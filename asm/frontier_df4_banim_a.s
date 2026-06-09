@ df4_banim_a: data-frontier-4 long-tail sweep — region-different data not
@ reachable by the code-literal carver, in the pure-DATA window
@ [0x085d4000, 0x08602568) (verified: 0 carved .text
@ objects inside; whole window is at/above the code+library boundary
@ 0x080dc134). Each gap is [prev_carved_end, next_carved_start) — already
@ snapped to carved edges; already-carved region-same sub-assets are
@ gap-subtracted, so only the uncarved blobs are emitted here.

	.section .data.frontier_df4_banim_a.gap0, "a", %progbits
@ df4_banim_a region-different data, JP 0x085e0e94..0x085e3170 (8924 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_banim_a_000_5E0E94
frontier_df4_banim_a_000_5E0E94:
	.incbin "baserom.gba", 0x5E0E94, 0x22DC

	.section .data.frontier_df4_banim_a.gap1, "a", %progbits
@ df4_banim_a region-different data, JP 0x085e37cc..0x085e3aac (736 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_banim_a_001_5E37CC
frontier_df4_banim_a_001_5E37CC:
	.incbin "baserom.gba", 0x5E37CC, 0x2E0

	.section .data.frontier_df4_banim_a.gap2, "a", %progbits
@ df4_banim_a region-different data, JP 0x085e3ad4..0x085e4088 (1460 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_banim_a_002_5E3AD4
frontier_df4_banim_a_002_5E3AD4:
	.incbin "baserom.gba", 0x5E3AD4, 0x5B4

	.section .data.frontier_df4_banim_a.gap3, "a", %progbits
@ df4_banim_a region-different data, JP 0x085e4570..0x085e49e4 (1140 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_banim_a_003_5E4570
frontier_df4_banim_a_003_5E4570:
	.incbin "baserom.gba", 0x5E4570, 0x474

	.section .data.frontier_df4_banim_a.gap4, "a", %progbits
@ df4_banim_a region-different data, JP 0x085e4e84..0x085e52f8 (1140 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_banim_a_004_5E4E84
frontier_df4_banim_a_004_5E4E84:
	.incbin "baserom.gba", 0x5E4E84, 0x474

	.section .data.frontier_df4_banim_a.gap5, "a", %progbits
@ df4_banim_a region-different data, JP 0x085ea510..0x085eb340 (3632 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_banim_a_005_5EA510
frontier_df4_banim_a_005_5EA510:
	.incbin "baserom.gba", 0x5EA510, 0xE30

	.section .data.frontier_df4_banim_a.gap6, "a", %progbits
@ df4_banim_a region-different data, JP 0x085ebf04..0x085ecb44 (3136 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_banim_a_006_5EBF04
frontier_df4_banim_a_006_5EBF04:
	.incbin "baserom.gba", 0x5EBF04, 0xC40

	.section .data.frontier_df4_banim_a.gap7, "a", %progbits
@ df4_banim_a region-different data, JP 0x085f1c3c..0x085f1f84 (840 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_banim_a_007_5F1C3C
frontier_df4_banim_a_007_5F1C3C:
	.incbin "baserom.gba", 0x5F1C3C, 0x348

	.section .data.frontier_df4_banim_a.gap8, "a", %progbits
@ df4_banim_a region-different data, JP 0x085fe7d8..0x085fea6c (660 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_banim_a_008_5FE7D8
frontier_df4_banim_a_008_5FE7D8:
	.incbin "baserom.gba", 0x5FE7D8, 0x294

	.section .data.frontier_df4_banim_a.gap9, "a", %progbits
@ df4_banim_a region-different data, JP 0x085ff000..0x085ff768 (1896 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_banim_a_009_5FF000
frontier_df4_banim_a_009_5FF000:
	.incbin "baserom.gba", 0x5FF000, 0x768

	.section .data.frontier_df4_banim_a.gap10, "a", %progbits
@ df4_banim_a region-different data, JP 0x085ff7c8..0x085ffb18 (848 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_banim_a_010_5FF7C8
frontier_df4_banim_a_010_5FF7C8:
	.incbin "baserom.gba", 0x5FF7C8, 0x350

	.section .data.frontier_df4_banim_a.gap11, "a", %progbits
@ df4_banim_a region-different data, JP 0x085ffba0..0x0860073c (2972 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_banim_a_011_5FFBA0
frontier_df4_banim_a_011_5FFBA0:
	.incbin "baserom.gba", 0x5FFBA0, 0xB9C

	.section .data.frontier_df4_banim_a.gap12, "a", %progbits
@ df4_banim_a region-different data, JP 0x08600754..0x086012c8 (2932 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_banim_a_012_600754
frontier_df4_banim_a_012_600754:
	.incbin "baserom.gba", 0x600754, 0xB74

	.section .data.frontier_df4_banim_a.gap13, "a", %progbits
@ df4_banim_a region-different data, JP 0x08601630..0x08601cc0 (1680 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_banim_a_013_601630
frontier_df4_banim_a_013_601630:
	.incbin "baserom.gba", 0x601630, 0x690

	.section .data.frontier_df4_banim_a.gap14, "a", %progbits
@ df4_banim_a region-different data, JP 0x08601cd8..0x08602550 (2168 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_banim_a_014_601CD8
frontier_df4_banim_a_014_601CD8:
	.incbin "baserom.gba", 0x601CD8, 0x878
