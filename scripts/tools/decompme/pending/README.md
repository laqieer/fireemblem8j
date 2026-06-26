# Pending decomp.me reconstructions (D292)

These are **near-match C reconstructions** of JP-only bare-asm FE8J functions produced
by the `fe8j-reconstruct-bareasm` workflow — NOT byte-exact matches, NOT compiled into
the ROM. They are the *starting C bases* for posting to decomp.me (so the community has
something to fork) and for seeding the permuter.

IMPORTANT: residuals here are the agents' self-reported numbers; INDEPENDENTLY VERIFIED
values differ (e.g. sub_80D1844=35B confirmed; Event1B_TEXTSHOW=74B; sub_80A6D34/
SelectSummonPos had size mismatches standalone). Always re-verify with `make compare` /
a fresh objdump byte-diff before trusting a residual. `make compare`-is-the-only-oracle.

Name -> asm: Event1B_TEXTSHOW=sub_800E5CC, SelectSummonPos=sub_807D3BC,
ClassStatsDisplay_Loop / GmapScreen2_Loop = sub_80B8B28 / sub_80C05C8 (see each file's
header for the JP address). sub_80D1844 (=LoadClassNameInClassReelFont) is the closest
and is staged in src/nonmatching/ + running in the permuter.

Posted to decomp.me as accounts/cookies allow (scripts/tools/decompme/new_scratch.sh).
