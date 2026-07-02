#include "global.h"

/* Wave46: carved from data/residual/data_086F6198.bin to a relocatable .4byte pointer table.
 * Each embedded ROM pointer is expressed as `Sym + addend` (the linked-ELF symbol
 * whose range owns the target address); non-pointer words stay literals. Byte-
 * identical to the original blob, and relocation-complete so the object stays
 * shiftcheck-clean (0 HIGH) if the pointee resources move. */
__asm__(
"\t.section .data.residue.086F6198, \"aw\", %progbits\n"
"\t.global data_086F6198\n"
"data_086F6198:\n"
"	.4byte AnimSprite_Banim_27 + 0x2\n"
"	.4byte AnimSprite_Banim_28 + 0x2\n"
"	.4byte AnimSprite_Banim_29 + 0x3\n"
"	.4byte AnimSprite_Banim_30 + 0x2\n"
"	.4byte AnimSprite_Banim_31 + 0x2\n"
"	.4byte AnimSprite_Banim_32 + 0x2\n"
"	.4byte AnimSprite_Banim_33 + 0x3\n"
"	.4byte AnimSprite_Banim_34 + 0x2\n"
"	.4byte AnimSprite_Banim_35 + 0x2\n"
"	.4byte 0x82000000\n"
);
