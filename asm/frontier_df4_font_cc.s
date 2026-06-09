@ df4_font_cc: data-frontier-4 long-tail sweep — region-different data not
@ reachable by the code-literal carver, in the pure-DATA window
@ [0x08530000, 0x08577000) (verified: 0 carved .text
@ objects inside; whole window is at/above the code+library boundary
@ 0x080dc134). Each gap is [prev_carved_end, next_carved_start) — already
@ snapped to carved edges; already-carved region-same sub-assets are
@ gap-subtracted, so only the uncarved blobs are emitted here.

	.section .data.frontier_df4_font_cc.gap0, "a", %progbits
@ df4_font_cc region-different data, JP 0x085355f1..0x08535824 (563 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_font_cc_000_5355F1
frontier_df4_font_cc_000_5355F1:
	.incbin "baserom.gba", 0x5355F1, 0x233

	.section .data.frontier_df4_font_cc.gap1, "a", %progbits
@ df4_font_cc region-different data, JP 0x08535afa..0x08535f60 (1126 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_font_cc_001_535AFA
frontier_df4_font_cc_001_535AFA:
	.incbin "baserom.gba", 0x535AFA, 0x466

	.section .data.frontier_df4_font_cc.gap2, "a", %progbits
@ df4_font_cc region-different data, JP 0x085360a6..0x0853636d (711 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_font_cc_002_5360A6
frontier_df4_font_cc_002_5360A6:
	.incbin "baserom.gba", 0x5360A6, 0x2C7

	.section .data.frontier_df4_font_cc.gap3, "a", %progbits
@ df4_font_cc region-different data, JP 0x085364d3..0x08536af9 (1574 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_font_cc_003_5364D3
frontier_df4_font_cc_003_5364D3:
	.incbin "baserom.gba", 0x5364D3, 0x626

	.section .data.frontier_df4_font_cc.gap4, "a", %progbits
@ df4_font_cc region-different data, JP 0x08536c96..0x0853706a (980 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_font_cc_004_536C96
frontier_df4_font_cc_004_536C96:
	.incbin "baserom.gba", 0x536C96, 0x3D4

	.section .data.frontier_df4_font_cc.gap5, "a", %progbits
@ df4_font_cc region-different data, JP 0x0853710a..0x085373cc (706 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_font_cc_005_53710A
frontier_df4_font_cc_005_53710A:
	.incbin "baserom.gba", 0x53710A, 0x2C2

	.section .data.frontier_df4_font_cc.gap6, "a", %progbits
@ df4_font_cc region-different data, JP 0x0853763a..0x08537960 (806 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_font_cc_006_53763A
frontier_df4_font_cc_006_53763A:
	.incbin "baserom.gba", 0x53763A, 0x326

	.section .data.frontier_df4_font_cc.gap7, "a", %progbits
@ df4_font_cc region-different data, JP 0x08537a2d..0x08539800 (7635 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_font_cc_007_537A2D
frontier_df4_font_cc_007_537A2D:
	.incbin "baserom.gba", 0x537A2D, 0x1DD3

	.section .data.frontier_df4_font_cc.gap8, "a", %progbits
@ df4_font_cc region-different data, JP 0x08539966..0x0853a9ee (4232 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_font_cc_008_539966
frontier_df4_font_cc_008_539966:
	.incbin "baserom.gba", 0x539966, 0x1088

	.section .data.frontier_df4_font_cc.gap9, "a", %progbits
@ df4_font_cc region-different data, JP 0x0853aafb..0x0853aeac (945 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_font_cc_009_53AAFB
frontier_df4_font_cc_009_53AAFB:
	.incbin "baserom.gba", 0x53AAFB, 0x3B1

	.section .data.frontier_df4_font_cc.gap10, "a", %progbits
@ df4_font_cc region-different data, JP 0x0853af68..0x0853b214 (684 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_font_cc_010_53AF68
frontier_df4_font_cc_010_53AF68:
	.incbin "baserom.gba", 0x53AF68, 0x2AC

	.section .data.frontier_df4_font_cc.gap11, "a", %progbits
@ df4_font_cc region-different data, JP 0x0853b2fb..0x0853c39e (4259 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_font_cc_011_53B2FB
frontier_df4_font_cc_011_53B2FB:
	.incbin "baserom.gba", 0x53B2FB, 0x10A3

	.section .data.frontier_df4_font_cc.gap12, "a", %progbits
@ df4_font_cc region-different data, JP 0x0853c483..0x0853d14b (3272 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_font_cc_012_53C483
frontier_df4_font_cc_012_53C483:
	.incbin "baserom.gba", 0x53C483, 0xCC8

	.section .data.frontier_df4_font_cc.gap13, "a", %progbits
@ df4_font_cc region-different data, JP 0x0853d88e..0x0853dd67 (1241 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_font_cc_013_53D88E
frontier_df4_font_cc_013_53D88E:
	.incbin "baserom.gba", 0x53D88E, 0x4D9

	.section .data.frontier_df4_font_cc.gap14, "a", %progbits
@ df4_font_cc region-different data, JP 0x0853e10b..0x0853e446 (827 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_font_cc_014_53E10B
frontier_df4_font_cc_014_53E10B:
	.incbin "baserom.gba", 0x53E10B, 0x33B

	.section .data.frontier_df4_font_cc.gap15, "a", %progbits
@ df4_font_cc region-different data, JP 0x0853e769..0x0853f095 (2348 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_font_cc_015_53E769
frontier_df4_font_cc_015_53E769:
	.incbin "baserom.gba", 0x53E769, 0x92C

	.section .data.frontier_df4_font_cc.gap16, "a", %progbits
@ df4_font_cc region-different data, JP 0x0853f152..0x0854002f (3805 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_font_cc_016_53F152
frontier_df4_font_cc_016_53F152:
	.incbin "baserom.gba", 0x53F152, 0xEDD

	.section .data.frontier_df4_font_cc.gap17, "a", %progbits
@ df4_font_cc region-different data, JP 0x085401fe..0x08540aad (2223 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_font_cc_017_5401FE
frontier_df4_font_cc_017_5401FE:
	.incbin "baserom.gba", 0x5401FE, 0x8AF

	.section .data.frontier_df4_font_cc.gap18, "a", %progbits
@ df4_font_cc region-different data, JP 0x08540e4e..0x0854138e (1344 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_font_cc_018_540E4E
frontier_df4_font_cc_018_540E4E:
	.incbin "baserom.gba", 0x540E4E, 0x540

	.section .data.frontier_df4_font_cc.gap19, "a", %progbits
@ df4_font_cc region-different data, JP 0x08541471..0x08541aa4 (1587 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_font_cc_019_541471
frontier_df4_font_cc_019_541471:
	.incbin "baserom.gba", 0x541471, 0x633

	.section .data.frontier_df4_font_cc.gap20, "a", %progbits
@ df4_font_cc region-different data, JP 0x08541b78..0x08541db3 (571 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_font_cc_020_541B78
frontier_df4_font_cc_020_541B78:
	.incbin "baserom.gba", 0x541B78, 0x23B

	.section .data.frontier_df4_font_cc.gap21, "a", %progbits
@ df4_font_cc region-different data, JP 0x08542066..0x085423f3 (909 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_font_cc_021_542066
frontier_df4_font_cc_021_542066:
	.incbin "baserom.gba", 0x542066, 0x38D

	.section .data.frontier_df4_font_cc.gap22, "a", %progbits
@ df4_font_cc region-different data, JP 0x08542628..0x085429dc (948 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_font_cc_022_542628
frontier_df4_font_cc_022_542628:
	.incbin "baserom.gba", 0x542628, 0x3B4

	.section .data.frontier_df4_font_cc.gap23, "a", %progbits
@ df4_font_cc region-different data, JP 0x08542aee..0x0854321a (1836 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_font_cc_023_542AEE
frontier_df4_font_cc_023_542AEE:
	.incbin "baserom.gba", 0x542AEE, 0x72C

	.section .data.frontier_df4_font_cc.gap24, "a", %progbits
@ df4_font_cc region-different data, JP 0x085437ed..0x08544070 (2179 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_font_cc_024_5437ED
frontier_df4_font_cc_024_5437ED:
	.incbin "baserom.gba", 0x5437ED, 0x883

	.section .data.frontier_df4_font_cc.gap25, "a", %progbits
@ df4_font_cc region-different data, JP 0x085443b2..0x08544806 (1108 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_font_cc_025_5443B2
frontier_df4_font_cc_025_5443B2:
	.incbin "baserom.gba", 0x5443B2, 0x454

	.section .data.frontier_df4_font_cc.gap26, "a", %progbits
@ df4_font_cc region-different data, JP 0x085448c6..0x08544f8d (1735 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_font_cc_026_5448C6
frontier_df4_font_cc_026_5448C6:
	.incbin "baserom.gba", 0x5448C6, 0x6C7

	.section .data.frontier_df4_font_cc.gap27, "a", %progbits
@ df4_font_cc region-different data, JP 0x085450de..0x08547070 (8082 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_font_cc_027_5450DE
frontier_df4_font_cc_027_5450DE:
	.incbin "baserom.gba", 0x5450DE, 0x1F92

	.section .data.frontier_df4_font_cc.gap28, "a", %progbits
@ df4_font_cc region-different data, JP 0x08547828..0x08547d92 (1386 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_font_cc_028_547828
frontier_df4_font_cc_028_547828:
	.incbin "baserom.gba", 0x547828, 0x56A

	.section .data.frontier_df4_font_cc.gap29, "a", %progbits
@ df4_font_cc region-different data, JP 0x08547fd4..0x085482a0 (716 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_font_cc_029_547FD4
frontier_df4_font_cc_029_547FD4:
	.incbin "baserom.gba", 0x547FD4, 0x2CC

	.section .data.frontier_df4_font_cc.gap30, "a", %progbits
@ df4_font_cc region-different data, JP 0x0854876b..0x085491e4 (2681 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_font_cc_030_54876B
frontier_df4_font_cc_030_54876B:
	.incbin "baserom.gba", 0x54876B, 0xA79

	.section .data.frontier_df4_font_cc.gap31, "a", %progbits
@ df4_font_cc region-different data, JP 0x0854934d..0x085495f7 (682 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_font_cc_031_54934D
frontier_df4_font_cc_031_54934D:
	.incbin "baserom.gba", 0x54934D, 0x2AA

	.section .data.frontier_df4_font_cc.gap32, "a", %progbits
@ df4_font_cc region-different data, JP 0x085496d6..0x08549a49 (883 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_font_cc_032_5496D6
frontier_df4_font_cc_032_5496D6:
	.incbin "baserom.gba", 0x5496D6, 0x373

	.section .data.frontier_df4_font_cc.gap33, "a", %progbits
@ df4_font_cc region-different data, JP 0x08549ad2..0x08549ee0 (1038 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_font_cc_033_549AD2
frontier_df4_font_cc_033_549AD2:
	.incbin "baserom.gba", 0x549AD2, 0x40E

	.section .data.frontier_df4_font_cc.gap34, "a", %progbits
@ df4_font_cc region-different data, JP 0x0854a1d0..0x0854ac47 (2679 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_font_cc_034_54A1D0
frontier_df4_font_cc_034_54A1D0:
	.incbin "baserom.gba", 0x54A1D0, 0xA77

	.section .data.frontier_df4_font_cc.gap35, "a", %progbits
@ df4_font_cc region-different data, JP 0x0854ae2b..0x0854c12d (4866 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_font_cc_035_54AE2B
frontier_df4_font_cc_035_54AE2B:
	.incbin "baserom.gba", 0x54AE2B, 0x1302

	.section .data.frontier_df4_font_cc.gap36, "a", %progbits
@ df4_font_cc region-different data, JP 0x0854c4e7..0x0854dd5c (6261 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_font_cc_036_54C4E7
frontier_df4_font_cc_036_54C4E7:
	.incbin "baserom.gba", 0x54C4E7, 0x1875

	.section .data.frontier_df4_font_cc.gap37, "a", %progbits
@ df4_font_cc region-different data, JP 0x0854e11a..0x0854ebf4 (2778 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_font_cc_037_54E11A
frontier_df4_font_cc_037_54E11A:
	.incbin "baserom.gba", 0x54E11A, 0xADA

	.section .data.frontier_df4_font_cc.gap38, "a", %progbits
@ df4_font_cc region-different data, JP 0x0854f14f..0x0854f670 (1313 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_font_cc_038_54F14F
frontier_df4_font_cc_038_54F14F:
	.incbin "baserom.gba", 0x54F14F, 0x521

	.section .data.frontier_df4_font_cc.gap39, "a", %progbits
@ df4_font_cc region-different data, JP 0x0854f75e..0x0854fcdd (1407 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_font_cc_039_54F75E
frontier_df4_font_cc_039_54F75E:
	.incbin "baserom.gba", 0x54F75E, 0x57F

	.section .data.frontier_df4_font_cc.gap40, "a", %progbits
@ df4_font_cc region-different data, JP 0x0854ff04..0x08551260 (4956 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_font_cc_040_54FF04
frontier_df4_font_cc_040_54FF04:
	.incbin "baserom.gba", 0x54FF04, 0x135C

	.section .data.frontier_df4_font_cc.gap41, "a", %progbits
@ df4_font_cc region-different data, JP 0x085515fb..0x08551bf1 (1526 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_font_cc_041_5515FB
frontier_df4_font_cc_041_5515FB:
	.incbin "baserom.gba", 0x5515FB, 0x5F6

	.section .data.frontier_df4_font_cc.gap42, "a", %progbits
@ df4_font_cc region-different data, JP 0x0855228d..0x0855252a (669 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_font_cc_042_55228D
frontier_df4_font_cc_042_55228D:
	.incbin "baserom.gba", 0x55228D, 0x29D

	.section .data.frontier_df4_font_cc.gap43, "a", %progbits
@ df4_font_cc region-different data, JP 0x085525b0..0x085532c6 (3350 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_font_cc_043_5525B0
frontier_df4_font_cc_043_5525B0:
	.incbin "baserom.gba", 0x5525B0, 0xD16

	.section .data.frontier_df4_font_cc.gap44, "a", %progbits
@ df4_font_cc region-different data, JP 0x08554706..0x085549c1 (699 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_font_cc_044_554706
frontier_df4_font_cc_044_554706:
	.incbin "baserom.gba", 0x554706, 0x2BB

	.section .data.frontier_df4_font_cc.gap45, "a", %progbits
@ df4_font_cc region-different data, JP 0x08554aa1..0x08554d3c (667 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_font_cc_045_554AA1
frontier_df4_font_cc_045_554AA1:
	.incbin "baserom.gba", 0x554AA1, 0x29B

	.section .data.frontier_df4_font_cc.gap46, "a", %progbits
@ df4_font_cc region-different data, JP 0x08554e45..0x08555153 (782 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_font_cc_046_554E45
frontier_df4_font_cc_046_554E45:
	.incbin "baserom.gba", 0x554E45, 0x30E

	.section .data.frontier_df4_font_cc.gap47, "a", %progbits
@ df4_font_cc region-different data, JP 0x08555238..0x08557e1b (11235 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_font_cc_047_555238
frontier_df4_font_cc_047_555238:
	.incbin "baserom.gba", 0x555238, 0x2BE3

	.section .data.frontier_df4_font_cc.gap48, "a", %progbits
@ df4_font_cc region-different data, JP 0x08558348..0x08558e97 (2895 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_font_cc_048_558348
frontier_df4_font_cc_048_558348:
	.incbin "baserom.gba", 0x558348, 0xB4F

	.section .data.frontier_df4_font_cc.gap49, "a", %progbits
@ df4_font_cc region-different data, JP 0x0855913a..0x08559539 (1023 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_font_cc_049_55913A
frontier_df4_font_cc_049_55913A:
	.incbin "baserom.gba", 0x55913A, 0x3FF

	.section .data.frontier_df4_font_cc.gap50, "a", %progbits
@ df4_font_cc region-different data, JP 0x08559793..0x0855a7cd (4154 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_font_cc_050_559793
frontier_df4_font_cc_050_559793:
	.incbin "baserom.gba", 0x559793, 0x103A

	.section .data.frontier_df4_font_cc.gap51, "a", %progbits
@ df4_font_cc region-different data, JP 0x0855a8bb..0x0855b45e (2979 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_font_cc_051_55A8BB
frontier_df4_font_cc_051_55A8BB:
	.incbin "baserom.gba", 0x55A8BB, 0xBA3

	.section .data.frontier_df4_font_cc.gap52, "a", %progbits
@ df4_font_cc region-different data, JP 0x0855b4ed..0x0855b8dd (1008 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_font_cc_052_55B4ED
frontier_df4_font_cc_052_55B4ED:
	.incbin "baserom.gba", 0x55B4ED, 0x3F0

	.section .data.frontier_df4_font_cc.gap53, "a", %progbits
@ df4_font_cc region-different data, JP 0x0855b966..0x0855c2f0 (2442 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_font_cc_053_55B966
frontier_df4_font_cc_053_55B966:
	.incbin "baserom.gba", 0x55B966, 0x98A

	.section .data.frontier_df4_font_cc.gap54, "a", %progbits
@ df4_font_cc region-different data, JP 0x0855c3ba..0x0855c861 (1191 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_font_cc_054_55C3BA
frontier_df4_font_cc_054_55C3BA:
	.incbin "baserom.gba", 0x55C3BA, 0x4A7

	.section .data.frontier_df4_font_cc.gap55, "a", %progbits
@ df4_font_cc region-different data, JP 0x0855c8e5..0x0855d3d0 (2795 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_font_cc_055_55C8E5
frontier_df4_font_cc_055_55C8E5:
	.incbin "baserom.gba", 0x55C8E5, 0xAEB

	.section .data.frontier_df4_font_cc.gap56, "a", %progbits
@ df4_font_cc region-different data, JP 0x0855d5d0..0x0855e316 (3398 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_font_cc_056_55D5D0
frontier_df4_font_cc_056_55D5D0:
	.incbin "baserom.gba", 0x55D5D0, 0xD46

	.section .data.frontier_df4_font_cc.gap57, "a", %progbits
@ df4_font_cc region-different data, JP 0x0855e491..0x0855eedc (2635 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_font_cc_057_55E491
frontier_df4_font_cc_057_55E491:
	.incbin "baserom.gba", 0x55E491, 0xA4B

	.section .data.frontier_df4_font_cc.gap58, "a", %progbits
@ df4_font_cc region-different data, JP 0x0855efdc..0x0855f3e3 (1031 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_font_cc_058_55EFDC
frontier_df4_font_cc_058_55EFDC:
	.incbin "baserom.gba", 0x55EFDC, 0x407

	.section .data.frontier_df4_font_cc.gap59, "a", %progbits
@ df4_font_cc region-different data, JP 0x08560458..0x085611e4 (3468 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_font_cc_059_560458
frontier_df4_font_cc_059_560458:
	.incbin "baserom.gba", 0x560458, 0xD8C

	.section .data.frontier_df4_font_cc.gap60, "a", %progbits
@ df4_font_cc region-different data, JP 0x0856127f..0x08561ca5 (2598 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_font_cc_060_56127F
frontier_df4_font_cc_060_56127F:
	.incbin "baserom.gba", 0x56127F, 0xA26

	.section .data.frontier_df4_font_cc.gap61, "a", %progbits
@ df4_font_cc region-different data, JP 0x08561fb9..0x08562821 (2152 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_font_cc_061_561FB9
frontier_df4_font_cc_061_561FB9:
	.incbin "baserom.gba", 0x561FB9, 0x868

	.section .data.frontier_df4_font_cc.gap62, "a", %progbits
@ df4_font_cc region-different data, JP 0x085629bb..0x08563b63 (4520 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_font_cc_062_5629BB
frontier_df4_font_cc_062_5629BB:
	.incbin "baserom.gba", 0x5629BB, 0x11A8

	.section .data.frontier_df4_font_cc.gap63, "a", %progbits
@ df4_font_cc region-different data, JP 0x08563d93..0x0856432c (1433 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_font_cc_063_563D93
frontier_df4_font_cc_063_563D93:
	.incbin "baserom.gba", 0x563D93, 0x599

	.section .data.frontier_df4_font_cc.gap64, "a", %progbits
@ df4_font_cc region-different data, JP 0x085646ed..0x08564918 (555 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_font_cc_064_5646ED
frontier_df4_font_cc_064_5646ED:
	.incbin "baserom.gba", 0x5646ED, 0x22B

	.section .data.frontier_df4_font_cc.gap65, "a", %progbits
@ df4_font_cc region-different data, JP 0x08564c69..0x08565480 (2071 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_font_cc_065_564C69
frontier_df4_font_cc_065_564C69:
	.incbin "baserom.gba", 0x564C69, 0x817

	.section .data.frontier_df4_font_cc.gap66, "a", %progbits
@ df4_font_cc region-different data, JP 0x08566136..0x08566574 (1086 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_font_cc_066_566136
frontier_df4_font_cc_066_566136:
	.incbin "baserom.gba", 0x566136, 0x43E

	.section .data.frontier_df4_font_cc.gap67, "a", %progbits
@ df4_font_cc region-different data, JP 0x08566624..0x08566b01 (1245 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_font_cc_067_566624
frontier_df4_font_cc_067_566624:
	.incbin "baserom.gba", 0x566624, 0x4DD

	.section .data.frontier_df4_font_cc.gap68, "a", %progbits
@ df4_font_cc region-different data, JP 0x08566c80..0x0856715d (1245 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_font_cc_068_566C80
frontier_df4_font_cc_068_566C80:
	.incbin "baserom.gba", 0x566C80, 0x4DD

	.section .data.frontier_df4_font_cc.gap69, "a", %progbits
@ df4_font_cc region-different data, JP 0x0856739b..0x08567818 (1149 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_font_cc_069_56739B
frontier_df4_font_cc_069_56739B:
	.incbin "baserom.gba", 0x56739B, 0x47D

	.section .data.frontier_df4_font_cc.gap70, "a", %progbits
@ df4_font_cc region-different data, JP 0x08567948..0x08567b88 (576 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_font_cc_070_567948
frontier_df4_font_cc_070_567948:
	.incbin "baserom.gba", 0x567948, 0x240

	.section .data.frontier_df4_font_cc.gap71, "a", %progbits
@ df4_font_cc region-different data, JP 0x08567c29..0x085685bd (2452 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_font_cc_071_567C29
frontier_df4_font_cc_071_567C29:
	.incbin "baserom.gba", 0x567C29, 0x994

	.section .data.frontier_df4_font_cc.gap72, "a", %progbits
@ df4_font_cc region-different data, JP 0x08568646..0x08568ca2 (1628 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_font_cc_072_568646
frontier_df4_font_cc_072_568646:
	.incbin "baserom.gba", 0x568646, 0x65C

	.section .data.frontier_df4_font_cc.gap73, "a", %progbits
@ df4_font_cc region-different data, JP 0x08568e1c..0x0856a110 (4852 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_font_cc_073_568E1C
frontier_df4_font_cc_073_568E1C:
	.incbin "baserom.gba", 0x568E1C, 0x12F4

	.section .data.frontier_df4_font_cc.gap74, "a", %progbits
@ df4_font_cc region-different data, JP 0x0856a411..0x0856b36a (3929 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_font_cc_074_56A411
frontier_df4_font_cc_074_56A411:
	.incbin "baserom.gba", 0x56A411, 0xF59

	.section .data.frontier_df4_font_cc.gap75, "a", %progbits
@ df4_font_cc region-different data, JP 0x0856b3f8..0x0856b60e (534 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_font_cc_075_56B3F8
frontier_df4_font_cc_075_56B3F8:
	.incbin "baserom.gba", 0x56B3F8, 0x216

	.section .data.frontier_df4_font_cc.gap76, "a", %progbits
@ df4_font_cc region-different data, JP 0x0856b6d6..0x0856b949 (627 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_font_cc_076_56B6D6
frontier_df4_font_cc_076_56B6D6:
	.incbin "baserom.gba", 0x56B6D6, 0x273

	.section .data.frontier_df4_font_cc.gap77, "a", %progbits
@ df4_font_cc region-different data, JP 0x0856bae8..0x0856c647 (2911 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_font_cc_077_56BAE8
frontier_df4_font_cc_077_56BAE8:
	.incbin "baserom.gba", 0x56BAE8, 0xB5F

	.section .data.frontier_df4_font_cc.gap78, "a", %progbits
@ df4_font_cc region-different data, JP 0x0856c7de..0x0856cbc4 (998 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_font_cc_078_56C7DE
frontier_df4_font_cc_078_56C7DE:
	.incbin "baserom.gba", 0x56C7DE, 0x3E6

	.section .data.frontier_df4_font_cc.gap79, "a", %progbits
@ df4_font_cc region-different data, JP 0x0856cf54..0x0856d898 (2372 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_font_cc_079_56CF54
frontier_df4_font_cc_079_56CF54:
	.incbin "baserom.gba", 0x56CF54, 0x944

	.section .data.frontier_df4_font_cc.gap80, "a", %progbits
@ df4_font_cc region-different data, JP 0x0856dcd8..0x0856dfd8 (768 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_font_cc_080_56DCD8
frontier_df4_font_cc_080_56DCD8:
	.incbin "baserom.gba", 0x56DCD8, 0x300

	.section .data.frontier_df4_font_cc.gap81, "a", %progbits
@ df4_font_cc region-different data, JP 0x0856e174..0x0856e678 (1284 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_font_cc_081_56E174
frontier_df4_font_cc_081_56E174:
	.incbin "baserom.gba", 0x56E174, 0x504

	.section .data.frontier_df4_font_cc.gap82, "a", %progbits
@ df4_font_cc region-different data, JP 0x0856e70c..0x0856ea94 (904 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_font_cc_082_56E70C
frontier_df4_font_cc_082_56E70C:
	.incbin "baserom.gba", 0x56E70C, 0x388

	.section .data.frontier_df4_font_cc.gap83, "a", %progbits
@ df4_font_cc region-different data, JP 0x0856eb28..0x0856ed40 (536 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_font_cc_083_56EB28
frontier_df4_font_cc_083_56EB28:
	.incbin "baserom.gba", 0x56EB28, 0x218

	.section .data.frontier_df4_font_cc.gap84, "a", %progbits
@ df4_font_cc region-different data, JP 0x0856ef80..0x0856f29c (796 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_font_cc_084_56EF80
frontier_df4_font_cc_084_56EF80:
	.incbin "baserom.gba", 0x56EF80, 0x31C

	.section .data.frontier_df4_font_cc.gap85, "a", %progbits
@ df4_font_cc region-different data, JP 0x0856f624..0x0856f95c (824 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_font_cc_085_56F624
frontier_df4_font_cc_085_56F624:
	.incbin "baserom.gba", 0x56F624, 0x338

	.section .data.frontier_df4_font_cc.gap86, "a", %progbits
@ df4_font_cc region-different data, JP 0x08570ec8..0x085723c8 (5376 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_font_cc_086_570EC8
frontier_df4_font_cc_086_570EC8:
	.incbin "baserom.gba", 0x570EC8, 0x1500

	.section .data.frontier_df4_font_cc.gap87, "a", %progbits
@ df4_font_cc region-different data, JP 0x08572584..0x085728bc (824 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_font_cc_087_572584
frontier_df4_font_cc_087_572584:
	.incbin "baserom.gba", 0x572584, 0x338

	.section .data.frontier_df4_font_cc.gap88, "a", %progbits
@ df4_font_cc region-different data, JP 0x08573134..0x08573360 (556 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_font_cc_088_573134
frontier_df4_font_cc_088_573134:
	.incbin "baserom.gba", 0x573134, 0x22C

	.section .data.frontier_df4_font_cc.gap89, "a", %progbits
@ df4_font_cc region-different data, JP 0x085739bc..0x08573c4c (656 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_font_cc_089_5739BC
frontier_df4_font_cc_089_5739BC:
	.incbin "baserom.gba", 0x5739BC, 0x290

	.section .data.frontier_df4_font_cc.gap90, "a", %progbits
@ df4_font_cc region-different data, JP 0x0857416c..0x0857469c (1328 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_font_cc_090_57416C
frontier_df4_font_cc_090_57416C:
	.incbin "baserom.gba", 0x57416C, 0x530
