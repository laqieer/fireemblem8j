@ df3_opanim_gfx: region-different data not reachable by the code-literal carver
@ (leaf assets are unnamed US symbols). Boundaries read live from the bracketing carved/named objects (single identified blob; per-asset
@ tiling N/A - the index structs live outside the window)
@ in baserom.
@ Region [0x08b75860, 0x08b89af8); already-carved region-same
@ sub-assets are gap-subtracted, so only the uncarved blobs are emitted here.

	.section .data.frontier_df3_opanim_gfx.gap0, "a", %progbits
@ df3_opanim_gfx region-different data, JP 0x08b75860..0x08b7741c (7100 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_df3_opanim_gfx_000_B75860
frontier_df3_opanim_gfx_000_B75860:
	.incbin "baserom.gba", 0xB75860, 0x1BBC

	.section .data.frontier_df3_opanim_gfx.gap1, "a", %progbits
@ df3_opanim_gfx region-different data, JP 0x08b79ebc..0x08b7affc (4416 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_df3_opanim_gfx_001_B79EBC
frontier_df3_opanim_gfx_001_B79EBC:
	.incbin "baserom.gba", 0xB79EBC, 0x1140

	.section .data.frontier_df3_opanim_gfx.gap2, "a", %progbits
@ df3_opanim_gfx region-different data, JP 0x08b7f118..0x08b839f4 (18652 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_df3_opanim_gfx_002_B7F118
frontier_df3_opanim_gfx_002_B7F118:
	.incbin "baserom.gba", 0xB7F118, 0x48DC

	.section .data.frontier_df3_opanim_gfx.gap3, "a", %progbits
@ df3_opanim_gfx region-different data, JP 0x08b864a8..0x08b89af8 (13904 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_df3_opanim_gfx_003_B864A8
frontier_df3_opanim_gfx_003_B864A8:
	.incbin "baserom.gba", 0xB864A8, 0x3650
