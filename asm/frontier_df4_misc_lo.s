@ df4_misc_lo: data-frontier-4 long-tail sweep — region-different data not
@ reachable by the code-literal carver, in the pure-DATA window
@ [0x080dc134, 0x081f5784) (verified: 0 carved .text
@ objects inside; whole window is at/above the code+library boundary
@ 0x080dc134). Each gap is [prev_carved_end, next_carved_start) — already
@ snapped to carved edges; already-carved region-same sub-assets are
@ gap-subtracted, so only the uncarved blobs are emitted here.

	.section .data.frontier_df4_misc_lo.gap0a, "a", %progbits
@ df4_misc_lo region-different data, JP 0x080dc3dc..0x080dc3fc (32 B); split before GetGenericChibiImg rodata at 0x080dc3fc.
	.global frontier_df4_misc_lo_000a_0DC3DC
frontier_df4_misc_lo_000a_0DC3DC:
	.incbin "graphics/frontier_df4_misc_lo/frontier_df4_misc_lo_000a_0DC3DC.bin"

	.section .data.frontier_df4_misc_lo.gap0b, "a", %progbits
@ df4_misc_lo region-different data, JP 0x080dc41c..0x080dc650 (564 B); split after GetGenericChibiImg rodata at 0x080dc3fc.
	.global frontier_df4_misc_lo_000b_0DC41C
frontier_df4_misc_lo_000b_0DC41C:
	.incbin "graphics/frontier_df4_misc_lo/frontier_df4_misc_lo_000b_0DC41C.bin"

	.section .data.frontier_df4_misc_lo.gap1, "a", %progbits
