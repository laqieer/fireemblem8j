#include "global.h"

/* ProcScr_ManimShiftingSineWaveScanlineBuf (0x08A15984): a process script with two
 * real Thumb function pointers (onInit/onLoop). De-pointered to relocatable symbol
 * refs (.4byte fn + 1, the Thumb bit) so the ROM is SHIFTABLE; byte-identical to
 * baserom (gated by `make compare`). Emitted as a pure asm block to avoid a typed
 * header decl of the referenced fns conflicting with the global prototypes. */

__asm__(
"\t.section .data.residue.08A15984, \"aw\", %progbits\n"
"\t.global data_08A15984\n"
"data_08A15984:\n"
"\t.4byte 0x00000002\n"                            /* PROC_CALL_ROUTINE onInit */
"\t.4byte sub_80848F0 + 0x1\n"                     /* ManimShiftingSineWaveScanlineBuf_Init */
"\t.4byte 0x00000003\n"                            /* PROC_CALL_ROUTINE onLoop */
"\t.4byte ManimShiftingSineWaveScanlineBuf_Loop + 0x1\n"
"\t.4byte 0x00000000\n"                            /* PROC_END */
"\t.4byte 0x00000000\n"
);
