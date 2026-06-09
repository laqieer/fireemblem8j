@ df3_titlescreen: region-different data not reachable by the code-literal carver
@ (leaf assets are unnamed US symbols). Boundaries read live from the bracketing carved/named objects (single identified blob; per-asset
@ tiling N/A - the index structs live outside the window)
@ in baserom.
@ Region [0x08b44b40, 0x08b4bba0); already-carved region-same
@ sub-assets are gap-subtracted, so only the uncarved blobs are emitted here.

	.section .data.frontier_df3_titlescreen.gap0, "a", %progbits
@ df3_titlescreen region-different data, JP 0x08b44b40..0x08b4678c (7244 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_df3_titlescreen_000_B44B40
frontier_df3_titlescreen_000_B44B40:
	.incbin "baserom.gba", 0xB44B40, 0x1C4C

	.section .data.frontier_df3_titlescreen.gap1, "a", %progbits
@ df3_titlescreen region-different data, JP 0x08b48d38..0x08b49b6c (3636 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_df3_titlescreen_001_B48D38
frontier_df3_titlescreen_001_B48D38:
	.incbin "baserom.gba", 0xB48D38, 0xE34

	.section .data.frontier_df3_titlescreen.gap2, "a", %progbits
@ df3_titlescreen region-different data, JP 0x08b4b200..0x08b4bba0 (2464 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_df3_titlescreen_002_B4B200
frontier_df3_titlescreen_002_B4B200:
	.incbin "baserom.gba", 0xB4B200, 0x9A0
