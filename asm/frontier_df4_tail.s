@ df4_tail: data-frontier-4 long-tail sweep — region-different data not
@ reachable by the code-literal carver, in the pure-DATA window
@ [0x08babaf8, 0x08f2f580) (verified: 0 carved .text
@ objects inside; whole window is at/above the code+library boundary
@ 0x080dc134). Each gap is [prev_carved_end, next_carved_start) — already
@ snapped to carved edges; already-carved region-same sub-assets are
@ gap-subtracted, so only the uncarved blobs are emitted here.

	.section .data.frontier_df4_tail.gap0, "a", %progbits
@ df4_tail region-different data, JP 0x08babaf8..0x08babe04 (780 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_tail_000_BABAF8
frontier_df4_tail_000_BABAF8:
	.incbin "baserom.gba", 0xBABAF8, 0x30C

	.section .data.frontier_df4_tail.gap1, "a", %progbits
@ df4_tail region-different data, JP 0x08bb08b4..0x08bb8788 (32468 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_tail_001_BB08B4
frontier_df4_tail_001_BB08B4:
	.incbin "baserom.gba", 0xBB08B4, 0x7ED4
