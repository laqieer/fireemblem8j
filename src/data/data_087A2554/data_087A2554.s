/* Wave46: carved from data/residual/data_087A2554.bin to a relocatable .4byte
 * pointer table. Preserves BOTH original symbols as global labels in one section:
 * data_087A2554 = words [0x0,0x18), data_087A256C = words [0x18,0x24) (the interior
 * label that sub_8067984.c references). Each embedded ROM pointer is Sym+addend;
 * non-pointer words stay literals. Byte-identical, relocation-complete (0 HIGH). */
	.section .data.residue.087A2554, "aw", %progbits
	.global data_087A2554
data_087A2554:
	.4byte AnimSprite_efxSuperdruidOBJ_0 + 0x3
	.4byte AnimSprite_efxSuperdruidOBJ_1 + 0x2
	.4byte AnimSprite_efxSuperdruidOBJ_3 + 0x10000001
	.4byte AnimSprite_efxSuperdruidOBJ_2 + 0x2
	.4byte AnimSprite_efxSuperdruidOBJ_3 + 0x2
	.4byte 0x81000000
	.global data_087A256C
data_087A256C:
	.4byte AnimSprite_efxSuperdruidOBJ_4 + 0x3
	.4byte AnimSprite_efxSuperdruidOBJ_5 + 0x2
	.4byte 0x81000000
