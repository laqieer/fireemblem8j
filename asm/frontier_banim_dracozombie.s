@ banim_dracozombie: region-different data not reachable by the code-literal carver
@ (leaf assets are unnamed US symbols). Boundaries read live from the JP frame pointer arrays scanned in [0x08000000, 0x09000000)
@ in baserom.
@ Region [0x0877bbb8, 0x087961e8); already-carved region-same
@ sub-assets are gap-subtracted, so only the uncarved blobs are emitted here.

	.section .data.frontier_banim_dracozombie.gap0, "a", %progbits
@ banim_dracozombie region-different data, JP 0x0877bbb8..0x0877bc6c (180 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_banim_dracozombie_000_77BBB8
frontier_banim_dracozombie_000_77BBB8:
	.incbin "baserom.gba", 0x77BBB8, 0xB4

	.section .data.frontier_banim_dracozombie.gap1, "a", %progbits
@ banim_dracozombie region-different data, JP 0x0877bc6c..0x0877ca18 (3500 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_banim_dracozombie_001_77BC6C
frontier_banim_dracozombie_001_77BC6C:
	.incbin "baserom.gba", 0x77BC6C, 0xDAC

	.section .data.frontier_banim_dracozombie.gap2, "a", %progbits
@ banim_dracozombie region-different data, JP 0x0877ca18..0x0877dbcc (4532 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_banim_dracozombie_002_77CA18
frontier_banim_dracozombie_002_77CA18:
	.incbin "baserom.gba", 0x77CA18, 0x11B4

	.section .data.frontier_banim_dracozombie.gap3, "a", %progbits
@ banim_dracozombie region-different data, JP 0x0877dbcc..0x0877eab4 (3816 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_banim_dracozombie_003_77DBCC
frontier_banim_dracozombie_003_77DBCC:
	.incbin "baserom.gba", 0x77DBCC, 0xEE8

	.section .data.frontier_banim_dracozombie.gap4, "a", %progbits
@ banim_dracozombie region-different data, JP 0x0877eab4..0x0877f654 (2976 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_banim_dracozombie_004_77EAB4
frontier_banim_dracozombie_004_77EAB4:
	.incbin "baserom.gba", 0x77EAB4, 0xBA0

	.section .data.frontier_banim_dracozombie.gap5, "a", %progbits
@ banim_dracozombie region-different data, JP 0x0877f654..0x0877f710 (188 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_banim_dracozombie_005_77F654
frontier_banim_dracozombie_005_77F654:
	.incbin "baserom.gba", 0x77F654, 0xBC

	.section .data.frontier_banim_dracozombie.gap6, "a", %progbits
@ banim_dracozombie region-different data, JP 0x0877f710..0x0877f7e8 (216 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_banim_dracozombie_006_77F710
frontier_banim_dracozombie_006_77F710:
	.incbin "baserom.gba", 0x77F710, 0xD8

	.section .data.frontier_banim_dracozombie.gap7, "a", %progbits
@ banim_dracozombie region-different data, JP 0x0877f7e8..0x0877f8e8 (256 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_banim_dracozombie_007_77F7E8
frontier_banim_dracozombie_007_77F7E8:
	.incbin "baserom.gba", 0x77F7E8, 0x100

	.section .data.frontier_banim_dracozombie.gap8, "a", %progbits
@ banim_dracozombie region-different data, JP 0x0877f8e8..0x0877fa14 (300 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_banim_dracozombie_008_77F8E8
frontier_banim_dracozombie_008_77F8E8:
	.incbin "baserom.gba", 0x77F8E8, 0x12C

	.section .data.frontier_banim_dracozombie.gap9, "a", %progbits
@ banim_dracozombie region-different data, JP 0x0877fa14..0x0877fb6c (344 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_banim_dracozombie_009_77FA14
frontier_banim_dracozombie_009_77FA14:
	.incbin "baserom.gba", 0x77FA14, 0x158

	.section .data.frontier_banim_dracozombie.gap10, "a", %progbits
@ banim_dracozombie region-different data, JP 0x0877fb6c..0x0877fce8 (380 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_banim_dracozombie_010_77FB6C
frontier_banim_dracozombie_010_77FB6C:
	.incbin "baserom.gba", 0x77FB6C, 0x17C

	.section .data.frontier_banim_dracozombie.gap11, "a", %progbits
@ banim_dracozombie region-different data, JP 0x0877fce8..0x0877fe64 (380 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_banim_dracozombie_011_77FCE8
frontier_banim_dracozombie_011_77FCE8:
	.incbin "baserom.gba", 0x77FCE8, 0x17C

	.section .data.frontier_banim_dracozombie.gap12, "a", %progbits
@ banim_dracozombie region-different data, JP 0x0877fe64..0x0877ffc4 (352 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_banim_dracozombie_012_77FE64
frontier_banim_dracozombie_012_77FE64:
	.incbin "baserom.gba", 0x77FE64, 0x160

	.section .data.frontier_banim_dracozombie.gap13, "a", %progbits
@ banim_dracozombie region-different data, JP 0x0877ffc4..0x08780114 (336 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_banim_dracozombie_013_77FFC4
frontier_banim_dracozombie_013_77FFC4:
	.incbin "baserom.gba", 0x77FFC4, 0x150

	.section .data.frontier_banim_dracozombie.gap14, "a", %progbits
@ banim_dracozombie region-different data, JP 0x08780114..0x08780250 (316 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_banim_dracozombie_014_780114
frontier_banim_dracozombie_014_780114:
	.incbin "baserom.gba", 0x780114, 0x13C

	.section .data.frontier_banim_dracozombie.gap15, "a", %progbits
@ banim_dracozombie region-different data, JP 0x08780250..0x08780378 (296 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_banim_dracozombie_015_780250
frontier_banim_dracozombie_015_780250:
	.incbin "baserom.gba", 0x780250, 0x128

	.section .data.frontier_banim_dracozombie.gap16, "a", %progbits
@ banim_dracozombie region-different data, JP 0x08780378..0x0878048c (276 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_banim_dracozombie_016_780378
frontier_banim_dracozombie_016_780378:
	.incbin "baserom.gba", 0x780378, 0x114

	.section .data.frontier_banim_dracozombie.gap17, "a", %progbits
@ banim_dracozombie region-different data, JP 0x0878048c..0x08781cbc (6192 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_banim_dracozombie_017_78048C
frontier_banim_dracozombie_017_78048C:
	.incbin "baserom.gba", 0x78048C, 0x1830

	.section .data.frontier_banim_dracozombie.gap18, "a", %progbits
@ banim_dracozombie region-different data, JP 0x08781cbc..0x087832b4 (5624 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_banim_dracozombie_018_781CBC
frontier_banim_dracozombie_018_781CBC:
	.incbin "baserom.gba", 0x781CBC, 0x15F8

	.section .data.frontier_banim_dracozombie.gap19, "a", %progbits
@ banim_dracozombie region-different data, JP 0x087832b4..0x087844f0 (4668 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_banim_dracozombie_019_7832B4
frontier_banim_dracozombie_019_7832B4:
	.incbin "baserom.gba", 0x7832B4, 0x123C

	.section .data.frontier_banim_dracozombie.gap20, "a", %progbits
@ banim_dracozombie region-different data, JP 0x087844f0..0x08785c08 (5912 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_banim_dracozombie_020_7844F0
frontier_banim_dracozombie_020_7844F0:
	.incbin "baserom.gba", 0x7844F0, 0x1718

	.section .data.frontier_banim_dracozombie.gap21, "a", %progbits
@ banim_dracozombie region-different data, JP 0x08785c08..0x087875a0 (6552 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_banim_dracozombie_021_785C08
frontier_banim_dracozombie_021_785C08:
	.incbin "baserom.gba", 0x785C08, 0x1998

	.section .data.frontier_banim_dracozombie.gap22, "a", %progbits
@ banim_dracozombie region-different data, JP 0x087875a0..0x08788cc4 (5924 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_banim_dracozombie_022_7875A0
frontier_banim_dracozombie_022_7875A0:
	.incbin "baserom.gba", 0x7875A0, 0x1724

	.section .data.frontier_banim_dracozombie.gap23, "a", %progbits
@ banim_dracozombie region-different data, JP 0x08788cc4..0x0878a0d0 (5132 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_banim_dracozombie_023_788CC4
frontier_banim_dracozombie_023_788CC4:
	.incbin "baserom.gba", 0x788CC4, 0x140C

	.section .data.frontier_banim_dracozombie.gap24, "a", %progbits
@ banim_dracozombie region-different data, JP 0x0878a0d0..0x0878af74 (3748 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_banim_dracozombie_024_78A0D0
frontier_banim_dracozombie_024_78A0D0:
	.incbin "baserom.gba", 0x78A0D0, 0xEA4

	.section .data.frontier_banim_dracozombie.gap25, "a", %progbits
@ banim_dracozombie region-different data, JP 0x0878af74..0x0878be1c (3752 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_banim_dracozombie_025_78AF74
frontier_banim_dracozombie_025_78AF74:
	.incbin "baserom.gba", 0x78AF74, 0xEA8

	.section .data.frontier_banim_dracozombie.gap26, "a", %progbits
@ banim_dracozombie region-different data, JP 0x0878be1c..0x0878cea8 (4236 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_banim_dracozombie_026_78BE1C
frontier_banim_dracozombie_026_78BE1C:
	.incbin "baserom.gba", 0x78BE1C, 0x108C

	.section .data.frontier_banim_dracozombie.gap27, "a", %progbits
@ banim_dracozombie region-different data, JP 0x0878cea8..0x0878d004 (348 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_banim_dracozombie_027_78CEA8
frontier_banim_dracozombie_027_78CEA8:
	.incbin "baserom.gba", 0x78CEA8, 0x15C

	.section .data.frontier_banim_dracozombie.gap28, "a", %progbits
@ banim_dracozombie region-different data, JP 0x0878d004..0x0878d354 (848 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_banim_dracozombie_028_78D004
frontier_banim_dracozombie_028_78D004:
	.incbin "baserom.gba", 0x78D004, 0x350

	.section .data.frontier_banim_dracozombie.gap29, "a", %progbits
@ banim_dracozombie region-different data, JP 0x0878d354..0x0878d6a4 (848 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_banim_dracozombie_029_78D354
frontier_banim_dracozombie_029_78D354:
	.incbin "baserom.gba", 0x78D354, 0x350

	.section .data.frontier_banim_dracozombie.gap30, "a", %progbits
@ banim_dracozombie region-different data, JP 0x0878d6a4..0x0878dab4 (1040 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_banim_dracozombie_030_78D6A4
frontier_banim_dracozombie_030_78D6A4:
	.incbin "baserom.gba", 0x78D6A4, 0x410

	.section .data.frontier_banim_dracozombie.gap31, "a", %progbits
@ banim_dracozombie region-different data, JP 0x0878dab4..0x0878df08 (1108 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_banim_dracozombie_031_78DAB4
frontier_banim_dracozombie_031_78DAB4:
	.incbin "baserom.gba", 0x78DAB4, 0x454

	.section .data.frontier_banim_dracozombie.gap32, "a", %progbits
@ banim_dracozombie region-different data, JP 0x0878df08..0x0878e33c (1076 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_banim_dracozombie_032_78DF08
frontier_banim_dracozombie_032_78DF08:
	.incbin "baserom.gba", 0x78DF08, 0x434

	.section .data.frontier_banim_dracozombie.gap33, "a", %progbits
@ banim_dracozombie region-different data, JP 0x0878e33c..0x0878e750 (1044 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_banim_dracozombie_033_78E33C
frontier_banim_dracozombie_033_78E33C:
	.incbin "baserom.gba", 0x78E33C, 0x414

	.section .data.frontier_banim_dracozombie.gap34, "a", %progbits
@ banim_dracozombie region-different data, JP 0x0878e750..0x0878eae0 (912 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_banim_dracozombie_034_78E750
frontier_banim_dracozombie_034_78E750:
	.incbin "baserom.gba", 0x78E750, 0x390

	.section .data.frontier_banim_dracozombie.gap35, "a", %progbits
@ banim_dracozombie region-different data, JP 0x0878eae0..0x0878ee00 (800 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_banim_dracozombie_035_78EAE0
frontier_banim_dracozombie_035_78EAE0:
	.incbin "baserom.gba", 0x78EAE0, 0x320

	.section .data.frontier_banim_dracozombie.gap36, "a", %progbits
@ banim_dracozombie region-different data, JP 0x0878ee00..0x08794964 (23396 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_banim_dracozombie_036_78EE00
frontier_banim_dracozombie_036_78EE00:
	.incbin "baserom.gba", 0x78EE00, 0x5B64

	.section .data.frontier_banim_dracozombie.gap37, "a", %progbits
@ banim_dracozombie region-different data, JP 0x08794964..0x08794d78 (1044 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_banim_dracozombie_037_794964
frontier_banim_dracozombie_037_794964:
	.incbin "baserom.gba", 0x794964, 0x414

	.section .data.frontier_banim_dracozombie.gap38, "a", %progbits
@ banim_dracozombie region-different data, JP 0x08794d78..0x08795198 (1056 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_banim_dracozombie_038_794D78
frontier_banim_dracozombie_038_794D78:
	.incbin "baserom.gba", 0x794D78, 0x420

	.section .data.frontier_banim_dracozombie.gap39, "a", %progbits
@ banim_dracozombie region-different data, JP 0x08795198..0x087955b8 (1056 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_banim_dracozombie_039_795198
frontier_banim_dracozombie_039_795198:
	.incbin "baserom.gba", 0x795198, 0x420

	.section .data.frontier_banim_dracozombie.gap40, "a", %progbits
@ banim_dracozombie region-different data, JP 0x087955b8..0x087961e8 (3120 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_banim_dracozombie_040_7955B8
frontier_banim_dracozombie_040_7955B8:
	.incbin "baserom.gba", 0x7955B8, 0xC30
