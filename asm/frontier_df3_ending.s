@ df3_ending: region-different data not reachable by the code-literal carver
@ (leaf assets are unnamed US symbols). Boundaries read live from the bracketing carved/named objects (single identified blob; per-asset
@ tiling N/A - the index structs live outside the window)
@ in baserom.
@ Region [0x08ac1bc0, 0x08ac6c98); already-carved region-same
@ sub-assets are gap-subtracted, so only the uncarved blobs are emitted here.

	.section .data.frontier_df3_ending.gap0, "a", %progbits
@ df3_ending region-different data, JP 0x08ac1bc0..0x08ac2be0 (4128 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_df3_ending_000_AC1BC0
frontier_df3_ending_000_AC1BC0:
	.incbin "baserom.gba", 0xAC1BC0, 0x1020

	.section .data.frontier_df3_ending.gap1, "a", %progbits
@ df3_ending region-different data, JP 0x08ac3aa8..0x08ac4c88 (4576 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_df3_ending_001_AC3AA8
frontier_df3_ending_001_AC3AA8:
	.incbin "baserom.gba", 0xAC3AA8, 0x11E0

	.section .data.frontier_df3_ending.gap2, "a", %progbits
@ df3_ending region-different data, JP 0x08ac50a4..0x08ac6c98 (7156 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_df3_ending_002_AC50A4
frontier_df3_ending_002_AC50A4:
	.incbin "baserom.gba", 0xAC50A4, 0x1BF4
