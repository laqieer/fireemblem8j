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
	.incbin "data/sound/frontier_df4_voice_000_1F578C.bin"

	.section .data.frontier_df4_voice.gap1, "a", %progbits
@ df4_voice region-different data, JP 0x081f67bc..0x081f6cf4 (1336 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_voice_001_1F67BC
frontier_df4_voice_001_1F67BC:
	.incbin "data/sound/frontier_df4_voice_001_1F67BC.bin"

@ gap2 (frontier_df4_voice_002_211988) and gap3 (frontier_df4_voice_003_214120)
@ retired (D312/wave6): now built from editable macro-table source in
@ src/data/frontier_df4_voice/frontier_df4_voice.c; their residual .bin orphans
@ are deleted. This whole .s is dead (DATA_INCBIN_ASM_EXCLUDE); the live _000/_001
@ symbols above come from the .c, the .incbin's here are retained only as a
@ provenance stub for the two still-INCBIN'd voice blobs.
