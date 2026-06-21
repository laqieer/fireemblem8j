#include "global.h"

/* Migrated from asm/data_080DC684.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 *
 * Split out the debug-menu strings (Shift-JIS) so DebugMenu_ClearDraw/FogDraw can
 * reference them by symbol instead of a hardcoded raw ROM address.
 */

#define DC684_SEC __attribute__((section(".data.residue.080DC684")))

u8 data_080DC68C[] DC684_SEC = INCBIN_U8("data/residual/data_080DC684.bin", 8, 0x5C);
const char Str_DebugPlaythroughCount[] DC684_SEC = INCBIN_U8("data/residual/data_080DC684.bin", 0x64, 8);  /* 周回数 (0x080DC6E8) */
const char Str_DebugPlaythroughTh[]    DC684_SEC = INCBIN_U8("data/residual/data_080DC684.bin", 0x6C, 8);  /* 周目  (0x080DC6F0) */
u8 data_080DC6F8[] DC684_SEC = INCBIN_U8("data/residual/data_080DC684.bin", 0x74, 0xC);
const char Str_DebugFogState[]         DC684_SEC = INCBIN_U8("data/residual/data_080DC684.bin", 0x80, 8);  /* さく敵 (0x080DC704) */
u8 data_080DC70C[] DC684_SEC = INCBIN_U8("data/residual/data_080DC684.bin", 0x88, 0x104);
