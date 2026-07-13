#!/usr/bin/env python3
"""Focused regressions for stack-passed call arguments."""

import os
import sys
import unittest

import z3

HERE = os.path.dirname(os.path.abspath(__file__))
if HERE not in sys.path:
    sys.path.insert(0, HERE)

import abi_signatures as ABI
import differential_test as D
import prove_nonmatching as P
from cfg_exec import State


class AbiSignatureTest(unittest.TestCase):
    def test_sub_800a194_is_five_words(self):
        signature = ABI.signature_for_target(0x0800A194)
        self.assertIsNotNone(signature)
        self.assertEqual(signature.arg_words, 5)

    def test_rejects_bvobw_four_argument_shape(self):
        unsafe = r"""
            extern void sub_800A194(int *a, int *b, int *c, int *d);
            void sub_800A34C(int *a, int *b, int *c, int *d, int n)
            {
                struct { int outgoing; int local[4]; } frame;
                frame.outgoing = n;
                sub_800A194(a, b, c, d);
            }
        """
        errors = ABI.validate_source("sub_800A34C", unsafe)
        self.assertTrue(errors)
        self.assertTrue(all("expected 5" in error for error in errors))

    def test_accepts_real_five_argument_shape(self):
        safe = r"""
            struct SplineVec2 { int x, y; };
            extern void sub_800A194(
                int *a, int *b, int *c, struct SplineVec2 *d, int n);
            void sub_800A34C(
                int *a, int *b, int *c, struct SplineVec2 *d, int n)
            {
                sub_800A194(a, b, c, d, n);
            }
        """
        self.assertEqual(ABI.validate_source("sub_800A34C", safe), [])

    def test_differential_parser_uses_target_definition(self):
        self.assertEqual(
            D.parse_sig("sub_800A34C"),
            (0, ["ptr", "ptr", "ptr", "val", "val"]),
        )

    def test_call_observable_compares_fifth_word(self):
        word = z3.BitVecSort(32)
        byte = z3.BitVecSort(8)
        regs = {i: z3.BitVecVal(0, 32) for i in range(16)}
        flags = {name: z3.BitVecVal(0, 1) for name in "NZCV"}
        data = z3.K(word, z3.BitVecVal(0, 8))
        stack = z3.K(word, z3.BitVecVal(0, 8))
        common = [z3.BitVecVal(i, 32) for i in range(4)]
        call_a = {
            "target": 0x0800A194,
            "args": common + [z3.BitVecVal(3, 32)],
        }
        call_b = {
            "target": 0x0800A194,
            "args": common + [z3.BitVecVal(4, 32)],
        }
        state_a = State(dict(regs), dict(flags), data, stack, [call_a], [], [], {})
        state_b = State(dict(regs), dict(flags), data, stack, [call_b], [], [], {})
        self.assertTrue(z3.is_true(z3.simplify(P.obs_differ(state_a, state_b))))


if __name__ == "__main__":
    unittest.main()
