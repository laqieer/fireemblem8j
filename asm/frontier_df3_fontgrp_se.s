@ df3_fontgrp_se: region-different data not reachable by the code-literal carver
@ (leaf assets are unnamed US symbols). Boundaries read live from the bracketing carved/named objects (single identified blob; per-asset
@ tiling N/A - the index structs live outside the window)
@ in baserom.
@ Region [0x0857e884, 0x085912ec); already-carved region-same
@ sub-assets are gap-subtracted, so only the uncarved blobs are emitted here.

	.section .data.frontier_df3_fontgrp_se.gap0, "a", %progbits
@ df3_fontgrp_se region-different data, JP 0x0857e884..0x0857f5bc (3384 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_df3_fontgrp_se_000_57E884
frontier_df3_fontgrp_se_000_57E884:
	.incbin "graphics/frontier_df3_fontgrp_se/frontier_df3_fontgrp_se_000_57E884.bin"

	.section .data.frontier_df3_fontgrp_se.gap1, "a", %progbits
@ df3_fontgrp_se region-different data, JP 0x0857f604..0x0857fa84 (1152 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_df3_fontgrp_se_001_57F604
frontier_df3_fontgrp_se_001_57F604:
	.incbin "graphics/frontier_df3_fontgrp_se/frontier_df3_fontgrp_se_001_57F604.bin"

	.section .data.frontier_df3_fontgrp_se.gap2, "a", %progbits
@ df3_fontgrp_se region-different data, JP 0x0857facc..0x0857fcc4 (504 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_df3_fontgrp_se_002_57FACC
frontier_df3_fontgrp_se_002_57FACC:
	.incbin "graphics/frontier_df3_fontgrp_se/frontier_df3_fontgrp_se_002_57FACC.bin"

	.section .data.frontier_df3_fontgrp_se.gap3, "a", %progbits
@ df3_fontgrp_se region-different data, JP 0x0857fd0c..0x0857ff4c (576 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_df3_fontgrp_se_003_57FD0C
frontier_df3_fontgrp_se_003_57FD0C:
	.incbin "graphics/frontier_df3_fontgrp_se/frontier_df3_fontgrp_se_003_57FD0C.bin"

	.section .data.frontier_df3_fontgrp_se.gap4, "a", %progbits
@ df3_fontgrp_se region-different data, JP 0x0857ff94..0x08580ad4 (2880 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_df3_fontgrp_se_004_57FF94
frontier_df3_fontgrp_se_004_57FF94:
	.incbin "graphics/frontier_df3_fontgrp_se/frontier_df3_fontgrp_se_004_57FF94.bin"

	.section .data.frontier_df3_fontgrp_se.gap5, "a", %progbits
@ df3_fontgrp_se region-different data, JP 0x08580b1c..0x08581464 (2376 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_df3_fontgrp_se_005_580B1C
frontier_df3_fontgrp_se_005_580B1C:
	.incbin "graphics/frontier_df3_fontgrp_se/frontier_df3_fontgrp_se_005_580B1C.bin"

	.section .data.frontier_df3_fontgrp_se.gap6, "a", %progbits
@ df3_fontgrp_se region-different data, JP 0x085814ac..0x085819bc (1296 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_df3_fontgrp_se_006_5814AC
frontier_df3_fontgrp_se_006_5814AC:
	.incbin "graphics/frontier_df3_fontgrp_se/frontier_df3_fontgrp_se_006_5814AC.bin"

	.section .data.frontier_df3_fontgrp_se.gap7, "a", %progbits
@ df3_fontgrp_se region-different data, JP 0x08581a04..0x08582a0c (4104 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_df3_fontgrp_se_007_581A04
frontier_df3_fontgrp_se_007_581A04:
	.incbin "graphics/frontier_df3_fontgrp_se/frontier_df3_fontgrp_se_007_581A04.bin"

	.section .data.frontier_df3_fontgrp_se.gap8, "a", %progbits
@ df3_fontgrp_se region-different data, JP 0x08582a54..0x08582ed4 (1152 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_df3_fontgrp_se_008_582A54
frontier_df3_fontgrp_se_008_582A54:
	.incbin "graphics/frontier_df3_fontgrp_se/frontier_df3_fontgrp_se_008_582A54.bin"

	.section .data.frontier_df3_fontgrp_se.gap9, "a", %progbits
@ df3_fontgrp_se region-different data, JP 0x08582f1c..0x085912ec (58320 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_df3_fontgrp_se_009_582F1C
frontier_df3_fontgrp_se_009_582F1C:
	.incbin "graphics/frontier_df3_fontgrp_se/frontier_df3_fontgrp_se_009_582F1C.bin"
