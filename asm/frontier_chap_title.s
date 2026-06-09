@ chap_title: region-different data not reachable by the code-literal carver
@ (leaf assets are unnamed US symbols). Boundaries read live from the JP index table(s) 0x08a732c0[88]
@ in baserom.
@ Region [0x08a7e188, 0x08a92514); already-carved region-same
@ sub-assets are gap-subtracted, so only the uncarved blobs are emitted here.

	.section .data.frontier_chap_title.gap0, "a", %progbits
@ chap_title region-different data, JP 0x08a7e188..0x08a7e504 (892 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_chap_title_000_A7E188
frontier_chap_title_000_A7E188:
	.incbin "baserom.gba", 0xA7E188, 0x37C

	.section .data.frontier_chap_title.gap1, "a", %progbits
@ chap_title region-different data, JP 0x08a7e504..0x08a7e800 (764 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_chap_title_001_A7E504
frontier_chap_title_001_A7E504:
	.incbin "baserom.gba", 0xA7E504, 0x2FC

	.section .data.frontier_chap_title.gap2, "a", %progbits
@ chap_title region-different data, JP 0x08a7e800..0x08a7eb7c (892 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_chap_title_002_A7E800
frontier_chap_title_002_A7E800:
	.incbin "baserom.gba", 0xA7E800, 0x37C

	.section .data.frontier_chap_title.gap3, "a", %progbits
@ chap_title region-different data, JP 0x08a7eb7c..0x08a7ef88 (1036 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_chap_title_003_A7EB7C
frontier_chap_title_003_A7EB7C:
	.incbin "baserom.gba", 0xA7EB7C, 0x40C

	.section .data.frontier_chap_title.gap4, "a", %progbits
@ chap_title region-different data, JP 0x08a7ef88..0x08a7f360 (984 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_chap_title_004_A7EF88
frontier_chap_title_004_A7EF88:
	.incbin "baserom.gba", 0xA7EF88, 0x3D8

	.section .data.frontier_chap_title.gap5, "a", %progbits
@ chap_title region-different data, JP 0x08a7f360..0x08a7f754 (1012 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_chap_title_005_A7F360
frontier_chap_title_005_A7F360:
	.incbin "baserom.gba", 0xA7F360, 0x3F4

	.section .data.frontier_chap_title.gap6, "a", %progbits
@ chap_title region-different data, JP 0x08a7f754..0x08a7faa4 (848 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_chap_title_006_A7F754
frontier_chap_title_006_A7F754:
	.incbin "baserom.gba", 0xA7F754, 0x350

	.section .data.frontier_chap_title.gap7, "a", %progbits
@ chap_title region-different data, JP 0x08a7faa4..0x08a7fe84 (992 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_chap_title_007_A7FAA4
frontier_chap_title_007_A7FAA4:
	.incbin "baserom.gba", 0xA7FAA4, 0x3E0

	.section .data.frontier_chap_title.gap8, "a", %progbits
@ chap_title region-different data, JP 0x08a7fe84..0x08a8021c (920 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_chap_title_008_A7FE84
frontier_chap_title_008_A7FE84:
	.incbin "baserom.gba", 0xA7FE84, 0x398

	.section .data.frontier_chap_title.gap9, "a", %progbits
@ chap_title region-different data, JP 0x08a8021c..0x08a80584 (872 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_chap_title_009_A8021C
frontier_chap_title_009_A8021C:
	.incbin "baserom.gba", 0xA8021C, 0x368

	.section .data.frontier_chap_title.gap10, "a", %progbits
@ chap_title region-different data, JP 0x08a80584..0x08a808bc (824 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_chap_title_010_A80584
frontier_chap_title_010_A80584:
	.incbin "baserom.gba", 0xA80584, 0x338

	.section .data.frontier_chap_title.gap11, "a", %progbits
@ chap_title region-different data, JP 0x08a808bc..0x08a80ca0 (996 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_chap_title_011_A808BC
frontier_chap_title_011_A808BC:
	.incbin "baserom.gba", 0xA808BC, 0x3E4

	.section .data.frontier_chap_title.gap12, "a", %progbits
@ chap_title region-different data, JP 0x08a80ca0..0x08a81068 (968 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_chap_title_012_A80CA0
frontier_chap_title_012_A80CA0:
	.incbin "baserom.gba", 0xA80CA0, 0x3C8

	.section .data.frontier_chap_title.gap13, "a", %progbits
@ chap_title region-different data, JP 0x08a81068..0x08a813f8 (912 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_chap_title_013_A81068
frontier_chap_title_013_A81068:
	.incbin "baserom.gba", 0xA81068, 0x390

	.section .data.frontier_chap_title.gap14, "a", %progbits
@ chap_title region-different data, JP 0x08a813f8..0x08a81774 (892 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_chap_title_014_A813F8
frontier_chap_title_014_A813F8:
	.incbin "baserom.gba", 0xA813F8, 0x37C

	.section .data.frontier_chap_title.gap15, "a", %progbits
@ chap_title region-different data, JP 0x08a81774..0x08a81b1c (936 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_chap_title_015_A81774
frontier_chap_title_015_A81774:
	.incbin "baserom.gba", 0xA81774, 0x3A8

	.section .data.frontier_chap_title.gap16, "a", %progbits
@ chap_title region-different data, JP 0x08a81b1c..0x08a81f28 (1036 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_chap_title_016_A81B1C
frontier_chap_title_016_A81B1C:
	.incbin "baserom.gba", 0xA81B1C, 0x40C

	.section .data.frontier_chap_title.gap17, "a", %progbits
@ chap_title region-different data, JP 0x08a81f28..0x08a82294 (876 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_chap_title_017_A81F28
frontier_chap_title_017_A81F28:
	.incbin "baserom.gba", 0xA81F28, 0x36C

	.section .data.frontier_chap_title.gap18, "a", %progbits
@ chap_title region-different data, JP 0x08a82294..0x08a8258c (760 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_chap_title_018_A82294
frontier_chap_title_018_A82294:
	.incbin "baserom.gba", 0xA82294, 0x2F8

	.section .data.frontier_chap_title.gap19, "a", %progbits
@ chap_title region-different data, JP 0x08a8258c..0x08a829b4 (1064 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_chap_title_019_A8258C
frontier_chap_title_019_A8258C:
	.incbin "baserom.gba", 0xA8258C, 0x428

	.section .data.frontier_chap_title.gap20, "a", %progbits
@ chap_title region-different data, JP 0x08a829b4..0x08a82d58 (932 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_chap_title_020_A829B4
frontier_chap_title_020_A829B4:
	.incbin "baserom.gba", 0xA829B4, 0x3A4

	.section .data.frontier_chap_title.gap21, "a", %progbits
@ chap_title region-different data, JP 0x08a82d58..0x08a8306c (788 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_chap_title_021_A82D58
frontier_chap_title_021_A82D58:
	.incbin "baserom.gba", 0xA82D58, 0x314

	.section .data.frontier_chap_title.gap22, "a", %progbits
@ chap_title region-different data, JP 0x08a8306c..0x08a833d4 (872 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_chap_title_022_A8306C
frontier_chap_title_022_A8306C:
	.incbin "baserom.gba", 0xA8306C, 0x368

	.section .data.frontier_chap_title.gap23, "a", %progbits
@ chap_title region-different data, JP 0x08a833d4..0x08a8383c (1128 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_chap_title_023_A833D4
frontier_chap_title_023_A833D4:
	.incbin "baserom.gba", 0xA833D4, 0x468

	.section .data.frontier_chap_title.gap24, "a", %progbits
@ chap_title region-different data, JP 0x08a8383c..0x08a83c0c (976 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_chap_title_024_A8383C
frontier_chap_title_024_A8383C:
	.incbin "baserom.gba", 0xA8383C, 0x3D0

	.section .data.frontier_chap_title.gap25, "a", %progbits
@ chap_title region-different data, JP 0x08a83c0c..0x08a83f64 (856 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_chap_title_025_A83C0C
frontier_chap_title_025_A83C0C:
	.incbin "baserom.gba", 0xA83C0C, 0x358

	.section .data.frontier_chap_title.gap26, "a", %progbits
@ chap_title region-different data, JP 0x08a83f64..0x08a8436c (1032 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_chap_title_026_A83F64
frontier_chap_title_026_A83F64:
	.incbin "baserom.gba", 0xA83F64, 0x408

	.section .data.frontier_chap_title.gap27, "a", %progbits
@ chap_title region-different data, JP 0x08a8436c..0x08a84720 (948 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_chap_title_027_A8436C
frontier_chap_title_027_A8436C:
	.incbin "baserom.gba", 0xA8436C, 0x3B4

	.section .data.frontier_chap_title.gap28, "a", %progbits
@ chap_title region-different data, JP 0x08a84720..0x08a84b00 (992 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_chap_title_028_A84720
frontier_chap_title_028_A84720:
	.incbin "baserom.gba", 0xA84720, 0x3E0

	.section .data.frontier_chap_title.gap29, "a", %progbits
@ chap_title region-different data, JP 0x08a84bfc..0x08a84f64 (872 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_chap_title_029_A84BFC
frontier_chap_title_029_A84BFC:
	.incbin "baserom.gba", 0xA84BFC, 0x368

	.section .data.frontier_chap_title.gap30, "a", %progbits
@ chap_title region-different data, JP 0x08a84f64..0x08a852e8 (900 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_chap_title_030_A84F64
frontier_chap_title_030_A84F64:
	.incbin "baserom.gba", 0xA84F64, 0x384

	.section .data.frontier_chap_title.gap31, "a", %progbits
@ chap_title region-different data, JP 0x08a852e8..0x08a85670 (904 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_chap_title_031_A852E8
frontier_chap_title_031_A852E8:
	.incbin "baserom.gba", 0xA852E8, 0x388

	.section .data.frontier_chap_title.gap32, "a", %progbits
@ chap_title region-different data, JP 0x08a85670..0x08a859e4 (884 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_chap_title_032_A85670
frontier_chap_title_032_A85670:
	.incbin "baserom.gba", 0xA85670, 0x374

	.section .data.frontier_chap_title.gap33, "a", %progbits
@ chap_title region-different data, JP 0x08a859e4..0x08a85d6c (904 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_chap_title_033_A859E4
frontier_chap_title_033_A859E4:
	.incbin "baserom.gba", 0xA859E4, 0x388

	.section .data.frontier_chap_title.gap34, "a", %progbits
@ chap_title region-different data, JP 0x08a85d6c..0x08a860f4 (904 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_chap_title_034_A85D6C
frontier_chap_title_034_A85D6C:
	.incbin "baserom.gba", 0xA85D6C, 0x388

	.section .data.frontier_chap_title.gap35, "a", %progbits
@ chap_title region-different data, JP 0x08a860f4..0x08a86460 (876 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_chap_title_035_A860F4
frontier_chap_title_035_A860F4:
	.incbin "baserom.gba", 0xA860F4, 0x36C

	.section .data.frontier_chap_title.gap36, "a", %progbits
@ chap_title region-different data, JP 0x08a86460..0x08a867e4 (900 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_chap_title_036_A86460
frontier_chap_title_036_A86460:
	.incbin "baserom.gba", 0xA86460, 0x384

	.section .data.frontier_chap_title.gap37, "a", %progbits
@ chap_title region-different data, JP 0x08a867e4..0x08a86b60 (892 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_chap_title_037_A867E4
frontier_chap_title_037_A867E4:
	.incbin "baserom.gba", 0xA867E4, 0x37C

	.section .data.frontier_chap_title.gap38, "a", %progbits
@ chap_title region-different data, JP 0x08a86b60..0x08a86ef8 (920 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_chap_title_038_A86B60
frontier_chap_title_038_A86B60:
	.incbin "baserom.gba", 0xA86B60, 0x398

	.section .data.frontier_chap_title.gap39, "a", %progbits
@ chap_title region-different data, JP 0x08a86ef8..0x08a8729c (932 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_chap_title_039_A86EF8
frontier_chap_title_039_A86EF8:
	.incbin "baserom.gba", 0xA86EF8, 0x3A4

	.section .data.frontier_chap_title.gap40, "a", %progbits
@ chap_title region-different data, JP 0x08a8729c..0x08a8765c (960 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_chap_title_040_A8729C
frontier_chap_title_040_A8729C:
	.incbin "baserom.gba", 0xA8729C, 0x3C0

	.section .data.frontier_chap_title.gap41, "a", %progbits
@ chap_title region-different data, JP 0x08a8765c..0x08a87a14 (952 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_chap_title_041_A8765C
frontier_chap_title_041_A8765C:
	.incbin "baserom.gba", 0xA8765C, 0x3B8

	.section .data.frontier_chap_title.gap42, "a", %progbits
@ chap_title region-different data, JP 0x08a87a14..0x08a87dbc (936 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_chap_title_042_A87A14
frontier_chap_title_042_A87A14:
	.incbin "baserom.gba", 0xA87A14, 0x3A8

	.section .data.frontier_chap_title.gap43, "a", %progbits
@ chap_title region-different data, JP 0x08a87dbc..0x08a88174 (952 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_chap_title_043_A87DBC
frontier_chap_title_043_A87DBC:
	.incbin "baserom.gba", 0xA87DBC, 0x3B8

	.section .data.frontier_chap_title.gap44, "a", %progbits
@ chap_title region-different data, JP 0x08a88174..0x08a88530 (956 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_chap_title_044_A88174
frontier_chap_title_044_A88174:
	.incbin "baserom.gba", 0xA88174, 0x3BC

	.section .data.frontier_chap_title.gap45, "a", %progbits
@ chap_title region-different data, JP 0x08a88530..0x08a888d0 (928 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_chap_title_045_A88530
frontier_chap_title_045_A88530:
	.incbin "baserom.gba", 0xA88530, 0x3A0

	.section .data.frontier_chap_title.gap46, "a", %progbits
@ chap_title region-different data, JP 0x08a888d0..0x08a88c8c (956 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_chap_title_046_A888D0
frontier_chap_title_046_A888D0:
	.incbin "baserom.gba", 0xA888D0, 0x3BC

	.section .data.frontier_chap_title.gap47, "a", %progbits
@ chap_title region-different data, JP 0x08a88c8c..0x08a89048 (956 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_chap_title_047_A88C8C
frontier_chap_title_047_A88C8C:
	.incbin "baserom.gba", 0xA88C8C, 0x3BC

	.section .data.frontier_chap_title.gap48, "a", %progbits
@ chap_title region-different data, JP 0x08a89048..0x08a89428 (992 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_chap_title_048_A89048
frontier_chap_title_048_A89048:
	.incbin "baserom.gba", 0xA89048, 0x3E0

	.section .data.frontier_chap_title.gap49, "a", %progbits
@ chap_title region-different data, JP 0x08a89428..0x08a89710 (744 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_chap_title_049_A89428
frontier_chap_title_049_A89428:
	.incbin "baserom.gba", 0xA89428, 0x2E8

	.section .data.frontier_chap_title.gap50, "a", %progbits
@ chap_title region-different data, JP 0x08a89710..0x08a899e8 (728 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_chap_title_050_A89710
frontier_chap_title_050_A89710:
	.incbin "baserom.gba", 0xA89710, 0x2D8

	.section .data.frontier_chap_title.gap51, "a", %progbits
@ chap_title region-different data, JP 0x08a899e8..0x08a89cd8 (752 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_chap_title_051_A899E8
frontier_chap_title_051_A899E8:
	.incbin "baserom.gba", 0xA899E8, 0x2F0

	.section .data.frontier_chap_title.gap52, "a", %progbits
@ chap_title region-different data, JP 0x08a89cd8..0x08a89f80 (680 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_chap_title_052_A89CD8
frontier_chap_title_052_A89CD8:
	.incbin "baserom.gba", 0xA89CD8, 0x2A8

	.section .data.frontier_chap_title.gap53, "a", %progbits
@ chap_title region-different data, JP 0x08a89f80..0x08a8a260 (736 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_chap_title_053_A89F80
frontier_chap_title_053_A89F80:
	.incbin "baserom.gba", 0xA89F80, 0x2E0

	.section .data.frontier_chap_title.gap54, "a", %progbits
@ chap_title region-different data, JP 0x08a8a260..0x08a8a5a0 (832 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_chap_title_054_A8A260
frontier_chap_title_054_A8A260:
	.incbin "baserom.gba", 0xA8A260, 0x340

	.section .data.frontier_chap_title.gap55, "a", %progbits
@ chap_title region-different data, JP 0x08a8a5a0..0x08a8a85c (700 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_chap_title_055_A8A5A0
frontier_chap_title_055_A8A5A0:
	.incbin "baserom.gba", 0xA8A5A0, 0x2BC

	.section .data.frontier_chap_title.gap56, "a", %progbits
@ chap_title region-different data, JP 0x08a8a85c..0x08a8ab8c (816 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_chap_title_056_A8A85C
frontier_chap_title_056_A8A85C:
	.incbin "baserom.gba", 0xA8A85C, 0x330

	.section .data.frontier_chap_title.gap57, "a", %progbits
@ chap_title region-different data, JP 0x08a8ab8c..0x08a8ae74 (744 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_chap_title_057_A8AB8C
frontier_chap_title_057_A8AB8C:
	.incbin "baserom.gba", 0xA8AB8C, 0x2E8

	.section .data.frontier_chap_title.gap58, "a", %progbits
@ chap_title region-different data, JP 0x08a8ae74..0x08a8b168 (756 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_chap_title_058_A8AE74
frontier_chap_title_058_A8AE74:
	.incbin "baserom.gba", 0xA8AE74, 0x2F4

	.section .data.frontier_chap_title.gap59, "a", %progbits
@ chap_title region-different data, JP 0x08a8b168..0x08a8b39c (564 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_chap_title_059_A8B168
frontier_chap_title_059_A8B168:
	.incbin "baserom.gba", 0xA8B168, 0x234

	.section .data.frontier_chap_title.gap60, "a", %progbits
@ chap_title region-different data, JP 0x08a8b39c..0x08a8b5dc (576 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_chap_title_060_A8B39C
frontier_chap_title_060_A8B39C:
	.incbin "baserom.gba", 0xA8B39C, 0x240

	.section .data.frontier_chap_title.gap61, "a", %progbits
@ chap_title region-different data, JP 0x08a8b5dc..0x08a8b7f0 (532 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_chap_title_061_A8B5DC
frontier_chap_title_061_A8B5DC:
	.incbin "baserom.gba", 0xA8B5DC, 0x214

	.section .data.frontier_chap_title.gap62, "a", %progbits
@ chap_title region-different data, JP 0x08a8b7f0..0x08a8bb88 (920 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_chap_title_062_A8B7F0
frontier_chap_title_062_A8B7F0:
	.incbin "baserom.gba", 0xA8B7F0, 0x398

	.section .data.frontier_chap_title.gap63, "a", %progbits
@ chap_title region-different data, JP 0x08a8bb88..0x08a8bfb0 (1064 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_chap_title_063_A8BB88
frontier_chap_title_063_A8BB88:
	.incbin "baserom.gba", 0xA8BB88, 0x428

	.section .data.frontier_chap_title.gap64, "a", %progbits
@ chap_title region-different data, JP 0x08a8bfb0..0x08a8c0ec (316 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_chap_title_064_A8BFB0
frontier_chap_title_064_A8BFB0:
	.incbin "baserom.gba", 0xA8BFB0, 0x13C

	.section .data.frontier_chap_title.gap65, "a", %progbits
@ chap_title region-different data, JP 0x08a8c0ec..0x08a8c1e4 (248 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_chap_title_065_A8C0EC
frontier_chap_title_065_A8C0EC:
	.incbin "baserom.gba", 0xA8C0EC, 0xF8

	.section .data.frontier_chap_title.gap66, "a", %progbits
@ chap_title region-different data, JP 0x08a8c1e4..0x08a8c308 (292 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_chap_title_066_A8C1E4
frontier_chap_title_066_A8C1E4:
	.incbin "baserom.gba", 0xA8C1E4, 0x124

	.section .data.frontier_chap_title.gap67, "a", %progbits
@ chap_title region-different data, JP 0x08a8c308..0x08a8c424 (284 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_chap_title_067_A8C308
frontier_chap_title_067_A8C308:
	.incbin "baserom.gba", 0xA8C308, 0x11C

	.section .data.frontier_chap_title.gap68, "a", %progbits
@ chap_title region-different data, JP 0x08a8c424..0x08a8c534 (272 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_chap_title_068_A8C424
frontier_chap_title_068_A8C424:
	.incbin "baserom.gba", 0xA8C424, 0x110

	.section .data.frontier_chap_title.gap69, "a", %progbits
@ chap_title region-different data, JP 0x08a8c534..0x08a8c734 (512 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_chap_title_069_A8C534
frontier_chap_title_069_A8C534:
	.incbin "baserom.gba", 0xA8C534, 0x200

	.section .data.frontier_chap_title.gap70, "a", %progbits
@ chap_title region-different data, JP 0x08a8c734..0x08a8c854 (288 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_chap_title_070_A8C734
frontier_chap_title_070_A8C734:
	.incbin "baserom.gba", 0xA8C734, 0x120

	.section .data.frontier_chap_title.gap71, "a", %progbits
@ chap_title region-different data, JP 0x08a8c854..0x08a8c974 (288 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_chap_title_071_A8C854
frontier_chap_title_071_A8C854:
	.incbin "baserom.gba", 0xA8C854, 0x120

	.section .data.frontier_chap_title.gap72, "a", %progbits
@ chap_title region-different data, JP 0x08a8c974..0x08a8ca74 (256 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_chap_title_072_A8C974
frontier_chap_title_072_A8C974:
	.incbin "baserom.gba", 0xA8C974, 0x100

	.section .data.frontier_chap_title.gap73, "a", %progbits
@ chap_title region-different data, JP 0x08a8ca74..0x08a8cb94 (288 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_chap_title_073_A8CA74
frontier_chap_title_073_A8CA74:
	.incbin "baserom.gba", 0xA8CA74, 0x120

	.section .data.frontier_chap_title.gap74, "a", %progbits
@ chap_title region-different data, JP 0x08a8cb94..0x08a8ccac (280 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_chap_title_074_A8CB94
frontier_chap_title_074_A8CB94:
	.incbin "baserom.gba", 0xA8CB94, 0x118

	.section .data.frontier_chap_title.gap75, "a", %progbits
@ chap_title region-different data, JP 0x08a8ccac..0x08a8cdf8 (332 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_chap_title_075_A8CCAC
frontier_chap_title_075_A8CCAC:
	.incbin "baserom.gba", 0xA8CCAC, 0x14C

	.section .data.frontier_chap_title.gap76, "a", %progbits
@ chap_title region-different data, JP 0x08a8cdf8..0x08a8cf14 (284 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_chap_title_076_A8CDF8
frontier_chap_title_076_A8CDF8:
	.incbin "baserom.gba", 0xA8CDF8, 0x11C

	.section .data.frontier_chap_title.gap77, "a", %progbits
@ chap_title region-different data, JP 0x08a8cf14..0x08a8d064 (336 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_chap_title_077_A8CF14
frontier_chap_title_077_A8CF14:
	.incbin "baserom.gba", 0xA8CF14, 0x150

	.section .data.frontier_chap_title.gap78, "a", %progbits
@ chap_title region-different data, JP 0x08a8d064..0x08a8d1b0 (332 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_chap_title_078_A8D064
frontier_chap_title_078_A8D064:
	.incbin "baserom.gba", 0xA8D064, 0x14C

	.section .data.frontier_chap_title.gap79, "a", %progbits
@ chap_title region-different data, JP 0x08a8d1b0..0x08a8d2f4 (324 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_chap_title_079_A8D1B0
frontier_chap_title_079_A8D1B0:
	.incbin "baserom.gba", 0xA8D1B0, 0x144

	.section .data.frontier_chap_title.gap80, "a", %progbits
@ chap_title region-different data, JP 0x08a8d2f4..0x08a8d430 (316 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_chap_title_080_A8D2F4
frontier_chap_title_080_A8D2F4:
	.incbin "baserom.gba", 0xA8D2F4, 0x13C

	.section .data.frontier_chap_title.gap81, "a", %progbits
@ chap_title region-different data, JP 0x08a8d430..0x08a8d574 (324 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_chap_title_081_A8D430
frontier_chap_title_081_A8D430:
	.incbin "baserom.gba", 0xA8D430, 0x144

	.section .data.frontier_chap_title.gap82, "a", %progbits
@ chap_title region-different data, JP 0x08a8d574..0x08a8d6ac (312 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_chap_title_082_A8D574
frontier_chap_title_082_A8D574:
	.incbin "baserom.gba", 0xA8D574, 0x138

	.section .data.frontier_chap_title.gap83, "a", %progbits
@ chap_title region-different data, JP 0x08a8d6ac..0x08a8d7f4 (328 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_chap_title_083_A8D6AC
frontier_chap_title_083_A8D6AC:
	.incbin "baserom.gba", 0xA8D6AC, 0x148

	.section .data.frontier_chap_title.gap84, "a", %progbits
@ chap_title region-different data, JP 0x08a8d7f4..0x08a8d948 (340 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_chap_title_084_A8D7F4
frontier_chap_title_084_A8D7F4:
	.incbin "baserom.gba", 0xA8D7F4, 0x154

	.section .data.frontier_chap_title.gap85, "a", %progbits
@ chap_title region-different data, JP 0x08a8d948..0x08a8dab0 (360 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_chap_title_085_A8D948
frontier_chap_title_085_A8D948:
	.incbin "baserom.gba", 0xA8D948, 0x168

	.section .data.frontier_chap_title.gap86, "a", %progbits
@ chap_title region-different data, JP 0x08a8dab0..0x08a8dbfc (332 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_chap_title_086_A8DAB0
frontier_chap_title_086_A8DAB0:
	.incbin "baserom.gba", 0xA8DAB0, 0x14C

	.section .data.frontier_chap_title.gap87, "a", %progbits
@ chap_title region-different data, JP 0x08a8dbfc..0x08a8de6c (624 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_chap_title_087_A8DBFC
frontier_chap_title_087_A8DBFC:
	.incbin "baserom.gba", 0xA8DBFC, 0x270

	.section .data.frontier_chap_title.gap88, "a", %progbits
@ chap_title region-different data, JP 0x08a8de6c..0x08a8e080 (532 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_chap_title_088_A8DE6C
frontier_chap_title_088_A8DE6C:
	.incbin "baserom.gba", 0xA8DE6C, 0x214

	.section .data.frontier_chap_title.gap89, "a", %progbits
@ chap_title region-different data, JP 0x08a8e080..0x08a8e2ec (620 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_chap_title_089_A8E080
frontier_chap_title_089_A8E080:
	.incbin "baserom.gba", 0xA8E080, 0x26C

	.section .data.frontier_chap_title.gap90, "a", %progbits
@ chap_title region-different data, JP 0x08a8e2ec..0x08a8e600 (788 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_chap_title_090_A8E2EC
frontier_chap_title_090_A8E2EC:
	.incbin "baserom.gba", 0xA8E2EC, 0x314

	.section .data.frontier_chap_title.gap91, "a", %progbits
@ chap_title region-different data, JP 0x08a8e600..0x08a8e8c8 (712 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_chap_title_091_A8E600
frontier_chap_title_091_A8E600:
	.incbin "baserom.gba", 0xA8E600, 0x2C8

	.section .data.frontier_chap_title.gap92, "a", %progbits
@ chap_title region-different data, JP 0x08a8e8c8..0x08a8eaf8 (560 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_chap_title_092_A8E8C8
frontier_chap_title_092_A8E8C8:
	.incbin "baserom.gba", 0xA8E8C8, 0x230

	.section .data.frontier_chap_title.gap93, "a", %progbits
@ chap_title region-different data, JP 0x08a8eaf8..0x08a8ed30 (568 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_chap_title_093_A8EAF8
frontier_chap_title_093_A8EAF8:
	.incbin "baserom.gba", 0xA8EAF8, 0x238

	.section .data.frontier_chap_title.gap94, "a", %progbits
@ chap_title region-different data, JP 0x08a8ed30..0x08a8effc (716 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_chap_title_094_A8ED30
frontier_chap_title_094_A8ED30:
	.incbin "baserom.gba", 0xA8ED30, 0x2CC

	.section .data.frontier_chap_title.gap95, "a", %progbits
@ chap_title region-different data, JP 0x08a8effc..0x08a8f28c (656 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_chap_title_095_A8EFFC
frontier_chap_title_095_A8EFFC:
	.incbin "baserom.gba", 0xA8EFFC, 0x290

	.section .data.frontier_chap_title.gap96, "a", %progbits
@ chap_title region-different data, JP 0x08a8f28c..0x08a8f4cc (576 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_chap_title_096_A8F28C
frontier_chap_title_096_A8F28C:
	.incbin "baserom.gba", 0xA8F28C, 0x240

	.section .data.frontier_chap_title.gap97, "a", %progbits
@ chap_title region-different data, JP 0x08a8f4cc..0x08a8f6f8 (556 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_chap_title_097_A8F4CC
frontier_chap_title_097_A8F4CC:
	.incbin "baserom.gba", 0xA8F4CC, 0x22C

	.section .data.frontier_chap_title.gap98, "a", %progbits
@ chap_title region-different data, JP 0x08a8f6f8..0x08a8f9c0 (712 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_chap_title_098_A8F6F8
frontier_chap_title_098_A8F6F8:
	.incbin "baserom.gba", 0xA8F6F8, 0x2C8

	.section .data.frontier_chap_title.gap99, "a", %progbits
@ chap_title region-different data, JP 0x08a8f9c0..0x08a8fc68 (680 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_chap_title_099_A8F9C0
frontier_chap_title_099_A8F9C0:
	.incbin "baserom.gba", 0xA8F9C0, 0x2A8

	.section .data.frontier_chap_title.gap100, "a", %progbits
@ chap_title region-different data, JP 0x08a8fc68..0x08a8fec0 (600 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_chap_title_100_A8FC68
frontier_chap_title_100_A8FC68:
	.incbin "baserom.gba", 0xA8FC68, 0x258

	.section .data.frontier_chap_title.gap101, "a", %progbits
@ chap_title region-different data, JP 0x08a8fec0..0x08a900fc (572 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_chap_title_101_A8FEC0
frontier_chap_title_101_A8FEC0:
	.incbin "baserom.gba", 0xA8FEC0, 0x23C

	.section .data.frontier_chap_title.gap102, "a", %progbits
@ chap_title region-different data, JP 0x08a900fc..0x08a90378 (636 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_chap_title_102_A900FC
frontier_chap_title_102_A900FC:
	.incbin "baserom.gba", 0xA900FC, 0x27C

	.section .data.frontier_chap_title.gap103, "a", %progbits
@ chap_title region-different data, JP 0x08a90378..0x08a9065c (740 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_chap_title_103_A90378
frontier_chap_title_103_A90378:
	.incbin "baserom.gba", 0xA90378, 0x2E4

	.section .data.frontier_chap_title.gap104, "a", %progbits
@ chap_title region-different data, JP 0x08a9065c..0x08a90898 (572 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_chap_title_104_A9065C
frontier_chap_title_104_A9065C:
	.incbin "baserom.gba", 0xA9065C, 0x23C

	.section .data.frontier_chap_title.gap105, "a", %progbits
@ chap_title region-different data, JP 0x08a90898..0x08a90a98 (512 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_chap_title_105_A90898
frontier_chap_title_105_A90898:
	.incbin "baserom.gba", 0xA90898, 0x200

	.section .data.frontier_chap_title.gap106, "a", %progbits
@ chap_title region-different data, JP 0x08a90a98..0x08a90d84 (748 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_chap_title_106_A90A98
frontier_chap_title_106_A90A98:
	.incbin "baserom.gba", 0xA90A98, 0x2EC

	.section .data.frontier_chap_title.gap107, "a", %progbits
@ chap_title region-different data, JP 0x08a90d84..0x08a90ff0 (620 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_chap_title_107_A90D84
frontier_chap_title_107_A90D84:
	.incbin "baserom.gba", 0xA90D84, 0x26C

	.section .data.frontier_chap_title.gap108, "a", %progbits
@ chap_title region-different data, JP 0x08a90ff0..0x08a911d0 (480 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_chap_title_108_A90FF0
frontier_chap_title_108_A90FF0:
	.incbin "baserom.gba", 0xA90FF0, 0x1E0

	.section .data.frontier_chap_title.gap109, "a", %progbits
@ chap_title region-different data, JP 0x08a911d0..0x08a91418 (584 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_chap_title_109_A911D0
frontier_chap_title_109_A911D0:
	.incbin "baserom.gba", 0xA911D0, 0x248

	.section .data.frontier_chap_title.gap110, "a", %progbits
@ chap_title region-different data, JP 0x08a91418..0x08a91760 (840 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_chap_title_110_A91418
frontier_chap_title_110_A91418:
	.incbin "baserom.gba", 0xA91418, 0x348

	.section .data.frontier_chap_title.gap111, "a", %progbits
@ chap_title region-different data, JP 0x08a91760..0x08a919f8 (664 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_chap_title_111_A91760
frontier_chap_title_111_A91760:
	.incbin "baserom.gba", 0xA91760, 0x298

	.section .data.frontier_chap_title.gap112, "a", %progbits
@ chap_title region-different data, JP 0x08a919f8..0x08a91c28 (560 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_chap_title_112_A919F8
frontier_chap_title_112_A919F8:
	.incbin "baserom.gba", 0xA919F8, 0x230

	.section .data.frontier_chap_title.gap113, "a", %progbits
@ chap_title region-different data, JP 0x08a91c28..0x08a91f08 (736 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_chap_title_113_A91C28
frontier_chap_title_113_A91C28:
	.incbin "baserom.gba", 0xA91C28, 0x2E0

	.section .data.frontier_chap_title.gap114, "a", %progbits
@ chap_title region-different data, JP 0x08a91f08..0x08a92170 (616 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_chap_title_114_A91F08
frontier_chap_title_114_A91F08:
	.incbin "baserom.gba", 0xA91F08, 0x268

	.section .data.frontier_chap_title.gap115, "a", %progbits
@ chap_title region-different data, JP 0x08a92170..0x08a92514 (932 B); table-pinned (not code-named), byte-perfect incbin.
	.global frontier_chap_title_115_A92170
frontier_chap_title_115_A92170:
	.incbin "baserom.gba", 0xA92170, 0x3A4
