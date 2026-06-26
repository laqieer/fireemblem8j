#include "global.h"

/* De-pointered from data/residual/gProcScr_SSPageNameCtrl.bin by scripts/repoint_table.py.
 * Pointer words are relocatable symbol references (.4byte sym) so the ROM is
 * SHIFTABLE; byte-identical to baserom (gated by `make compare`). Emitted as a
 * pure asm block so no typed header decl of the referenced symbols can conflict. */

__asm__(
"\t.section .rodata.dat_gProcScr_SSPageNameCtrl_ref, \"a\", %progbits\n"
"\t.global gProcScr_SSPageNameCtrl\n"
"gProcScr_SSPageNameCtrl:\n"
"\t.4byte 0x00000002\n"
"\t.4byte PageNameCtrl_OnInit + 0x1\n"
"\t.4byte 0x0000000B\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000003\n"
"\t.4byte PageNameCtrl_OnIdle + 0x1\n"
"\t.4byte 0x00000003\n"
"\t.4byte PageNameCtrl_AnimOut + 0x1\n"
"\t.4byte 0x0001000E\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000003\n"
"\t.4byte PageNameCtrl_AnimIn + 0x1\n"
"\t.4byte 0x0000000C\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
);
