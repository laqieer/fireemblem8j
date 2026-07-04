/* Wave46: carved from data/residual/data_0872CFC4.bin to a relocatable .4byte pointer table.
 * Each embedded ROM pointer is expressed as `Sym + addend` (the linked-ELF symbol
 * whose range owns the target address); non-pointer words stay literals. Byte-
 * identical to the original blob, and relocation-complete so the object stays
 * shiftcheck-clean (0 HIGH) if the pointee resources move. */
	.section .data.residue.0872CFC4, "aw", %progbits
	.global AnimScr_efxNaglfarOBJ2_2
AnimScr_efxNaglfarOBJ2_2:
	.4byte AnimScr_efxNaglfarOBJ2_1 + 0xF
	.4byte AnimSprite_efxNaglfarOBJ2_3 + 0x2
	.4byte 0x81000000
	.4byte AnimSprite_efxNaglfarOBJ2_4 + 0x2
	.4byte AnimSprite_efxNaglfarOBJ2_5 + 0x2
	.4byte 0x81000000
