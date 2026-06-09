@ data_bg: region-different graphics blobs not reachable by the code-literal
@ carver (leaf assets are unnamed US symbols). Boundaries read live from the
@ JP index table(s) 0x089cd958[162], 0x089cdbe0[78] in baserom.
@ Region [0x08926b14, 0x089cd958); the small palette/map
@ sub-assets are already carved in the shared monolith, so only the big
@ LZ tile/gfx gaps are emitted here.

	.section .data.data_bg.gap0, "a", %progbits
@ data_bg asset bg_House_tiles: region-different graphics, JP 0x08926b14..0x0892a588 (14964 B); not code-named, table-pinned; byte-perfect incbin.
	.global gfx_data_bg_000_bg_House_tiles
gfx_data_bg_000_bg_House_tiles:
	.incbin "baserom.gba", 0x926B14, 0x3A74

	.section .data.data_bg.gap1, "a", %progbits
@ data_bg asset bg_House_map: region-different graphics, JP 0x0892a588..0x0892aa3c (1204 B); not code-named, table-pinned; byte-perfect incbin.
	.global gfx_data_bg_001_bg_House_map
gfx_data_bg_001_bg_House_map:
	.incbin "baserom.gba", 0x92A588, 0x4B4

	.section .data.data_bg.gap2, "a", %progbits
@ data_bg asset bg_Caer_Pelyn_tiles: region-different graphics, JP 0x0892ab3c..0x0892e924 (15848 B); not code-named, table-pinned; byte-perfect incbin.
	.global gfx_data_bg_002_bg_Caer_Pelyn_tiles
gfx_data_bg_002_bg_Caer_Pelyn_tiles:
	.incbin "baserom.gba", 0x92AB3C, 0x3DE8

	.section .data.data_bg.gap3, "a", %progbits
@ data_bg asset bg_Caer_Pelyn_map: region-different graphics, JP 0x0892e924..0x0892edd8 (1204 B); not code-named, table-pinned; byte-perfect incbin.
	.global gfx_data_bg_003_bg_Caer_Pelyn_map
gfx_data_bg_003_bg_Caer_Pelyn_map:
	.incbin "baserom.gba", 0x92E924, 0x4B4

	.section .data.data_bg.gap4, "a", %progbits
@ data_bg asset bg_Normal_Village_tiles: region-different graphics, JP 0x0892eed8..0x089323b0 (13528 B); not code-named, table-pinned; byte-perfect incbin.
	.global gfx_data_bg_004_bg_Normal_Village_tiles
gfx_data_bg_004_bg_Normal_Village_tiles:
	.incbin "baserom.gba", 0x92EED8, 0x34D8

	.section .data.data_bg.gap5, "a", %progbits
@ data_bg asset bg_Village_Clear_palette: region-different graphics, JP 0x08932964..0x08932a64 (256 B); not code-named, table-pinned; byte-perfect incbin.
	.global gfx_data_bg_005_bg_Village_Clear_palette
gfx_data_bg_005_bg_Village_Clear_palette:
	.incbin "baserom.gba", 0x932964, 0x100

	.section .data.data_bg.gap6, "a", %progbits
@ data_bg asset bg_Village_Clear_tiles: region-different graphics, JP 0x08932a64..0x08935d3c (13016 B); not code-named, table-pinned; byte-perfect incbin.
	.global gfx_data_bg_006_bg_Village_Clear_tiles
gfx_data_bg_006_bg_Village_Clear_tiles:
	.incbin "baserom.gba", 0x932A64, 0x32D8

	.section .data.data_bg.gap7, "a", %progbits
@ data_bg asset bg_Village_Clear_map: region-different graphics, JP 0x08935d3c..0x089361f0 (1204 B); not code-named, table-pinned; byte-perfect incbin.
	.global gfx_data_bg_007_bg_Village_Clear_map
gfx_data_bg_007_bg_Village_Clear_map:
	.incbin "baserom.gba", 0x935D3C, 0x4B4

	.section .data.data_bg.gap8, "a", %progbits
@ data_bg asset bg_Serafew_Village_palette: region-different graphics, JP 0x089362f0..0x089363f0 (256 B); not code-named, table-pinned; byte-perfect incbin.
	.global gfx_data_bg_008_bg_Serafew_Village_palette
gfx_data_bg_008_bg_Serafew_Village_palette:
	.incbin "baserom.gba", 0x9362F0, 0x100

	.section .data.data_bg.gap9, "a", %progbits
@ data_bg asset bg_Port_palette: region-different graphics, JP 0x089364f0..0x089365f0 (256 B); not code-named, table-pinned; byte-perfect incbin.
	.global gfx_data_bg_009_bg_Port_palette
gfx_data_bg_009_bg_Port_palette:
	.incbin "baserom.gba", 0x9364F0, 0x100

	.section .data.data_bg.gap10, "a", %progbits
@ data_bg asset bg_Ship_palette: region-different graphics, JP 0x089365f0..0x089366f0 (256 B); not code-named, table-pinned; byte-perfect incbin.
	.global gfx_data_bg_010_bg_Ship_palette
gfx_data_bg_010_bg_Ship_palette:
	.incbin "baserom.gba", 0x9365F0, 0x100

	.section .data.data_bg.gap11, "a", %progbits
@ data_bg asset bg_Fireplace_tiles: region-different graphics, JP 0x089366f0..0x08939c68 (13688 B); not code-named, table-pinned; byte-perfect incbin.
	.global gfx_data_bg_011_bg_Fireplace_tiles
gfx_data_bg_011_bg_Fireplace_tiles:
	.incbin "baserom.gba", 0x9366F0, 0x3578

	.section .data.data_bg.gap12, "a", %progbits
