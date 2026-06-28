#!/usr/bin/env python3
"""
eventscr_disasm.py  --  EventScr bytecode -> editable EAstdlib macro C decoder.

D309 de-risk prototype. Reads an existing
  src/data/EventScr_<Name>_ref/dat_EventScr_<Name>_ref.c
(an __asm__ block of `.4byte 0xXXXXXXXX` words, possibly with `.4byte SYM`
relocation words) and re-emits the SAME global symbol + section as an editable
`EventListScr [] = { ... }` initialiser using the fe8u EAstdlib `Evt*`/`EVENT_*`
macros, falling back to a raw 32-bit word literal for any command/operand shape
not in the reverse table.  The macros expand (via include/eventscript.h) back to
the exact same word stream -> `make compare` is the byte-exact oracle.

Word format (see include/eventscript.h _EvtCmd/_EvtArg0):
  word0 low16  = (cmd<<8) | (len<<4) | sub      (len = total_command_bytes/2 = nwords*2)
  word0 high16 = arg0
  following (nwords-1) words = extra params

Usage:
  eventscr_disasm.py decode <path-to-_ref.c>      # print decoded C to stdout
  eventscr_disasm.py words  <path-to-_ref.c>      # dump decoded word table (debug)
"""
import sys, re, os

REPO = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))

# ---------------------------------------------------------------------------
# 1. Parse the __asm__ block: ordered list of (kind, value) where kind is
#    'word' (int) or 'sym' (str, a relocation .4byte SYM).
# ---------------------------------------------------------------------------
def _norm_sym(tok):
    """Normalise a reloc operand: `(u32)&SYM` -> `SYM`; keep `SYM + addend`."""
    tok = tok.strip()
    m = re.match(r'\(u32\)\s*&\s*(.+)$', tok)
    if m:
        tok = m.group(1).strip()
    return tok

def parse_ref_c(path):
    """Return (global_sym, section, items).  Supports two on-disk forms:
       (A) __asm__(" .section ... .global SYM ... .4byte W / .4byte SYM+add ");
       (B) SECTION(...) static const u32 SYM__shift[] = { 0xW, (u32)&SYM, ... };
           + __asm__(".global SYM\n.set SYM, SYM__shift");
    """
    txt = open(path, encoding="utf-8").read()
    m = re.search(r'\.global\s+(\w+)', txt)
    sym = m.group(1) if m else None
    m = re.search(r'\.section\s+([^,]+),', txt)
    section = m.group(1).strip() if m else None
    items = []
    am = re.search(r'__asm__\s*\((.*?)\)\s*;', txt, re.S)
    body = am.group(1) if am else ""
    # form (A): .4byte words inside the asm block
    if '.4byte' in body:
        for mm in re.finditer(r'\.4byte\s+([^\\"\n]+?)\s*(?:\\n)', body):
            tok = mm.group(1).strip()
            if re.match(r'(0x[0-9A-Fa-f]+|-?\d+)$', tok):
                items.append(('word', int(tok, 0) & 0xFFFFFFFF))
            else:
                items.append(('sym', tok))
        return sym, section, items
    # form (B): static const u32 ...__shift[] = { ... };
    m = re.search(r'SECTION\("([^"]+)"\)\s+static\s+const\s+u32\s+(\w+)\s*\[\]\s*=\s*\{(.*?)\}',
                  txt, re.S)
    if m:
        section = m.group(1)
        arr = m.group(3)
        for raw in arr.split(','):
            tok = raw.strip()
            if not tok:
                continue
            if re.match(r'(0x[0-9A-Fa-f]+|-?\d+)$', tok):
                items.append(('word', int(tok, 0) & 0xFFFFFFFF))
            else:
                items.append(('sym', _norm_sym(tok)))
    return sym, section, items

# ---------------------------------------------------------------------------
# 2. Reverse macro table.  Keyed by (cmd, sub) for single-form commands.
# ---------------------------------------------------------------------------
SLOT = {i: f"EVT_SLOT_{c}" for i, c in enumerate("0123456789AB")}
SLOT[0xC] = "EVT_SLOT_C"; SLOT[0xD] = "EVT_SLOT_D"

