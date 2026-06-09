@ df4_voice: data-frontier-4 long-tail sweep — region-different data not
@ reachable by the code-literal carver, in the pure-DATA window
@ [0x081f5784, 0x08530000) (verified: 0 carved .text
@ objects inside; whole window is at/above the code+library boundary
@ 0x080dc134). Each gap is [prev_carved_end, next_carved_start) — already
@ snapped to carved edges; already-carved region-same sub-assets are
@ gap-subtracted, so only the uncarved blobs are emitted here.

	.section .data.frontier_df4_voice.gap0, "a", %progbits
@ df4_voice region-different data, JP 0x081f578c..0x081f5bec (1120 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_voice_000_1F578C
frontier_df4_voice_000_1F578C:
	.incbin "baserom.gba", 0x1F578C, 0x460

	.section .data.frontier_df4_voice.gap1, "a", %progbits
@ df4_voice region-different data, JP 0x081f67bc..0x081f6cf4 (1336 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_voice_001_1F67BC
frontier_df4_voice_001_1F67BC:
	.incbin "baserom.gba", 0x1F67BC, 0x538

	.section .data.frontier_df4_voice.gap2, "a", %progbits
@ df4_voice region-different data, JP 0x08211988..0x08212360 (2520 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_voice_002_211988
frontier_df4_voice_002_211988:
	.incbin "baserom.gba", 0x211988, 0x9D8

	.section .data.frontier_df4_voice.gap3, "a", %progbits
@ df4_voice region-different data, JP 0x08214120..0x08216064 (8004 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_voice_003_214120
frontier_df4_voice_003_214120:
	.incbin "baserom.gba", 0x214120, 0x1F44