@ data_bg asset bg_Fireplace_map: region-different graphics, JP 0x08939c68..0x0893a11c (1204 B); not code-named, table-pinned; byte-perfect incbin.
	.global gfx_data_bg_012_bg_Fireplace_map
gfx_data_bg_012_bg_Fireplace_map:
	.incbin "baserom.gba", 0x939C68, 0x4B4

	.section .data.data_bg.gap13, "a", %progbits
@ data_bg asset bg_Fireplace_palette: region-different graphics, JP 0x0893a11c..0x0893a21c (256 B); not code-named, table-pinned; byte-perfect incbin.
	.global gfx_data_bg_013_bg_Fireplace_palette
gfx_data_bg_013_bg_Fireplace_palette:
	.incbin "baserom.gba", 0x93A11C, 0x100

	.section .data.data_bg.gap14, "a", %progbits
@ data_bg asset bg_Castle_Interior_tiles: region-different graphics, JP 0x0893a21c..0x0893e170 (16212 B); not code-named, table-pinned; byte-perfect incbin.
	.global gfx_data_bg_014_bg_Castle_Interior_tiles
gfx_data_bg_014_bg_Castle_Interior_tiles:
	.incbin "baserom.gba", 0x93A21C, 0x3F54

	.section .data.data_bg.gap15, "a", %progbits
@ data_bg asset bg_Castle_Interior_map: region-different graphics, JP 0x0893e170..0x0893e624 (1204 B); not code-named, table-pinned; byte-perfect incbin.
	.global gfx_data_bg_015_bg_Castle_Interior_map
gfx_data_bg_015_bg_Castle_Interior_map:
	.incbin "baserom.gba", 0x93E170, 0x4B4

	.section .data.data_bg.gap16, "a", %progbits
@ data_bg asset bg_Grado_Chamber_tiles: region-different graphics, JP 0x0893e824..0x08941264 (10816 B); not code-named, table-pinned; byte-perfect incbin.
	.global gfx_data_bg_016_bg_Grado_Chamber_tiles
gfx_data_bg_016_bg_Grado_Chamber_tiles:
	.incbin "baserom.gba", 0x93E824, 0x2A40

	.section .data.data_bg.gap17, "a", %progbits
@ data_bg asset bg_Grado_Chamber_tiles: region-different graphics, JP 0x08941818..0x08944a80 (12904 B); not code-named, table-pinned; byte-perfect incbin.
	.global gfx_data_bg_017_bg_Grado_Chamber_tiles
gfx_data_bg_017_bg_Grado_Chamber_tiles:
	.incbin "baserom.gba", 0x941818, 0x3268

	.section .data.data_bg.gap18, "a", %progbits
@ data_bg asset bg_Grado_Chamber_map: region-different graphics, JP 0x08944a80..0x08944f34 (1204 B); not code-named, table-pinned; byte-perfect incbin.
	.global gfx_data_bg_018_bg_Grado_Chamber_map
gfx_data_bg_018_bg_Grado_Chamber_map:
	.incbin "baserom.gba", 0x944A80, 0x4B4

	.section .data.data_bg.gap19, "a", %progbits
@ data_bg asset bg_Throne_Normal_tiles: region-different graphics, JP 0x08945034..0x0894810c (12504 B); not code-named, table-pinned; byte-perfect incbin.
	.global gfx_data_bg_019_bg_Throne_Normal_tiles
gfx_data_bg_019_bg_Throne_Normal_tiles:
	.incbin "baserom.gba", 0x945034, 0x30D8

	.section .data.data_bg.gap20, "a", %progbits
@ data_bg asset bg_Throne_Normal_map: region-different graphics, JP 0x0894810c..0x089485c0 (1204 B); not code-named, table-pinned; byte-perfect incbin.
	.global gfx_data_bg_020_bg_Throne_Normal_map
gfx_data_bg_020_bg_Throne_Normal_map:
	.incbin "baserom.gba", 0x94810C, 0x4B4

	.section .data.data_bg.gap21, "a", %progbits
@ data_bg asset bg_Throne_Normal_tiles: region-different graphics, JP 0x089486c0..0x0894b5e0 (12064 B); not code-named, table-pinned; byte-perfect incbin.
	.global gfx_data_bg_021_bg_Throne_Normal_tiles
gfx_data_bg_021_bg_Throne_Normal_tiles:
	.incbin "baserom.gba", 0x9486C0, 0x2F20

	.section .data.data_bg.gap22, "a", %progbits
@ data_bg asset bg_Throne_Normal_map: region-different graphics, JP 0x0894b5e0..0x0894ba94 (1204 B); not code-named, table-pinned; byte-perfect incbin.
	.global gfx_data_bg_022_bg_Throne_Normal_map
gfx_data_bg_022_bg_Throne_Normal_map:
	.incbin "baserom.gba", 0x94B5E0, 0x4B4

	.section .data.data_bg.gap23, "a", %progbits
@ data_bg asset bg_Castle_Bright_tiles: region-different graphics, JP 0x0894bc94..0x08950658 (18884 B); not code-named, table-pinned; byte-perfect incbin.
	.global gfx_data_bg_023_bg_Castle_Bright_tiles
gfx_data_bg_023_bg_Castle_Bright_tiles:
	.incbin "baserom.gba", 0x94BC94, 0x49C4

	.section .data.data_bg.gap24, "a", %progbits
@ data_bg asset bg_Castle_Bright_map: region-different graphics, JP 0x08950658..0x08950b0c (1204 B); not code-named, table-pinned; byte-perfect incbin.
	.global gfx_data_bg_024_bg_Castle_Bright_map
gfx_data_bg_024_bg_Castle_Bright_map:
	.incbin "baserom.gba", 0x950658, 0x4B4

	.section .data.data_bg.gap25, "a", %progbits
