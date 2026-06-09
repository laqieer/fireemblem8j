@ df4_banim_b: data-frontier-4 long-tail sweep — region-different data not
@ reachable by the code-literal carver, in the pure-DATA window
@ [0x08602568, 0x08a146bc) (verified: 0 carved .text
@ objects inside; whole window is at/above the code+library boundary
@ 0x080dc134). Each gap is [prev_carved_end, next_carved_start) — already
@ snapped to carved edges; already-carved region-same sub-assets are
@ gap-subtracted, so only the uncarved blobs are emitted here.

	.section .data.frontier_df4_banim_b.gap0, "a", %progbits
@ df4_banim_b region-different data, JP 0x08602568..0x08602b24 (1468 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_banim_b_000_602568
frontier_df4_banim_b_000_602568:
	.incbin "baserom.gba", 0x602568, 0x5BC

	.section .data.frontier_df4_banim_b.gap1, "a", %progbits
@ df4_banim_b region-different data, JP 0x08602fb0..0x086037a4 (2036 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_banim_b_001_602FB0
frontier_df4_banim_b_001_602FB0:
	.incbin "baserom.gba", 0x602FB0, 0x7F4

	.section .data.frontier_df4_banim_b.gap2, "a", %progbits
@ df4_banim_b region-different data, JP 0x08603894..0x08604384 (2800 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_banim_b_002_603894
frontier_df4_banim_b_002_603894:
	.incbin "baserom.gba", 0x603894, 0xAF0

	.section .data.frontier_df4_banim_b.gap3, "a", %progbits
@ df4_banim_b region-different data, JP 0x08604f7c..0x08606778 (6140 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_banim_b_003_604F7C
frontier_df4_banim_b_003_604F7C:
	.incbin "baserom.gba", 0x604F7C, 0x17FC

	.section .data.frontier_df4_banim_b.gap4, "a", %progbits
@ df4_banim_b region-different data, JP 0x0860838c..0x0860a83c (9392 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_banim_b_004_60838C
frontier_df4_banim_b_004_60838C:
	.incbin "baserom.gba", 0x60838C, 0x24B0

	.section .data.frontier_df4_banim_b.gap5, "a", %progbits
@ df4_banim_b region-different data, JP 0x08611798..0x08611a80 (744 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_banim_b_005_611798
frontier_df4_banim_b_005_611798:
	.incbin "baserom.gba", 0x611798, 0x2E8

	.section .data.frontier_df4_banim_b.gap6, "a", %progbits
@ df4_banim_b region-different data, JP 0x086123d4..0x086126bc (744 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_banim_b_006_6123D4
frontier_df4_banim_b_006_6123D4:
	.incbin "baserom.gba", 0x6123D4, 0x2E8

	.section .data.frontier_df4_banim_b.gap7, "a", %progbits
@ df4_banim_b region-different data, JP 0x08617424..0x08617890 (1132 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_banim_b_007_617424
frontier_df4_banim_b_007_617424:
	.incbin "baserom.gba", 0x617424, 0x46C

	.section .data.frontier_df4_banim_b.gap8, "a", %progbits
@ df4_banim_b region-different data, JP 0x086186c4..0x08618b30 (1132 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_banim_b_008_6186C4
frontier_df4_banim_b_008_6186C4:
	.incbin "baserom.gba", 0x6186C4, 0x46C

	.section .data.frontier_df4_banim_b.gap9, "a", %progbits
@ df4_banim_b region-different data, JP 0x08619994..0x08619e00 (1132 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_banim_b_009_619994
frontier_df4_banim_b_009_619994:
	.incbin "baserom.gba", 0x619994, 0x46C

	.section .data.frontier_df4_banim_b.gap10, "a", %progbits
@ df4_banim_b region-different data, JP 0x0861ac64..0x0861b0d0 (1132 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_banim_b_010_61AC64
frontier_df4_banim_b_010_61AC64:
	.incbin "baserom.gba", 0x61AC64, 0x46C

	.section .data.frontier_df4_banim_b.gap11, "a", %progbits
@ df4_banim_b region-different data, JP 0x0861be44..0x0861ca68 (3108 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_banim_b_011_61BE44
frontier_df4_banim_b_011_61BE44:
	.incbin "baserom.gba", 0x61BE44, 0xC24

	.section .data.frontier_df4_banim_b.gap12, "a", %progbits
@ df4_banim_b region-different data, JP 0x0861ec9c..0x0861f000 (868 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_banim_b_012_61EC9C
frontier_df4_banim_b_012_61EC9C:
	.incbin "baserom.gba", 0x61EC9C, 0x364

	.section .data.frontier_df4_banim_b.gap13, "a", %progbits
@ df4_banim_b region-different data, JP 0x08622e28..0x086230f8 (720 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_banim_b_013_622E28
frontier_df4_banim_b_013_622E28:
	.incbin "baserom.gba", 0x622E28, 0x2D0

	.section .data.frontier_df4_banim_b.gap14, "a", %progbits
@ df4_banim_b region-different data, JP 0x086238b4..0x08623b84 (720 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_banim_b_014_6238B4
frontier_df4_banim_b_014_6238B4:
	.incbin "baserom.gba", 0x6238B4, 0x2D0

	.section .data.frontier_df4_banim_b.gap15, "a", %progbits
@ df4_banim_b region-different data, JP 0x0862dc84..0x0862df94 (784 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_banim_b_015_62DC84
frontier_df4_banim_b_015_62DC84:
	.incbin "baserom.gba", 0x62DC84, 0x310

	.section .data.frontier_df4_banim_b.gap16, "a", %progbits
@ df4_banim_b region-different data, JP 0x0862edd8..0x0862f5e8 (2064 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_banim_b_016_62EDD8
frontier_df4_banim_b_016_62EDD8:
	.incbin "baserom.gba", 0x62EDD8, 0x810

	.section .data.frontier_df4_banim_b.gap17, "a", %progbits
@ df4_banim_b region-different data, JP 0x0863cdd4..0x0863cfdc (520 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_banim_b_017_63CDD4
frontier_df4_banim_b_017_63CDD4:
	.incbin "baserom.gba", 0x63CDD4, 0x208

	.section .data.frontier_df4_banim_b.gap18, "a", %progbits
@ df4_banim_b region-different data, JP 0x0863d868..0x0863dcb8 (1104 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_banim_b_018_63D868
frontier_df4_banim_b_018_63D868:
	.incbin "baserom.gba", 0x63D868, 0x450

	.section .data.frontier_df4_banim_b.gap19, "a", %progbits
@ df4_banim_b region-different data, JP 0x0864c610..0x0864c818 (520 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_banim_b_019_64C610
frontier_df4_banim_b_019_64C610:
	.incbin "baserom.gba", 0x64C610, 0x208

	.section .data.frontier_df4_banim_b.gap20, "a", %progbits
@ df4_banim_b region-different data, JP 0x0865a7fc..0x0865b3b4 (3000 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_banim_b_020_65A7FC
frontier_df4_banim_b_020_65A7FC:
	.incbin "baserom.gba", 0x65A7FC, 0xBB8

	.section .data.frontier_df4_banim_b.gap21, "a", %progbits
@ df4_banim_b region-different data, JP 0x08663368..0x086638d0 (1384 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_banim_b_021_663368
frontier_df4_banim_b_021_663368:
	.incbin "baserom.gba", 0x663368, 0x568

	.section .data.frontier_df4_banim_b.gap22, "a", %progbits
@ df4_banim_b region-different data, JP 0x08665fb0..0x086662bc (780 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_banim_b_022_665FB0
frontier_df4_banim_b_022_665FB0:
	.incbin "baserom.gba", 0x665FB0, 0x30C

	.section .data.frontier_df4_banim_b.gap23, "a", %progbits
@ df4_banim_b region-different data, JP 0x086719a8..0x086721fc (2132 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_banim_b_023_6719A8
frontier_df4_banim_b_023_6719A8:
	.incbin "baserom.gba", 0x6719A8, 0x854

	.section .data.frontier_df4_banim_b.gap24, "a", %progbits
@ df4_banim_b region-different data, JP 0x0867e9b8..0x0867f30c (2388 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_banim_b_024_67E9B8
frontier_df4_banim_b_024_67E9B8:
	.incbin "baserom.gba", 0x67E9B8, 0x954

	.section .data.frontier_df4_banim_b.gap25, "a", %progbits
@ df4_banim_b region-different data, JP 0x0867f520..0x08680738 (4632 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_banim_b_025_67F520
frontier_df4_banim_b_025_67F520:
	.incbin "baserom.gba", 0x67F520, 0x1218

	.section .data.frontier_df4_banim_b.gap26, "a", %progbits
@ df4_banim_b region-different data, JP 0x08683c80..0x08686bb8 (12088 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_banim_b_026_683C80
frontier_df4_banim_b_026_683C80:
	.incbin "baserom.gba", 0x683C80, 0x2F38

	.section .data.frontier_df4_banim_b.gap27, "a", %progbits
@ df4_banim_b region-different data, JP 0x086870d4..0x0868753c (1128 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_banim_b_027_6870D4
frontier_df4_banim_b_027_6870D4:
	.incbin "baserom.gba", 0x6870D4, 0x468

	.section .data.frontier_df4_banim_b.gap28, "a", %progbits
@ df4_banim_b region-different data, JP 0x0869697c..0x08697974 (4088 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_banim_b_028_69697C
frontier_df4_banim_b_028_69697C:
	.incbin "baserom.gba", 0x69697C, 0xFF8

	.section .data.frontier_df4_banim_b.gap29, "a", %progbits
@ df4_banim_b region-different data, JP 0x0869bbc8..0x0869beac (740 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_banim_b_029_69BBC8
frontier_df4_banim_b_029_69BBC8:
	.incbin "baserom.gba", 0x69BBC8, 0x2E4

	.section .data.frontier_df4_banim_b.gap30, "a", %progbits
@ df4_banim_b region-different data, JP 0x0869c34c..0x0869ceac (2912 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_banim_b_030_69C34C
frontier_df4_banim_b_030_69C34C:
	.incbin "baserom.gba", 0x69C34C, 0xB60

	.section .data.frontier_df4_banim_b.gap31, "a", %progbits
@ df4_banim_b region-different data, JP 0x0869ebd8..0x0869edf8 (544 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_banim_b_031_69EBD8
frontier_df4_banim_b_031_69EBD8:
	.incbin "baserom.gba", 0x69EBD8, 0x220

	.section .data.frontier_df4_banim_b.gap32, "a", %progbits
@ df4_banim_b region-different data, JP 0x086a5edc..0x086a66dc (2048 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_banim_b_032_6A5EDC
frontier_df4_banim_b_032_6A5EDC:
	.incbin "baserom.gba", 0x6A5EDC, 0x800

	.section .data.frontier_df4_banim_b.gap33, "a", %progbits
@ df4_banim_b region-different data, JP 0x086a819c..0x086a8640 (1188 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_banim_b_033_6A819C
frontier_df4_banim_b_033_6A819C:
	.incbin "baserom.gba", 0x6A819C, 0x4A4

	.section .data.frontier_df4_banim_b.gap34, "a", %progbits
@ df4_banim_b region-different data, JP 0x086a9534..0x086aaa28 (5364 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_banim_b_034_6A9534
frontier_df4_banim_b_034_6A9534:
	.incbin "baserom.gba", 0x6A9534, 0x14F4

	.section .data.frontier_df4_banim_b.gap35, "a", %progbits
@ df4_banim_b region-different data, JP 0x086ab184..0x086ab448 (708 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_banim_b_035_6AB184
frontier_df4_banim_b_035_6AB184:
	.incbin "baserom.gba", 0x6AB184, 0x2C4

	.section .data.frontier_df4_banim_b.gap36, "a", %progbits
@ df4_banim_b region-different data, JP 0x086ab520..0x086aba8c (1388 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_banim_b_036_6AB520
frontier_df4_banim_b_036_6AB520:
	.incbin "baserom.gba", 0x6AB520, 0x56C

	.section .data.frontier_df4_banim_b.gap37, "a", %progbits
@ df4_banim_b region-different data, JP 0x086ac820..0x086ad294 (2676 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_banim_b_037_6AC820
frontier_df4_banim_b_037_6AC820:
	.incbin "baserom.gba", 0x6AC820, 0xA74

	.section .data.frontier_df4_banim_b.gap38, "a", %progbits
@ df4_banim_b region-different data, JP 0x086ad478..0x086ad998 (1312 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_banim_b_038_6AD478
frontier_df4_banim_b_038_6AD478:
	.incbin "baserom.gba", 0x6AD478, 0x520

	.section .data.frontier_df4_banim_b.gap39, "a", %progbits
@ df4_banim_b region-different data, JP 0x086adb74..0x086ae148 (1492 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_banim_b_039_6ADB74
frontier_df4_banim_b_039_6ADB74:
	.incbin "baserom.gba", 0x6ADB74, 0x5D4

	.section .data.frontier_df4_banim_b.gap40, "a", %progbits
@ df4_banim_b region-different data, JP 0x086af038..0x086b052c (5364 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_banim_b_040_6AF038
frontier_df4_banim_b_040_6AF038:
	.incbin "baserom.gba", 0x6AF038, 0x14F4

	.section .data.frontier_df4_banim_b.gap41, "a", %progbits
@ df4_banim_b region-different data, JP 0x086b0c88..0x086b0f4c (708 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_banim_b_041_6B0C88
frontier_df4_banim_b_041_6B0C88:
	.incbin "baserom.gba", 0x6B0C88, 0x2C4

	.section .data.frontier_df4_banim_b.gap42, "a", %progbits
@ df4_banim_b region-different data, JP 0x086b1024..0x086b1590 (1388 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_banim_b_042_6B1024
frontier_df4_banim_b_042_6B1024:
	.incbin "baserom.gba", 0x6B1024, 0x56C

	.section .data.frontier_df4_banim_b.gap43, "a", %progbits
@ df4_banim_b region-different data, JP 0x086b1690..0x086b1eb0 (2080 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_banim_b_043_6B1690
frontier_df4_banim_b_043_6B1690:
	.incbin "baserom.gba", 0x6B1690, 0x820

	.section .data.frontier_df4_banim_b.gap44, "a", %progbits
@ df4_banim_b region-different data, JP 0x086b64cc..0x086b66d0 (516 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_banim_b_044_6B64CC
frontier_df4_banim_b_044_6B64CC:
	.incbin "baserom.gba", 0x6B64CC, 0x204

	.section .data.frontier_df4_banim_b.gap45, "a", %progbits
@ df4_banim_b region-different data, JP 0x086bb2ec..0x086bc294 (4008 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_banim_b_045_6BB2EC
frontier_df4_banim_b_045_6BB2EC:
	.incbin "baserom.gba", 0x6BB2EC, 0xFA8

	.section .data.frontier_df4_banim_b.gap46, "a", %progbits
@ df4_banim_b region-different data, JP 0x086bc4bc..0x086bc7bc (768 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_banim_b_046_6BC4BC
frontier_df4_banim_b_046_6BC4BC:
	.incbin "baserom.gba", 0x6BC4BC, 0x300

	.section .data.frontier_df4_banim_b.gap47, "a", %progbits
@ df4_banim_b region-different data, JP 0x086bcf9c..0x086bd1a0 (516 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_banim_b_047_6BCF9C
frontier_df4_banim_b_047_6BCF9C:
	.incbin "baserom.gba", 0x6BCF9C, 0x204

	.section .data.frontier_df4_banim_b.gap48, "a", %progbits
@ df4_banim_b region-different data, JP 0x086cf20c..0x086cf44c (576 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_banim_b_048_6CF20C
frontier_df4_banim_b_048_6CF20C:
	.incbin "baserom.gba", 0x6CF20C, 0x240

	.section .data.frontier_df4_banim_b.gap49, "a", %progbits
@ df4_banim_b region-different data, JP 0x086d00a8..0x086d0e48 (3488 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_banim_b_049_6D00A8
frontier_df4_banim_b_049_6D00A8:
	.incbin "baserom.gba", 0x6D00A8, 0xDA0

	.section .data.frontier_df4_banim_b.gap50, "a", %progbits
@ df4_banim_b region-different data, JP 0x086d3478..0x086d3760 (744 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_banim_b_050_6D3478
frontier_df4_banim_b_050_6D3478:
	.incbin "baserom.gba", 0x6D3478, 0x2E8

	.section .data.frontier_df4_banim_b.gap51, "a", %progbits
@ df4_banim_b region-different data, JP 0x086e0cf4..0x086e2158 (5220 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_banim_b_051_6E0CF4
frontier_df4_banim_b_051_6E0CF4:
	.incbin "baserom.gba", 0x6E0CF4, 0x1464

	.section .data.frontier_df4_banim_b.gap52, "a", %progbits
@ df4_banim_b region-different data, JP 0x086e96d0..0x086e9e38 (1896 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_banim_b_052_6E96D0
frontier_df4_banim_b_052_6E96D0:
	.incbin "baserom.gba", 0x6E96D0, 0x768

	.section .data.frontier_df4_banim_b.gap53, "a", %progbits
@ df4_banim_b region-different data, JP 0x087059c4..0x08707b0c (8520 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_banim_b_053_7059C4
frontier_df4_banim_b_053_7059C4:
	.incbin "baserom.gba", 0x7059C4, 0x2148

	.section .data.frontier_df4_banim_b.gap54, "a", %progbits
@ df4_banim_b region-different data, JP 0x08716918..0x0871759c (3204 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_banim_b_054_716918
frontier_df4_banim_b_054_716918:
	.incbin "baserom.gba", 0x716918, 0xC84

	.section .data.frontier_df4_banim_b.gap55, "a", %progbits
@ df4_banim_b region-different data, JP 0x087179ec..0x08717ff0 (1540 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_banim_b_055_7179EC
frontier_df4_banim_b_055_7179EC:
	.incbin "baserom.gba", 0x7179EC, 0x604

	.section .data.frontier_df4_banim_b.gap56, "a", %progbits
@ df4_banim_b region-different data, JP 0x087657cc..0x08765ad8 (780 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_banim_b_056_7657CC
frontier_df4_banim_b_056_7657CC:
	.incbin "baserom.gba", 0x7657CC, 0x30C

	.section .data.frontier_df4_banim_b.gap57, "a", %progbits
@ df4_banim_b region-different data, JP 0x0879a108..0x0879b220 (4376 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_banim_b_057_79A108
frontier_df4_banim_b_057_79A108:
	.incbin "baserom.gba", 0x79A108, 0x1118

	.section .data.frontier_df4_banim_b.gap58, "a", %progbits
@ df4_banim_b region-different data, JP 0x0879f83c..0x0879fa88 (588 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_banim_b_058_79F83C
frontier_df4_banim_b_058_79F83C:
	.incbin "baserom.gba", 0x79F83C, 0x24C

	.section .data.frontier_df4_banim_b.gap59, "a", %progbits
@ df4_banim_b region-different data, JP 0x0879fcb0..0x087a1d3c (8332 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_banim_b_059_79FCB0
frontier_df4_banim_b_059_79FCB0:
	.incbin "baserom.gba", 0x79FCB0, 0x208C

	.section .data.frontier_df4_banim_b.gap60, "a", %progbits
@ df4_banim_b region-different data, JP 0x087a8b10..0x087a9094 (1412 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_banim_b_060_7A8B10
frontier_df4_banim_b_060_7A8B10:
	.incbin "baserom.gba", 0x7A8B10, 0x584

	.section .data.frontier_df4_banim_b.gap61, "a", %progbits
@ df4_banim_b region-different data, JP 0x087a9254..0x087a9bb8 (2404 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_banim_b_061_7A9254
frontier_df4_banim_b_061_7A9254:
	.incbin "baserom.gba", 0x7A9254, 0x964

	.section .data.frontier_df4_banim_b.gap62, "a", %progbits
@ df4_banim_b region-different data, JP 0x087aa39c..0x087aa5ec (592 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_banim_b_062_7AA39C
frontier_df4_banim_b_062_7AA39C:
	.incbin "baserom.gba", 0x7AA39C, 0x250

	.section .data.frontier_df4_banim_b.gap63, "a", %progbits
@ df4_banim_b region-different data, JP 0x087aac64..0x087ab004 (928 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_banim_b_063_7AAC64
frontier_df4_banim_b_063_7AAC64:
	.incbin "baserom.gba", 0x7AAC64, 0x3A0

	.section .data.frontier_df4_banim_b.gap64, "a", %progbits
@ df4_banim_b region-different data, JP 0x087cd474..0x087cf8b8 (9284 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_banim_b_064_7CD474
frontier_df4_banim_b_064_7CD474:
	.incbin "baserom.gba", 0x7CD474, 0x2444

	.section .data.frontier_df4_banim_b.gap65, "a", %progbits
@ df4_banim_b region-different data, JP 0x087d3984..0x087d3d2c (936 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_banim_b_065_7D3984
frontier_df4_banim_b_065_7D3984:
	.incbin "baserom.gba", 0x7D3984, 0x3A8

	.section .data.frontier_df4_banim_b.gap66, "a", %progbits
@ df4_banim_b region-different data, JP 0x087e13a4..0x087e15d4 (560 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_banim_b_066_7E13A4
frontier_df4_banim_b_066_7E13A4:
	.incbin "baserom.gba", 0x7E13A4, 0x230

	.section .data.frontier_df4_banim_b.gap67, "a", %progbits
@ df4_banim_b region-different data, JP 0x0884886c..0x08848b28 (700 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_banim_b_067_84886C
frontier_df4_banim_b_067_84886C:
	.incbin "baserom.gba", 0x84886C, 0x2BC

	.section .data.frontier_df4_banim_b.gap68, "a", %progbits
@ df4_banim_b region-different data, JP 0x0885b6bc..0x0885e068 (10668 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_banim_b_068_85B6BC
frontier_df4_banim_b_068_85B6BC:
	.incbin "baserom.gba", 0x85B6BC, 0x29AC

	.section .data.frontier_df4_banim_b.gap69, "a", %progbits
@ df4_banim_b region-different data, JP 0x088601b1..0x088609d1 (2080 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_banim_b_069_8601B1
frontier_df4_banim_b_069_8601B1:
	.incbin "baserom.gba", 0x8601B1, 0x820

	.section .data.frontier_df4_banim_b.gap70, "a", %progbits
@ df4_banim_b region-different data, JP 0x08901138..0x08903138 (8192 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_banim_b_070_901138
frontier_df4_banim_b_070_901138:
	.incbin "baserom.gba", 0x901138, 0x2000

	.section .data.frontier_df4_banim_b.gap71, "a", %progbits
@ df4_banim_b region-different data, JP 0x08903450..0x089036dc (652 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_banim_b_071_903450
frontier_df4_banim_b_071_903450:
	.incbin "baserom.gba", 0x903450, 0x28C

	.section .data.frontier_df4_banim_b.gap72, "a", %progbits
@ df4_banim_b region-different data, JP 0x08903a50..0x08904e1c (5068 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_banim_b_072_903A50
frontier_df4_banim_b_072_903A50:
	.incbin "baserom.gba", 0x903A50, 0x13CC

	.section .data.frontier_df4_banim_b.gap73, "a", %progbits
@ df4_banim_b region-different data, JP 0x08907f78..0x089081d8 (608 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_banim_b_073_907F78
frontier_df4_banim_b_073_907F78:
	.incbin "baserom.gba", 0x907F78, 0x260

	.section .data.frontier_df4_banim_b.gap74, "a", %progbits
@ df4_banim_b region-different data, JP 0x08909de8..0x08909fec (516 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_banim_b_074_909DE8
frontier_df4_banim_b_074_909DE8:
	.incbin "baserom.gba", 0x909DE8, 0x204

	.section .data.frontier_df4_banim_b.gap75, "a", %progbits
@ df4_banim_b region-different data, JP 0x0890a050..0x0890a2d0 (640 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_banim_b_075_90A050
frontier_df4_banim_b_075_90A050:
	.incbin "baserom.gba", 0x90A050, 0x280

	.section .data.frontier_df4_banim_b.gap76, "a", %progbits
@ df4_banim_b region-different data, JP 0x0890b4dc..0x0890b888 (940 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_banim_b_076_90B4DC
frontier_df4_banim_b_076_90B4DC:
	.incbin "baserom.gba", 0x90B4DC, 0x3AC

	.section .data.frontier_df4_banim_b.gap77, "a", %progbits
@ df4_banim_b region-different data, JP 0x0890db94..0x0890e2a4 (1808 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_banim_b_077_90DB94
frontier_df4_banim_b_077_90DB94:
	.incbin "baserom.gba", 0x90DB94, 0x710

	.section .data.frontier_df4_banim_b.gap78, "a", %progbits
@ df4_banim_b region-different data, JP 0x0890e58c..0x0890ea7c (1264 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_banim_b_078_90E58C
frontier_df4_banim_b_078_90E58C:
	.incbin "baserom.gba", 0x90E58C, 0x4F0

	.section .data.frontier_df4_banim_b.gap79, "a", %progbits
@ df4_banim_b region-different data, JP 0x0890efac..0x0890f204 (600 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_banim_b_079_90EFAC
frontier_df4_banim_b_079_90EFAC:
	.incbin "baserom.gba", 0x90EFAC, 0x258

	.section .data.frontier_df4_banim_b.gap80, "a", %progbits
@ df4_banim_b region-different data, JP 0x089cd958..0x089cdd18 (960 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_banim_b_080_9CD958
frontier_df4_banim_b_080_9CD958:
	.incbin "baserom.gba", 0x9CD958, 0x3C0

	.section .data.frontier_df4_banim_b.gap81, "a", %progbits
@ df4_banim_b region-different data, JP 0x089cf318..0x089cfd20 (2568 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_banim_b_081_9CF318
frontier_df4_banim_b_081_9CF318:
	.incbin "baserom.gba", 0x9CF318, 0xA08

	.section .data.frontier_df4_banim_b.gap82, "a", %progbits
@ df4_banim_b region-different data, JP 0x08a12ac0..0x08a1313a (1658 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_banim_b_082_A12AC0
frontier_df4_banim_b_082_A12AC0:
	.incbin "baserom.gba", 0xA12AC0, 0x67A

	.section .data.frontier_df4_banim_b.gap83, "a", %progbits
@ df4_banim_b region-different data, JP 0x08a13256..0x08a13488 (562 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_banim_b_083_A13256
frontier_df4_banim_b_083_A13256:
	.incbin "baserom.gba", 0xA13256, 0x232

	.section .data.frontier_df4_banim_b.gap84, "a", %progbits
@ df4_banim_b region-different data, JP 0x08a13880..0x08a13b90 (784 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_banim_b_084_A13880
frontier_df4_banim_b_084_A13880:
	.incbin "baserom.gba", 0xA13880, 0x310

	.section .data.frontier_df4_banim_b.gap85, "a", %progbits
@ df4_banim_b region-different data, JP 0x08a13cd0..0x08a146bc (2540 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_banim_b_085_A13CD0
frontier_df4_banim_b_085_A13CD0:
	.incbin "baserom.gba", 0xA13CD0, 0x9EC
