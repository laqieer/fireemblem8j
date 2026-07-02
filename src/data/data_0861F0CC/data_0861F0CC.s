/* Wave46: carved from data/residual/data_0861F0CC.bin to a relocatable .4byte pointer table.
 * Each embedded ROM pointer is expressed as `Sym + addend` (the linked-ELF symbol
 * whose range owns the target address); non-pointer words stay literals. Byte-
 * identical to the original blob, and relocation-complete so the object stays
 * shiftcheck-clean (0 HIGH) if the pointee resources move. */
	.section .data.residue.0861F0CC, "aw", %progbits
	.global data_0861F0CC
data_0861F0CC:
	.4byte AnimSprite_EfxMantBatabata4_R_1 + 0x3
	.4byte AnimSprite_EfxMantBatabata4_R_2 + 0x3
	.4byte AnimSprite_EfxMantBatabata4_R_3 + 0x3
	.4byte AnimSprite_EfxMantBatabata4_R_4 + 0x3
	.4byte AnimSprite_EfxMantBatabata4_R_5 + 0x3
	.4byte 0x82000000
