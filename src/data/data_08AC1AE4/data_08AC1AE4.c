#include "global.h"

/* Migrated from asm/data_08AC1AE4.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

__asm__(
"\t.section .data.residue.08AC1AE4, \"aw\", %progbits\n"
"\t.global data_08AC1AE4\n"
"data_08AC1AE4:\n"
"\t.4byte 0x00060101\n"
"\t.4byte 0x00000000\n"
"\t.4byte MenuItemDef_WMGeneralMenu\n"
"\t.4byte WMGeneralMenu_OnInit + 0x1\n"
"\t.4byte WMGeneralMenu_OnEnd + 0x1\n"
"\t.4byte 0x00000000\n"
"\t.4byte WMGeneralMenu_OnCancel + 0x1\n"
"\t.4byte sub_8050294 + 0x1\n"
"\t.4byte MenuStdHelpBox + 0x1\n"
"\t.4byte 0x00060101\n"
);  /* de-pointered slice data_08AC1AE4: ptr=6 data=4 skip=0 */
