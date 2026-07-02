/* Wave46: carved from data/residual/data_0861F3BC.bin to a relocatable .4byte pointer table.
 * Each embedded ROM pointer is expressed as `Sym + addend` (the linked-ELF symbol
 * whose range owns the target address); non-pointer words stay literals. Byte-
 * identical to the original blob, and relocation-complete so the object stays
 * shiftcheck-clean (0 HIGH) if the pointee resources move. */
	.section .data.residue.0861F3BC, "aw", %progbits
	.global data_0861F3BC
data_0861F3BC:
	.4byte AnimSprite_EfxMantBatabata5_L_1 + 0x2
	.4byte AnimSprite_EfxMantBatabata5_L_2 + 0x2
	.4byte AnimSprite_EfxMantBatabata5_L_3 + 0x2
	.4byte AnimSprite_EfxMantBatabata5_L_4 + 0x2
	.4byte 0x82000000
