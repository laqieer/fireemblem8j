#!/usr/bin/env python3
import argparse, csv, re
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
TSV = ROOT / 'reports/asm_in_c_classification.tsv'

PTR_OPS_FUNC = {0x02, 0x03, 0x04, 0x14, 0x16, 0x18}
PTR_OPS_PROC = {0x05, 0x06, 0x07, 0x08, 0x09, 0x0A, 0x0D}
PTR_OPS_DATA = {0x01}
NO_PTR_OPS = {0x00, 0x0B, 0x0C, 0x0E, 0x0F, 0x10, 0x11, 0x12, 0x13, 0x15, 0x17, 0x19}
VALID_OPS = PTR_OPS_FUNC | PTR_OPS_PROC | PTR_OPS_DATA | NO_PTR_OPS
NUM_RE = re.compile(r'^(?:0x[0-9A-Fa-f]+|[0-9]+)$')
SYM_RE = re.compile(r'[A-Za-z_]\w*')

def parse_int(s):
    s = s.strip()
    return int(s, 0) if NUM_RE.match(s) else None

def c_hex(n):
    return '0x%X' % n if n >= 10 else str(n)

def clean_expr(expr):
    expr = re.sub(r'\s+', ' ', expr.strip())
    return '0' if expr in ('0x00000000', '0x0') else expr

def first_symbol(expr):
    expr = expr.strip()
    if expr.startswith(('0x', '0X')) or expr[:1].isdigit():
        return None
    for m in SYM_RE.finditer(expr):
        sym = m.group(0)
        if sym not in {'u8', 'u16', 'u32', 's8', 's16', 's32', 'void', 'struct', 'const'}:
            return sym
    return None

def proc_macro(first, ptr):
    op = first & 0xFFFF
    imm = (first >> 16) & 0xFFFF
    ptr = clean_expr(ptr)
    if op not in VALID_OPS:
        return None
    if op in (PTR_OPS_FUNC | PTR_OPS_PROC | PTR_OPS_DATA) and first_symbol(ptr) is None:
        return None
    if op in NO_PTR_OPS and ptr != '0':
        return None
    return {
        0x00: lambda: 'PROC_END',
        0x01: lambda: f'PROC_NAME({ptr})',
        0x02: lambda: f'PROC_CALL({ptr})',
        0x03: lambda: f'PROC_REPEAT({ptr})',
        0x04: lambda: f'PROC_SET_END_CB({ptr})',
        0x05: lambda: f'PROC_START_CHILD({ptr})',
        0x06: lambda: f'PROC_START_CHILD_BLOCKING({ptr})',
        0x07: lambda: f'PROC_START_MAIN_BUGGED({ptr})',
        0x08: lambda: f'PROC_WHILE_EXISTS({ptr})',
        0x09: lambda: f'PROC_END_EACH({ptr})',
        0x0A: lambda: f'PROC_BREAK_EACH({ptr})',
        0x0B: lambda: f'PROC_LABEL({c_hex(imm)})',
        0x0C: lambda: f'PROC_GOTO({c_hex(imm)})',
        0x0D: lambda: f'PROC_JUMP({ptr})',
        0x0E: lambda: f'PROC_SLEEP({c_hex(imm)})',
        0x0F: lambda: f'PROC_MARK({c_hex(imm)})',
        0x10: lambda: 'PROC_BLOCK',
        0x11: lambda: 'PROC_END_IF_DUPLICATE',
        0x12: lambda: 'PROC_SET_BIT4',
        0x13: lambda: 'PROC_13',
        0x14: lambda: f'PROC_WHILE({ptr})',
        0x15: lambda: 'PROC_15',
        0x16: lambda: f'PROC_CALL_2({ptr})',
        0x17: lambda: 'PROC_END_DUPLICATES',
        0x18: lambda: f'PROC_CALL_ARG({ptr}, {c_hex(imm)})',
        0x19: lambda: 'PROC_19',
    }[op]()

def asm_line_from_c_string(line):
    m = re.search(r'"(.*)"', line)
    if not m:
        return None
    s = m.group(1)
    return s.replace('\\"', '"').replace('\\t', '\t').replace('\\n', '')

