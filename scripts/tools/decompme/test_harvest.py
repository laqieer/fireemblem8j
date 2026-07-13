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


if __name__ == "__main__":
    unittest.main()
