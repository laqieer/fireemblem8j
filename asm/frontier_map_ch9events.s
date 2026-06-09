@ map_ch9events: region-different data not reachable by the code-literal carver
@ (leaf assets are unnamed US symbols). Boundaries read live from the JP
@ index table(s) 0x08907bc8[236] in baserom.
@ Region [0x08159850, 0x081608a4); already-carved region-same
@ sub-assets are gap-subtracted, so only the uncarved blobs are emitted here.

	.section .data.frontier_map_ch9events.gap0, "a", %progbits
@ map_ch9events region-different data, JP 0x081598a0..0x081608a4 (28676 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_map_ch9events_000_1598A0
frontier_map_ch9events_000_1598A0:
	.incbin "baserom.gba", 0x1598A0, 0x7004