def c_string_for_asm(s):
    s = s.replace('\\', '\\\\').replace('"', '\\"')
    return f'    "{s}\\n"'

def parse_blocks(lines):
    blocks=[]; i=0
    while i < len(lines):
        if '__asm__(' not in lines[i]:
            i += 1; continue
        start=i; j=i+1; content=[]
        while j < len(lines):
            if lines[j].strip() == ');':
                break
            al=asm_line_from_c_string(lines[j])
            if al is not None:
                content.append((j, al))
            j += 1
        if j < len(lines):
            blocks.append({'start':start,'end':j,'content':content})
        i=j+1
    return blocks

def block_section(content):
    for _,s in content:
        st=s.strip()
        if st.startswith('.section '):
            return st.split()[1].rstrip(',')
    return ''

def block_labels(content):
    return [s.strip()[:-1] for _,s in content if s.strip().endswith(':') and not s.strip().startswith('.')]

def target_keys(paths):
    keys={}
    with TSV.open() as f:
        for r in csv.DictReader(f, delimiter='\t'):
            if r['category'] != 'PROC_SCRIPT':
                continue
            if paths and r['file'] not in paths:
                continue
            labs = [x for x in r['labels'].split(',') if x]
            keys.setdefault(r['file'], set()).add((r['section'], labs[0] if labs else ''))
    return keys

def is_target(block, keys_for_file):
    sec=block_section(block['content'])
    labs=block_labels(block['content'])
    first = labs[0] if labs else ''
    return (sec, first) in keys_for_file or (sec, '') in keys_for_file or ('', first) in keys_for_file

def line_kind(s):
    st=s.strip()
    if st.startswith('.4byte '):
        return ('word', st[len('.4byte '):].strip())
    if st.endswith(':') and not st.startswith('.'):
        return ('label', st[:-1])
    if st.startswith('.global '):
        return ('global', st[len('.global '):].strip())
    if st.startswith('.section '):
        return ('section', st.split()[1].rstrip(','))
    return ('other', st)

def emit_asm(raw_lines, section=''):
    lines = [x for x in raw_lines if x.strip()]
    if not lines:
        return []
    if section and not any(x.strip().startswith('.section ') for x in lines):
        lines.insert(0, f'.section {section}, "aw", %progbits')
    if all(x.strip().startswith('.section ') or x.strip().startswith('.global ') for x in lines):
        return []
    return ['__asm__('] + [c_string_for_asm(x) for x in lines] + [');','']

def try_parse_proc(kinds, pos):
    j=pos; macros=[]; used=[]; good=False
    while j+1 < len(kinds) and kinds[j][0]=='word' and kinds[j+1][0]=='word':
        first=parse_int(kinds[j][1])
        if first is None:
            break
        macro=proc_macro(first, kinds[j+1][1])
        if macro is None:
            break
        op=first & 0xFFFF
        sym=first_symbol(clean_expr(kinds[j+1][1]))
        if sym and op in PTR_OPS_FUNC:
            used.append((sym,'func'))
        elif sym and op in PTR_OPS_PROC:
            used.append((sym,'proc'))
        elif sym and op in PTR_OPS_DATA:
            used.append((sym,'data'))
        macros.append(macro)
        j += 2
        if op == 0x00:
            good=True
            break
    if len(macros) >= 2 and (good or any(m.startswith(('PROC_CALL', 'PROC_REPEAT', 'PROC_START', 'PROC_WHILE', 'PROC_NAME')) for m in macros)):
        return j, macros, used
    return None

def make_generated_name(block, used, index):
    sec = block_section(block['content'])
    labels = block_labels(block['content'])
    base = None
    for sym, kind in used:
        if kind == 'func':
            base = sym
            break
    if base is None and used:
        base = used[0][0]
    if base is None:
        base = labels[0] if labels else sec.replace('.', '_')
    base = re.sub(r'\W+', '_', base).strip('_')
    suffix = labels[0].split('_')[-1] if labels else str(index)
    return f'ProcScr_{base}_{suffix}_{index}'

