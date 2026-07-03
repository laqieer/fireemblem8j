/* NON_MATCHING: byte source is asm/sub_800E1FC.s @ JP 0x0800E1FC (region-different,
 * gbadisasm descriptive asm; carved_rom places those bytes). This C DOCUMENTS the
 * reconstruction and is NOT in make-compare: compiled only by `make nonmatching`.
 * near-match build flags: // FLAGS: -mjp-promote.
 * Graduate via permuter/lever -> move to src/, flip the carved_rom row, drop asm.
 *
 * Event18_ColorFade (JP sub_800E1FC) = fe8u eventscr.c:747 verbatim.
 * Callees (in JP bmfx.h): EventStartFade, EventEndFade, NewEventFadefx.
 * 204/204 mnemonic-identical, ~95-byte PURE register-alloc/spill-decision residual
 * (the flagship spill-NEAR of docs/agbcc_codegen_levers.md §7). .text is exactly
 * 0xCC (204B) in BOTH builds; the divergence is which locals get hard regs vs stack.
 *
 * GRADUATION ATTEMPT (bravo, this session) — REMAINS NONMATCHING:
 *  - Deterministic levers (docs/agbcc_codegen_levers.md), measured vs the oracle
 *    asm/sub_800E1FC.o (mjp-promote clean baseline = 96 differing objdump lines):
 *      proc->ip pin (§3/P4) ........ 124 (WORSE)   +m spill barrier r,g (P2) . 148 (WORSE)
 *      decl-reorder size<start (§9) . 122 (WORSE)   P4 hi-reg swarm pin ....... 128 (WORSE)
 *    Every lever REGRESSES from the clean-source floor — matches §7's "95 is the floor,
 *    NONE of 11 flag combos helped" verdict for THIS exact function.
 *  - decomp-permuter (tools/decomp-permuter, -mjp-promote patched in, 16 workers):
 *    base score 2030 -> best 965 over 67,391 iterations; NO score-0 permutation found.
 *    (Consistent with §7: workers plateau ~30-60k iters; needs millions / the original
 *     IS-build agbcc reg-allocator, not a per-TU flag.)
 *
 * EXACT CURRENT RESIDUAL (JP oracle  |  agbcc-here -mjp-promote), the whole diff is
 * a reg-coloring + one-more-spill rotation; instruction OPCODES + count are identical:
 *   frame:    sub/add sp,#16 (spills 2 colors)   |  sub/add sp,#12 (spills 1)
 *   proc:     ip  (mov ip,r0 ; mov r0,ip reloads) |  r7 (direct low-reg, no reload)
 *   subcode:  r6   |  r5        start: r5 |  r4        size: r4 |  r6
 *   speed:    r9   |  r8        blue:  sl |  r9
 *   red:      [sp,#8]  (SPILLED)          |  sl  (kept in reg)   <-- the extra spill
 *   green:    [sp,#12] (SPILLED)          |  [sp,#8] (SPILLED)
 *   loop:     JP holds the size counter pre-decremented in r2 (subs r2,r0,r1) and the
 *             start-holder incrementing in r3; agbcc-here emits the inc/dec in the
 *             opposite RTL order and materializes 0xff<<24 via movs+lsls instead of a
 *             held negative step. Same net computation, different emission order — a
 *             downstream consequence of the start/size coloring swap.
 *
 * WALL HYPOTHESIS: genuine agbcc reg-allocator-internal spill decision. The JP build
 * anchors `proc` to the caller-saved high reg ip (priority formula
 * floor_log2(refs)*refs*size/live_length + CALLER_SAVE_PROFITABLE=4*CALLS<REFS, see
 * §9), which frees a low reg but forces 2 color locals to the stack (frame 16); the
 * repo agbcc instead colors `proc` into callee-saved r7 and spills only 1 (frame 12).
 * No -mjp-promote-compatible source shape or flag reaches the JP coloring; the residual
 * is not opcode/shape (§1-§6 don't apply) — it is pure allocator state. Crack path per
 * §7/§9: a multi-million-iter permuter seed, or the original IS agbcc. decomp.me
 * scratch: https://decomp.me/scratch/WmsgZ (docs §10). */
#include "global.h"
#include "proc.h"
#include "rng.h"
#include "hardware.h"
#include "m4a.h"
#include "soundwrapper.h"
#include "fontgrp.h"
#include "bmio.h"
#include "bmunit.h"
#include "bmmap.h"
#include "bmitem.h"
#include "bmtrick.h"
#include "bmidoten.h"
#include "mu.h"
#include "chapterdata.h"
#include "face.h"
#include "scene.h"
#include "bm.h"
#include "bmlib.h"
#include "bmudisp.h"
#include "gamecontrol.h"
#include "uimenu.h"
#include "prepscreen.h"
#include "playerphase.h"
#include "bmbattle.h"
#include "popup.h"
#include "muctrl.h"
#include "mapanim.h"
#include "helpbox.h"
#include "worldmap.h"
#include "cgtext.h"
#include "bmmind.h"
#include "eventinfo.h"
#include "event.h"
#include "eventscript.h"
#include "EAstdlib.h"
#include "constants/backgrounds.h"
#include "eventcall.h"
#include "bmdifficulty.h"
#include "bmfx.h"
#include "colorfade.h"
#include "constants/songs.h"

u8 Event18_ColorFade(struct EventEngineProc * proc)
{
    u32 mask;

    u8 subcode = EVT_SUB_CMD(proc->pEventCurrent);

    s8 start = EVT_CMD_ARGV(proc->pEventCurrent)[0];
    s8 size  = EVT_CMD_ARGV(proc->pEventCurrent)[0] >> 8;

    u16 speed = proc->pEventCurrent[2];
    u16 r = proc->pEventCurrent[3];
    u16 g = proc->pEventCurrent[4];
    u16 b = proc->pEventCurrent[5];

    switch (subcode) {
    case EVSUBCMD_STARTFADE:
        EventStartFade();
        return EVC_ADVANCE_YIELD;

    case EVSUBCMD_ENDFADE:
        EventEndFade();
        return EVC_ADVANCE_YIELD;

    case EVSUBCMD_FADECOLORS:
    {
        s8 i;

        if (EVENT_IS_SKIPPING(proc) || (proc->evStateBits & EV_STATE_FADEDIN))
            speed = 0;

        mask = 0;

        for (i = size; i > 0; --i)
        {
            s8 tmp = start;
            mask = mask | (1 << tmp);
            start = tmp + 1;
        }

        NewEventFadefx(speed, mask, r, g, b, proc);

        return EVC_ADVANCE_YIELD;
    }

    default:
        return EVC_ERROR;

    } // switch (subcode)
}
