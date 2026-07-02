/* Wave46: carved from data/residual/data_0861E944.bin to a relocatable .4byte pointer table.
 * Each embedded ROM pointer is expressed as `Sym + addend` (the linked-ELF symbol
 * whose range owns the target address); non-pointer words stay literals. Byte-
 * identical to the original blob, and relocation-complete so the object stays
 * shiftcheck-clean (0 HIGH) if the pointee resources move. */
	.section .data.residue.0861E944, "aw", %progbits
	.global data_0861E944
data_0861E944:
	.4byte AnimSprite_EfxMantBatabata1_L_1 + 0x2
	.4byte AnimSprite_EfxMantBatabata1_L_2 + 0x3
	.4byte AnimSprite_EfxMantBatabata1_L_3 + 0x2
	.4byte AnimSprite_EfxMantBatabata1_L_4 + 0x2
	.4byte 0x82000000