@ data_bg asset bg_Garden_tiles: region-different graphics, JP 0x08950d0c..0x0895479c (14992 B); not code-named, table-pinned; byte-perfect incbin.
	.global gfx_data_bg_025_bg_Garden_tiles
gfx_data_bg_025_bg_Garden_tiles:
	.incbin "baserom.gba", 0x950D0C, 0x3A90

	.section .data.data_bg.gap26, "a", %progbits
@ data_bg asset bg_Garden_map: region-different graphics, JP 0x0895479c..0x08954c50 (1204 B); not code-named, table-pinned; byte-perfect incbin.
	.global gfx_data_bg_026_bg_Garden_map
gfx_data_bg_026_bg_Garden_map:
	.incbin "baserom.gba", 0x95479C, 0x4B4

	.section .data.data_bg.gap27, "a", %progbits
@ data_bg asset bg_Manse_Back_tiles: region-different graphics, JP 0x08954e50..0x08957b7c (11564 B); not code-named, table-pinned; byte-perfect incbin.
	.global gfx_data_bg_027_bg_Manse_Back_tiles
gfx_data_bg_027_bg_Manse_Back_tiles:
	.incbin "baserom.gba", 0x954E50, 0x2D2C

	.section .data.data_bg.gap28, "a", %progbits
@ data_bg asset bg_Manse_Back_map: region-different graphics, JP 0x08957b7c..0x08958030 (1204 B); not code-named, table-pinned; byte-perfect incbin.
	.global gfx_data_bg_028_bg_Manse_Back_map
gfx_data_bg_028_bg_Manse_Back_map:
	.incbin "baserom.gba", 0x957B7C, 0x4B4

	.section .data.data_bg.gap29, "a", %progbits
@ data_bg asset bg_Cell_tiles: region-different graphics, JP 0x08958230..0x0895b068 (11832 B); not code-named, table-pinned; byte-perfect incbin.
	.global gfx_data_bg_029_bg_Cell_tiles
gfx_data_bg_029_bg_Cell_tiles:
	.incbin "baserom.gba", 0x958230, 0x2E38

	.section .data.data_bg.gap30, "a", %progbits
@ data_bg asset bg_Cell_map: region-different graphics, JP 0x0895b068..0x0895b51c (1204 B); not code-named, table-pinned; byte-perfect incbin.
	.global gfx_data_bg_030_bg_Cell_map
gfx_data_bg_030_bg_Cell_map:
	.incbin "baserom.gba", 0x95B068, 0x4B4

	.section .data.data_bg.gap31, "a", %progbits
@ data_bg asset bg_Plain_1_palette: region-different graphics, JP 0x0895b61c..0x0895b71c (256 B); not code-named, table-pinned; byte-perfect incbin.
	.global gfx_data_bg_031_bg_Plain_1_palette
gfx_data_bg_031_bg_Plain_1_palette:
	.incbin "baserom.gba", 0x95B61C, 0x100

	.section .data.data_bg.gap32, "a", %progbits
@ data_bg asset bg_Plain_1_tiles: region-different graphics, JP 0x0895b71c..0x0895f728 (16396 B); not code-named, table-pinned; byte-perfect incbin.
	.global gfx_data_bg_032_bg_Plain_1_tiles
gfx_data_bg_032_bg_Plain_1_tiles:
	.incbin "baserom.gba", 0x95B71C, 0x400C

	.section .data.data_bg.gap33, "a", %progbits
@ data_bg asset bg_Plain_1_map: region-different graphics, JP 0x0895f728..0x0895fbdc (1204 B); not code-named, table-pinned; byte-perfect incbin.
	.global gfx_data_bg_033_bg_Plain_1_map
gfx_data_bg_033_bg_Plain_1_map:
	.incbin "baserom.gba", 0x95F728, 0x4B4

	.section .data.data_bg.gap34, "a", %progbits
@ data_bg asset bg_Grass_Plains_2_tiles: region-different graphics, JP 0x0895fddc..0x08962f5c (12672 B); not code-named, table-pinned; byte-perfect incbin.
	.global gfx_data_bg_034_bg_Grass_Plains_2_tiles
gfx_data_bg_034_bg_Grass_Plains_2_tiles:
	.incbin "baserom.gba", 0x95FDDC, 0x3180

	.section .data.data_bg.gap35, "a", %progbits
@ data_bg asset bg_Grass_Plains_2_map: region-different graphics, JP 0x08962f5c..0x08963410 (1204 B); not code-named, table-pinned; byte-perfect incbin.
	.global gfx_data_bg_035_bg_Grass_Plains_2_map
gfx_data_bg_035_bg_Grass_Plains_2_map:
	.incbin "baserom.gba", 0x962F5C, 0x4B4

	.section .data.data_bg.gap36, "a", %progbits
@ data_bg asset bg_Plain_2_tiles: region-different graphics, JP 0x08963610..0x08965f54 (10564 B); not code-named, table-pinned; byte-perfect incbin.
	.global gfx_data_bg_036_bg_Plain_2_tiles
gfx_data_bg_036_bg_Plain_2_tiles:
	.incbin "baserom.gba", 0x963610, 0x2944

	.section .data.data_bg.gap37, "a", %progbits
@ data_bg asset bg_Plain_2_tiles: region-different graphics, JP 0x08966508..0x08968710 (8712 B); not code-named, table-pinned; byte-perfect incbin.
	.global gfx_data_bg_037_bg_Plain_2_tiles
gfx_data_bg_037_bg_Plain_2_tiles:
	.incbin "baserom.gba", 0x966508, 0x2208

	.section .data.data_bg.gap38, "a", %progbits