def hx(v):
    return f"0x{v:X}" if v > 9 else str(v)

def slot(v):
    return SLOT.get(v, hx(v))

# cmd codes (mirror eventscript.h)
NOP,END,EVSET,EVCHECK,RAND,SVAL,SLOTOPS,QUEUEOPS,LABEL,GOTO,CALL,ENQCALL,BRANCH, \
ASMC,STALL,COUNTER,EVBITMOD,IGNOREKEYS,BGM12,BGM13,BGMOVR,BGMVOL,PLAYSE,FADE, \
COLORFADE,CHECKVAR,SETTEXTTYPE,DISPTEXT,CONTTEXT,ENDTEXT,DISPFACE,MOVEFACE, \
CLEARTB,SHOWBG,CLEARSCR = range(0x23)
LOMA=0x25; CAMERA=0x26; TILECH=0x27; WEATHER=0x28; FOGVIS=0x29; CHGCHAP=0x2A
LOADPRE=0x2B; LOADUNIT=0x2C; CHGPAL=0x2D; GETPID=0x2E; MOVEUNIT=0x2F; ENUN=0x30
TOGRANGE=0x31; LOADSINGLE=0x32; CHKSTATE=0x33; CHGSTATE=0x34; CHGCLASS=0x35
CHKAREA=0x36; GIVEITEM=0x37; CHGACTIVE=0x38; CHGAI=0x39; POPUP=0x3A; CURSOR=0x3B
MOVECURSOR=0x3C; MENUOVR=0x3D; PREP=0x3E; SCRBATTLE=0x3F; PROM=0x40; WARP=0x41
EARTHQ=0x42; SUMMON=0x43; BREAKSTONE=0x44; GLOWCROSS=0x45

def r_none(name):
    return lambda a, ex, rl: ("", name)

def r_arg0(name, fmt=hx):
    return lambda a, ex, rl: (f"{fmt(a)}", name)

def r_slotop(name):
    def f(a, ex, rl):
        to, aa, bb = a & 0xF, (a >> 4) & 0xF, (a >> 8) & 0xF
        if (a >> 12) & 0xF: return None
        return (f"{slot(to)}, {slot(aa)}, {slot(bb)}", name)
    return f

def r_xy(name):
    return lambda a, ex, rl: (f"{hx(a & 0xFF)}, {hx((a >> 8) & 0xFF)}", name)

