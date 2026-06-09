@ df3_voicegroup: region-different data not reachable by the code-literal carver
@ (leaf assets are unnamed US symbols). Boundaries read live from the bracketing carved/named objects (single identified blob; per-asset
@ tiling N/A - the index structs live outside the window)
@ in baserom.
@ Region [0x081f70e8, 0x0820fee8); already-carved region-same
@ sub-assets are gap-subtracted, so only the uncarved blobs are emitted here.

	.section .data.frontier_df3_voicegroup.gap0, "a", %progbits
@ df3_voicegroup region-different data, JP 0x081f70e8..0x081fd720 (26168 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_df3_voicegroup_000_1F70E8
frontier_df3_voicegroup_000_1F70E8:
	.incbin "baserom.gba", 0x1F70E8, 0x6638

	.section .data.frontier_df3_voicegroup.gap1, "a", %progbits
@ df3_voicegroup region-different data, JP 0x081fe320..0x0820189c (13692 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_df3_voicegroup_001_1FE320
frontier_df3_voicegroup_001_1FE320:
	.incbin "baserom.gba", 0x1FE320, 0x357C

	.section .data.frontier_df3_voicegroup.gap2, "a", %progbits
@ df3_voicegroup region-different data, JP 0x08202c07..0x082031d4 (1485 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_df3_voicegroup_002_202C07
frontier_df3_voicegroup_002_202C07:
	.incbin "baserom.gba", 0x202C07, 0x5CD

	.section .data.frontier_df3_voicegroup.gap3, "a", %progbits
@ df3_voicegroup region-different data, JP 0x082038c4..0x08205cc4 (9216 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_df3_voicegroup_003_2038C4
frontier_df3_voicegroup_003_2038C4:
	.incbin "baserom.gba", 0x2038C4, 0x2400

	.section .data.frontier_df3_voicegroup.gap4, "a", %progbits
@ df3_voicegroup region-different data, JP 0x082068c4..0x08206ec4 (1536 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_df3_voicegroup_004_2068C4
frontier_df3_voicegroup_004_2068C4:
	.incbin "baserom.gba", 0x2068C4, 0x600

	.section .data.frontier_df3_voicegroup.gap5, "a", %progbits
@ df3_voicegroup region-different data, JP 0x082074c4..0x082098c4 (9216 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_df3_voicegroup_005_2074C4
frontier_df3_voicegroup_005_2074C4:
	.incbin "baserom.gba", 0x2074C4, 0x2400

	.section .data.frontier_df3_voicegroup.gap6, "a", %progbits
@ df3_voicegroup region-different data, JP 0x0820a398..0x0820a86c (1236 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_df3_voicegroup_006_20A398
frontier_df3_voicegroup_006_20A398:
	.incbin "baserom.gba", 0x20A398, 0x4D4

	.section .data.frontier_df3_voicegroup.gap7, "a", %progbits
@ df3_voicegroup region-different data, JP 0x0820ad40..0x0820b940 (3072 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_df3_voicegroup_007_20AD40
frontier_df3_voicegroup_007_20AD40:
	.incbin "baserom.gba", 0x20AD40, 0xC00

	.section .data.frontier_df3_voicegroup.gap8, "a", %progbits
@ df3_voicegroup region-different data, JP 0x0820bf40..0x0820c540 (1536 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_df3_voicegroup_008_20BF40
frontier_df3_voicegroup_008_20BF40:
	.incbin "baserom.gba", 0x20BF40, 0x600

	.section .data.frontier_df3_voicegroup.gap9, "a", %progbits
@ df3_voicegroup region-different data, JP 0x0820cee8..0x0820dae8 (3072 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_df3_voicegroup_009_20CEE8
frontier_df3_voicegroup_009_20CEE8:
	.incbin "baserom.gba", 0x20CEE8, 0xC00

	.section .data.frontier_df3_voicegroup.gap10, "a", %progbits
@ df3_voicegroup region-different data, JP 0x0820ece8..0x0820fee8 (4608 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_df3_voicegroup_010_20ECE8
frontier_df3_voicegroup_010_20ECE8:
	.incbin "baserom.gba", 0x20ECE8, 0x1200
