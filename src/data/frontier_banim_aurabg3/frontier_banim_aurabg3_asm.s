@ frontier_banim_aurabg3_asm.s -- gap-glue sections carved out of frontier_banim_aurabg3.c because a
@ symbolic .4byte pointer table sits at a non-4-aligned section offset
@ (a typed C u32[] would force .align and shift the ROM). Built verbatim
@ by SRC_S_OBJECTS; sections retargeted in layout/carved_rom*.tsv.

.section .data.frontier_banim_aurabg3.gap55, "aw", %progbits
.global frontier_banim_aurabg3_055_77AACA
frontier_banim_aurabg3_055_77AACA:
.short 0xffff,0x0080,0x0000,0x0000,0x0080,0x0004
.short 0xffff,0xff80,0x0000,0x0000,0x0080,0x0004
.short 0xffff,0x0080,0x0000,0x0000,0xff80,0x0004
.short 0xffff,0xff80,0x0000,0x0000,0xff80,0x0300
.short 0x8000,0x0000,0xffc0,0xffc0,0x0000,0x0300
.short 0x8200,0x0000,0xffff,0xffc0,0x0000,0x0300
.short 0x8400,0x0000,0xffc0,0xffff,0x0000,0x0300
.short 0x8600,0x0000,0xffff,0xffff,0x0000,0x0001
.short 0x0000,0x0000,0x0000,0x0000,0x0000

	.section .data.frontier_banim_aurabg3.gap55, "aw", %progbits
	.global data_0877AB34
data_0877AB34:
	.4byte frontier_banim_aurabg3_035_77A2DE
	.4byte frontier_banim_aurabg3_036_77A34A
	.4byte frontier_banim_aurabg3_037_77A3B6
	.4byte frontier_banim_aurabg3_038_77A422
	.4byte frontier_banim_aurabg3_039_77A48E
	.4byte frontier_banim_aurabg3_040_77A4FA
	.4byte frontier_banim_aurabg3_041_77A566
	.4byte frontier_banim_aurabg3_042_77A5D2
	.4byte frontier_banim_aurabg3_043_77A63E
	.4byte frontier_banim_aurabg3_044_77A6AA
	.4byte frontier_banim_aurabg3_050_77A902
	.4byte frontier_banim_aurabg3_045_77A6E6
	.4byte frontier_banim_aurabg3_050_77A902
	.4byte frontier_banim_aurabg3_046_77A752
	.4byte frontier_banim_aurabg3_050_77A902
	.4byte frontier_banim_aurabg3_047_77A7BE
	.4byte frontier_banim_aurabg3_050_77A902
	.4byte frontier_banim_aurabg3_048_77A82A
	.4byte frontier_banim_aurabg3_050_77A902
	.4byte frontier_banim_aurabg3_049_77A896
	.4byte frontier_banim_aurabg3_050_77A902
	.4byte frontier_banim_aurabg3_051_77A91A
	.4byte frontier_banim_aurabg3_050_77A902
	.4byte frontier_banim_aurabg3_052_77A986
	.4byte frontier_banim_aurabg3_050_77A902
	.4byte frontier_banim_aurabg3_053_77A9F2
	.4byte frontier_banim_aurabg3_050_77A902
	.4byte frontier_banim_aurabg3_054_77AA5E
	.4byte frontier_banim_aurabg3_050_77A902
	.4byte frontier_banim_aurabg3_055_77AACA
	.4byte frontier_banim_aurabg3_050_77A902
	.4byte frontier_banim_aurabg3_055_77AACA
	.4byte frontier_banim_aurabg3_050_77A902
	.4byte frontier_banim_aurabg3_055_77AACA
	.4byte frontier_banim_aurabg3_050_77A902
	.4byte frontier_banim_aurabg3_055_77AACA
	.4byte frontier_banim_aurabg3_050_77A902
	.4byte 0x80000000

	.section .data.frontier_banim_aurabg3.gap55, "aw", %progbits
	.global data_0877ABCC
data_0877ABCC:
	.4byte 0x1877A900
	.4byte frontier_banim_aurabg3_029_779AB6
	.4byte frontier_banim_aurabg3_030_779AFE
	.4byte frontier_banim_aurabg3_031_779B76
	.4byte frontier_banim_aurabg3_032_779C2A
	.4byte frontier_banim_aurabg3_033_779D56
	.4byte frontier_banim_aurabg3_034_779ED6
	.4byte 0x7877A0AB
	.4byte 0x84000013
	.4byte 0x80000000
