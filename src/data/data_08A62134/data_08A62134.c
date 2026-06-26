#include "global.h"

/* Migrated from asm/data_08A62134.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

__asm__(
"\t.section .data.residue.08A62134, \"aw\", %progbits\n"
"\t.global EventScr_Ch1Tut_TradeSelectGalliamEnd\n"
"EventScr_Ch1Tut_TradeSelectGalliamEnd:\n"
"\t.4byte 0x00070228\n"
"\t.4byte 0x00001120\n"
"\t.4byte 0x00001A23\n"
"\t.4byte 0x000B0540\n"
"\t.4byte 0x00380048\n"
"\t.4byte 0x09081B20\n"
"\t.4byte 0x00001D20\n"
"\t.4byte 0x00001B22\n"
"\t.4byte 0x010A1120\n"
"\t.4byte 0x00870229\n"
"\t.4byte 0x00040B41\n"
"\t.4byte EventScr_Ch1Tut_AfterTrade\n"
"\t.4byte 0x00000120\n"
);  /* de-pointered slice EventScr_Ch1Tut_TradeSelectGalliamEnd: ptr=1 data=12 skip=0 */
__asm__(
"\t.section .data.residue.08A62168, \"aw\", %progbits\n"
"\t.global EventScr_Ch1Tut_AfterTrade\n"
"EventScr_Ch1Tut_AfterTrade:\n"
"\t.4byte 0x00070228\n"
"\t.4byte 0x00001A23\n"
"\t.4byte 0x000B0540\n"
"\t.4byte 0x00380048\n"
"\t.4byte 0x090D1B20\n"
"\t.4byte 0x00001D20\n"
"\t.4byte 0x00001B22\n"
"\t.4byte 0x00C70229\n"
"\t.4byte 0x00C80229\n"
"\t.4byte 0x00010B41\n"
"\t.4byte EventScr_Ch1Tut_PostTradeAndItemUseAction\n"
"\t.4byte 0x00000120\n"
);  /* de-pointered slice EventScr_Ch1Tut_AfterTrade: ptr=1 data=11 skip=0 */
__asm__(
"\t.section .data.residue.08A62198, \"aw\", %progbits\n"
"\t.global EventScr_Ch1Tut_PostTradeAndItemUseAction\n"
"EventScr_Ch1Tut_PostTradeAndItemUseAction:\n"
"\t.4byte 0x00043B21\n"
"\t.4byte 0x003C0E20\n"
"\t.4byte 0x00003B22\n"
"\t.4byte 0x00001A20\n"
"\t.4byte 0x08F21B20\n"
"\t.4byte 0x00001D20\n"
"\t.4byte 0x00001B22\n"
"\t.4byte 0x00003D20\n"
"\t.4byte 0x00000A40\n"
"\t.4byte data_08A62340 + 0x7C\n"
"\t.4byte 0x00070228\n"
"\t.4byte 0x00000120\n"
);  /* de-pointered slice EventScr_Ch1Tut_PostTradeAndItemUseAction: ptr=1 data=10 skip=1 */
u8 EventScr_Ch1Tut_GuideMsgSeize[] __attribute__((section(".data.residue.08A621C8"))) = INCBIN_U8("data/residual/data_08A62134.bin", 148, 44);
