@ df3_eventscr_ch: region-different data not reachable by the code-literal carver
@ (leaf assets are unnamed US symbols). Boundaries read live from the bracketing carved/named objects (single identified blob; per-asset
@ tiling N/A - the index structs live outside the window)
@ in baserom.
@ Region [0x08a69408, 0x08a70c88); already-carved region-same
@ sub-assets are gap-subtracted, so only the uncarved blobs are emitted here.

	.section .data.frontier_df3_eventscr_ch.gap0, "a", %progbits
@ df3_eventscr_ch region-different data, JP 0x08a69464..0x08a69688 (548 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_df3_eventscr_ch_000_A69464
frontier_df3_eventscr_ch_000_A69464:
	.incbin "baserom.gba", 0xA69464, 0x224

	.section .data.frontier_df3_eventscr_ch.gap1, "a", %progbits
@ df3_eventscr_ch region-different data, JP 0x08a696d4..0x08a69f50 (2172 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_df3_eventscr_ch_001_A696D4
frontier_df3_eventscr_ch_001_A696D4:
	.incbin "baserom.gba", 0xA696D4, 0x87C

	.section .data.frontier_df3_eventscr_ch.gap2, "a", %progbits
@ df3_eventscr_ch region-different data, JP 0x08a6a06c..0x08a6a76c (1792 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_df3_eventscr_ch_002_A6A06C
frontier_df3_eventscr_ch_002_A6A06C:
	.incbin "baserom.gba", 0xA6A06C, 0x700

	.section .data.frontier_df3_eventscr_ch.gap3, "a", %progbits
@ df3_eventscr_ch region-different data, JP 0x08a6aa20..0x08a6adb0 (912 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_df3_eventscr_ch_003_A6AA20
frontier_df3_eventscr_ch_003_A6AA20:
	.incbin "baserom.gba", 0xA6AA20, 0x390

	.section .data.frontier_df3_eventscr_ch.gap4, "a", %progbits
@ df3_eventscr_ch region-different data, JP 0x08a6ae28..0x08a6b224 (1020 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_df3_eventscr_ch_004_A6AE28
frontier_df3_eventscr_ch_004_A6AE28:
	.incbin "baserom.gba", 0xA6AE28, 0x3FC

	.section .data.frontier_df3_eventscr_ch.gap5, "a", %progbits
@ df3_eventscr_ch region-different data, JP 0x08a6b460..0x08a6c000 (2976 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_df3_eventscr_ch_005_A6B460
frontier_df3_eventscr_ch_005_A6B460:
	.incbin "baserom.gba", 0xA6B460, 0xBA0

	.section .data.frontier_df3_eventscr_ch.gap6, "a", %progbits
@ df3_eventscr_ch region-different data, JP 0x08a6c078..0x08a6c88c (2068 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_df3_eventscr_ch_006_A6C078
frontier_df3_eventscr_ch_006_A6C078:
	.incbin "baserom.gba", 0xA6C078, 0x814

	.section .data.frontier_df3_eventscr_ch.gap7, "a", %progbits
@ df3_eventscr_ch region-different data, JP 0x08a6c8cc..0x08a6cba4 (728 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_df3_eventscr_ch_007_A6C8CC
frontier_df3_eventscr_ch_007_A6C8CC:
	.incbin "baserom.gba", 0xA6C8CC, 0x2D8

	.section .data.frontier_df3_eventscr_ch.gap8, "a", %progbits
@ df3_eventscr_ch region-different data, JP 0x08a6cd00..0x08a6d2c4 (1476 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_df3_eventscr_ch_008_A6CD00
frontier_df3_eventscr_ch_008_A6CD00:
	.incbin "baserom.gba", 0xA6CD00, 0x5C4

	.section .data.frontier_df3_eventscr_ch.gap9, "a", %progbits
@ df3_eventscr_ch region-different data, JP 0x08a6d3f8..0x08a6d4dc (228 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_df3_eventscr_ch_009_A6D3F8
frontier_df3_eventscr_ch_009_A6D3F8:
	.incbin "baserom.gba", 0xA6D3F8, 0xE4

	.section .data.frontier_df3_eventscr_ch.gap10, "a", %progbits
@ df3_eventscr_ch region-different data, JP 0x08a6d524..0x08a6d758 (564 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_df3_eventscr_ch_010_A6D524
frontier_df3_eventscr_ch_010_A6D524:
	.incbin "baserom.gba", 0xA6D524, 0x234

	.section .data.frontier_df3_eventscr_ch.gap11, "a", %progbits
@ df3_eventscr_ch region-different data, JP 0x08a6d850..0x08a6dcec (1180 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_df3_eventscr_ch_011_A6D850
frontier_df3_eventscr_ch_011_A6D850:
	.incbin "baserom.gba", 0xA6D850, 0x49C

	.section .data.frontier_df3_eventscr_ch.gap12, "a", %progbits
@ df3_eventscr_ch region-different data, JP 0x08a6de0c..0x08a6e60c (2048 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_df3_eventscr_ch_012_A6DE0C
frontier_df3_eventscr_ch_012_A6DE0C:
	.incbin "baserom.gba", 0xA6DE0C, 0x800

	.section .data.frontier_df3_eventscr_ch.gap13, "a", %progbits
@ df3_eventscr_ch region-different data, JP 0x08a6e680..0x08a6e7dc (348 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_df3_eventscr_ch_013_A6E680
frontier_df3_eventscr_ch_013_A6E680:
	.incbin "baserom.gba", 0xA6E680, 0x15C

	.section .data.frontier_df3_eventscr_ch.gap14, "a", %progbits
@ df3_eventscr_ch region-different data, JP 0x08a6edfc..0x08a6eec0 (196 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_df3_eventscr_ch_014_A6EDFC
frontier_df3_eventscr_ch_014_A6EDFC:
	.incbin "baserom.gba", 0xA6EDFC, 0xC4

	.section .data.frontier_df3_eventscr_ch.gap15, "a", %progbits
@ df3_eventscr_ch region-different data, JP 0x08a6ef04..0x08a6ef3c (56 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_df3_eventscr_ch_015_A6EF04
frontier_df3_eventscr_ch_015_A6EF04:
	.incbin "baserom.gba", 0xA6EF04, 0x38

	.section .data.frontier_df3_eventscr_ch.gap16, "a", %progbits
@ df3_eventscr_ch region-different data, JP 0x08a6efd8..0x08a6f43c (1124 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_df3_eventscr_ch_016_A6EFD8
frontier_df3_eventscr_ch_016_A6EFD8:
	.incbin "baserom.gba", 0xA6EFD8, 0x464

	.section .data.frontier_df3_eventscr_ch.gap17, "a", %progbits
@ df3_eventscr_ch region-different data, JP 0x08a6f47c..0x08a6fa2c (1456 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_df3_eventscr_ch_017_A6F47C
frontier_df3_eventscr_ch_017_A6F47C:
	.incbin "baserom.gba", 0xA6F47C, 0x5B0

	.section .data.frontier_df3_eventscr_ch.gap18, "a", %progbits
@ df3_eventscr_ch region-different data, JP 0x08a6fae4..0x08a6fb04 (32 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_df3_eventscr_ch_018_A6FAE4
frontier_df3_eventscr_ch_018_A6FAE4:
	.incbin "baserom.gba", 0xA6FAE4, 0x20

	.section .data.frontier_df3_eventscr_ch.gap19, "a", %progbits
@ df3_eventscr_ch region-different data, JP 0x08a6fb48..0x08a6fb58 (16 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_df3_eventscr_ch_019_A6FB48
frontier_df3_eventscr_ch_019_A6FB48:
	.incbin "baserom.gba", 0xA6FB48, 0x10

	.section .data.frontier_df3_eventscr_ch.gap20, "a", %progbits
@ df3_eventscr_ch region-different data, JP 0x08a6fb9c..0x08a6fc04 (104 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_df3_eventscr_ch_020_A6FB9C
frontier_df3_eventscr_ch_020_A6FB9C:
	.incbin "baserom.gba", 0xA6FB9C, 0x68

	.section .data.frontier_df3_eventscr_ch.gap21, "a", %progbits
@ df3_eventscr_ch region-different data, JP 0x08a6fc48..0x08a70c88 (4160 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_df3_eventscr_ch_021_A6FC48
frontier_df3_eventscr_ch_021_A6FC48:
	.incbin "baserom.gba", 0xA6FC48, 0x1040
