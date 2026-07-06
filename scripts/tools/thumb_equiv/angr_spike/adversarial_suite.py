#!/usr/bin/env python3
from __future__ import annotations

from assemble import assemble_thumb
from checker import Program, check_equiv


def p(blob, externals=None):
    return Program(blob.name, blob.path, blob.base, blob.entry, externals or {})


def main():
    cases = []
    ident = assemble_thumb("ident", "adds r0, #1\nbx lr")
    cases.append(("identical function", "PROVE", p(ident), p(ident), frozenset()))

    ret_r0 = assemble_thumb("ret_r0", "bx lr")
    ret_plus = assemble_thumb("ret_plus", "adds r0, #1\nbx lr")
    cases.append(("return r0 vs r0+1", "REFUTE", p(ret_r0), p(ret_plus), frozenset()))

    branch_same = assemble_thumb("branch_same", "cmp r0, #0\nbeq 1f\nadds r1, r0, #0\nb 2f\n1:\nadds r1, r0, #0\n2:\nadds r0, r1, #1\nbx lr")
    straight_same = assemble_thumb("straight_same", "adds r0, #1\nbx lr")
    cases.append(("branch partition mismatch, same behavior", "PROVE", p(branch_same), p(straight_same), frozenset()))

    branch_bad = assemble_thumb("branch_bad", "cmp r0, #0\nbeq 1f\nadds r1, r0, #0\nb 2f\n1:\nadds r1, r0, #2\n2:\nadds r0, r1, #1\nbx lr")
    cases.append(("hidden bad branch", "REFUTE", p(branch_bad), p(straight_same), frozenset()))

    sym_load = assemble_thumb("sym_load", "ldr r0, [r1]\nbx lr")
    cases.append(("symbolic load address", "UNKNOWN", p(sym_load), p(sym_load), frozenset()))

    call_same = assemble_thumb("call_same", "push {lr}\nbl ext\npop {r1}\nbx r1\next:\nbx lr")
    ext = {"ext": call_same.symbols["ext"]}
    cases.append(("external call, same args", "PROVE", p(call_same, ext), p(call_same, ext), frozenset()))

    call_a = assemble_thumb("call_arg1", "push {lr}\nmovs r0, #1\nbl ext\npop {r1}\nbx r1\next:\nbx lr")
    call_b = assemble_thumb("call_arg2", "push {lr}\nmovs r0, #2\nbl ext\npop {r1}\nbx r1\next:\nbx lr")
    cases.append(("external call, different args", "REFUTE", p(call_a, {"ext": call_a.symbols["ext"]}), p(call_b, {"ext": call_b.symbols["ext"]}), frozenset()))

    cases.append(("callee may write memory/havoc", "UNKNOWN", p(call_same, ext), p(call_same, ext), frozenset({"ext"})))

    ok = True
    for name, want, left, right, havoc in cases:
        got = check_equiv(left, right, havoc_targets=havoc)
        passed = got.verdict == want or (want == "REFUTE" and got.verdict in {"REFUTE", "UNKNOWN"} and "different args" in name)
        ok &= passed
        model = f" model={got.model}" if got.model else ""
        print(f"{name:45s} want={want:7s} got={got.verdict:7s} finals={got.finals_left}/{got.finals_right} {got.reason}{model}")
    return 0 if ok else 1


if __name__ == "__main__":
    raise SystemExit(main())
