@ ending_cg: region-different data not reachable by the code-literal carver
@ (leaf assets are unnamed US symbols). Boundaries read live from the bracketing carved/named objects (single identified blob; per-asset
@ tiling N/A - the index structs live outside the window)
@ in baserom.
@ Region [0x08b27970, 0x08b3b3d4); already-carved region-same
@ sub-assets are gap-subtracted, so only the uncarved blobs are emitted here.

	.section .data.frontier_ending_cg.gap0, "a", %progbits
@ ending_cg region-different data, JP 0x08b27970..0x08b3b3d4 (80484 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_ending_cg_000_B27970
frontier_ending_cg_000_B27970:
	.incbin "graphics/frontier_ending_cg/frontier_ending_cg_000_B27970.bin"