# (cmd, sub) -> (render_fn, nwords)
TABLE = {
    (END, 0):   (r_none("ENDA"), 1),
    (END, 1):   (r_none("ENDB"), 1),
    (EVSET, 0): (r_arg0("EVBIT_F"), 1),
    (EVSET, 8): (r_arg0("EVBIT_T"), 1),
    (EVSET, 1): (r_arg0("ENUF"), 1),
    (EVSET, 9): (r_arg0("ENUT"), 1),
    (EVCHECK, 0): (r_arg0("CHECK_EVBIT"), 1),
    (EVCHECK, 1): (r_arg0("CHECK_EVENTID"), 1),
    (RAND, 0):  (r_arg0("RANDOMNUMBER"), 1),
    (SLOTOPS, 0): (r_slotop("SADD"), 1),
    (SLOTOPS, 1): (r_slotop("SSUB"), 1),
    (SLOTOPS, 2): (r_slotop("SMUL"), 1),
    (SLOTOPS, 3): (r_slotop("SDIV"), 1),
    (SLOTOPS, 4): (r_slotop("SMOD"), 1),
    (SLOTOPS, 5): (r_slotop("SAND"), 1),
    (SLOTOPS, 6): (r_slotop("SORR"), 1),
    (SLOTOPS, 7): (r_slotop("SXOR"), 1),
    (SLOTOPS, 8): (r_slotop("SLSL"), 1),
    (SLOTOPS, 9): (r_slotop("SLSR"), 1),
    (QUEUEOPS, 0): (r_arg0("SENQUEUE"), 1),
    (QUEUEOPS, 1): (r_none("SENQUEUE1"), 1),
    (QUEUEOPS, 2): (r_arg0("SDEQUEUE"), 1),
    (LABEL, 0): (r_arg0("LABEL"), 1),
    (GOTO, 0):  (r_arg0("GOTO"), 1),
    (STALL, 0): (r_arg0("STAL"), 1),
    (STALL, 1): (r_arg0("STAL1"), 1),
    (STALL, 2): (r_arg0("STAL2"), 1),
    (STALL, 3): (r_arg0("STAL3"), 1),
    (EVBITMOD, 0): (r_arg0("EVBIT_MODIFY"), 1),
    (IGNOREKEYS, 0): (r_arg0("IGNORE_KEYS"), 1),
    (BGM12, 0): (r_arg0("MUSC"), 1),
    (BGMOVR, 0): (r_arg0("MUSS"), 1),
    (BGMOVR, 1): (r_arg0("MURE"), 1),
    (BGMVOL, 0): (r_none("MUSI"), 1),
    (BGMVOL, 1): (r_none("MUNO"), 1),
    (PLAYSE, 0): (r_arg0("SOUN"), 1),
    (FADE, 0): (r_arg0("FADU"), 1),
    (FADE, 1): (r_arg0("FADI"), 1),
    (FADE, 2): (r_arg0("FAWU"), 1),
    (FADE, 3): (r_arg0("FAWI"), 1),
    (CHECKVAR, 0): (r_none("CHECK_MODE"), 1),
    (CHECKVAR, 1): (r_none("CHECK_CHAPTER_NUMBER"), 1),
    (CHECKVAR, 2): (r_none("CHECK_HARD"), 1),
    (CHECKVAR, 3): (r_none("CHECK_TURNS"), 1),
    (CHECKVAR, 4): (r_none("CHECK_ENEMIES"), 1),
    (CHECKVAR, 5): (r_none("CHECK_OTHERS"), 1),
    (CHECKVAR, 6): (r_none("CHECK_SKIRMISH"), 1),
    (CHECKVAR, 7): (r_none("CHECK_TUTORIAL"), 1),
    (CHECKVAR, 8): (r_none("CHECK_MONEY"), 1),
    (CHECKVAR, 9): (r_none("CHECK_TRIG_EVENTID"), 1),
    (CHECKVAR, 0xA): (r_none("CHECK_POSTGAME"), 1),
    (SETTEXTTYPE, 0): (r_none("TEXTSTART"), 1),
    (SETTEXTTYPE, 1): (r_none("REMOVEPORTRAITS"), 1),
    (SETTEXTTYPE, 2): (r_none("_1A22"), 1),
    (SETTEXTTYPE, 3): (r_none("TUTORIALTEXTBOXSTART"), 1),
    (SETTEXTTYPE, 4): (r_none("SOLOTEXTBOXSTART"), 1),
    (SETTEXTTYPE, 5): (r_none("_1A25"), 1),
    (DISPTEXT, 2): (r_none("REMA"), 1),
    (CONTTEXT, 0): (r_none("TEXTCONT"), 1),
    (ENDTEXT, 0): (r_none("TEXTEND"), 1),
    (CLEARSCR, 0): (r_none("CLEAN"), 1),
    (LOMA, 0): (r_arg0("LOMA"), 1),
    (CAMERA, 0): (r_xy("CAMERA"), 1),
    (CAMERA, 1): (r_arg0("CAMERA_CAHR"), 1),
    (CAMERA, 8): (r_xy("CAMERA2"), 1),
    (CAMERA, 9): (r_arg0("CAMERA2_CAHR"), 1),
    (TILECH, 0): (r_arg0("TILECHANGE"), 1),
    (TILECH, 1): (r_arg0("TILEREVERT"), 1),
    (CHGCHAP, 0): (r_arg0("MNTS"), 1),
    (CHGCHAP, 1): (r_arg0("MNCH"), 1),
    (CHGCHAP, 2): (r_arg0("MNC2"), 1),
    (CHGCHAP, 3): (r_arg0("MNC3"), 1),
    (CHGCHAP, 4): (r_none("MNC4"), 1),
    (CHGPAL, 0): (r_arg0("UNIT_COLORS"), 1),
    (GETPID, 0): (r_xy("CHECK_AT"), 1),
    (GETPID, 1): (r_none("CHECK_ACTIVE"), 1),
    (ENUN, 0): (r_none("ENUN"), 1),
    (CHKSTATE, 0): (r_arg0("CHECK_EXISTS"), 1),
    (CHKSTATE, 1): (r_arg0("CHECK_STATUS"), 1),
    (CHKSTATE, 2): (r_arg0("CHECK_ALIVE"), 1),
    (CHKSTATE, 3): (r_arg0("CHECK_DEPLOYED"), 1),
    (CHKSTATE, 4): (r_arg0("CHECK_ACTIVEID"), 1),
    (CHKSTATE, 5): (r_arg0("CHECK_ALLEGIANCE"), 1),
    (CHKSTATE, 6): (r_arg0("CHECK_COORDS"), 1),
    (CHKSTATE, 7): (r_arg0("CHECK_CLASS"), 1),
    (CHKSTATE, 8): (r_arg0("CHECK_LUCK"), 1),
    (CHGSTATE, 0x0): (r_arg0("REMU"), 1),
    (CHGSTATE, 0x1): (r_arg0("REVEAL"), 1),
    (CHGSTATE, 0xD): (r_arg0("KILL"), 1),
    (CHGSTATE, 0xF): (r_arg0("DISA"), 1),
    (CHGSTATE, 0x5): (r_arg0("SET_HP"), 1),
    (CHGSTATE, 0x6): (r_arg0("SET_ENDTURN"), 1),
    (CHGSTATE, 0x7): (r_arg0("_3427"), 1),
    (CHGSTATE, 0x8): (r_arg0("SET_STATE"), 1),
    (CHGSTATE, 0xA): (r_none("CLEA"), 1),
    (CHGSTATE, 0xB): (r_none("CLEN"), 1),
    (CHGSTATE, 0xC): (r_none("CLEE"), 1),
    (CHGSTATE, 0xE): (r_arg0("DISA_IF"), 1),
    (GIVEITEM, 0): (r_arg0("GIVEITEMTO"), 1),
    (GIVEITEM, 1): (r_arg0("GIVEITEMTOMAIN"), 1),
    (GIVEITEM, 2): (r_arg0("GIVETOSLOT3"), 1),
    (CHGACTIVE, 0): (r_arg0("SET_ACTIVE"), 1),
    (CHGAI, 0): (r_arg0("CHAI"), 1),
    (PREP, 0): (r_none("PREP"), 1),
    (SUMMON, 0): (r_arg0("SUMMONUNIT"), 1),
    (BREAKSTONE, 0): (r_arg0("BREAKSTONE"), 1),
    (GLOWCROSS, 0): (r_arg0("GLOWINGCROSS"), 1),
    (GLOWCROSS, 0xF): (r_none("GLOWINGCROSS_END"), 1),
    (DISPTEXT, 1): (r_arg0("EvtTextShow2"), 1),
    (CURSOR, 0x0): (r_xy("CURSOR_AT"), 1),
    (CURSOR, 0x1): (r_arg0("CURSOR_CHAR"), 1),
    (CURSOR, 0x2): (r_none("CURE"), 1),
    (CURSOR, 0x4): (r_xy("CURSOR_FLASHING"), 1),
    (CURSOR, 0x5): (r_arg0("CURSOR_FLASHING_CHAR"), 1),
    (MENUOVR, 0): (r_arg0("DISABLEOPTIONS"), 1),
    (MENUOVR, 1): (r_arg0("DISABLEWEAPONS"), 1),
    (MOVECURSOR, 0): (r_none("CHECK_CURSOR"), 1),
    (MOVECURSOR, 1): (r_xy("SET_CURSOR"), 1),
    (TOGRANGE, 0): (r_arg0("SHOW_ATTACK_RANGE"), 1),
    (TOGRANGE, 1): (r_none("HIDE_ATTACK_RANGE"), 1),
    (LOADPRE, 0): (r_arg0("EvtSetLoadUnitCount"), 1),
    (LOADPRE, 1): (r_arg0("EvtSetLoadUnitChance"), 1),
    (LOADPRE, 2): (r_none("EvtSetLoadUnitNoREDA"), 1),
    (WARP, 0): (r_xy("WARP_OUT"), 1),
    (WARP, 1): (r_xy("WARP_IN"), 1),
    (WARP, 0xF): (r_none("ENDWARP"), 1),
}

