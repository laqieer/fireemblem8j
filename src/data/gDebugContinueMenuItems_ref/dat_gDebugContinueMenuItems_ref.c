#include "global.h"

/* De-pointered from data/residual/gDebugContinueMenuItems.bin by scripts/repoint_table.py.
 * Pointer words are relocatable symbol references (.4byte sym) so the ROM is
 * SHIFTABLE; byte-identical to baserom (gated by `make compare`). Emitted as a
 * pure asm block so no typed header decl of the referenced symbols can conflict. */

__asm__(
"\t.section .rodata.dat_gDebugContinueMenuItems_ref, \"a\", %progbits\n"
"\t.global gDebugContinueMenuItems\n"
"gDebugContinueMenuItems:\n"
"\t.4byte 0x080DCA20\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00000002\n"
"\t.4byte 0x00000A00\n"
"\t.4byte MenuAlwaysEnabled + 0x1\n"
"\t.4byte 0x00000000\n"
"\t.4byte DebugContinueMenu_ReleaseEntry + 0x1\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x080DCA10\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00000003\n"
"\t.4byte 0x00000B00\n"
"\t.4byte DebugContinueMenu_IsContinueChapterAvailable + 0x1\n"
"\t.4byte 0x00000000\n"
"\t.4byte DebugContinueMenu_ContinueChapter + 0x1\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x080DCA04\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00000631\n"
"\t.4byte 0x00000C00\n"
"\t.4byte DebugContinueMenu_IsManualContinueAvailable + 0x1\n"
"\t.4byte 0x00000000\n"
"\t.4byte DebugContinueMenu_ManualContinue + 0x1\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x080DC9F0\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00000005\n"
"\t.4byte 0x00000D00\n"
"\t.4byte MenuAlwaysEnabled + 0x1\n"
"\t.4byte 0x00000000\n"
"\t.4byte DebugContinueMenu_InitializeFile + 0x1\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
);
