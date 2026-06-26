#include "global.h"

/* De-pointered from data/residual/gProcScr_BKSEL.bin by scripts/repoint_table.py.
 * Pointer words are relocatable symbol references (.4byte sym) so the ROM is
 * SHIFTABLE; byte-identical to baserom (gated by `make compare`). Emitted as a
 * pure asm block so no typed header decl of the referenced symbols can conflict. */

__asm__(
"\t.section .rodata.dat_gProcScr_BKSEL_ref, \"a\", %progbits\n"
"\t.global gProcScr_BKSEL\n"
"gProcScr_BKSEL:\n"
"\t.4byte 0x00000001\n"
"\t.4byte 0x080DCCFC\n"  /* coincidental const into fn: raw */
"\t.4byte 0x00000004\n"
"\t.4byte BattleForecast_OnEnd + 0x1\n"
"\t.4byte 0x00000002\n"
"\t.4byte ClearBg0Bg1 + 0x1\n"
"\t.4byte 0x0000000E\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000002\n"
"\t.4byte BattleForecast_Init + 0x1\n"
"\t.4byte 0x0000000B\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000014\n"
"\t.4byte MapEventEngineExists_ + 0x1\n"
"\t.4byte 0x00000002\n"
"\t.4byte BattleForecast_OnNewBattle + 0x1\n"
"\t.4byte 0x00000003\n"
"\t.4byte BattleForecast_LoopSlideIn + 0x1\n"
"\t.4byte 0x00000002\n"
"\t.4byte StartBattleForecastTutorialEvent + 0x1\n"
"\t.4byte 0x00000003\n"
"\t.4byte BattleForecast_LoopDisplay + 0x1\n"
"\t.4byte 0x00000003\n"
"\t.4byte BattleForecast_LoopSlideOut + 0x1\n"
"\t.4byte 0x0000000C\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x0001000B\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000003\n"
"\t.4byte BattleForecast_LoopSlideOut + 0x1\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
);