def convert_block(block):
    content=[s for _,s in block['content']]
    section=block_section(block['content'])
    kinds=[line_kind(s) for s in content]
    out=[]; raw=[]; conv=0; entries_total=0; externs={}; gen_index=0
    i=0
    while i < len(kinds):
        k,v=kinds[i]
        if k == 'section':
            i += 1; continue
        if k == 'global':
            raw.append(content[i]); i += 1; continue
        if k == 'label':
            label=v
            parsed = try_parse_proc(kinds, i+1)
            if parsed:
                j, macros, used = parsed
                raw = [r for r in raw if r.strip() != '.global ' + label]
                out.extend(emit_asm(raw, section)); raw=[]
                for sym,kind in used: externs[sym]=kind
                out.append(f'struct ProcCmd {label}[] SECTION("{section}") = {{')
                out.extend(f'    {m},' for m in macros)
                out.append('};'); out.append('')
                conv += 1; entries_total += len(macros); i = j; continue
            raw.append(content[i]); i += 1; continue
        if k == 'word':
            parsed = try_parse_proc(kinds, i)
            if parsed:
                j, macros, used = parsed
                name = make_generated_name(block, used, gen_index)
                gen_index += 1
                out.extend(emit_asm(raw, section)); raw=[]
                for sym,kind in used: externs[sym]=kind
                out.append(f'struct ProcCmd {name}[] SECTION("{section}") = {{')
                out.extend(f'    {m},' for m in macros)
                out.append('};'); out.append('')
                conv += 1; entries_total += len(macros); i = j; continue
        raw.append(content[i]); i += 1
    out.extend(emit_asm(raw, section))
    return out, conv, entries_total, externs

def ensure_include(lines):
    if any('#include "proc.h"' in l for l in lines):
        return lines
    for idx,l in enumerate(lines):
        if '#include "global.h"' in l:
            return lines[:idx+1]+['#include "proc.h"\n']+lines[idx+1:]
    return ['#include "proc.h"\n']+lines

def insert_externs(lines, externs):
    if not externs:
        return lines
    prefix=''.join(lines).split('__asm__',1)[0]
    existing=''.join(lines)
    decl=[]
    for sym,kind in sorted(externs.items()):
        if kind == 'func': d=f'extern void {sym}();'
        elif kind == 'proc': d=f'extern struct ProcCmd {sym}[];'
        else: d=f'extern u8 {sym}[];'
        if d not in existing:
            decl.append(d+'\n')
    if not decl:
        return lines
    insert=0
    for idx,l in enumerate(lines):
        if l.startswith('#include'):
            insert=idx+1
    while insert < len(lines) and lines[insert].strip()=='' : insert += 1
    return lines[:insert]+['\n']+decl+['\n']+lines[insert:]

def convert_file(rel, keys_for_file, write=True):
    path=ROOT/rel
    lines=path.read_text().splitlines(True)
    replacements=[]; total_conv=0; total_entries=0; all_externs={}
    for b in parse_blocks(lines):
        if not is_target(b, keys_for_file):
            continue
        new, conv, entries, externs = convert_block(b)
        if conv:
            replacements.append((b['start'], b['end'], [x+'\n' for x in new]))
            total_conv += conv; total_entries += entries; all_externs.update(externs)
    if replacements and write:
        for start,end,new in reversed(replacements):
            lines[start:end+1]=new
        lines=ensure_include(lines)
        lines=insert_externs(lines, all_externs)
        path.write_text(''.join(lines))
    return total_conv,total_entries,len(replacements)

def main():
    ap=argparse.ArgumentParser(); ap.add_argument('files', nargs='*'); ap.add_argument('--dry-run', action='store_true')
    args=ap.parse_args(); keys=target_keys(set(args.files))
    for rel,k in sorted(keys.items()):
        conv,entries,repls=convert_file(rel,k,write=not args.dry_run)
        print(f'{rel}\tconverted_scripts={conv}\tentries={entries}\tblocks_replaced={repls}')
if __name__ == '__main__': main()