def render_word_operand(v, reloc):
    return reloc if reloc else hx(v)

def decode(items):
    flat = []
    for kind, val in items:
        if kind == 'word':
            flat.append((val, None))
        else:
            flat.append((0, val))
    out = []
    i = 0
    n = len(flat)
    while i < n:
        w, rl0 = flat[i]
        if rl0 is not None:
            out.append(("EVENT_WORD_SYM(%s)" % rl0, 1)); i += 1; continue
        lo = w & 0xFFFF
        cmd = (lo >> 8) & 0xFF
        length = (lo >> 4) & 0xF
        sub = lo & 0xF
        arg0 = (w >> 16) & 0xFFFF
        nwords = (length // 2) if length >= 2 else 1
        if i + nwords > n:
            out.append((raw_word(w, rl0), 1)); i += 1; continue
        extra = flat[i+1:i+nwords]
        line = try_macro(cmd, length, sub, arg0, extra, nwords)
        if line is None:
            out.append((raw_word(w, None), 1)); i += 1; continue
        out.append((line, nwords)); i += nwords
    return out

def raw_word(w, rl):
    if rl: return "EVENT_WORD_SYM(%s)" % rl
    return "EVENT_WORD(0x%08X)" % w

def try_macro(cmd, length, sub, arg0, extra, nwords):
    if cmd == CALL and sub == 0 and nwords == 2:
        ev, rl = extra[0]
        return f"CALL({render_word_operand(ev, rl)})"
    if cmd == ASMC and nwords == 2:
        ev, rl = extra[0]
        if sub == 0: return f"ASMC({render_word_operand(ev, rl)})"
        if sub == 1: return f"ASMC2({render_word_operand(ev, rl)})"
    if cmd == SVAL and sub == 0 and nwords == 2:
        ev, rl = extra[0]
        return f"SVAL({slot(arg0)}, {render_word_operand(ev, rl)})"
    if cmd == LOADUNIT and nwords == 2 and sub in (0, 1, 2, 3):
        ev, rl = extra[0]
        nm = {0: "LOAD1", 1: "LOAD2", 2: "LOAD3", 3: "LOAD4"}[sub]
        return f"{nm}({hx(arg0)}, {render_word_operand(ev, rl)})"
    if cmd == ENQCALL and nwords == 2 and sub == 0:
        ev, rl = extra[0]
        return f"EvtEnqueueCallDirectly({render_word_operand(ev, rl)})"
    if cmd == BRANCH and nwords == 2:
        nm = {0:"BEQ",1:"BNE",2:"BGE",3:"BGT",4:"BLE",5:"BLT"}.get(sub)
        ev, rl = extra[0]
        if nm and rl is None:
            s1, s2 = ev & 0xFFFF, (ev >> 16) & 0xFFFF
            return f"{nm}({hx(arg0)}, {hx(s1)}, {hx(s2)})"
    if cmd == DISPTEXT and sub == 0 and nwords == 1:
        return f"TEXTSHOW({hx(arg0)})"
    if cmd == SHOWBG and nwords == 2 and sub == 0:
        ev, rl = extra[0]
        if rl is None and ev == 0:
            return f"BACG({hx(arg0)})"
    if cmd == COLORFADE and nwords == 3 and sub in (0, 1):
        if extra[0][0] == 0 and extra[1][0] == 0 and arg0 == 0 \
           and extra[0][1] is None and extra[1][1] is None:
            return "STARTFADE" if sub == 0 else "ENDFADE"
    if cmd == MOVEUNIT and nwords == 2:
        ev, rl = extra[0]
        if rl is None:
            speed = arg0
            pid = ev & 0xFFFF
            xy = (ev >> 16) & 0xFFFF
            modify = (sub >> 3) & 1
            base = sub & 7
            x, y = xy & 0xFF, (xy >> 8) & 0xFF
            if base == 0:
                nm = "MOVE_CLOSEST" if modify else "MOVE"
                return f"{nm}({hx(speed)}, {hx(pid)}, {hx(x)}, {hx(y)})"
            if base == 1:
                nm = "MOVE_NEXTTO" if modify else "MOVEONTO"
                return f"{nm}({hx(speed)}, {hx(pid)}, {hx(xy)})"
            if base == 2:
                nm = "MOVE_1STEP_CLOSEST" if modify else "MOVE_1STEP"
                return f"{nm}({hx(speed)}, {hx(pid)}, {hx(xy)})"
            if base == 3:
                nm = "MOVE_DEFINED_CLOSEST" if modify else "MOVE_DEFINED"
                return f"{nm}({hx(pid)})"
    if cmd == LOADSINGLE and nwords == 2:
        ev, rl = extra[0]
        if rl is None:
            x = ev & 0xFF; y = (ev >> 8) & 0xFF
            if (ev >> 16) == 0:
                nm = {0:"SPAWN_ALLY",2:"SPAWN_NPC",4:"SPAWN_ENEMY"}.get(sub)
                if nm: return f"{nm}({hx(arg0)}, {hx(x)}, {hx(y)})"
                return f"EvtLoadSingleUnit({hx(sub)}, {hx(arg0)}, {hx(x)}, {hx(y)})"
    if cmd == POPUP and nwords == 2 and sub == 0:
        ev, rl = extra[0]
        if rl is None and (ev >> 16) == 0:
            return f"NOTIFY({hx(arg0)}, {hx(ev & 0xFFFF)})"
    if cmd == SCRBATTLE and nwords == 2:
        ev, rl = extra[0]
        if rl is None:
            target = ev & 0xFFFF; wb = (ev >> 16) & 0xFFFF
            weapon, ball = wb & 0xFF, (wb >> 8) & 0xFF
            if sub == 0: return f"FIGHT({hx(arg0)}, {hx(target)}, {hx(weapon)}, {hx(ball)})"
            if sub == 1: return f"FIGHT_MAP({hx(arg0)}, {hx(target)}, {hx(weapon)}, {hx(ball)})"
    if cmd == CHKAREA and nwords == 2 and sub == 0:
        ev, rl = extra[0]
        if rl is None:
            x = ev & 0xFF; y = (ev >> 8) & 0xFF; w_ = (ev >> 16) & 0xFF; h = (ev >> 24) & 0xFF
            return f"CHECK_INAREA({hx(arg0)}, {hx(x)}, {hx(y)}, {hx(w_)}, {hx(h)})"
    if cmd == PROM and nwords == 2 and sub == 0:
        ev, rl = extra[0]
        if rl is None:
            jid = ev & 0xFFFF; item = (ev >> 16) & 0xFFFF
            return f"PROM({hx(arg0)}, {hx(jid)}, {hx(item)})"
    if cmd == DISPFACE and nwords == 1:
        return f"FACE_SHOW({hx(sub)}, {hx(arg0)})"
    if cmd == COUNTER and nwords == 1:
        idx = arg0 & 0xFF; val = (arg0 >> 8) & 0xFF
        nm = {0:"COUNTER_CHECK",1:"COUNTER_SET",2:"COUNTER_INC",3:"COUNTER_DEC"}.get(sub)
        if nm == "COUNTER_SET": return f"COUNTER_SET({hx(idx)}, {hx(val)})"
        if nm: return f"{nm}({hx(idx)})"
    if cmd == BGM13 and nwords == 1:
        return f"EvtBgmFadeIn({hx(arg0)}, {hx(sub)})"
    if cmd == NOP and sub == 0 and arg0 == 0 and nwords == 1:
        return "EvtNop"
    if cmd == POPUP and sub == 1 and nwords == 2:
        ev, rl = extra[0]
        if rl is None:
            x = ev & 0xFFFF; y = (ev >> 16) & 0xFFFF
            return f"BROWNBOXTEXT({hx(arg0)}, {hx(x)}, {hx(y)})"
    if cmd == COLORFADE and sub == 2 and nwords == 3:
        e0, r0 = extra[0]; e1, r1 = extra[1]
        if r0 is None and r1 is None:
            form = arg0 & 0xFF; to = (arg0 >> 8) & 0xFF
            speed = e0 & 0xFFFF; r = (e0 >> 16) & 0xFFFF
            g = e1 & 0xFFFF; b = (e1 >> 16) & 0xFFFF
            return f"EvtColorFadeSetup({hx(form)}, {hx(to)}, {hx(speed)}, {hx(r)}, {hx(g)}, {hx(b)})"
    if cmd == FOGVIS and nwords == 1:
        return f"EvtChangeFogVision({hx(sub)}, {hx(arg0)})"
    if cmd == EARTHQ and nwords == 1:
        if sub == 0:
            d = arg0 & 0xFF; ps = (arg0 >> 8) & 0xFF
            return f"EARTHQUAKE_START({hx(d)}, {hx(ps)})"
        if sub == 0xF:
            return "EARTHQUAKE_END"
    if cmd == CHGAI and sub == 1 and nwords == 1:
        return f"CHAI_AT({hx(arg0 & 0xFF)}, {hx((arg0 >> 8) & 0xFF)})"
    if cmd == ENQCALL and sub == 1 and nwords == 2:
        ev, rl = extra[0]
        return f"EvtEnqueueConditionalTutCall({render_word_operand(ev, rl)}, {hx(arg0)})"
    if cmd == CHGSTATE and sub in (2, 3, 4) and nwords == 1:
        nm = {2: "CUSA", 3: "CUSN", 4: "CUSE"}[sub]
        return f"{nm}({hx(arg0)})"
    if cmd == SCRBATTLE and sub == 2 and nwords == 2:
        ev, rl = extra[0]
        if ev == 0 and rl is None:
            return "FIGHT_SCRIPT"

    ent = TABLE.get((cmd, sub))
    if ent and nwords == 1:
        render, exp_nw = ent
        if exp_nw == nwords and render is not None:
            r = render(arg0, extra, None)
            if r is None: return None
            args, name = r
            return f"{name}({args})" if args else name
    return None

def collect_externs(items, self_sym):
    """Base symbol names referenced by reloc words that need an extern decl."""
    names = []
    seen = set()
    for kind, val in items:
        if kind != 'sym':
            continue
        m = re.match(r'\s*([A-Za-z_]\w*)', val)
        if not m:
            continue
        base = m.group(1)
        if base == self_sym or base in seen:
            continue
        seen.add(base)
        names.append(base)
    return names

def emit_c(sym, section, items, src_rel):
    lines = decode(items)
    body = ["    " + text for text, _ in lines]
    externs = collect_externs(items, sym)
    sec = f'SECTION("{section}") ' if section else "CONST_DATA "
    out = []
    out.append('#include "global.h"')
    out.append('#include "event.h"')
    out.append('#include "eventinfo.h"')
    out.append('#include "EAstdlib.h"')
    out.append("")
    out.append(f"/* Converted from {src_rel} by scripts/eventscr_disasm.py (D309).")
    out.append(" * Editable EAstdlib macro form; expands byte-identical to baserom")
    out.append(" * (gated by `make compare`).  EVENT_WORD/EVENT_WORD_SYM = raw escape")
    out.append(" * for command/operand shapes without a friendly macro yet. */")
    out.append("#define EVENT_WORD(w)      (EventListScr)(w),")
    out.append("#define EVENT_WORD_SYM(s)  (EventListScr)(s),")
    out.append("")
    if externs:
        for nm in externs:
            out.append(f"extern const u8 {nm}[];")
        out.append("")
    out.append(f"{sec}EventListScr {sym}[] = {{")
    out.append("\n".join(body))
    out.append("};")
    out.append("")
    return "\n".join(out)

def main():
    if len(sys.argv) < 3:
        print(__doc__); sys.exit(1)
    mode, path = sys.argv[1], sys.argv[2]
    sym, section, items = parse_ref_c(path)
    if mode == "words":
        for k, v in items:
            print(k, hex(v) if k == 'word' else v)
        return
    src_rel = os.path.relpath(path, REPO)
    print(emit_c(sym, section, items, src_rel))

if __name__ == "__main__":
    main()
