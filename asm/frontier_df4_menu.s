@ df4_menu: data-frontier-4 long-tail sweep — region-different data not
@ reachable by the code-literal carver, in the pure-DATA window
@ [0x08a146bc, 0x08ac059c) (verified: 0 carved .text
@ objects inside; whole window is at/above the code+library boundary
@ 0x080dc134). Each gap is [prev_carved_end, next_carved_start) — already
@ snapped to carved edges; already-carved region-same sub-assets are
@ gap-subtracted, so only the uncarved blobs are emitted here.

	.section .data.frontier_df4_menu.gap0, "a", %progbits
@ df4_menu region-different data, JP 0x08a149d4..0x08a14dec (1048 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_menu_000_A149D4
frontier_df4_menu_000_A149D4:
	.incbin "baserom.gba", 0xA149D4, 0x418

	.section .data.frontier_df4_menu.gap1, "a", %progbits
@ df4_menu region-different data, JP 0x08a588c0..0x08a5a35c (6812 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_menu_001_A588C0
frontier_df4_menu_001_A588C0:
	.incbin "baserom.gba", 0xA588C0, 0x1A9C

	.section .data.frontier_df4_menu.gap2, "a", %progbits
@ df4_menu region-different data, JP 0x08a5d648..0x08a5d9b8 (880 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_menu_002_A5D648
frontier_df4_menu_002_A5D648:
	.incbin "baserom.gba", 0xA5D648, 0x370

	.section .data.frontier_df4_menu.gap3, "a", %progbits
@ df4_menu region-different data, JP 0x08a5e6cc..0x08a5f230 (2916 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_menu_003_A5E6CC
frontier_df4_menu_003_A5E6CC:
	.incbin "baserom.gba", 0xA5E6CC, 0xB64

	.section .data.frontier_df4_menu.gap4, "a", %progbits
@ df4_menu region-different data, JP 0x08a5f770..0x08a5feb6 (1862 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_menu_004_A5F770
frontier_df4_menu_004_A5F770:
	.incbin "baserom.gba", 0xA5F770, 0x746

	.section .data.frontier_df4_menu.gap5, "a", %progbits
@ df4_menu region-different data, JP 0x08a5ffad..0x08a601f8 (587 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_menu_005_A5FFAD
frontier_df4_menu_005_A5FFAD:
	.incbin "baserom.gba", 0xA5FFAD, 0x24B

	.section .data.frontier_df4_menu.gap6, "a", %progbits
@ df4_menu region-different data, JP 0x08a65504..0x08a65768 (612 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_menu_006_A65504
frontier_df4_menu_006_A65504:
	.incbin "baserom.gba", 0xA65504, 0x264

	.section .data.frontier_df4_menu.gap7, "a", %progbits
@ df4_menu region-different data, JP 0x08a657d4..0x08a65aa0 (716 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_menu_007_A657D4
frontier_df4_menu_007_A657D4:
	.incbin "baserom.gba", 0xA657D4, 0x2CC

	.section .data.frontier_df4_menu.gap8, "a", %progbits
@ df4_menu region-different data, JP 0x08a66f88..0x08a674a0 (1304 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_menu_008_A66F88
frontier_df4_menu_008_A66F88:
	.incbin "baserom.gba", 0xA66F88, 0x518

	.section .data.frontier_df4_menu.gap9, "a", %progbits
@ df4_menu region-different data, JP 0x08a67660..0x08a678cc (620 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_menu_009_A67660
frontier_df4_menu_009_A67660:
	.incbin "baserom.gba", 0xA67660, 0x26C

	.section .data.frontier_df4_menu.gap10, "a", %progbits
@ df4_menu region-different data, JP 0x08a67eec..0x08a682ec (1024 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_menu_010_A67EEC
frontier_df4_menu_010_A67EEC:
	.incbin "baserom.gba", 0xA67EEC, 0x400

	.section .data.frontier_df4_menu.gap11, "a", %progbits
@ df4_menu region-different data, JP 0x08a71268..0x08a715ac (836 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_menu_011_A71268
frontier_df4_menu_011_A71268:
	.incbin "baserom.gba", 0xA71268, 0x344

	.section .data.frontier_df4_menu.gap12, "a", %progbits
@ df4_menu region-different data, JP 0x08a71cc4..0x08a71f3c (632 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_menu_012_A71CC4
frontier_df4_menu_012_A71CC4:
	.incbin "baserom.gba", 0xA71CC4, 0x278

	.section .data.frontier_df4_menu.gap13, "a", %progbits
@ df4_menu region-different data, JP 0x08a72408..0x08a729f0 (1512 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_menu_013_A72408
frontier_df4_menu_013_A72408:
	.incbin "baserom.gba", 0xA72408, 0x5E8

	.section .data.frontier_df4_menu.gap14, "a", %progbits
@ df4_menu region-different data, JP 0x08a72bf0..0x08a738e0 (3312 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_menu_014_A72BF0
frontier_df4_menu_014_A72BF0:
	.incbin "baserom.gba", 0xA72BF0, 0xCF0

	.section .data.frontier_df4_menu.gap15, "a", %progbits
@ df4_menu region-different data, JP 0x08a73900..0x08a73f9c (1692 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_menu_015_A73900
frontier_df4_menu_015_A73900:
	.incbin "baserom.gba", 0xA73900, 0x69C

	.section .data.frontier_df4_menu.gap16, "a", %progbits
@ df4_menu region-different data, JP 0x08a74cec..0x08a74fec (768 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_menu_016_A74CEC
frontier_df4_menu_016_A74CEC:
	.incbin "baserom.gba", 0xA74CEC, 0x300

	.section .data.frontier_df4_menu.gap17, "a", %progbits
@ df4_menu region-different data, JP 0x08a79e90..0x08a7b098 (4616 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_menu_017_A79E90
frontier_df4_menu_017_A79E90:
	.incbin "baserom.gba", 0xA79E90, 0x1208

	.section .data.frontier_df4_menu.gap18, "a", %progbits
@ df4_menu region-different data, JP 0x08a92b38..0x08a930d8 (1440 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_menu_018_A92B38
frontier_df4_menu_018_A92B38:
	.incbin "baserom.gba", 0xA92B38, 0x5A0

	.section .data.frontier_df4_menu.gap19, "a", %progbits
@ df4_menu region-different data, JP 0x08a934ec..0x08a94488 (3996 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_menu_019_A934EC
frontier_df4_menu_019_A934EC:
	.incbin "baserom.gba", 0xA934EC, 0xF9C

	.section .data.frontier_df4_menu.gap20, "a", %progbits
@ df4_menu region-different data, JP 0x08a9454c..0x08a95b14 (5576 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_menu_020_A9454C
frontier_df4_menu_020_A9454C:
	.incbin "baserom.gba", 0xA9454C, 0x15C8

	.section .data.frontier_df4_menu.gap21, "a", %progbits
@ df4_menu region-different data, JP 0x08a95b4e..0x08a9645c (2318 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_menu_021_A95B4E
frontier_df4_menu_021_A95B4E:
	.incbin "baserom.gba", 0xA95B4E, 0x90E

	.section .data.frontier_df4_menu.gap22, "a", %progbits
@ df4_menu region-different data, JP 0x08a96d18..0x08a97720 (2568 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_menu_022_A96D18
frontier_df4_menu_022_A96D18:
	.incbin "baserom.gba", 0xA96D18, 0xA08

	.section .data.frontier_df4_menu.gap23, "a", %progbits
@ df4_menu region-different data, JP 0x08a99fa8..0x08a9a624 (1660 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_menu_023_A99FA8
frontier_df4_menu_023_A99FA8:
	.incbin "baserom.gba", 0xA99FA8, 0x67C

	.section .data.frontier_df4_menu.gap24, "a", %progbits
@ df4_menu region-different data, JP 0x08a9ac28..0x08a9b08c (1124 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_menu_024_A9AC28
frontier_df4_menu_024_A9AC28:
	.incbin "baserom.gba", 0xA9AC28, 0x464

	.section .data.frontier_df4_menu.gap25, "a", %progbits
@ df4_menu region-different data, JP 0x08a9c020..0x08a9ca20 (2560 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_menu_025_A9C020
frontier_df4_menu_025_A9C020:
	.incbin "baserom.gba", 0xA9C020, 0xA00

	.section .data.frontier_df4_menu.gap26, "a", %progbits
@ df4_menu region-different data, JP 0x08a9cf7c..0x08a9d448 (1228 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_menu_026_A9CF7C
frontier_df4_menu_026_A9CF7C:
	.incbin "baserom.gba", 0xA9CF7C, 0x4CC

	.section .data.frontier_df4_menu.gap27, "a", %progbits
@ df4_menu region-different data, JP 0x08a9d462..0x08a9d856 (1012 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_menu_027_A9D462
frontier_df4_menu_027_A9D462:
	.incbin "baserom.gba", 0xA9D462, 0x3F4

	.section .data.frontier_df4_menu.gap28, "a", %progbits
@ df4_menu region-different data, JP 0x08a9e244..0x08a9e5c0 (892 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_menu_028_A9E244
frontier_df4_menu_028_A9E244:
	.incbin "baserom.gba", 0xA9E244, 0x37C

	.section .data.frontier_df4_menu.gap29, "a", %progbits
@ df4_menu region-different data, JP 0x08aa3860..0x08aa7094 (14388 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_menu_029_AA3860
frontier_df4_menu_029_AA3860:
	.incbin "baserom.gba", 0xAA3860, 0x3834

	.section .data.frontier_df4_menu.gap30, "a", %progbits
@ df4_menu region-different data, JP 0x08aa71d4..0x08aa77e4 (1552 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_menu_030_AA71D4
frontier_df4_menu_030_AA71D4:
	.incbin "baserom.gba", 0xAA71D4, 0x610

	.section .data.frontier_df4_menu.gap31, "a", %progbits
@ df4_menu region-different data, JP 0x08aa9f98..0x08aaa3cc (1076 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_menu_031_AA9F98
frontier_df4_menu_031_AA9F98:
	.incbin "baserom.gba", 0xAA9F98, 0x434

	.section .data.frontier_df4_menu.gap32, "a", %progbits
@ df4_menu region-different data, JP 0x08aaac4c..0x08aadc58 (12300 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_menu_032_AAAC4C
frontier_df4_menu_032_AAAC4C:
	.incbin "baserom.gba", 0xAAAC4C, 0x300C

	.section .data.frontier_df4_menu.gap33, "a", %progbits
@ df4_menu region-different data, JP 0x08aaeb40..0x08aaf350 (2064 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_menu_033_AAEB40
frontier_df4_menu_033_AAEB40:
	.incbin "baserom.gba", 0xAAEB40, 0x810

	.section .data.frontier_df4_menu.gap34, "a", %progbits
@ df4_menu region-different data, JP 0x08aaf9ec..0x08ab031c (2352 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_menu_034_AAF9EC
frontier_df4_menu_034_AAF9EC:
	.incbin "baserom.gba", 0xAAF9EC, 0x930

	.section .data.frontier_df4_menu.gap35, "a", %progbits
@ df4_menu region-different data, JP 0x08ab0830..0x08ab0a44 (532 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_menu_035_AB0830
frontier_df4_menu_035_AB0830:
	.incbin "baserom.gba", 0xAB0830, 0x214

	.section .data.frontier_df4_menu.gap36, "a", %progbits
@ df4_menu region-different data, JP 0x08ab0d18..0x08ab0fdc (708 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_menu_036_AB0D18
frontier_df4_menu_036_AB0D18:
	.incbin "baserom.gba", 0xAB0D18, 0x2C4

	.section .data.frontier_df4_menu.gap37, "a", %progbits
@ df4_menu region-different data, JP 0x08ab7144..0x08abcad0 (22924 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_menu_037_AB7144
frontier_df4_menu_037_AB7144:
	.incbin "baserom.gba", 0xAB7144, 0x598C

	.section .data.frontier_df4_menu.gap38, "a", %progbits
@ df4_menu region-different data, JP 0x08abcd24..0x08abffe4 (12992 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_menu_038_ABCD24
frontier_df4_menu_038_ABCD24:
	.incbin "baserom.gba", 0xABCD24, 0x32C0

	.section .data.frontier_df4_menu.gap39, "a", %progbits
@ df4_menu region-different data, JP 0x08ac00a8..0x08ac0394 (748 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_menu_039_AC00A8
frontier_df4_menu_039_AC00A8:
	.incbin "baserom.gba", 0xAC00A8, 0x2EC
