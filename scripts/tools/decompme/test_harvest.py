#!/usr/bin/env python3

import unittest
from unittest import mock

import harvest


class RejectedFamilyMatchTest(unittest.TestCase):
    @mock.patch.object(harvest, "is_still_asm", return_value=True)
    @mock.patch.object(
        harvest,
        "family_members",
        return_value=[
            {
                "slug": "ABtKz",
                "score": 60,
                "owner": {"username": "laqieer"},
            },
            {
                "slug": "BVOBw",
                "score": 0,
                "owner": {"username": "TsilaAllaoui"},
            },
        ],
    )
    def test_known_false_zero_is_not_actionable(self, _family, _still):
        result = harvest.classify("sub_800A34C", "ABtKz")
        self.assertEqual(result["status"], "INVALID_MATCH")
        self.assertEqual(result["best"], 60)
        self.assertNotIn("matched_slug", result)
        self.assertEqual(result["rejected_matches"][0]["slug"], "BVOBw")

    @mock.patch.object(harvest, "is_still_asm", return_value=True)
    @mock.patch.object(
        harvest,
        "family_members",
        return_value=[
            {
                "slug": "J1ka1",
                "score": 10499,
                "owner": {"username": "laqieer"},
            },
            {
                "slug": "NPt7d",
                "score": 3655,
                "owner": {"username": "TsilaAllaoui"},
            },
        ],
    )
    def test_semantically_invalid_improvement_is_not_actionable(self, _family, _still):
        result = harvest.classify("sub_807D3BC", "J1ka1")
        self.assertEqual(result["status"], "INVALID_MATCH")
        self.assertEqual(result["best"], 10499)
        self.assertNotIn("matched_slug", result)
        self.assertEqual(result["rejected_matches"][0]["slug"], "NPt7d")


if __name__ == "__main__":
    unittest.main()
