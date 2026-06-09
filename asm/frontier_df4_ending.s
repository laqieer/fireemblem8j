@ df4_ending: data-frontier-4 long-tail sweep — region-different data not
@ reachable by the code-literal carver, in the pure-DATA window
@ [0x08ac059c, 0x08babaf8) (verified: 0 carved .text
@ objects inside; whole window is at/above the code+library boundary
@ 0x080dc134). Each gap is [prev_carved_end, next_carved_start) — already
@ snapped to carved edges; already-carved region-same sub-assets are
@ gap-subtracted, so only the uncarved blobs are emitted here.

	.section .data.frontier_df4_ending.gap0, "a", %progbits
@ df4_ending region-different data, JP 0x08ac059c..0x08ac09e8 (1100 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_ending_000_AC059C
frontier_df4_ending_000_AC059C:
	.incbin "baserom.gba", 0xAC059C, 0x44C

	.section .data.frontier_df4_ending.gap1, "a", %progbits
@ df4_ending region-different data, JP 0x08ac0b90..0x08ac1108 (1400 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_ending_001_AC0B90
frontier_df4_ending_001_AC0B90:
	.incbin "baserom.gba", 0xAC0B90, 0x578

	.section .data.frontier_df4_ending.gap2, "a", %progbits
@ df4_ending region-different data, JP 0x08ac16c8..0x08ac1a0c (836 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_ending_002_AC16C8
frontier_df4_ending_002_AC16C8:
	.incbin "baserom.gba", 0xAC16C8, 0x344

	.section .data.frontier_df4_ending.gap3, "a", %progbits
@ df4_ending region-different data, JP 0x08ac718c..0x08ac7408 (636 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_ending_003_AC718C
frontier_df4_ending_003_AC718C:
	.incbin "baserom.gba", 0xAC718C, 0x27C

	.section .data.frontier_df4_ending.gap4, "a", %progbits
@ df4_ending region-different data, JP 0x08acc378..0x08accd98 (2592 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_ending_004_ACC378
frontier_df4_ending_004_ACC378:
	.incbin "baserom.gba", 0xACC378, 0xA20

	.section .data.frontier_df4_ending.gap5, "a", %progbits
@ df4_ending region-different data, JP 0x08aceb54..0x08acf418 (2244 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_ending_005_ACEB54
frontier_df4_ending_005_ACEB54:
	.incbin "baserom.gba", 0xACEB54, 0x8C4

	.section .data.frontier_df4_ending.gap6, "a", %progbits
@ df4_ending region-different data, JP 0x08ad02d4..0x08ad06f4 (1056 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_ending_006_AD02D4
frontier_df4_ending_006_AD02D4:
	.incbin "baserom.gba", 0xAD02D4, 0x420

	.section .data.frontier_df4_ending.gap7, "a", %progbits
@ df4_ending region-different data, JP 0x08ad0cfc..0x08ad1284 (1416 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_ending_007_AD0CFC
frontier_df4_ending_007_AD0CFC:
	.incbin "baserom.gba", 0xAD0CFC, 0x588

	.section .data.frontier_df4_ending.gap8, "a", %progbits
@ df4_ending region-different data, JP 0x08ad1444..0x08ad247c (4152 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_ending_008_AD1444
frontier_df4_ending_008_AD1444:
	.incbin "baserom.gba", 0xAD1444, 0x1038

	.section .data.frontier_df4_ending.gap9, "a", %progbits
@ df4_ending region-different data, JP 0x08b1d954..0x08b1e49c (2888 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_ending_009_B1D954
frontier_df4_ending_009_B1D954:
	.incbin "baserom.gba", 0xB1D954, 0xB48

	.section .data.frontier_df4_ending.gap10, "a", %progbits
@ df4_ending region-different data, JP 0x08b1e5fc..0x08b1e894 (664 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_ending_010_B1E5FC
frontier_df4_ending_010_B1E5FC:
	.incbin "baserom.gba", 0xB1E5FC, 0x298

	.section .data.frontier_df4_ending.gap11, "a", %progbits
@ df4_ending region-different data, JP 0x08b24d0c..0x08b2523c (1328 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_ending_011_B24D0C
frontier_df4_ending_011_B24D0C:
	.incbin "baserom.gba", 0xB24D0C, 0x530

	.section .data.frontier_df4_ending.gap12, "a", %progbits
@ df4_ending region-different data, JP 0x08b25a78..0x08b25f9c (1316 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_ending_012_B25A78
frontier_df4_ending_012_B25A78:
	.incbin "baserom.gba", 0xB25A78, 0x524

	.section .data.frontier_df4_ending.gap13, "a", %progbits
@ df4_ending region-different data, JP 0x08b26374..0x08b26938 (1476 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_ending_013_B26374
frontier_df4_ending_013_B26374:
	.incbin "baserom.gba", 0xB26374, 0x5C4

	.section .data.frontier_df4_ending.gap14, "a", %progbits
@ df4_ending region-different data, JP 0x08b26a6c..0x08b2759c (2864 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_ending_014_B26A6C
frontier_df4_ending_014_B26A6C:
	.incbin "baserom.gba", 0xB26A6C, 0xB30

	.section .data.frontier_df4_ending.gap15, "a", %progbits
@ df4_ending region-different data, JP 0x08b3b3d4..0x08b3b74c (888 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_ending_015_B3B3D4
frontier_df4_ending_015_B3B3D4:
	.incbin "baserom.gba", 0xB3B3D4, 0x378

	.section .data.frontier_df4_ending.gap16, "a", %progbits
@ df4_ending region-different data, JP 0x08b3ebe4..0x08b3ee00 (540 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_ending_016_B3EBE4
frontier_df4_ending_016_B3EBE4:
	.incbin "baserom.gba", 0xB3EBE4, 0x21C

	.section .data.frontier_df4_ending.gap17, "a", %progbits
@ df4_ending region-different data, JP 0x08b3f024..0x08b3f690 (1644 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_ending_017_B3F024
frontier_df4_ending_017_B3F024:
	.incbin "baserom.gba", 0xB3F024, 0x66C

	.section .data.frontier_df4_ending.gap18, "a", %progbits
@ df4_ending region-different data, JP 0x08b3f7bc..0x08b3fcf4 (1336 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_ending_018_B3F7BC
frontier_df4_ending_018_B3F7BC:
	.incbin "baserom.gba", 0xB3F7BC, 0x538

	.section .data.frontier_df4_ending.gap19, "a", %progbits
@ df4_ending region-different data, JP 0x08b8b998..0x08b8c43c (2724 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_ending_019_B8B998
frontier_df4_ending_019_B8B998:
	.incbin "baserom.gba", 0xB8B998, 0xAA4

	.section .data.frontier_df4_ending.gap20, "a", %progbits
@ df4_ending region-different data, JP 0x08baa2e0..0x08baa71c (1084 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_ending_020_BAA2E0
frontier_df4_ending_020_BAA2E0:
	.incbin "baserom.gba", 0xBAA2E0, 0x43C

	.section .data.frontier_df4_ending.gap21, "a", %progbits
@ df4_ending region-different data, JP 0x08bab754..0x08babab4 (864 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_ending_021_BAB754
frontier_df4_ending_021_BAB754:
	.incbin "baserom.gba", 0xBAB754, 0x360