@ data_bg asset bg_Plain_2_Night_palette: region-different graphics, JP 0x08968dc4..0x08968ec4 (256 B); not code-named, table-pinned; byte-perfect incbin.
	.global gfx_data_bg_038_bg_Plain_2_Night_palette
gfx_data_bg_038_bg_Plain_2_Night_palette:
	.incbin "baserom.gba", 0x968DC4, 0x100

	.section .data.data_bg.gap39, "a", %progbits
@ data_bg asset bg_Stream_palette: region-different graphics, JP 0x08968ec4..0x08968fc4 (256 B); not code-named, table-pinned; byte-perfect incbin.
	.global gfx_data_bg_039_bg_Stream_palette
gfx_data_bg_039_bg_Stream_palette:
	.incbin "baserom.gba", 0x968EC4, 0x100

	.section .data.data_bg.gap40, "a", %progbits
@ data_bg asset bg_Forest_tiles: region-different graphics, JP 0x089690c4..0x0896b7a0 (9948 B); not code-named, table-pinned; byte-perfect incbin.
	.global gfx_data_bg_040_bg_Forest_tiles
gfx_data_bg_040_bg_Forest_tiles:
	.incbin "baserom.gba", 0x9690C4, 0x26DC

	.section .data.data_bg.gap41, "a", %progbits
@ data_bg asset bg_Town_tiles: region-different graphics, JP 0x0896bd54..0x0896da8c (7480 B); not code-named, table-pinned; byte-perfect incbin.
	.global gfx_data_bg_041_bg_Town_tiles
gfx_data_bg_041_bg_Town_tiles:
	.incbin "baserom.gba", 0x96BD54, 0x1D38

	.section .data.data_bg.gap42, "a", %progbits
@ data_bg asset bg_Castle_Back_tiles: region-different graphics, JP 0x0896e040..0x089715e4 (13732 B); not code-named, table-pinned; byte-perfect incbin.
	.global gfx_data_bg_042_bg_Castle_Back_tiles
gfx_data_bg_042_bg_Castle_Back_tiles:
	.incbin "baserom.gba", 0x96E040, 0x35A4

	.section .data.data_bg.gap43, "a", %progbits
@ data_bg asset bg_Interior_Black_palette: region-different graphics, JP 0x08971b98..0x08971c98 (256 B); not code-named, table-pinned; byte-perfect incbin.
	.global gfx_data_bg_043_bg_Interior_Black_palette
gfx_data_bg_043_bg_Interior_Black_palette:
	.incbin "baserom.gba", 0x971B98, 0x100

	.section .data.data_bg.gap44, "a", %progbits
@ data_bg asset bg_Passage_tiles: region-different graphics, JP 0x08971f98..0x08975060 (12488 B); not code-named, table-pinned; byte-perfect incbin.
	.global gfx_data_bg_044_bg_Passage_tiles
gfx_data_bg_044_bg_Passage_tiles:
	.incbin "baserom.gba", 0x971F98, 0x30C8

	.section .data.data_bg.gap45, "a", %progbits
@ data_bg asset bg_Passage_map: region-different graphics, JP 0x08975060..0x08975514 (1204 B); not code-named, table-pinned; byte-perfect incbin.
	.global gfx_data_bg_045_bg_Passage_map
gfx_data_bg_045_bg_Passage_map:
	.incbin "baserom.gba", 0x975060, 0x4B4

	.section .data.data_bg.gap46, "a", %progbits
@ data_bg asset bg_Passage_palette: region-different graphics, JP 0x08975514..0x08975614 (256 B); not code-named, table-pinned; byte-perfect incbin.
	.global gfx_data_bg_046_bg_Passage_palette
gfx_data_bg_046_bg_Passage_palette:
	.incbin "baserom.gba", 0x975514, 0x100

	.section .data.data_bg.gap47, "a", %progbits
@ data_bg asset bg_Burning_Castle_palette: region-different graphics, JP 0x08975614..0x08975714 (256 B); not code-named, table-pinned; byte-perfect incbin.
	.global gfx_data_bg_047_bg_Burning_Castle_palette
gfx_data_bg_047_bg_Burning_Castle_palette:
	.incbin "baserom.gba", 0x975614, 0x100

	.section .data.data_bg.gap48, "a", %progbits
@ data_bg asset bg_Stone_Chamber_tiles: region-different graphics, JP 0x08975714..0x08977d10 (9724 B); not code-named, table-pinned; byte-perfect incbin.
	.global gfx_data_bg_048_bg_Stone_Chamber_tiles
gfx_data_bg_048_bg_Stone_Chamber_tiles:
	.incbin "baserom.gba", 0x975714, 0x25FC

	.section .data.data_bg.gap49, "a", %progbits
@ data_bg asset bg_Stone_Chamber_tiles: region-different graphics, JP 0x089782c4..0x0897c73c (17528 B); not code-named, table-pinned; byte-perfect incbin.
	.global gfx_data_bg_049_bg_Stone_Chamber_tiles
gfx_data_bg_049_bg_Stone_Chamber_tiles:
	.incbin "baserom.gba", 0x9782C4, 0x4478

	.section .data.data_bg.gap50, "a", %progbits
@ data_bg asset bg_Stone_Chamber_map: region-different graphics, JP 0x0897c73c..0x0897cbf0 (1204 B); not code-named, table-pinned; byte-perfect incbin.
	.global gfx_data_bg_050_bg_Stone_Chamber_map
gfx_data_bg_050_bg_Stone_Chamber_map:
	.incbin "baserom.gba", 0x97C73C, 0x4B4

	.section .data.data_bg.gap51, "a", %progbits
@ data_bg asset bg_Renais_Chamber_tiles: region-different graphics, JP 0x0897ccf0..0x08981c10 (20256 B); not code-named, table-pinned; byte-perfect incbin.
	.global gfx_data_bg_051_bg_Renais_Chamber_tiles
