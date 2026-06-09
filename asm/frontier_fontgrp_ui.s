@ fontgrp_ui: region-different data not reachable by the code-literal carver
@ (leaf assets are unnamed US symbols). Boundaries read live from the bracketing carved/named objects (single identified blob; per-asset
@ tiling N/A - the index structs live outside the window)
@ in baserom.
@ Region [0x0859d4fc, 0x085b8cdc); already-carved region-same
@ sub-assets are gap-subtracted, so only the uncarved blobs are emitted here.

	.section .data.frontier_fontgrp_ui.gap0, "a", %progbits
@ fontgrp_ui region-different data, JP 0x0859d4fc..0x085b8cdc (112608 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_fontgrp_ui_000_59D4FC
frontier_fontgrp_ui_000_59D4FC:
	.incbin "baserom.gba", 0x59D4FC, 0x1B7E0
