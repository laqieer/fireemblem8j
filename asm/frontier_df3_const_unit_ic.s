@ df3_const_unit_ic: region-different data not reachable by the code-literal carver
@ (leaf assets are unnamed US symbols). Boundaries read live from the bracketing carved/named objects (single identified blob; per-asset
@ tiling N/A - the index structs live outside the window)
@ in baserom.
@ Region [0x081c0d80, 0x081c4a04); already-carved region-same
@ sub-assets are gap-subtracted, so only the uncarved blobs are emitted here.

	.section .data.frontier_df3_const_unit_ic.gap0, "a", %progbits
@ df3_const_unit_ic region-different data, JP 0x081c0d80..0x081c2224 (5284 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_df3_const_unit_ic_000_1C0D80
frontier_df3_const_unit_ic_000_1C0D80:
	.incbin "baserom.gba", 0x1C0D80, 0x14A4

	.section .data.frontier_df3_const_unit_ic.gap1, "a", %progbits
@ df3_const_unit_ic region-different data, JP 0x081c2b4c..0x081c4a04 (7864 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_df3_const_unit_ic_001_1C2B4C
frontier_df3_const_unit_ic_001_1C2B4C:
	.incbin "baserom.gba", 0x1C2B4C, 0x1EB8