gfx_data_bg_051_bg_Renais_Chamber_tiles:
	.incbin "baserom.gba", 0x97CCF0, 0x4F20

	.section .data.data_bg.gap52, "a", %progbits
@ data_bg asset bg_Renais_Chamber_map: region-different graphics, JP 0x08981c10..0x089820c4 (1204 B); not code-named, table-pinned; byte-perfect incbin.
	.global gfx_data_bg_052_bg_Renais_Chamber_map
gfx_data_bg_052_bg_Renais_Chamber_map:
	.incbin "baserom.gba", 0x981C10, 0x4B4

	.section .data.data_bg.gap53, "a", %progbits
@ data_bg asset bg_White_Chamber_tiles: region-different graphics, JP 0x089821c4..0x08985f28 (15716 B); not code-named, table-pinned; byte-perfect incbin.
	.global gfx_data_bg_053_bg_White_Chamber_tiles
gfx_data_bg_053_bg_White_Chamber_tiles:
	.incbin "baserom.gba", 0x9821C4, 0x3D64

	.section .data.data_bg.gap54, "a", %progbits
@ data_bg asset bg_White_Chamber_map: region-different graphics, JP 0x08985f28..0x089863dc (1204 B); not code-named, table-pinned; byte-perfect incbin.
	.global gfx_data_bg_054_bg_White_Chamber_map
gfx_data_bg_054_bg_White_Chamber_map:
	.incbin "baserom.gba", 0x985F28, 0x4B4

	.section .data.data_bg.gap55, "a", %progbits
@ data_bg asset bg_Desert_palette: region-different graphics, JP 0x089864dc..0x089865dc (256 B); not code-named, table-pinned; byte-perfect incbin.
	.global gfx_data_bg_055_bg_Desert_palette
gfx_data_bg_055_bg_Desert_palette:
	.incbin "baserom.gba", 0x9864DC, 0x100

	.section .data.data_bg.gap56, "a", %progbits
@ data_bg asset bg_Darkling_Woods_palette: region-different graphics, JP 0x089865dc..0x089866dc (256 B); not code-named, table-pinned; byte-perfect incbin.
	.global gfx_data_bg_056_bg_Darkling_Woods_palette
gfx_data_bg_056_bg_Darkling_Woods_palette:
	.incbin "baserom.gba", 0x9865DC, 0x100

	.section .data.data_bg.gap57, "a", %progbits
@ data_bg asset bg_Volcano_palette: region-different graphics, JP 0x089866dc..0x089867dc (256 B); not code-named, table-pinned; byte-perfect incbin.
	.global gfx_data_bg_057_bg_Volcano_palette
gfx_data_bg_057_bg_Volcano_palette:
	.incbin "baserom.gba", 0x9866DC, 0x100

	.section .data.data_bg.gap58, "a", %progbits
@ data_bg asset bg_Black_Temple_Outside_tiles: region-different graphics, JP 0x089867dc..0x08989eac (14032 B); not code-named, table-pinned; byte-perfect incbin.
	.global gfx_data_bg_058_bg_Black_Temple_Outside_tiles
gfx_data_bg_058_bg_Black_Temple_Outside_tiles:
	.incbin "baserom.gba", 0x9867DC, 0x36D0

	.section .data.data_bg.gap59, "a", %progbits
@ data_bg asset bg_Black_Temple_Outside_map: region-different graphics, JP 0x08989eac..0x0898a360 (1204 B); not code-named, table-pinned; byte-perfect incbin.
	.global gfx_data_bg_059_bg_Black_Temple_Outside_map
gfx_data_bg_059_bg_Black_Temple_Outside_map:
	.incbin "baserom.gba", 0x989EAC, 0x4B4

	.section .data.data_bg.gap60, "a", %progbits
@ data_bg asset bg_Black_Temple_Inside_tiles: region-different graphics, JP 0x0898a460..0x0898db34 (14036 B); not code-named, table-pinned; byte-perfect incbin.
	.global gfx_data_bg_060_bg_Black_Temple_Inside_tiles
gfx_data_bg_060_bg_Black_Temple_Inside_tiles:
	.incbin "baserom.gba", 0x98A460, 0x36D4

	.section .data.data_bg.gap61, "a", %progbits
@ data_bg asset bg_Black_Temple_Inside_map: region-different graphics, JP 0x0898db34..0x0898dfe8 (1204 B); not code-named, table-pinned; byte-perfect incbin.
	.global gfx_data_bg_061_bg_Black_Temple_Inside_map
gfx_data_bg_061_bg_Black_Temple_Inside_map:
	.incbin "baserom.gba", 0x98DB34, 0x4B4

	.section .data.data_bg.gap62, "a", %progbits
@ data_bg asset bg_Black_Temple_Inside_palette: region-different graphics, JP 0x0898dfe8..0x0898e0e8 (256 B); not code-named, table-pinned; byte-perfect incbin.
	.global gfx_data_bg_062_bg_Black_Temple_Inside_palette
gfx_data_bg_062_bg_Black_Temple_Inside_palette:
	.incbin "baserom.gba", 0x98DFE8, 0x100

	.section .data.data_bg.gap63, "a", %progbits
@ data_bg asset bg_Blank_palette: region-different graphics, JP 0x0898e0e8..0x0898e1e8 (256 B); not code-named, table-pinned; byte-perfect incbin.
	.global gfx_data_bg_063_bg_Blank_palette
gfx_data_bg_063_bg_Blank_palette:
	.incbin "baserom.gba", 0x98E0E8, 0x100

	.section .data.data_bg.gap64, "a", %progbits