@ df4_misc_lo region-different data, JP 0x080dc96c..0x080dcc90 (804 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_misc_lo_001_0DC96C
frontier_df4_misc_lo_001_0DC96C:
	.incbin "graphics/frontier_df4_misc_lo/frontier_df4_misc_lo_001_0DC96C.bin"

	.section .data.frontier_df4_misc_lo.gap2a, "a", %progbits
@ df4_misc_lo region-different data, JP 0x080dcdd0..0x080dce48 (120 B); long-tail data gap (no .text in window), byte-perfect incbin.
@ Was gap2 (0x080dcdd0..0x080dd368); split around cp_data.o(.rodata) at 0x080dce48..0x080dd358 (now typed C, src/cp_data.c).
	.global frontier_df4_misc_lo_002a_0DCDD0
frontier_df4_misc_lo_002a_0DCDD0:
	.incbin "graphics/frontier_df4_misc_lo/frontier_df4_misc_lo_002a_0DCDD0.bin"

	.section .data.frontier_df4_misc_lo.gap2b, "a", %progbits
@ df4_misc_lo region-different data, JP 0x080dd358..0x080dd368 (16 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_misc_lo_002b_0DD358
frontier_df4_misc_lo_002b_0DD358:
	.incbin "graphics/frontier_df4_misc_lo/frontier_df4_misc_lo_002b_0DD358.bin"

	.section .data.frontier_df4_misc_lo.gap3, "a", %progbits
@ df4_misc_lo region-different data, JP 0x080de85c..0x080ded24 (1224 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_misc_lo_003_0DE85C
frontier_df4_misc_lo_003_0DE85C:
	.incbin "graphics/frontier_df4_misc_lo/frontier_df4_misc_lo_003_0DE85C.bin"

	.section .data.frontier_df4_misc_lo.gap4, "a", %progbits
@ df4_misc_lo region-different data, JP 0x080dee88..0x080df2e0 (1112 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_misc_lo_004_0DEE88
frontier_df4_misc_lo_004_0DEE88:
	.incbin "graphics/frontier_df4_misc_lo/frontier_df4_misc_lo_004_0DEE88.bin"

	.section .data.frontier_df4_misc_lo.gap5, "a", %progbits
@ df4_misc_lo region-different data, JP 0x080df388..0x080dfbe4 (2140 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_misc_lo_005_0DF388
frontier_df4_misc_lo_005_0DF388:
	.incbin "graphics/frontier_df4_misc_lo/frontier_df4_misc_lo_005_0DF388.bin"

	.section .data.frontier_df4_misc_lo.gap6, "a", %progbits
@ df4_misc_lo region-different data, JP 0x080dfbef..0x080dfe9c (685 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_misc_lo_006_0DFBEF
frontier_df4_misc_lo_006_0DFBEF:
	.incbin "graphics/frontier_df4_misc_lo/frontier_df4_misc_lo_006_0DFBEF.bin"

	.section .data.frontier_df4_misc_lo.gap7, "a", %progbits
@ df4_misc_lo region-different data, JP 0x080e1870..0x080e262c (3516 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_misc_lo_007_0E1870
frontier_df4_misc_lo_007_0E1870:
	.incbin "graphics/frontier_df4_misc_lo/frontier_df4_misc_lo_007_0E1870.bin"

	.section .data.frontier_df4_misc_lo.gap8, "a", %progbits
@ df4_misc_lo region-different data, JP 0x080e2638..0x080e37b8 (4480 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_misc_lo_008_0E2638
frontier_df4_misc_lo_008_0E2638:
	.incbin "graphics/frontier_df4_misc_lo/frontier_df4_misc_lo_008_0E2638.bin"

	.section .data.frontier_df4_misc_lo.gap9, "a", %progbits
@ df4_misc_lo region-different data, JP 0x080e37c5..0x080e3ccc (1287 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_misc_lo_009_0E37C5
frontier_df4_misc_lo_009_0E37C5:
	.incbin "graphics/frontier_df4_misc_lo/frontier_df4_misc_lo_009_0E37C5.bin"

	.section .data.frontier_df4_misc_lo.gap10, "a", %progbits
@ df4_misc_lo region-different data, JP 0x080e3cd7..0x080e45d8 (2305 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_misc_lo_010_0E3CD7
frontier_df4_misc_lo_010_0E3CD7:
	.incbin "graphics/frontier_df4_misc_lo/frontier_df4_misc_lo_010_0E3CD7.bin"

	.section .data.frontier_df4_misc_lo.gap11, "a", %progbits
@ df4_misc_lo region-different data, JP 0x080e4602..0x080e4e0c (2058 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_misc_lo_011_0E4602
frontier_df4_misc_lo_011_0E4602:
	.incbin "graphics/frontier_df4_misc_lo/frontier_df4_misc_lo_011_0E4602.bin"

	.section .data.frontier_df4_misc_lo.gap12, "a", %progbits
@ df4_misc_lo region-different data, JP 0x080e6774..0x080e6ba0 (1068 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_misc_lo_012_0E6774
frontier_df4_misc_lo_012_0E6774:
	.incbin "graphics/frontier_df4_misc_lo/frontier_df4_misc_lo_012_0E6774.bin"

	.section .data.frontier_df4_misc_lo.gap13, "a", %progbits
@ df4_misc_lo region-different data, JP 0x080e7544..0x080e8934 (5104 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_misc_lo_013_0E7544
frontier_df4_misc_lo_013_0E7544:
	.incbin "graphics/frontier_df4_misc_lo/frontier_df4_misc_lo_013_0E7544.bin"

	.section .data.frontier_df4_misc_lo.gap14, "a", %progbits
@ df4_misc_lo region-different data, JP 0x080e8f58..0x080eac84 (7468 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_misc_lo_014_0E8F58
frontier_df4_misc_lo_014_0E8F58:
	.incbin "graphics/frontier_df4_misc_lo/frontier_df4_misc_lo_014_0E8F58.bin"

	.section .data.frontier_df4_misc_lo.gap15, "a", %progbits
@ df4_misc_lo region-different data, JP 0x0819e6ec..0x0819e9a8 (700 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_misc_lo_015_19E6EC
frontier_df4_misc_lo_015_19E6EC:
	.incbin "graphics/frontier_df4_misc_lo/frontier_df4_misc_lo_015_19E6EC.bin"

	.section .data.frontier_df4_misc_lo.gap16, "a", %progbits
@ df4_misc_lo region-different data, JP 0x081a4c88..0x081a4f44 (700 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_misc_lo_016_1A4C88
frontier_df4_misc_lo_016_1A4C88:
	.incbin "graphics/frontier_df4_misc_lo/frontier_df4_misc_lo_016_1A4C88.bin.lz"

	.section .data.frontier_df4_misc_lo.gap17, "a", %progbits
@ df4_misc_lo region-different data, JP 0x081b1878..0x081b2c80 (5128 B); long-tail data gap.
@ Split for src/chapterdata.o(.rodata) at 0x081b2c80 (chapter internalName string pool).
	.global frontier_df4_misc_lo_017_1B1878
frontier_df4_misc_lo_017_1B1878:
	.incbin "graphics/frontier_df4_misc_lo/frontier_df4_misc_lo_017_1B1878.bin", 0, 5128

	.section .data.frontier_df4_misc_lo.gap17b, "a", %progbits
@ df4_misc_lo region-different data, JP 0x081b2d81..0x081b2d84 (3 B); tail after chapterdata string pool.
	.global frontier_df4_misc_lo_017b_1B2D81
frontier_df4_misc_lo_017b_1B2D81:
	.incbin "graphics/frontier_df4_misc_lo/frontier_df4_misc_lo_017_1B1878.bin", 5385, 3

	.section .data.frontier_df4_misc_lo.gap18, "a", %progbits
@ df4_misc_lo region-different data, JP 0x081def84..0x081e0b90 (7180 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_misc_lo_018_1DEF84
frontier_df4_misc_lo_018_1DEF84:
	.incbin "graphics/frontier_df4_misc_lo/frontier_df4_misc_lo_018_1DEF84.bin"

	.section .data.frontier_df4_misc_lo.gap19, "a", %progbits
@ df4_misc_lo region-different data, JP 0x081e140c..0x081e1fac (2976 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_misc_lo_019_1E140C
frontier_df4_misc_lo_019_1E140C:
	.incbin "graphics/frontier_df4_misc_lo/frontier_df4_misc_lo_019_1E140C.bin"

	.section .data.frontier_df4_misc_lo.gap20, "a", %progbits
@ df4_misc_lo region-different data, JP 0x081ec9e0..0x081ee2d8 (6392 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_misc_lo_020_1EC9E0
frontier_df4_misc_lo_020_1EC9E0:
	.incbin "graphics/frontier_df4_misc_lo/frontier_df4_misc_lo_020_1EC9E0.bin"

	.section .data.frontier_df4_misc_lo.gap21, "a", %progbits
@ df4_misc_lo region-different data, JP 0x081f4f60..0x081f5784 (2084 B); long-tail data gap (no .text in window), byte-perfect incbin.
	.global frontier_df4_misc_lo_021_1F4F60
frontier_df4_misc_lo_021_1F4F60:
	.incbin "graphics/frontier_df4_misc_lo/frontier_df4_misc_lo_021_1F4F60.bin"
