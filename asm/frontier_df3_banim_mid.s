@ df3_banim_mid: region-different data not reachable by the code-literal carver
@ (leaf assets are unnamed US symbols). Boundaries read live from the bracketing carved/named objects (single identified blob; per-asset
@ tiling N/A - the index structs live outside the window)
@ in baserom.
@ Region [0x0864d2b4, 0x08659804); already-carved region-same
@ sub-assets are gap-subtracted, so only the uncarved blobs are emitted here.

	.section .data.frontier_df3_banim_mid.gap0, "a", %progbits
@ df3_banim_mid region-different data, JP 0x0864d2b4..0x0864ddbc (2824 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_df3_banim_mid_000_64D2B4
frontier_df3_banim_mid_000_64D2B4:
	.incbin "graphics/frontier_df3_banim_mid/frontier_df3_banim_mid_000_64D2B4.bin"

	.section .data.frontier_df3_banim_mid.gap1, "a", %progbits
@ df3_banim_mid region-different data, JP 0x086500b0..0x086506b8 (1544 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_df3_banim_mid_001_6500B0
frontier_df3_banim_mid_001_6500B0:
	.incbin "graphics/frontier_df3_banim_mid/frontier_df3_banim_mid_001_6500B0.bin"

	.section .data.frontier_df3_banim_mid.gap2, "a", %progbits
@ df3_banim_mid region-different data, JP 0x08651204..0x08651228 (36 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_df3_banim_mid_002_651204
frontier_df3_banim_mid_002_651204:
	.incbin "graphics/frontier_df3_banim_mid/frontier_df3_banim_mid_002_651204.bin"

	.section .data.frontier_df3_banim_mid.gap3, "a", %progbits
@ df3_banim_mid region-different data, JP 0x08651c6c..0x08651dfc (400 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_df3_banim_mid_003_651C6C
frontier_df3_banim_mid_003_651C6C:
	.incbin "graphics/frontier_df3_banim_mid/frontier_df3_banim_mid_003_651C6C.bin"

	.section .data.frontier_df3_banim_mid.gap4, "a", %progbits
@ df3_banim_mid region-different data, JP 0x08652948..0x0865296c (36 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_df3_banim_mid_004_652948
frontier_df3_banim_mid_004_652948:
	.incbin "graphics/frontier_df3_banim_mid/frontier_df3_banim_mid_004_652948.bin"

	.section .data.frontier_df3_banim_mid.gap5, "a", %progbits
@ df3_banim_mid region-different data, JP 0x086533b0..0x086540ec (3388 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_df3_banim_mid_005_6533B0
frontier_df3_banim_mid_005_6533B0:
	.incbin "graphics/frontier_df3_banim_mid/frontier_df3_banim_mid_005_6533B0.bin"

	.section .data.frontier_df3_banim_mid.gap6, "a", %progbits
@ df3_banim_mid region-different data, JP 0x08654dfc..0x08656058 (4700 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_df3_banim_mid_006_654DFC
frontier_df3_banim_mid_006_654DFC:
	.incbin "graphics/frontier_df3_banim_mid/frontier_df3_banim_mid_006_654DFC.bin.lz"

	.section .data.frontier_df3_banim_mid.gap7, "a", %progbits
@ df3_banim_mid region-different data, JP 0x08656ea8..0x08656ec8 (32 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_df3_banim_mid_007_656EA8
frontier_df3_banim_mid_007_656EA8:
	.incbin "graphics/frontier_df3_banim_mid/frontier_df3_banim_mid_007_656EA8.gbapal"

	.section .data.frontier_df3_banim_mid.gap8, "a", %progbits
@ df3_banim_mid region-different data, JP 0x08657a78..0x08657e84 (1036 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_df3_banim_mid_008_657A78
frontier_df3_banim_mid_008_657A78:
	.incbin "graphics/frontier_df3_banim_mid/frontier_df3_banim_mid_008_657A78.bin"

	.section .data.frontier_df3_banim_mid.gap9, "a", %progbits
@ df3_banim_mid region-different data, JP 0x086587e0..0x08659804 (4132 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_df3_banim_mid_009_6587E0
frontier_df3_banim_mid_009_6587E0:
	.incbin "graphics/frontier_df3_banim_mid/frontier_df3_banim_mid_009_6587E0.bin"
