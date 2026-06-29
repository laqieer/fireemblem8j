#include "global.h"

/* Migrated from asm/data_085C3B10.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

__asm__(
"\t.section .data.residue.085C3B10, \"aw\", %progbits\n"
"\t.global data_085C3B10\n"
"data_085C3B10:\n"
"\t.4byte 0x00000002\n"
"\t.4byte LockGame + 0x1\n"
"\t.4byte 0x00000002\n"
"\t.4byte BackToAttackMenu_CamWatch + 0x1\n"
"\t.4byte 0x00000008\n"
"\t.4byte gProcScr_BKSEL\n"
"\t.4byte 0x00000008\n"
"\t.4byte ProcScr_CamMove\n"  /* shiftcheck: was data_085C2980 + 0x48 (== &ProcScr_CamMove); byte-identical, now relocatable */
"\t.4byte 0x00000002\n"
"\t.4byte BackToAttackMenu_RestartMenu + 0x1\n"
"\t.4byte 0x00000002\n"
"\t.4byte UnlockGame + 0x1\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x02020188\n"
);  /* de-pointered slice data_085C3B10: ptr=6 data=9 skip=0 */
