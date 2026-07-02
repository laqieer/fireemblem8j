#include "global.h"

/* Wave46: carved from data/residual/data_0861EAF0.bin to a relocatable .4byte pointer table.
 * Each embedded ROM pointer is expressed as `Sym + addend` (the linked-ELF symbol
 * whose range owns the target address); non-pointer words stay literals. Byte-
 * identical to the original blob, and relocation-complete so the object stays
 * shiftcheck-clean (0 HIGH) if the pointee resources move. */
__asm__(
"\t.section .data.residue.0861EAF0, \"aw\", %progbits\n"
"\t.global data_0861EAF0\n"
"data_0861EAF0:\n"
"	.4byte AnimSprite_EfxMantBatabata2_R_1 + 0x3\n"
"	.4byte AnimSprite_EfxMantBatabata2_R_2 + 0x2\n"
"	.4byte AnimSprite_EfxMantBatabata2_R_3 + 0x3\n"
"	.4byte AnimSprite_EfxMantBatabata2_R_4 + 0x2\n"
"	.4byte 0x82000000\n"
);
