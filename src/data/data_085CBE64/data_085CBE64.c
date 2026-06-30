#include "global.h"

/* Pal_PikeTrap (data_085CBE64): trap-fx 16-color palette, region-same with fe8u.
 * Editable JASC source graphics/misc_gfx2/Pal_PikeTrap.pal -> .gbapal byte-identical.
 */

u8 data_085CBE64[] __attribute__((section(".data.residue.085CBE64"))) = INCBIN_U8("graphics/misc_gfx2/Pal_PikeTrap.gbapal");
