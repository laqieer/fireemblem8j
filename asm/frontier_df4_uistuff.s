@ df4_uistuff: data-frontier-4 long-tail sweep — region-different data not
@ reachable by the code-literal carver, in the pure-DATA window
@ [0x08577000, 0x085d4000) (verified: 0 carved .text
@ objects inside; whole window is at/above the code+library boundary
@ 0x080dc134). Each gap is [prev_carved_end, next_carved_start) — already
@ snapped to carved edges; already-carved region-same sub-assets are
@ gap-subtracted, so only the uncarved blobs are emitted here.

	.section .data.frontier_df4_uistuff.gap0, "a", %progbits
@ df4_uistuff region-different data, JP 0x0857a504..0x0857a7d4 (720 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_uistuff_000_57A504
frontier_df4_uistuff_000_57A504:
	.incbin "baserom.gba", 0x57A504, 0x2D0

	.section .data.frontier_df4_uistuff.gap1, "a", %progbits
@ df4_uistuff region-different data, JP 0x0857b23c..0x0857b74c (1296 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_uistuff_001_57B23C
frontier_df4_uistuff_001_57B23C:
	.incbin "baserom.gba", 0x57B23C, 0x510

	.section .data.frontier_df4_uistuff.gap2, "a", %progbits
@ df4_uistuff region-different data, JP 0x0857bf74..0x0857c244 (720 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_uistuff_002_57BF74
frontier_df4_uistuff_002_57BF74:
	.incbin "baserom.gba", 0x57BF74, 0x2D0

	.section .data.frontier_df4_uistuff.gap3, "a", %progbits
@ df4_uistuff region-different data, JP 0x0857cc64..0x0857ceec (648 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_uistuff_003_57CC64
frontier_df4_uistuff_003_57CC64:
	.incbin "baserom.gba", 0x57CC64, 0x288

	.section .data.frontier_df4_uistuff.gap4, "a", %progbits
@ df4_uistuff region-different data, JP 0x0857cf7c..0x0857d324 (936 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_uistuff_004_57CF7C
frontier_df4_uistuff_004_57CF7C:
	.incbin "baserom.gba", 0x57CF7C, 0x3A8

	.section .data.frontier_df4_uistuff.gap5, "a", %progbits
@ df4_uistuff region-different data, JP 0x0857dfcc..0x0857e2e4 (792 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_uistuff_005_57DFCC
frontier_df4_uistuff_005_57DFCC:
	.incbin "baserom.gba", 0x57DFCC, 0x318

	.section .data.frontier_df4_uistuff.gap6, "a", %progbits
@ df4_uistuff region-different data, JP 0x0857e4dc..0x0857e83c (864 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_uistuff_006_57E4DC
frontier_df4_uistuff_006_57E4DC:
	.incbin "baserom.gba", 0x57E4DC, 0x360

	.section .data.frontier_df4_uistuff.gap7, "a", %progbits
@ df4_uistuff region-different data, JP 0x0859140c..0x08593ecc (10944 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_uistuff_007_59140C
frontier_df4_uistuff_007_59140C:
	.incbin "baserom.gba", 0x59140C, 0x2AC0

	.section .data.frontier_df4_uistuff.gap8, "a", %progbits
@ df4_uistuff region-different data, JP 0x085946f4..0x08594934 (576 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_uistuff_008_5946F4
frontier_df4_uistuff_008_5946F4:
	.incbin "baserom.gba", 0x5946F4, 0x240

	.section .data.frontier_df4_uistuff.gap9, "a", %progbits
@ df4_uistuff region-different data, JP 0x08594b2c..0x08594dfc (720 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_uistuff_009_594B2C
frontier_df4_uistuff_009_594B2C:
	.incbin "baserom.gba", 0x594B2C, 0x2D0

	.section .data.frontier_df4_uistuff.gap10, "a", %progbits
@ df4_uistuff region-different data, JP 0x08595b34..0x08595d74 (576 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_uistuff_010_595B34
frontier_df4_uistuff_010_595B34:
	.incbin "baserom.gba", 0x595B34, 0x240

	.section .data.frontier_df4_uistuff.gap11, "a", %progbits
@ df4_uistuff region-different data, JP 0x0859662c..0x0859686c (576 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_uistuff_011_59662C
frontier_df4_uistuff_011_59662C:
	.incbin "baserom.gba", 0x59662C, 0x240

	.section .data.frontier_df4_uistuff.gap12, "a", %progbits
@ df4_uistuff region-different data, JP 0x08596f74..0x08598444 (5328 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_uistuff_012_596F74
frontier_df4_uistuff_012_596F74:
	.incbin "baserom.gba", 0x596F74, 0x14D0

	.section .data.frontier_df4_uistuff.gap13, "a", %progbits
@ df4_uistuff region-different data, JP 0x085987ec..0x08598e1c (1584 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_uistuff_013_5987EC
frontier_df4_uistuff_013_5987EC:
	.incbin "baserom.gba", 0x5987EC, 0x630

	.section .data.frontier_df4_uistuff.gap14, "a", %progbits
@ df4_uistuff region-different data, JP 0x08598e64..0x08599b9c (3384 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_uistuff_014_598E64
frontier_df4_uistuff_014_598E64:
	.incbin "baserom.gba", 0x598E64, 0xD38

	.section .data.frontier_df4_uistuff.gap15, "a", %progbits
@ df4_uistuff region-different data, JP 0x08599be4..0x0859a064 (1152 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_uistuff_015_599BE4
frontier_df4_uistuff_015_599BE4:
	.incbin "baserom.gba", 0x599BE4, 0x480

	.section .data.frontier_df4_uistuff.gap16, "a", %progbits
@ df4_uistuff region-different data, JP 0x0859a2ec..0x0859a52c (576 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_uistuff_016_59A2EC
frontier_df4_uistuff_016_59A2EC:
	.incbin "baserom.gba", 0x59A2EC, 0x240

	.section .data.frontier_df4_uistuff.gap17, "a", %progbits
@ df4_uistuff region-different data, JP 0x0859a574..0x0859b0b4 (2880 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_uistuff_017_59A574
frontier_df4_uistuff_017_59A574:
	.incbin "baserom.gba", 0x59A574, 0xB40

	.section .data.frontier_df4_uistuff.gap18, "a", %progbits
@ df4_uistuff region-different data, JP 0x0859b0fc..0x0859ba44 (2376 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_uistuff_018_59B0FC
frontier_df4_uistuff_018_59B0FC:
	.incbin "baserom.gba", 0x59B0FC, 0x948

	.section .data.frontier_df4_uistuff.gap19, "a", %progbits
@ df4_uistuff region-different data, JP 0x0859ba8c..0x0859bf9c (1296 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_uistuff_019_59BA8C
frontier_df4_uistuff_019_59BA8C:
	.incbin "baserom.gba", 0x59BA8C, 0x510

	.section .data.frontier_df4_uistuff.gap20, "a", %progbits
@ df4_uistuff region-different data, JP 0x0859bfe4..0x0859cfec (4104 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_uistuff_020_59BFE4
frontier_df4_uistuff_020_59BFE4:
	.incbin "baserom.gba", 0x59BFE4, 0x1008

	.section .data.frontier_df4_uistuff.gap21, "a", %progbits
@ df4_uistuff region-different data, JP 0x0859d034..0x0859d4b4 (1152 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_uistuff_021_59D034
frontier_df4_uistuff_021_59D034:
	.incbin "baserom.gba", 0x59D034, 0x480

	.section .data.frontier_df4_uistuff.gap22, "a", %progbits
@ df4_uistuff region-different data, JP 0x085b90d8..0x085b9308 (560 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_uistuff_022_5B90D8
frontier_df4_uistuff_022_5B90D8:
	.incbin "baserom.gba", 0x5B90D8, 0x230

	.section .data.frontier_df4_uistuff.gap23, "a", %progbits
@ df4_uistuff region-different data, JP 0x085b9454..0x085b9dd4 (2432 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_uistuff_023_5B9454
frontier_df4_uistuff_023_5B9454:
	.incbin "baserom.gba", 0x5B9454, 0x980

	.section .data.frontier_df4_uistuff.gap24, "a", %progbits
@ df4_uistuff region-different data, JP 0x085c1d30..0x085c28b8 (2952 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_uistuff_024_5C1D30
frontier_df4_uistuff_024_5C1D30:
	.incbin "baserom.gba", 0x5C1D30, 0xB88

	.section .data.frontier_df4_uistuff.gap25, "a", %progbits
@ df4_uistuff region-different data, JP 0x085c2e50..0x085c3308 (1208 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_uistuff_025_5C2E50
frontier_df4_uistuff_025_5C2E50:
	.incbin "baserom.gba", 0x5C2E50, 0x4B8

	.section .data.frontier_df4_uistuff.gap26, "a", %progbits
@ df4_uistuff region-different data, JP 0x085c3618..0x085c3830 (536 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_uistuff_026_5C3618
frontier_df4_uistuff_026_5C3618:
	.incbin "baserom.gba", 0x5C3618, 0x218

	.section .data.frontier_df4_uistuff.gap27, "a", %progbits
@ df4_uistuff region-different data, JP 0x085c3c9c..0x085c4104 (1128 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_uistuff_027_5C3C9C
frontier_df4_uistuff_027_5C3C9C:
	.incbin "baserom.gba", 0x5C3C9C, 0x468

	.section .data.frontier_df4_uistuff.gap28, "a", %progbits
@ df4_uistuff region-different data, JP 0x085c411c..0x085c4320 (516 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_uistuff_028_5C411C
frontier_df4_uistuff_028_5C411C:
	.incbin "baserom.gba", 0x5C411C, 0x204

	.section .data.frontier_df4_uistuff.gap29, "a", %progbits
@ df4_uistuff region-different data, JP 0x085c4a94..0x085c4f14 (1152 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_uistuff_029_5C4A94
frontier_df4_uistuff_029_5C4A94:
	.incbin "baserom.gba", 0x5C4A94, 0x480

	.section .data.frontier_df4_uistuff.gap30, "a", %progbits
@ df4_uistuff region-different data, JP 0x085c534c..0x085c5978 (1580 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_uistuff_030_5C534C
frontier_df4_uistuff_030_5C534C:
	.incbin "baserom.gba", 0x5C534C, 0x62C

	.section .data.frontier_df4_uistuff.gap31, "a", %progbits
@ df4_uistuff region-different data, JP 0x085c5de8..0x085c6080 (664 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_uistuff_031_5C5DE8
frontier_df4_uistuff_031_5C5DE8:
	.incbin "baserom.gba", 0x5C5DE8, 0x298

	.section .data.frontier_df4_uistuff.gap32, "a", %progbits
@ df4_uistuff region-different data, JP 0x085c6084..0x085c6646 (1474 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_uistuff_032_5C6084
frontier_df4_uistuff_032_5C6084:
	.incbin "baserom.gba", 0x5C6084, 0x5C2

	.section .data.frontier_df4_uistuff.gap33, "a", %progbits
@ df4_uistuff region-different data, JP 0x085c6ad4..0x085c6d88 (692 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_uistuff_033_5C6AD4
frontier_df4_uistuff_033_5C6AD4:
	.incbin "baserom.gba", 0x5C6AD4, 0x2B4

	.section .data.frontier_df4_uistuff.gap34, "a", %progbits
@ df4_uistuff region-different data, JP 0x085c6e08..0x085c7290 (1160 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_uistuff_034_5C6E08
frontier_df4_uistuff_034_5C6E08:
	.incbin "baserom.gba", 0x5C6E08, 0x488

	.section .data.frontier_df4_uistuff.gap35, "a", %progbits
@ df4_uistuff region-different data, JP 0x085cdf84..0x085cf274 (4848 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_uistuff_035_5CDF84
frontier_df4_uistuff_035_5CDF84:
	.incbin "baserom.gba", 0x5CDF84, 0x12F0

	.section .data.frontier_df4_uistuff.gap36, "a", %progbits
@ df4_uistuff region-different data, JP 0x085d14d4..0x085d1bc8 (1780 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_uistuff_036_5D14D4
frontier_df4_uistuff_036_5D14D4:
	.incbin "baserom.gba", 0x5D14D4, 0x6F4

	.section .data.frontier_df4_uistuff.gap37, "a", %progbits
@ df4_uistuff region-different data, JP 0x085d2608..0x085d2984 (892 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_uistuff_037_5D2608
frontier_df4_uistuff_037_5D2608:
	.incbin "baserom.gba", 0x5D2608, 0x37C

	.section .data.frontier_df4_uistuff.gap38, "a", %progbits
@ df4_uistuff region-different data, JP 0x085d32d8..0x085d3624 (844 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_uistuff_038_5D32D8
frontier_df4_uistuff_038_5D32D8:
	.incbin "baserom.gba", 0x5D32D8, 0x34C
