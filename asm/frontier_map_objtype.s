@ map_objtype: region-different data not reachable by the code-literal carver
@ (leaf assets are unnamed US symbols). Boundaries read live from the JP
@ index table(s) 0x08907bc8[236] in baserom.
@ Region [0x0817b398, 0x08190010); already-carved region-same
@ sub-assets are gap-subtracted, so only the uncarved blobs are emitted here.

	.section .data.frontier_map_objtype.gap0, "a", %progbits
@ map_objtype region-different data, JP 0x0817b398..0x08181610 (25208 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_map_objtype_000_17B398
frontier_map_objtype_000_17B398:
	.incbin "baserom.gba", 0x17B398, 0x6278

	.section .data.frontier_map_objtype.gap1, "a", %progbits
@ map_objtype region-different data, JP 0x08181610..0x08188888 (29304 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_map_objtype_001_181610
frontier_map_objtype_001_181610:
	.incbin "baserom.gba", 0x181610, 0x7278

	.section .data.frontier_map_objtype.gap2, "a", %progbits
@ map_objtype region-different data, JP 0x08188888..0x08190010 (30600 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_map_objtype_002_188888
frontier_map_objtype_002_188888:
	.incbin "baserom.gba", 0x188888, 0x7788
