#include "global.h"

/* Migrated from asm/data_085C34F0.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

__asm__(
"\t.section .data.residue.085C34F0, \"aw\", %progbits\n"
"\t.global data_085C34F0\n"
"data_085C34F0:\n"
"\t.4byte 0x0000000E\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000002\n"
"\t.4byte ProcShowMapChange_MoveCamera + 0x1\n"
"\t.4byte 0x00000008\n"
"\t.4byte ProcScr_CamMove\n"  /* shiftcheck: was data_085C2980 + 0x48 (== &ProcScr_CamMove); byte-identical, now relocatable */
"\t.4byte 0x00000002\n"
"\t.4byte ProcShowMapChange_UpdateGame + 0x1\n"
"\t.4byte 0x00000014\n"
"\t.4byte DoesBMXFADEExist + 0x1\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x0000000E\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000002\n"
"\t.4byte PikeTrapSpriteAnim_Init + 0x1\n"
"\t.4byte 0x00000014\n"
"\t.4byte APProc_Exists + 0x1\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
);  /* de-pointered slice data_085C34F0: ptr=4 data=14 skip=2 */
