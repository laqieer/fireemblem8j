@ df3_btl_bg: region-different data not reachable by the code-literal carver
@ (leaf assets are unnamed US symbols). Boundaries read live from the bracketing carved/named objects (single identified blob; per-asset
@ tiling N/A - the index structs live outside the window)
@ in baserom.
@ Region [0x087b40a8, 0x087b9f98); already-carved region-same
@ sub-assets are gap-subtracted, so only the uncarved blobs are emitted here.

	.section .data.frontier_df3_btl_bg.gap0, "a", %progbits
@ df3_btl_bg region-different data, JP 0x087b40a8..0x087b5a80 (6616 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_df3_btl_bg_000_7B40A8
frontier_df3_btl_bg_000_7B40A8:
	.incbin "graphics/frontier_df3_btl_bg/frontier_df3_btl_bg_000_7B40A8.bin.lz"

	.section .data.frontier_df3_btl_bg.gap1, "a", %progbits
@ df3_btl_bg region-different data, JP 0x087b6e50..0x087b8100 (4784 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_df3_btl_bg_001_7B6E50
frontier_df3_btl_bg_001_7B6E50:
	.incbin "graphics/frontier_df3_btl_bg/frontier_df3_btl_bg_001_7B6E50.bin.lz"

	.section .data.frontier_df3_btl_bg.gap2, "a", %progbits
@ df3_btl_bg region-different data, JP 0x087b83b8..0x087b9f98 (7136 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_df3_btl_bg_002_7B83B8
frontier_df3_btl_bg_002_7B83B8:
	.incbin "graphics/frontier_df3_btl_bg/frontier_df3_btl_bg_002_7B83B8.bin"
