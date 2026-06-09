@ df3_data_5aa96c: region-different data not reachable by the code-literal carver
@ (leaf assets are unnamed US symbols). Boundaries read live from the bracketing carved/named objects (single identified blob; per-asset
@ tiling N/A - the index structs live outside the window)
@ in baserom.
@ Region [0x085d367c, 0x085d92d0); already-carved region-same
@ sub-assets are gap-subtracted, so only the uncarved blobs are emitted here.

	.section .data.frontier_df3_data_5aa96c.gap0, "a", %progbits
@ df3_data_5aa96c region-different data, JP 0x085d367c..0x085d3ea0 (2084 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_df3_data_5aa96c_000_5D367C
frontier_df3_data_5aa96c_000_5D367C:
	.incbin "baserom.gba", 0x5D367C, 0x824

	.section .data.frontier_df3_data_5aa96c.gap1, "a", %progbits
@ df3_data_5aa96c region-different data, JP 0x085d3ea8..0x085d4310 (1128 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_df3_data_5aa96c_001_5D3EA8
frontier_df3_data_5aa96c_001_5D3EA8:
	.incbin "baserom.gba", 0x5D3EA8, 0x468

	.section .data.frontier_df3_data_5aa96c.gap2, "a", %progbits
@ df3_data_5aa96c region-different data, JP 0x085d4358..0x085d48c8 (1392 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_df3_data_5aa96c_002_5D4358
frontier_df3_data_5aa96c_002_5D4358:
	.incbin "baserom.gba", 0x5D4358, 0x570

	.section .data.frontier_df3_data_5aa96c.gap3, "a", %progbits
@ df3_data_5aa96c region-different data, JP 0x085d48e0..0x085d4c0c (812 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_df3_data_5aa96c_003_5D48E0
frontier_df3_data_5aa96c_003_5D48E0:
	.incbin "baserom.gba", 0x5D48E0, 0x32C

	.section .data.frontier_df3_data_5aa96c.gap4, "a", %progbits
@ df3_data_5aa96c region-different data, JP 0x085d4c5c..0x085d4c94 (56 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_df3_data_5aa96c_004_5D4C5C
frontier_df3_data_5aa96c_004_5D4C5C:
	.incbin "baserom.gba", 0x5D4C5C, 0x38

	.section .data.frontier_df3_data_5aa96c.gap5, "a", %progbits
@ df3_data_5aa96c region-different data, JP 0x085d4dd8..0x085d4eb0 (216 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_df3_data_5aa96c_005_5D4DD8
frontier_df3_data_5aa96c_005_5D4DD8:
	.incbin "baserom.gba", 0x5D4DD8, 0xD8

	.section .data.frontier_df3_data_5aa96c.gap6, "a", %progbits
@ df3_data_5aa96c region-different data, JP 0x085d53fc..0x085d68b4 (5304 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_df3_data_5aa96c_006_5D53FC
frontier_df3_data_5aa96c_006_5D53FC:
	.incbin "baserom.gba", 0x5D53FC, 0x14B8

	.section .data.frontier_df3_data_5aa96c.gap7, "a", %progbits
@ df3_data_5aa96c region-different data, JP 0x085d737c..0x085d7c6c (2288 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_df3_data_5aa96c_007_5D737C
frontier_df3_data_5aa96c_007_5D737C:
	.incbin "baserom.gba", 0x5D737C, 0x8F0

	.section .data.frontier_df3_data_5aa96c.gap8, "a", %progbits
@ df3_data_5aa96c region-different data, JP 0x085d8048..0x085d8068 (32 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_df3_data_5aa96c_008_5D8048
frontier_df3_data_5aa96c_008_5D8048:
	.incbin "baserom.gba", 0x5D8048, 0x20

	.section .data.frontier_df3_data_5aa96c.gap9, "a", %progbits
@ df3_data_5aa96c region-different data, JP 0x085d8a8c..0x085d92d0 (2116 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_df3_data_5aa96c_009_5D8A8C
frontier_df3_data_5aa96c_009_5D8A8C:
	.incbin "baserom.gba", 0x5D8A8C, 0x844