@ data_bg asset bg_convo2_00_tiles: region-different graphics, JP 0x0898e1e8..0x089910b0 (11976 B); not code-named, table-pinned; byte-perfect incbin.
	.global gfx_data_bg_064_bg_convo2_00_tiles
gfx_data_bg_064_bg_convo2_00_tiles:
	.incbin "baserom.gba", 0x98E1E8, 0x2EC8

	.section .data.data_bg.gap65, "a", %progbits
@ data_bg asset bg_convo2_00_map: region-different graphics, JP 0x089910b0..0x08991564 (1204 B); not code-named, table-pinned; byte-perfect incbin.
	.global gfx_data_bg_065_bg_convo2_00_map
gfx_data_bg_065_bg_convo2_00_map:
	.incbin "baserom.gba", 0x9910B0, 0x4B4

	.section .data.data_bg.gap66, "a", %progbits
@ data_bg asset bg_convo2_00_palette: region-different graphics, JP 0x08991564..0x08991664 (256 B); not code-named, table-pinned; byte-perfect incbin.
	.global gfx_data_bg_066_bg_convo2_00_palette
gfx_data_bg_066_bg_convo2_00_palette:
	.incbin "baserom.gba", 0x991564, 0x100

	.section .data.data_bg.gap67, "a", %progbits
@ data_bg asset bg_convo2_01_palette: region-different graphics, JP 0x08991664..0x08991764 (256 B); not code-named, table-pinned; byte-perfect incbin.
	.global gfx_data_bg_067_bg_convo2_01_palette
gfx_data_bg_067_bg_convo2_01_palette:
	.incbin "baserom.gba", 0x991664, 0x100

	.section .data.data_bg.gap68, "a", %progbits
@ data_bg asset bg_convo2_02_palette: region-different graphics, JP 0x08991764..0x08991864 (256 B); not code-named, table-pinned; byte-perfect incbin.
	.global gfx_data_bg_068_bg_convo2_02_palette
gfx_data_bg_068_bg_convo2_02_palette:
	.incbin "baserom.gba", 0x991764, 0x100

	.section .data.data_bg.gap69, "a", %progbits
@ data_bg asset bg_convo2_03_tiles: region-different graphics, JP 0x08991864..0x089948d0 (12396 B); not code-named, table-pinned; byte-perfect incbin.
	.global gfx_data_bg_069_bg_convo2_03_tiles
gfx_data_bg_069_bg_convo2_03_tiles:
	.incbin "baserom.gba", 0x991864, 0x306C

	.section .data.data_bg.gap70, "a", %progbits
@ data_bg asset bg_convo2_03_map: region-different graphics, JP 0x089948d0..0x08994d84 (1204 B); not code-named, table-pinned; byte-perfect incbin.
	.global gfx_data_bg_070_bg_convo2_03_map
gfx_data_bg_070_bg_convo2_03_map:
	.incbin "baserom.gba", 0x9948D0, 0x4B4

	.section .data.data_bg.gap71, "a", %progbits
@ data_bg asset bg_convo2_04_palette: region-different graphics, JP 0x08994e84..0x08994f84 (256 B); not code-named, table-pinned; byte-perfect incbin.
	.global gfx_data_bg_071_bg_convo2_04_palette
gfx_data_bg_071_bg_convo2_04_palette:
	.incbin "baserom.gba", 0x994E84, 0x100

	.section .data.data_bg.gap72, "a", %progbits
@ data_bg asset bg_convo2_06_tiles: region-different graphics, JP 0x08995084..0x08998e80 (15868 B); not code-named, table-pinned; byte-perfect incbin.
	.global gfx_data_bg_072_bg_convo2_06_tiles
gfx_data_bg_072_bg_convo2_06_tiles:
	.incbin "baserom.gba", 0x995084, 0x3DFC

	.section .data.data_bg.gap73, "a", %progbits
@ data_bg asset bg_convo2_07_palette: region-different graphics, JP 0x08999434..0x08999534 (256 B); not code-named, table-pinned; byte-perfect incbin.
	.global gfx_data_bg_073_bg_convo2_07_palette
gfx_data_bg_073_bg_convo2_07_palette:
	.incbin "baserom.gba", 0x999434, 0x100

	.section .data.data_bg.gap74, "a", %progbits
@ data_bg asset bg_convo2_08_tiles: region-different graphics, JP 0x08999534..0x0899dcdc (18344 B); not code-named, table-pinned; byte-perfect incbin.
	.global gfx_data_bg_074_bg_convo2_08_tiles
gfx_data_bg_074_bg_convo2_08_tiles:
	.incbin "baserom.gba", 0x999534, 0x47A8

	.section .data.data_bg.gap75, "a", %progbits
@ data_bg asset bg_convo2_08_map: region-different graphics, JP 0x0899dcdc..0x0899e190 (1204 B); not code-named, table-pinned; byte-perfect incbin.
	.global gfx_data_bg_075_bg_convo2_08_map
gfx_data_bg_075_bg_convo2_08_map:
	.incbin "baserom.gba", 0x99DCDC, 0x4B4

	.section .data.data_bg.gap76, "a", %progbits
@ data_bg asset bg_convo2_09_tiles: region-different graphics, JP 0x0899e290..0x089a2c5c (18892 B); not code-named, table-pinned; byte-perfect incbin.
	.global gfx_data_bg_076_bg_convo2_09_tiles
gfx_data_bg_076_bg_convo2_09_tiles:
	.incbin "baserom.gba", 0x99E290, 0x49CC

	.section .data.data_bg.gap77, "a", %progbits
@ data_bg asset bg_convo2_09_map: region-different graphics, JP 0x089a2c5c..0x089a3110 (1204 B); not code-named, table-pinned; byte-perfect incbin.
	.global gfx_data_bg_077_bg_convo2_09_map
