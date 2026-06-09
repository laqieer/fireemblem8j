@ banim_aurabg3: region-different data not reachable by the code-literal carver
@ (leaf assets are unnamed US symbols). Boundaries read live from the JP frame pointer arrays scanned in [0x08600000, 0x0877b000)
@ in baserom.
@ Region [0x0876e98c, 0x0877abf4); already-carved region-same
@ sub-assets are gap-subtracted, so only the uncarved blobs are emitted here.

	.section .data.frontier_banim_aurabg3.gap0, "a", %progbits
@ banim_aurabg3 region-different data, JP 0x0876e98c..0x0876fe78 (5356 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_banim_aurabg3_000_76E98C
frontier_banim_aurabg3_000_76E98C:
	.incbin "baserom.gba", 0x76E98C, 0x14EC

	.section .data.frontier_banim_aurabg3.gap1, "a", %progbits
@ banim_aurabg3 region-different data, JP 0x0876fe78..0x08771224 (5036 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_banim_aurabg3_001_76FE78
frontier_banim_aurabg3_001_76FE78:
	.incbin "baserom.gba", 0x76FE78, 0x13AC

	.section .data.frontier_banim_aurabg3.gap2, "a", %progbits
@ banim_aurabg3 region-different data, JP 0x08771224..0x087725d4 (5040 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_banim_aurabg3_002_771224
frontier_banim_aurabg3_002_771224:
	.incbin "baserom.gba", 0x771224, 0x13B0

	.section .data.frontier_banim_aurabg3.gap3, "a", %progbits
@ banim_aurabg3 region-different data, JP 0x087725d4..0x087738f0 (4892 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_banim_aurabg3_003_7725D4
frontier_banim_aurabg3_003_7725D4:
	.incbin "baserom.gba", 0x7725D4, 0x131C

	.section .data.frontier_banim_aurabg3.gap4, "a", %progbits
@ banim_aurabg3 region-different data, JP 0x087738f0..0x08774cb8 (5064 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_banim_aurabg3_004_7738F0
frontier_banim_aurabg3_004_7738F0:
	.incbin "baserom.gba", 0x7738F0, 0x13C8

	.section .data.frontier_banim_aurabg3.gap5, "a", %progbits
@ banim_aurabg3 region-different data, JP 0x08774cb8..0x08774f30 (632 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_banim_aurabg3_005_774CB8
frontier_banim_aurabg3_005_774CB8:
	.incbin "baserom.gba", 0x774CB8, 0x278

	.section .data.frontier_banim_aurabg3.gap6, "a", %progbits
@ banim_aurabg3 region-different data, JP 0x08774f30..0x087751a8 (632 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_banim_aurabg3_006_774F30
frontier_banim_aurabg3_006_774F30:
	.incbin "baserom.gba", 0x774F30, 0x278

	.section .data.frontier_banim_aurabg3.gap7, "a", %progbits
@ banim_aurabg3 region-different data, JP 0x087751a8..0x08775420 (632 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_banim_aurabg3_007_7751A8
frontier_banim_aurabg3_007_7751A8:
	.incbin "baserom.gba", 0x7751A8, 0x278

	.section .data.frontier_banim_aurabg3.gap8, "a", %progbits
@ banim_aurabg3 region-different data, JP 0x08775420..0x08775698 (632 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_banim_aurabg3_008_775420
frontier_banim_aurabg3_008_775420:
	.incbin "baserom.gba", 0x775420, 0x278

	.section .data.frontier_banim_aurabg3.gap9, "a", %progbits
@ banim_aurabg3 region-different data, JP 0x08775698..0x08775908 (624 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_banim_aurabg3_009_775698
frontier_banim_aurabg3_009_775698:
	.incbin "baserom.gba", 0x775698, 0x270

	.section .data.frontier_banim_aurabg3.gap10, "a", %progbits
@ banim_aurabg3 region-different data, JP 0x08775908..0x08775b64 (604 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_banim_aurabg3_010_775908
frontier_banim_aurabg3_010_775908:
	.incbin "baserom.gba", 0x775908, 0x25C

	.section .data.frontier_banim_aurabg3.gap11, "a", %progbits
@ banim_aurabg3 region-different data, JP 0x08775b64..0x08775ddc (632 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_banim_aurabg3_011_775B64
frontier_banim_aurabg3_011_775B64:
	.incbin "baserom.gba", 0x775B64, 0x278

	.section .data.frontier_banim_aurabg3.gap12, "a", %progbits
@ banim_aurabg3 region-different data, JP 0x08775ddc..0x08776054 (632 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_banim_aurabg3_012_775DDC
frontier_banim_aurabg3_012_775DDC:
	.incbin "baserom.gba", 0x775DDC, 0x278

	.section .data.frontier_banim_aurabg3.gap13, "a", %progbits
@ banim_aurabg3 region-different data, JP 0x08776054..0x087762cc (632 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_banim_aurabg3_013_776054
frontier_banim_aurabg3_013_776054:
	.incbin "baserom.gba", 0x776054, 0x278

	.section .data.frontier_banim_aurabg3.gap14, "a", %progbits
@ banim_aurabg3 region-different data, JP 0x087762cc..0x08776544 (632 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_banim_aurabg3_014_7762CC
frontier_banim_aurabg3_014_7762CC:
	.incbin "baserom.gba", 0x7762CC, 0x278

	.section .data.frontier_banim_aurabg3.gap15, "a", %progbits
@ banim_aurabg3 region-different data, JP 0x08776544..0x087767bc (632 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_banim_aurabg3_015_776544
frontier_banim_aurabg3_015_776544:
	.incbin "baserom.gba", 0x776544, 0x278

	.section .data.frontier_banim_aurabg3.gap16, "a", %progbits
@ banim_aurabg3 region-different data, JP 0x087767bc..0x08777118 (2396 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_banim_aurabg3_016_7767BC
frontier_banim_aurabg3_016_7767BC:
	.incbin "baserom.gba", 0x7767BC, 0x95C

	.section .data.frontier_banim_aurabg3.gap17, "a", %progbits
@ banim_aurabg3 region-different data, JP 0x08777118..0x087771b8 (160 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_banim_aurabg3_017_777118
frontier_banim_aurabg3_017_777118:
	.incbin "baserom.gba", 0x777118, 0xA0

	.section .data.frontier_banim_aurabg3.gap18, "a", %progbits
@ banim_aurabg3 region-different data, JP 0x087771b8..0x08777264 (172 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_banim_aurabg3_018_7771B8
frontier_banim_aurabg3_018_7771B8:
	.incbin "baserom.gba", 0x7771B8, 0xAC

	.section .data.frontier_banim_aurabg3.gap19, "a", %progbits
@ banim_aurabg3 region-different data, JP 0x08777264..0x08777308 (164 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_banim_aurabg3_019_777264
frontier_banim_aurabg3_019_777264:
	.incbin "baserom.gba", 0x777264, 0xA4

	.section .data.frontier_banim_aurabg3.gap20, "a", %progbits
@ banim_aurabg3 region-different data, JP 0x08777308..0x087773b4 (172 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_banim_aurabg3_020_777308
frontier_banim_aurabg3_020_777308:
	.incbin "baserom.gba", 0x777308, 0xAC

	.section .data.frontier_banim_aurabg3.gap21, "a", %progbits
@ banim_aurabg3 region-different data, JP 0x087773b4..0x08777468 (180 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_banim_aurabg3_021_7773B4
frontier_banim_aurabg3_021_7773B4:
	.incbin "baserom.gba", 0x7773B4, 0xB4

	.section .data.frontier_banim_aurabg3.gap22, "a", %progbits
@ banim_aurabg3 region-different data, JP 0x08777468..0x08777520 (184 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_banim_aurabg3_022_777468
frontier_banim_aurabg3_022_777468:
	.incbin "baserom.gba", 0x777468, 0xB8

	.section .data.frontier_banim_aurabg3.gap23, "a", %progbits
@ banim_aurabg3 region-different data, JP 0x08777520..0x087775cc (172 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_banim_aurabg3_023_777520
frontier_banim_aurabg3_023_777520:
	.incbin "baserom.gba", 0x777520, 0xAC

	.section .data.frontier_banim_aurabg3.gap24, "a", %progbits
@ banim_aurabg3 region-different data, JP 0x087775cc..0x08777674 (168 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_banim_aurabg3_024_7775CC
frontier_banim_aurabg3_024_7775CC:
	.incbin "baserom.gba", 0x7775CC, 0xA8

	.section .data.frontier_banim_aurabg3.gap25, "a", %progbits
@ banim_aurabg3 region-different data, JP 0x08777674..0x0877771c (168 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_banim_aurabg3_025_777674
frontier_banim_aurabg3_025_777674:
	.incbin "baserom.gba", 0x777674, 0xA8

	.section .data.frontier_banim_aurabg3.gap26, "a", %progbits
@ banim_aurabg3 region-different data, JP 0x0877771c..0x087777bc (160 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_banim_aurabg3_026_77771C
frontier_banim_aurabg3_026_77771C:
	.incbin "baserom.gba", 0x77771C, 0xA0

	.section .data.frontier_banim_aurabg3.gap27, "a", %progbits
@ banim_aurabg3 region-different data, JP 0x087777bc..0x08777858 (156 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_banim_aurabg3_027_7777BC
frontier_banim_aurabg3_027_7777BC:
	.incbin "baserom.gba", 0x7777BC, 0x9C

	.section .data.frontier_banim_aurabg3.gap28, "a", %progbits
@ banim_aurabg3 region-different data, JP 0x08777858..0x08779ab6 (8798 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_banim_aurabg3_028_777858
frontier_banim_aurabg3_028_777858:
	.incbin "baserom.gba", 0x777858, 0x225E

	.section .data.frontier_banim_aurabg3.gap29, "a", %progbits
@ banim_aurabg3 region-different data, JP 0x08779ab6..0x08779afe (72 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_banim_aurabg3_029_779AB6
frontier_banim_aurabg3_029_779AB6:
	.incbin "baserom.gba", 0x779AB6, 0x48

	.section .data.frontier_banim_aurabg3.gap30, "a", %progbits
@ banim_aurabg3 region-different data, JP 0x08779afe..0x08779b76 (120 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_banim_aurabg3_030_779AFE
frontier_banim_aurabg3_030_779AFE:
	.incbin "baserom.gba", 0x779AFE, 0x78

	.section .data.frontier_banim_aurabg3.gap31, "a", %progbits
@ banim_aurabg3 region-different data, JP 0x08779b76..0x08779c2a (180 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_banim_aurabg3_031_779B76
frontier_banim_aurabg3_031_779B76:
	.incbin "baserom.gba", 0x779B76, 0xB4

	.section .data.frontier_banim_aurabg3.gap32, "a", %progbits
@ banim_aurabg3 region-different data, JP 0x08779c2a..0x08779d56 (300 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_banim_aurabg3_032_779C2A
frontier_banim_aurabg3_032_779C2A:
	.incbin "baserom.gba", 0x779C2A, 0x12C

	.section .data.frontier_banim_aurabg3.gap33, "a", %progbits
@ banim_aurabg3 region-different data, JP 0x08779d56..0x08779ed6 (384 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_banim_aurabg3_033_779D56
frontier_banim_aurabg3_033_779D56:
	.incbin "baserom.gba", 0x779D56, 0x180

	.section .data.frontier_banim_aurabg3.gap34, "a", %progbits
@ banim_aurabg3 region-different data, JP 0x08779ed6..0x0877a2de (1032 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_banim_aurabg3_034_779ED6
frontier_banim_aurabg3_034_779ED6:
	.incbin "baserom.gba", 0x779ED6, 0x408

	.section .data.frontier_banim_aurabg3.gap35, "a", %progbits
@ banim_aurabg3 region-different data, JP 0x0877a2de..0x0877a34a (108 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_banim_aurabg3_035_77A2DE
frontier_banim_aurabg3_035_77A2DE:
	.incbin "baserom.gba", 0x77A2DE, 0x6C

	.section .data.frontier_banim_aurabg3.gap36, "a", %progbits
@ banim_aurabg3 region-different data, JP 0x0877a34a..0x0877a3b6 (108 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_banim_aurabg3_036_77A34A
frontier_banim_aurabg3_036_77A34A:
	.incbin "baserom.gba", 0x77A34A, 0x6C

	.section .data.frontier_banim_aurabg3.gap37, "a", %progbits
@ banim_aurabg3 region-different data, JP 0x0877a3b6..0x0877a422 (108 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_banim_aurabg3_037_77A3B6
frontier_banim_aurabg3_037_77A3B6:
	.incbin "baserom.gba", 0x77A3B6, 0x6C

	.section .data.frontier_banim_aurabg3.gap38, "a", %progbits
@ banim_aurabg3 region-different data, JP 0x0877a422..0x0877a48e (108 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_banim_aurabg3_038_77A422
frontier_banim_aurabg3_038_77A422:
	.incbin "baserom.gba", 0x77A422, 0x6C

	.section .data.frontier_banim_aurabg3.gap39, "a", %progbits
@ banim_aurabg3 region-different data, JP 0x0877a48e..0x0877a4fa (108 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_banim_aurabg3_039_77A48E
frontier_banim_aurabg3_039_77A48E:
	.incbin "baserom.gba", 0x77A48E, 0x6C

	.section .data.frontier_banim_aurabg3.gap40, "a", %progbits
@ banim_aurabg3 region-different data, JP 0x0877a4fa..0x0877a566 (108 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_banim_aurabg3_040_77A4FA
frontier_banim_aurabg3_040_77A4FA:
	.incbin "baserom.gba", 0x77A4FA, 0x6C

	.section .data.frontier_banim_aurabg3.gap41, "a", %progbits
@ banim_aurabg3 region-different data, JP 0x0877a566..0x0877a5d2 (108 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_banim_aurabg3_041_77A566
frontier_banim_aurabg3_041_77A566:
	.incbin "baserom.gba", 0x77A566, 0x6C

	.section .data.frontier_banim_aurabg3.gap42, "a", %progbits
@ banim_aurabg3 region-different data, JP 0x0877a5d2..0x0877a63e (108 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_banim_aurabg3_042_77A5D2
frontier_banim_aurabg3_042_77A5D2:
	.incbin "baserom.gba", 0x77A5D2, 0x6C

	.section .data.frontier_banim_aurabg3.gap43, "a", %progbits
@ banim_aurabg3 region-different data, JP 0x0877a63e..0x0877a6aa (108 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_banim_aurabg3_043_77A63E
frontier_banim_aurabg3_043_77A63E:
	.incbin "baserom.gba", 0x77A63E, 0x6C

	.section .data.frontier_banim_aurabg3.gap44, "a", %progbits
@ banim_aurabg3 region-different data, JP 0x0877a6aa..0x0877a6e6 (60 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_banim_aurabg3_044_77A6AA
frontier_banim_aurabg3_044_77A6AA:
	.incbin "baserom.gba", 0x77A6AA, 0x3C

	.section .data.frontier_banim_aurabg3.gap45, "a", %progbits
@ banim_aurabg3 region-different data, JP 0x0877a6e6..0x0877a752 (108 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_banim_aurabg3_045_77A6E6
frontier_banim_aurabg3_045_77A6E6:
	.incbin "baserom.gba", 0x77A6E6, 0x6C

	.section .data.frontier_banim_aurabg3.gap46, "a", %progbits
@ banim_aurabg3 region-different data, JP 0x0877a752..0x0877a7be (108 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_banim_aurabg3_046_77A752
frontier_banim_aurabg3_046_77A752:
	.incbin "baserom.gba", 0x77A752, 0x6C

	.section .data.frontier_banim_aurabg3.gap47, "a", %progbits
@ banim_aurabg3 region-different data, JP 0x0877a7be..0x0877a82a (108 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_banim_aurabg3_047_77A7BE
frontier_banim_aurabg3_047_77A7BE:
	.incbin "baserom.gba", 0x77A7BE, 0x6C

	.section .data.frontier_banim_aurabg3.gap48, "a", %progbits
@ banim_aurabg3 region-different data, JP 0x0877a82a..0x0877a896 (108 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_banim_aurabg3_048_77A82A
frontier_banim_aurabg3_048_77A82A:
	.incbin "baserom.gba", 0x77A82A, 0x6C

	.section .data.frontier_banim_aurabg3.gap49, "a", %progbits
@ banim_aurabg3 region-different data, JP 0x0877a896..0x0877a902 (108 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_banim_aurabg3_049_77A896
frontier_banim_aurabg3_049_77A896:
	.incbin "baserom.gba", 0x77A896, 0x6C

	.section .data.frontier_banim_aurabg3.gap50, "a", %progbits
@ banim_aurabg3 region-different data, JP 0x0877a902..0x0877a91a (24 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_banim_aurabg3_050_77A902
frontier_banim_aurabg3_050_77A902:
	.incbin "baserom.gba", 0x77A902, 0x18

	.section .data.frontier_banim_aurabg3.gap51, "a", %progbits
@ banim_aurabg3 region-different data, JP 0x0877a91a..0x0877a986 (108 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_banim_aurabg3_051_77A91A
frontier_banim_aurabg3_051_77A91A:
	.incbin "baserom.gba", 0x77A91A, 0x6C

	.section .data.frontier_banim_aurabg3.gap52, "a", %progbits
@ banim_aurabg3 region-different data, JP 0x0877a986..0x0877a9f2 (108 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_banim_aurabg3_052_77A986
frontier_banim_aurabg3_052_77A986:
	.incbin "baserom.gba", 0x77A986, 0x6C

	.section .data.frontier_banim_aurabg3.gap53, "a", %progbits
@ banim_aurabg3 region-different data, JP 0x0877a9f2..0x0877aa5e (108 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_banim_aurabg3_053_77A9F2
frontier_banim_aurabg3_053_77A9F2:
	.incbin "baserom.gba", 0x77A9F2, 0x6C

	.section .data.frontier_banim_aurabg3.gap54, "a", %progbits
@ banim_aurabg3 region-different data, JP 0x0877aa5e..0x0877aaca (108 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_banim_aurabg3_054_77AA5E
frontier_banim_aurabg3_054_77AA5E:
	.incbin "baserom.gba", 0x77AA5E, 0x6C

	.section .data.frontier_banim_aurabg3.gap55, "a", %progbits
@ banim_aurabg3 region-different data, JP 0x0877aaca..0x0877abf4 (298 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_banim_aurabg3_055_77AACA
frontier_banim_aurabg3_055_77AACA:
	.incbin "baserom.gba", 0x77AACA, 0x12A
