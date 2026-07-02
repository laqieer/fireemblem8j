#include "global.h"

/* Wave46: carved from data/residual/data_086F6364.bin to a relocatable .4byte pointer table.
 * Each embedded ROM pointer is expressed as `Sym + addend` (the linked-ELF symbol
 * whose range owns the target address); non-pointer words stay literals. Byte-
 * identical to the original blob, and relocation-complete so the object stays
 * shiftcheck-clean (0 HIGH) if the pointee resources move. */
__asm__(
"\t.section .data.residue.086F6364, \"aw\", %progbits\n"
"\t.global data_086F6364\n"
"data_086F6364:\n"
"	.4byte AnimSprite_Banim_36 + 0x2\n"
"	.4byte AnimSprite_Banim_37 + 0x2\n"
"	.4byte AnimSprite_Banim_38 + 0x3\n"
"	.4byte AnimSprite_Banim_39 + 0x2\n"
"	.4byte AnimSprite_Banim_40 + 0x2\n"
"	.4byte AnimSprite_Banim_41 + 0x2\n"
"	.4byte AnimSprite_Banim_42 + 0x3\n"
"	.4byte AnimSprite_Banim_43 + 0x2\n"
"	.4byte AnimSprite_Banim_44 + 0x2\n"
"	.4byte 0x82000000\n"
);