gfx_data_bg_077_bg_convo2_09_map:
	.incbin "baserom.gba", 0x9A2C5C, 0x4B4

	.section .data.data_bg.gap78, "a", %progbits
@ data_bg asset bg_convo2_10_palette: region-different graphics, JP 0x089a3210..0x089a3310 (256 B); not code-named, table-pinned; byte-perfect incbin.
	.global gfx_data_bg_078_bg_convo2_10_palette
gfx_data_bg_078_bg_convo2_10_palette:
	.incbin "baserom.gba", 0x9A3210, 0x100

	.section .data.data_bg.gap79, "a", %progbits
@ data_bg asset bg_convo2_11_palette: region-different graphics, JP 0x089a3310..0x089a3410 (256 B); not code-named, table-pinned; byte-perfect incbin.
	.global gfx_data_bg_079_bg_convo2_11_palette
gfx_data_bg_079_bg_convo2_11_palette:
	.incbin "baserom.gba", 0x9A3310, 0x100

	.section .data.data_bg.gap80, "a", %progbits
@ data_bg asset bg_convo2_12_tiles: region-different graphics, JP 0x089a3410..0x089a8260 (20048 B); not code-named, table-pinned; byte-perfect incbin.
	.global gfx_data_bg_080_bg_convo2_12_tiles
gfx_data_bg_080_bg_convo2_12_tiles:
	.incbin "baserom.gba", 0x9A3410, 0x4E50

	.section .data.data_bg.gap81, "a", %progbits
@ data_bg asset bg_convo2_12_map: region-different graphics, JP 0x089a8260..0x089a8714 (1204 B); not code-named, table-pinned; byte-perfect incbin.
	.global gfx_data_bg_081_bg_convo2_12_map
gfx_data_bg_081_bg_convo2_12_map:
	.incbin "baserom.gba", 0x9A8260, 0x4B4

	.section .data.data_bg.gap82, "a", %progbits
@ data_bg asset bg_convo2_13_tiles: region-different graphics, JP 0x089a8814..0x089ad780 (20332 B); not code-named, table-pinned; byte-perfect incbin.
	.global gfx_data_bg_082_bg_convo2_13_tiles
gfx_data_bg_082_bg_convo2_13_tiles:
	.incbin "baserom.gba", 0x9A8814, 0x4F6C

	.section .data.data_bg.gap83, "a", %progbits
@ data_bg asset bg_convo2_13_map: region-different graphics, JP 0x089ad780..0x089adc34 (1204 B); not code-named, table-pinned; byte-perfect incbin.
	.global gfx_data_bg_083_bg_convo2_13_map
gfx_data_bg_083_bg_convo2_13_map:
	.incbin "baserom.gba", 0x9AD780, 0x4B4

	.section .data.data_bg.gap84, "a", %progbits
@ data_bg asset bg_convo2_15_tiles: region-different graphics, JP 0x089ade34..0x089b1474 (13888 B); not code-named, table-pinned; byte-perfect incbin.
	.global gfx_data_bg_084_bg_convo2_15_tiles
gfx_data_bg_084_bg_convo2_15_tiles:
	.incbin "baserom.gba", 0x9ADE34, 0x3640

	.section .data.data_bg.gap85, "a", %progbits
@ data_bg asset bg_convo2_15_map: region-different graphics, JP 0x089b1474..0x089b1928 (1204 B); not code-named, table-pinned; byte-perfect incbin.
	.global gfx_data_bg_085_bg_convo2_15_map
gfx_data_bg_085_bg_convo2_15_map:
	.incbin "baserom.gba", 0x9B1474, 0x4B4

	.section .data.data_bg.gap86, "a", %progbits
@ data_bg asset bg_convo2_16_tiles: region-different graphics, JP 0x089b1a28..0x089b5e4c (17444 B); not code-named, table-pinned; byte-perfect incbin.
	.global gfx_data_bg_086_bg_convo2_16_tiles
gfx_data_bg_086_bg_convo2_16_tiles:
	.incbin "baserom.gba", 0x9B1A28, 0x4424

	.section .data.data_bg.gap87, "a", %progbits
@ data_bg asset bg_convo2_16_map: region-different graphics, JP 0x089b5e4c..0x089b6300 (1204 B); not code-named, table-pinned; byte-perfect incbin.
	.global gfx_data_bg_087_bg_convo2_16_map
gfx_data_bg_087_bg_convo2_16_map:
	.incbin "baserom.gba", 0x9B5E4C, 0x4B4

	.section .data.data_bg.gap88, "a", %progbits
@ data_bg asset bg_convo2_17_palette: region-different graphics, JP 0x089b6400..0x089b6500 (256 B); not code-named, table-pinned; byte-perfect incbin.
	.global gfx_data_bg_088_bg_convo2_17_palette
gfx_data_bg_088_bg_convo2_17_palette:
	.incbin "baserom.gba", 0x9B6400, 0x100

	.section .data.data_bg.gap89, "a", %progbits
@ data_bg asset bg_convo2_18_palette: region-different graphics, JP 0x089b6500..0x089b6600 (256 B); not code-named, table-pinned; byte-perfect incbin.
	.global gfx_data_bg_089_bg_convo2_18_palette
gfx_data_bg_089_bg_convo2_18_palette:
	.incbin "baserom.gba", 0x9B6500, 0x100

	.section .data.data_bg.gap90, "a", %progbits
@ data_bg asset bg_convo2_19_tiles: region-different graphics, JP 0x089b6600..0x089b8d8c (10124 B); not code-named, table-pinned; byte-perfect incbin.
	.global gfx_data_bg_090_bg_convo2_19_tiles
gfx_data_bg_090_bg_convo2_19_tiles:
	.incbin "baserom.gba", 0x9B6600, 0x278C

	.section .data.data_bg.gap91, "a", %progbits
@ data_bg asset bg_convo2_19_map: region-different graphics, JP 0x089b8d8c..0x089b9240 (1204 B); not code-named, table-pinned; byte-perfect incbin.
	.global gfx_data_bg_091_bg_convo2_19_map
gfx_data_bg_091_bg_convo2_19_map:
	.incbin "baserom.gba", 0x9B8D8C, 0x4B4

	.section .data.data_bg.gap92, "a", %progbits
@ data_bg asset bg_convo2_20_palette: region-different graphics, JP 0x089b9340..0x089b9440 (256 B); not code-named, table-pinned; byte-perfect incbin.
	.global gfx_data_bg_092_bg_convo2_20_palette
gfx_data_bg_092_bg_convo2_20_palette:
	.incbin "baserom.gba", 0x9B9340, 0x100

	.section .data.data_bg.gap93, "a", %progbits
@ data_bg asset bg_convo2_21_tiles: region-different graphics, JP 0x089b9440..0x089bdef4 (19124 B); not code-named, table-pinned; byte-perfect incbin.
	.global gfx_data_bg_093_bg_convo2_21_tiles
gfx_data_bg_093_bg_convo2_21_tiles:
	.incbin "baserom.gba", 0x9B9440, 0x4AB4

	.section .data.data_bg.gap94, "a", %progbits
@ data_bg asset bg_convo2_21_map: region-different graphics, JP 0x089bdef4..0x089be3a8 (1204 B); not code-named, table-pinned; byte-perfect incbin.
	.global gfx_data_bg_094_bg_convo2_21_map
gfx_data_bg_094_bg_convo2_21_map:
	.incbin "baserom.gba", 0x9BDEF4, 0x4B4

	.section .data.data_bg.gap95, "a", %progbits
@ data_bg asset bg_convo2_22_tiles: region-different graphics, JP 0x089be4a8..0x089c260c (16740 B); not code-named, table-pinned; byte-perfect incbin.
	.global gfx_data_bg_095_bg_convo2_22_tiles
gfx_data_bg_095_bg_convo2_22_tiles:
	.incbin "baserom.gba", 0x9BE4A8, 0x4164

	.section .data.data_bg.gap96, "a", %progbits
@ data_bg asset bg_convo2_22_map: region-different graphics, JP 0x089c260c..0x089c2ac0 (1204 B); not code-named, table-pinned; byte-perfect incbin.
	.global gfx_data_bg_096_bg_convo2_22_map
gfx_data_bg_096_bg_convo2_22_map:
	.incbin "baserom.gba", 0x9C260C, 0x4B4

	.section .data.data_bg.gap97, "a", %progbits
@ data_bg asset bg_convo2_23_tiles: region-different graphics, JP 0x089c2bc0..0x089c76b0 (19184 B); not code-named, table-pinned; byte-perfect incbin.
	.global gfx_data_bg_097_bg_convo2_23_tiles
gfx_data_bg_097_bg_convo2_23_tiles:
	.incbin "baserom.gba", 0x9C2BC0, 0x4AF0

	.section .data.data_bg.gap98, "a", %progbits
@ data_bg asset bg_convo2_23_map: region-different graphics, JP 0x089c76b0..0x089c7b64 (1204 B); not code-named, table-pinned; byte-perfect incbin.
	.global gfx_data_bg_098_bg_convo2_23_map
gfx_data_bg_098_bg_convo2_23_map:
	.incbin "baserom.gba", 0x9C76B0, 0x4B4

	.section .data.data_bg.gap99, "a", %progbits
@ data_bg asset bg_convo2_24_tiles: region-different graphics, JP 0x089c7c64..0x089cc470 (18444 B); not code-named, table-pinned; byte-perfect incbin.
	.global gfx_data_bg_099_bg_convo2_24_tiles
gfx_data_bg_099_bg_convo2_24_tiles:
	.incbin "baserom.gba", 0x9C7C64, 0x480C

	.section .data.data_bg.gap100, "a", %progbits
@ data_bg asset bg_convo2_24_map: region-different graphics, JP 0x089cc470..0x089cc924 (1204 B); not code-named, table-pinned; byte-perfect incbin.
	.global gfx_data_bg_100_bg_convo2_24_map
gfx_data_bg_100_bg_convo2_24_map:
	.incbin "baserom.gba", 0x9CC470, 0x4B4

	.section .data.data_bg.gap101, "a", %progbits
@ data_bg asset bg_convo2_25_tiles: region-different graphics, JP 0x089cca24..0x089cd3a4 (2432 B); not code-named, table-pinned; byte-perfect incbin.
	.global gfx_data_bg_101_bg_convo2_25_tiles
gfx_data_bg_101_bg_convo2_25_tiles:
	.incbin "baserom.gba", 0x9CCA24, 0x980

	.section .data.data_bg.gap102, "a", %progbits
@ data_bg asset bg_Blank_map: region-different graphics, JP 0x089cd3a4..0x089cd858 (1204 B); not code-named, table-pinned; byte-perfect incbin.
	.global gfx_data_bg_102_bg_Blank_map
gfx_data_bg_102_bg_Blank_map:
	.incbin "baserom.gba", 0x9CD3A4, 0x4B4

	.section .data.data_bg.gap103, "a", %progbits
@ data_bg asset bg_convo2_25_palette: region-different graphics, JP 0x089cd858..0x089cd958 (256 B); not code-named, table-pinned; byte-perfect incbin.
	.global gfx_data_bg_103_bg_convo2_25_palette
gfx_data_bg_103_bg_convo2_25_palette:
	.incbin "baserom.gba", 0x9CD858, 0x100
