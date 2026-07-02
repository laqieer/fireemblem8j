#include "global.h"
#include "proc.h"
#define PROC_WORDS(op, pa, p) { (op), (pa), (void *)(p) }
#include "event.h"
#include "eventinfo.h"
#include "EAstdlib.h"
#define EVENT_WORD(w)      (EventListScr)(w),
#define EVENT_WORD_SYM(s)  (EventListScr)(s),

/* Migrated from asm/frontier_df4_menu.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

/* multi-slice atomic relocation carve (was several INCBIN_U8 slices of one .bin);
   every embedded ROM pointer -> .4byte Sym(+addend), byte-exact. make compare is the oracle. */
__asm__(
"	.section .data.frontier_df4_menu.gap0, \"aw\", %progbits\n"
"	.global frontier_df4_menu_000_A149D4\n"
"frontier_df4_menu_000_A149D4:\n"
"	.4byte 0x0001000E, 0x00000000, 0x00000002, 0x08081BDD, 0x00000003, 0x08081CA5\n"
"	.4byte 0x001E000E, 0x00000000, 0x00000003, 0x08081DE1, 0x00000003, 0x08081F0D\n"
"	.4byte 0x00000003, 0x08081F99, 0x00000002, 0x08081FE9, 0x00000000, 0x00000000\n"
"	.4byte 0x0001000E, 0x00000000, 0x00000002, 0x08082025, 0x00000003, 0x08082109\n"
"	.4byte 0x00000003, 0x0808214D, 0x00000002, 0x08082331, 0x003C000E, 0x00000000\n"
"	.4byte 0x00000002, 0x0807FD71, 0x00000000, 0x00000000, gMapanimEventcall_191, gMapanimEventcall_199\n"
"	.4byte gMapanimEventcall_207, gMapanimEventcall_192, gMapanimEventcall_200, gMapanimEventcall_208, gMapanimEventcall_193, gMapanimEventcall_201\n"
"	.4byte gMapanimEventcall_209, gMapanimEventcall_194, gMapanimEventcall_202, gMapanimEventcall_210, gMapanimEventcall_195, gMapanimEventcall_203\n"
"	.4byte gMapanimEventcall_211, gMapanimEventcall_196, gMapanimEventcall_204, gMapanimEventcall_212, gMapanimEventcall_197, gMapanimEventcall_205\n"
"	.4byte gMapanimEventcall_213, gMapanimEventcall_198, gMapanimEventcall_206, gMapanimEventcall_214, 0x00000004, 0x08082379\n"
"	.4byte 0x0001000E, 0x00000000, 0x00000002, 0x08082391, 0x00000003, 0x08082479\n"
"	.4byte 0x00000003, 0x080825C9, 0x001E000E, 0x00000000, 0x00000003, 0x080826CD\n"
"	.4byte 0x00000002, 0x08082719, 0x003C000E, 0x00000000, 0x00000002, 0x0807FD71\n"
"	.4byte 0x00000000, 0x00000000, 0x0000000E, 0x00000000, 0x00000003, 0x0808278D\n"
"	.4byte 0x00000000, 0x00000000, gMapanimEventcall_215, gMapanimEventcall_241, gMapanimEventcall_267, gMapanimEventcall_216\n"
"	.4byte gMapanimEventcall_242, gMapanimEventcall_268, gMapanimEventcall_217, gMapanimEventcall_243, gMapanimEventcall_269, gMapanimEventcall_218\n"
"	.4byte gMapanimEventcall_244, gMapanimEventcall_270, gMapanimEventcall_219, gMapanimEventcall_245, gMapanimEventcall_271, gMapanimEventcall_220\n"
"	.4byte gMapanimEventcall_246, gMapanimEventcall_272, gMapanimEventcall_221, gMapanimEventcall_247, gMapanimEventcall_273, gMapanimEventcall_222\n"
"	.4byte gMapanimEventcall_248, gMapanimEventcall_274, gMapanimEventcall_223, gMapanimEventcall_249, gMapanimEventcall_275, gMapanimEventcall_224\n"
"	.4byte gMapanimEventcall_250, gMapanimEventcall_276, gMapanimEventcall_225, gMapanimEventcall_251, gMapanimEventcall_277, gMapanimEventcall_226\n"
"	.4byte gMapanimEventcall_252, gMapanimEventcall_278, gMapanimEventcall_227, gMapanimEventcall_253, gMapanimEventcall_279, gMapanimEventcall_228\n"
"	.4byte gMapanimEventcall_254, gMapanimEventcall_280, gMapanimEventcall_229, gMapanimEventcall_255, gMapanimEventcall_281, gMapanimEventcall_230\n"
"	.4byte gMapanimEventcall_256, gMapanimEventcall_282, gMapanimEventcall_231, gMapanimEventcall_257, gMapanimEventcall_283, gMapanimEventcall_232\n"
"	.4byte gMapanimEventcall_258, gMapanimEventcall_284, gMapanimEventcall_233, gMapanimEventcall_259, gMapanimEventcall_285, gMapanimEventcall_234\n"
"	.4byte gMapanimEventcall_260, gMapanimEventcall_286, gMapanimEventcall_235, gMapanimEventcall_261, gMapanimEventcall_287, gMapanimEventcall_236\n"
"	.4byte gMapanimEventcall_262, gMapanimEventcall_288, gMapanimEventcall_237, gMapanimEventcall_263, gMapanimEventcall_289, gMapanimEventcall_238\n"
"	.4byte gMapanimEventcall_264, gMapanimEventcall_290, gMapanimEventcall_239, gMapanimEventcall_265, gMapanimEventcall_291, gMapanimEventcall_240\n"
"	.4byte gMapanimEventcall_266, gMapanimEventcall_292, 0x00000004, 0x08082995, 0x0001000E, 0x00000000\n"
"	.4byte 0x00000002, 0x080829A1, 0x00000003, 0x08082A71, 0x00000003, 0x08082B09\n"
"	.4byte 0x00000003, 0x08082BD1, 0x00000003, 0x08082C41, 0x00000003, 0x08082D19\n"
"	.4byte 0x00000003, 0x08082E59, 0x00000002, 0x08082EC5, 0x003C000E, 0x00000000\n"
"	.4byte 0x00000002, 0x0807FD71, 0x00000000, 0x00000000, 0x00000002, 0x08082EE9\n"
"	.4byte 0x0000000E, 0x00000000, 0x00000003, 0x08082F19, 0x00000000, 0x00000000\n"
"	.4byte Tsa_Mapeventcall_0, Tsa_Mapeventcall_1, Tsa_Mapeventcall_2, Tsa_Mapeventcall_3, Tsa_Mapeventcall_4, Tsa_Mapeventcall_5\n"
"	.4byte Tsa_Mapeventcall_6, Tsa_Mapeventcall_7, Tsa_Mapeventcall_8, Tsa_Mapeventcall_9, Tsa_Mapeventcall_10, Tsa_Mapeventcall_11\n"
"	.4byte Tsa_Mapeventcall_12, Tsa_Mapeventcall_13, Tsa_Mapeventcall_14, Tsa_Mapeventcall_15, Tsa_Mapeventcall_16, Tsa_Mapeventcall_17\n"
"	.4byte 0x0001000E, 0x00000000, 0x00000002, 0x080830AD, 0x00000003, 0x0808310D\n"
"	.4byte 0x00000002, 0x080831C5, 0x00000002, 0x0807FD71, 0x00000000, 0x00000000\n"
"	.4byte 0x0001000E, 0x00000000, 0x00000002, 0x08083225, 0x00000003, 0x08083285\n"
"	.4byte 0x00000002, 0x08083349, 0x00000002, 0x0807FD71, 0x00000000, 0x00000000\n"
"	.global data_08A14D94\n"
"data_08A14D94:\n"
"	.4byte 0x0001000E, 0x00000000, 0x00000004, 0x080834ED, 0x00000002, 0x080833B9\n"
"	.4byte 0x00000003, 0x08083441, 0x00000000, 0x00000000, 0x0001000E, 0x00000000\n"
"	.4byte 0x00000002, 0x0808352D, 0x00000003, 0x08083549, 0x00000002, gap_0008359C + 0x1\n"
"	.4byte 0x00000002, 0x0807FD71, 0x00000000, 0x00000000\n"
);
u8 frontier_df4_menu_001_A588C0[] __attribute__((section(".data.frontier_df4_menu.gap1"))) = INCBIN_U8("graphics/frontier_df4_menu/frontier_df4_menu_001_A588C0.bin");
/* frontier_df4_menu_002_A5D648: atomic relocation carve (was INCBIN); every embedded ROM
   pointer expressed as .4byte Sym(+addend), byte-exact. make compare is the oracle. */
__asm__(
"	.section .data.frontier_df4_menu.gap2, \"aw\", %progbits\n"
"	.global frontier_df4_menu_002_A5D648\n"
"frontier_df4_menu_002_A5D648:\n"
"	.4byte 0x00000000, 0x00000000, 0x0000000A, gUidebug_0 + 0x308, 0x00161100, 0x0000000A\n"
"	.4byte gUidebug_0 + 0x30C, 0x00171101, 0x00000000, 0x00000001, frontier_df3_eventscr_ch_021_A6FC48 + 0x54, 0x00000006\n"
"	.4byte 0x00000001, EventScr_GameOver, 0x00000065, 0x00000000, 0x00000000, 0x00000000\n"
"	.4byte 0x00000000, 0x00000000, frontier_df4_menu_002_A5D648, frontier_df4_menu_002_A5D648 + 0x4, frontier_df4_menu_002_A5D648 + 0x8, frontier_df4_menu_002_A5D648 + 0x24\n"
"	.4byte frontier_df4_menu_002_A5D648 + 0x40, frontier_df4_menu_002_A5D648 + 0x44, frontier_df4_menu_002_A5D648 + 0x48, frontier_df4_menu_002_A5D648 + 0x4C, gUidebug_0 + 0x64C, frontier_df4_menu_005_A5FFAD + 0x6C\n"
"	.4byte UnitDef_Tower1Ally, UnitDef_Tower1Ally, 0x00000000, 0x00000000, 0x00000000, 0x00000000\n"
"	.4byte 0x00000000, 0x00000000, EventScr_Ch21b_BeginningScene + 0x1C, frontier_df3_eventscr_ch_021_A6FC48 + 0x54, 0x00080002, frontier_df3_eventscr_ch_021_A6FC48 + 0x168\n"
"	.4byte 0x0000FF01, 0x00000000, 0x00000000, 0x00000000, 0x00000001, frontier_df3_eventscr_ch_021_A6FC48 + 0x100\n"
"	.4byte 0x00000006, 0x0007000B, frontier_df3_eventscr_ch_021_A6FC48 + 0x134, 0x11130111, 0x00000001, EventScr_GameOver\n"
"	.4byte 0x00000065, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000\n"
"	.4byte gChDAsset_140 + 0x50, gChDAsset_140 + 0x60, gChDAsset_140 + 0x64, gChDAsset_140 + 0x68, gChDAsset_140 + 0x90, gChDAsset_140 + 0x94\n"
"	.4byte gChDAsset_140 + 0x98, gChDAsset_140 + 0x9C, gUidebug_0 + 0x64D, frontier_df4_menu_005_A5FFAD + 0x6D, UnitDef_Tower2Ally, UnitDef_Tower2Ally\n"
"	.4byte 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000\n"
"	.4byte frontier_df3_eventscr_ch_021_A6FC48 + 0x88, frontier_df3_eventscr_ch_021_A6FC48 + 0x100, 0x00000000, 0x00000000, 0x00000007, 0x0BB80077\n"
"	.4byte 0x0014030A, 0x00000000, 0x00000001, frontier_df3_eventscr_ch_021_A6FC48 + 0x1F4, 0x00000006, 0x00000001\n"
"	.4byte EventScr_GameOver, 0x00000065, 0x00000000, 0x00000000, 0x00000000, 0x00000000\n"
"	.4byte 0x00000000, gChDAsset_143 + 0x50, gChDAsset_143 + 0x54, gChDAsset_143 + 0x58, gChDAsset_143 + 0x68, gChDAsset_143 + 0x84\n"
"	.4byte gChDAsset_143 + 0x88, gChDAsset_143 + 0x8C, gChDAsset_143 + 0x90, gUidebug_0 + 0x64E, frontier_df4_menu_005_A5FFAD + 0x6E, UnitDef_Tower3Ally\n"
"	.4byte UnitDef_Tower3Ally, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000\n"
"	.4byte 0x00000000, frontier_df3_eventscr_ch_021_A6FC48 + 0x180, frontier_df3_eventscr_ch_021_A6FC48 + 0x1F4, 0x00000000, 0x00000000, 0x00000000\n"
"	.4byte 0x00000001, frontier_df3_eventscr_ch_021_A6FC48 + 0x2AC, 0x00000006, 0x00000001, EventScr_GameOver, 0x00000065\n"
"	.4byte 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, gChDAsset_146 + 0x50\n"
"	.4byte gChDAsset_146 + 0x54, gChDAsset_146 + 0x58, gChDAsset_146 + 0x5C, gChDAsset_146 + 0x78, gChDAsset_146 + 0x7C, gChDAsset_146 + 0x80\n"
"	.4byte gChDAsset_146 + 0x84, gUidebug_0 + 0x64F, frontier_df4_menu_005_A5FFAD + 0x6F, UnitDef_Tower4Ally, UnitDef_Tower4Ally, 0x00000000\n"
"	.4byte 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, frontier_df3_eventscr_ch_021_A6FC48 + 0x238\n"
"	.4byte frontier_df3_eventscr_ch_021_A6FC48 + 0x2AC, 0x00000002, frontier_df3_eventscr_ch_021_A6FC48 + 0x388, 0x00000602, 0x00000000, 0x00000000\n"
"	.4byte 0x00000005, gUidebug_0 + 0x60, 0x00140906, 0x00000005, gUidebug_0 + 0x6E, 0x00140E0E\n"
"	.4byte 0x00000000, 0x00000001, frontier_df3_eventscr_ch_021_A6FC48 + 0x354, 0x00000006, 0x00000001, EventScr_GameOver\n"
"	.4byte 0x00000065, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000\n"
"	.4byte gChDAsset_149 + 0x50, gChDAsset_149 + 0x60, gChDAsset_149 + 0x64, gChDAsset_149 + 0x80, gChDAsset_149 + 0x9C, gChDAsset_149 + 0xA0\n"
"	.4byte gChDAsset_149 + 0xA4, gChDAsset_149 + 0xA8, gUidebug_0 + 0x650, frontier_df4_menu_005_A5FFAD + 0x70, UnitDef_Tower5Ally, UnitDef_Tower5Ally\n"
"	.4byte 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000\n"
"	.4byte frontier_df3_eventscr_ch_021_A6FC48 + 0x2E0, frontier_df3_eventscr_ch_021_A6FC48 + 0x354, 0x00000000, 0x00000000, 0x00000005, gUidebug_0 + 0x7C\n"
"	.4byte 0x00141202, 0x00000005, gUidebug_0 + 0x86, 0x0014010C, 0x00000005, gUidebug_0 + 0x9A\n"
"	.4byte 0x0014010A, 0x00000007, 0x13880077, 0x00140113, 0x00000000, 0x00000001\n"
"	.4byte frontier_df3_eventscr_ch_021_A6FC48 + 0x414, 0x00000006, 0x00000001, EventScr_GameOver, 0x00000065, 0x00000000\n"
"	.4byte 0x00000000, 0x00000000, 0x00000000, 0x00000000\n"
);
u8 frontier_df4_menu_003_A5E6CC[] __attribute__((section(".data.frontier_df4_menu.gap3"))) = INCBIN_U8("graphics/frontier_df4_menu/frontier_df4_menu_003_A5E6CC.bin");
u8 frontier_df4_menu_004_A5F770[] __attribute__((section(".data.frontier_df4_menu.gap4"))) = INCBIN_U8("graphics/frontier_df4_menu/frontier_df4_menu_004_A5F770.bin");
u8 frontier_df4_menu_005_A5FFAD[] __attribute__((section(".data.frontier_df4_menu.gap5"))) = INCBIN_U8("graphics/frontier_df4_menu/frontier_df4_menu_005_A5FFAD.bin", 0x0, 0x103);
u8 data_08A600B0[] __attribute__((section(".data.frontier_df4_menu.gap5"))) = INCBIN_U8("graphics/frontier_df4_menu/frontier_df4_menu_005_A5FFAD.bin", 0x103, 0x148);
EventListScr frontier_df4_menu_006_A65504[] __attribute__((section(".data.frontier_df4_menu.gap6"))) = {
    MUSC(0x31)
    SVAL(EVT_SLOT_2, 0xF)
    CALL(0x8A60420)
    TEXTSHOW(0xBC6)
    TEXTEND
    FADI(0x10)
    REMA
    SVAL(EVT_SLOT_2, 0xF)
    CALL(0x8A60420)
    TEXTSHOW(0xBC7)
    TEXTEND
    REMA
    SVAL(EVT_SLOT_2, 0x13)
    CALL(0x8A60420)
    TEXTSHOW(0xBC8)
    TEXTEND
    REMA
    EvtBgmFadeIn(0x7FFF, 4)
    STAL(0x1E)
    MUSC(0x2B)
    SVAL(EVT_SLOT_2, 0x13)
    CALL(0x8A60420)
    TEXTSHOW(0xBC9)
    TEXTEND
    MUSC(0x25)
    TEXTCONT
    TEXTEND
    FADI(0x10)
    REMA
    CALL(0x8A657F8)
    REMOVEPORTRAITS
    BACG(0x13)
    FADU(4)
    TEXTSHOW(0xBCD)
    TEXTEND
    REMA
    SVAL(EVT_SLOT_2, 0x13)
    CALL(0x8A60420)
    TEXTSHOW(0xBCE)
    TEXTEND
    REMA
    EvtBgmFadeIn(0x7FFF, 6)
    CALL(0x85B9D24)
    SVAL(EVT_SLOT_3, 0x2710)
    GIVEITEMTOMAIN(0)
    SVAL(EVT_SLOT_2, 0xF)
    CALL(0x8A60420)
    MUSC(0x29)
    TEXTSHOW(0xBCF)
    TEXTEND
    REMA
    CALL(0x85B9D24)
    EVBIT_MODIFY(4)
    TUTORIALTEXTBOXSTART
    SVAL(EVT_SLOT_B, 0xFFFFFFFF)
    TEXTSHOW(0xBD4)
    TEXTEND
    REMA
    LABEL(0)
    ASMC(0x8088799)
    SADD(EVT_SLOT_2, EVT_SLOT_C, EVT_SLOT_0)
    TUTORIALTEXTBOXSTART
    SVAL(EVT_SLOT_B, 0xFFFFFFFF)
    TEXTSHOW(0xFFFF)
    TEXTEND
    REMA
    SVAL(EVT_SLOT_7, 1)
    BNE(0, 0xC, 7)
    EVBIT_MODIFY(0)
    MUSC(0x24)
    CHECK_MODE
    SVAL(EVT_SLOT_1, 2)
    BNE(9, 0xC, 1)
    CHECK_ALIVE(0x10)
    BEQ(1, 0xC, 0)
    CHECK_ALIVE(0x11)
    BEQ(1, 0xC, 0)
    SVAL(EVT_SLOT_2, 0xF)
    CALL(0x8A60420)
    TEXTSHOW(0xBD0)
    TEXTEND
    GOTO(3)
    LABEL(1)
    CHECK_ALIVE(0x11)
    BEQ(2, 0xC, 0)
    SVAL(EVT_SLOT_2, 0xF)
    CALL(0x8A60420)
    TEXTSHOW(0xBD1)
    TEXTEND
    GOTO(3)
    LABEL(2)
    CHECK_ALIVE(0x10)
    BEQ(3, 0xC, 0)
    SVAL(EVT_SLOT_2, 0xF)
    CALL(0x8A60420)
    TEXTSHOW(0xBD2)
    TEXTEND
    LABEL(3)
    REMA
    FADI(0x10)
    MNCH(0xA)
    ASMC(0x8088869)
    REMU(0xF)
    ENDB
    LABEL(9)
    SVAL(EVT_SLOT_2, 0xF)
    CALL(0x8A60420)
    TEXTSHOW(0xBD3)
    TEXTEND
    REMA
    FADI(0x10)
    MNCH(0x17)
    ASMC(0x8088869)
    REMU(1)
    ENDB
};
EventListScr frontier_df4_menu_007_A657D4[] __attribute__((section(".data.frontier_df4_menu.gap7"))) = {
    EVENT_WORD(0x00120806)
    EVENT_WORD(0x00000001)
    EVENT_WORD(0x08A65768)
    EVENT_WORD(0x00000000)
    EVENT_WORD(0x00000000)
    EVENT_WORD(0x00000000)
    EVENT_WORD(0x00000000)
    EVENT_WORD(0x00000000)
    EVENT_WORD(0x00000000)
    SVAL(EVT_SLOT_B, 0x14000C)
    LOMA(0x2B)
    LOAD1(1, 0x890BE74)
    ENUN
    FADU(0x10)
    BROWNBOXTEXT(0x5FC, 8, 8)
    CALL(0x8A65830)
    CALL(0x8A659B4)
    ENDA
    LABEL(0x5F90)
    LOAD1(1, 0x890BEEC)
    ENUN
    SVAL(EVT_SLOT_B, 0x14000B)
    MOVE_1STEP(0, 0xFFFE, 2)
    ENUN
    SVAL(EVT_SLOT_D, 0)
    SVAL(EVT_SLOT_1, 0)
    SENQUEUE1
    SVAL(EVT_SLOT_B, 0x15000B)
    FIGHT_MAP(0x53, 0xFFFF, 0, 0)
    DISA(0xFFFE)
    SVAL(EVT_SLOT_B, 0x140009)
    MOVE(0, 0xFFFE, 9, 0x16)
    SVAL(EVT_SLOT_B, 0x14000D)
    MOVE(0x10, 0xFFFE, 0xD, 0x15)
    LOAD1(1, 0x890BF14)
    ENUN
    SVAL(EVT_SLOT_D, 0)
    SVAL(EVT_SLOT_1, 0x501)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0)
    SENQUEUE1
    SVAL(EVT_SLOT_B, 0x160009)
    FIGHT_MAP(0x80, 0xFFFF, 0, 0)
    DISA(0xFFFE)
    SVAL(EVT_SLOT_D, 0)
    SVAL(EVT_SLOT_1, 0x10000)
    SENQUEUE1
    SVAL(EVT_SLOT_B, 0x15000D)
    FIGHT_MAP(0x81, 0xFFFF, 0, 0)
    DISA(0xFFFE)
    MOVE(0, 0x80, 0xA, 0x14)
    MOVE(0, 0x81, 0xD, 0x12)
    SVAL(EVT_SLOT_B, 0x130010)
    MOVE(0, 0xFFFE, 0x13, 0xE)
    LOAD1(1, 0x890BF78)
    SVAL(EVT_SLOT_B, 0x130006)
    MOVE(0, 0xFFFE, 7, 0x18)
    LOAD1(1, 0x890BF50)
    ENUN
    SVAL(EVT_SLOT_D, 0)
    SVAL(EVT_SLOT_1, 0)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 1)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0)
    SENQUEUE1
    SVAL(EVT_SLOT_B, 0x180007)
    FIGHT_MAP(0x82, 0xFFFF, 0, 0)
    DISA(0xFFFE)
    MOVE(0, 0x82, 5, 0x18)
    MOVE(0x10, 0x53, 9, 0x11)
    STAL2(0x1E)
    FADI(0x10)
    ENUN
    CLEA
    CLEE
    CLEN
    ENDA
    LABEL(0x5F90)
    CAMERA2(0xB, 4)
    MUSS(0x2E)
    STAL(0x21)
    LOAD1(1, 0x890BFDC)
    ENUN
    FADU(0x10)
    SVAL(EVT_SLOT_2, 0x53)
    CALL(0x8A60CF0)
    CURSOR_CHAR(0x53)
    STAL(0x3C)
    CURE
    TEXTSTART
    TEXTSHOW(0xBCA)
    TEXTEND
    REMA
    MOVE(2, 0xC0, 0xA, 4)
    ENUN
    MOVE(0x10, 0x53, 0xB, 4)
    ENUN
    CURSOR_CHAR(0xC0)
    STAL(0x3C)
    CURE
    TEXTSTART
    TEXTSHOW(0xBCB)
    TEXTEND
    REMA
    SVAL(EVT_SLOT_1, 3)
    SET_HP(0xC0)
    SVAL(EVT_SLOT_D, 0)
    SVAL(EVT_SLOT_1, 0x10000)
    SENQUEUE1
    FIGHT_MAP(0x53, 0xC0, 0, 0)
    DISA(0xC0)
    MOVE_1STEP(0, 0x44, 2)
    ENUN
    CURSOR_CHAR(0x44)
    STAL(0x3C)
    CURE
    TEXTSTART
    TEXTSHOW(0xBCC)
    TEXTEND
    REMA
    MURE(4)
    FADI(4)
    CLEA
    CLEE
    CLEN
    ENDA
};
EventListScr frontier_df4_menu_008_A66F88[] __attribute__((section(".data.frontier_df4_menu.gap8"))) = {
    MUSS(0x30)
    STAL(0x21)
    TEXTSTART
    TEXTSHOW(0xA15)
    TEXTEND
    REMA
    MURE(2)
    CUSA(0x19)
    EVBIT_T(7)
    ENDA
    MUSS(0x30)
    STAL(0x21)
    TEXTSTART
    TEXTSHOW(0xA16)
    TEXTEND
    REMA
    MURE(2)
    CUSA(0x1A)
    EVBIT_T(7)
    ENDA
    SVAL(EVT_SLOT_2, 0x890E27C)
    CALL(0x8A603AC)
    EVBIT_T(7)
    ENDA
    SVAL(EVT_SLOT_2, 0)
    CALL(0x8A602F0)
    SVAL(EVT_SLOT_1, 0x10000)
    CHAI(0xB4)
    EVBIT_T(7)
    ENDA
    SVAL(EVT_SLOT_2, 0)
    CALL(0x8A602F0)
    SVAL(EVT_SLOT_1, 0x10500)
    CHAI(0xAF)
    SVAL(EVT_SLOT_1, 0x10000)
    CHAI(0xBC)
    SVAL(EVT_SLOT_1, 0x11200)
    CHAI(0xB8)
    EVBIT_T(7)
    ENDA
    SVAL(EVT_SLOT_2, 0)
    CALL(0x8A602F0)
    SVAL(EVT_SLOT_1, 0x10000)
    CHAI(0xAE)
    EVBIT_T(7)
    ENDA
    SVAL(EVT_SLOT_2, 0x890E2A4)
    CALL(0x8A603D4)
    EVBIT_T(7)
    ENDA
    SVAL(EVT_SLOT_2, 0x890E2F4)
    CALL(0x8A603D4)
    EVBIT_T(7)
    ENDA
    SVAL(EVT_SLOT_2, 0x890E344)
    CALL(0x8A603D4)
    EVBIT_T(7)
    ENDA
    MUSC(0x47)
    LOAD2(1, 0x890EB58)
    ENUN
    CURSOR_CHAR(1)
    STAL(0x3C)
    CURE
    TEXTSTART
    TEXTSHOW(0xA17)
    TEXTEND
    EvtBgmFadeIn(0x7FFF, 6)
    TEXTCONT
    TEXTEND
    REMA
    CAMERA2(0xA, 0x14)
    LOAD1(1, 0x890E7D4)
    ENUN
    SVAL(EVT_SLOT_2, 0x890EC0C)
    SVAL(EVT_SLOT_3, 1)
    CALL(0x8A60380)
    CURSOR_CHAR(2)
    STAL(0x3C)
    CURE
    MUSC(0x25)
    TEXTSTART
    TEXTSHOW(0xA18)
    TEXTEND
    REMA
    FADI(0x10)
    LOAD1(0, 0x890E6E4)
    ENUN
    CALL(0x85B9DBC)
    EvtBgmFadeIn(0x7FFF, 4)
    CAMERA2(7, 0x15)
    FADU(0x10)
    CURSOR_CHAR(0x17)
    STAL(0x3C)
    CURE
    MUSC(0xA)
    TEXTSTART
    TEXTSHOW(0xA19)
    TEXTEND
    REMA
    CAMERA2(9, 0xB)
    LOAD2(1, 0x890EBD0)
    ENUN
    CURSOR_CHAR(0x18)
    STAL(0x3C)
    CURE
    TEXTSTART
    TEXTSHOW(0xA1A)
    TEXTEND
    REMA
    SVAL(EVT_SLOT_D, 0)
    SVAL(EVT_SLOT_1, 0x2C9)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x309)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x305)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0)
    SENQUEUE1
    MOVE_DEFINED(0x18)
    SVAL(EVT_SLOT_D, 0)
    SVAL(EVT_SLOT_1, 0x2CB)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x2C9)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x309)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x306)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0)
    SENQUEUE1
    MOVE_DEFINED(0xC5)
    ENUN
    DISA(0x18)
    STAL(0x1E)
    MOVE(8, 0xC5, 7, 0xC)
    ENUN
    CURSOR_AT(5, 0xC)
    STAL(0x3C)
    CURE
    SVAL(EVT_SLOT_2, 1)
    CALL(0x8A60420)
    MUSI
    TEXTSHOW(0xA1B)
    TEXTEND
    REMA
    MUNO
    FADI(0x10)
    CLEAN
    DISA(0xC5)
    LOAD1(1, 0x890EA54)
    ENUN
    ENUT(7)
    ENUT(8)
    EVBIT_T(7)
    ENDA
    MUSC(0x31)
    FADI(0x10)
    CLEA
    CLEE
    CLEN
    CHECK_EXISTS(0x18)
    BNE(2, 0xC, 0)
    CHECK_ALIVE(0x17)
    BEQ(0, 0xC, 0)
    SVAL(EVT_SLOT_2, 1)
    CALL(0x8A60420)
    TEXTSHOW(0xA1C)
    TEXTEND
    GOTO(1)
    LABEL(0)
    CHECK_ALIVE(0x15)
    BEQ(2, 0xC, 0)
    SVAL(EVT_SLOT_2, 1)
    CALL(0x8A60420)
    TEXTSHOW(0xA1D)
    TEXTEND
    LABEL(1)
    FADI(0x10)
    LOAD1(1, 0x890EB30)
    ENUN
    LABEL(2)
    CLEAN
    CAMERA2(0xC, 4)
    FADU(0x10)
    STAL(0xF)
    CURSOR_AT(0xC, 1)
    STAL(0x3C)
    CURE
    CHECK_ALIVE(0x17)
    BEQ(0xA, 0xC, 0)
    SVAL(EVT_SLOT_2, 6)
    CALL(0x8A60420)
    TEXTSHOW(0xA1E)
    TEXTEND
    REMA
    EvtBgmFadeIn(0x7FFF, 4)
    FADI(0x10)
    SVAL(EVT_SLOT_2, 1)
    CALL(0x8A60420)
    MUSC(0x2B)
    TEXTSHOW(0xA1F)
    TEXTEND
    EvtBgmFadeIn(0x7FFF, 4)
    STAL3(0x20)
    MUSC(0x32)
    TEXTCONT
    TEXTEND
    REMA
    FADI(4)
    SVAL(EVT_SLOT_2, 4)
    CALL(0x8A60420)
    TEXTSHOW(0xA20)
    TEXTEND
    REMA
    GOTO(0xB)
    LABEL(0xA)
    MUSC(0x32)
    SVAL(EVT_SLOT_2, 4)
    CALL(0x8A60420)
    TEXTSHOW(0xA21)
    TEXTEND
    REMA
    EvtBgmFadeIn(0x7FFF, 4)
    FADI(0x10)
    SVAL(EVT_SLOT_2, 1)
    CALL(0x8A60420)
    MUSC(0x2B)
    TEXTSHOW(0xA22)
    TEXTEND
    EvtBgmFadeIn(0x7FFF, 4)
    STAL3(0x20)
    MUSC(0x32)
    TEXTCONT
    TEXTEND
    REMA
    FADI(4)
    SVAL(EVT_SLOT_2, 4)
    CALL(0x8A60420)
    TEXTSHOW(0xA23)
    TEXTEND
    REMA
    LABEL(0xB)
    ENUT(0x74)
    MNCH(0xD)
    ENDA
};
EventListScr frontier_df4_menu_009_A67660[] __attribute__((section(".data.frontier_df4_menu.gap9"))) = {
    SVAL(EVT_SLOT_2, 0)
    CALL(0x8A60B90)
    SVAL(EVT_SLOT_2, 0x11)
    CALL(0x8A60420)
    TEXTSHOW(0xA29)
    TEXTEND
    REMA
    FADI(0x10)
    SVAL(EVT_SLOT_B, 0)
    LOMA(0x3F)
    FADU(0x10)
    LOAD1(1, 0x890FED0)
    ENUN
    CLEE
    CURSOR_AT(0xA, 4)
    STAL(0x3C)
    CURE
    SVAL(EVT_SLOT_2, 0x11)
    CALL(0x8A60420)
    TEXTSHOW(0xA2A)
    TEXTEND
    REMA
    FADI(0x10)
    SVAL(EVT_SLOT_B, 0)
    LOMA(0x49)
    EvtSetLoadUnitNoREDA
    LOAD2(1, 0x890FF24)
    ENUN
    DISA(0xCC)
    FADU(0x10)
    LOAD2(1, 0x890FF24)
    ENUN
    CURSOR_CHAR(0xCC)
    STAL(0x3C)
    CURE
    SVAL(EVT_SLOT_2, 0x25)
    CALL(0x8A60420)
    MUSC(0x25)
    TEXTSHOW(0xA2B)
    TEXTEND
    REMA
    FADI(4)
    CLEA
    CLEE
    CLEN
    SVAL(EVT_SLOT_2, 0x25)
    CALL(0x8A60420)
    TEXTSHOW(0xA2C)
    TEXTEND
    REMA
    FADI(0x10)
    SVAL(EVT_SLOT_B, 0x90012)
    LOMA(0xD)
    LOAD1(1, 0x890EFD4)
    ENUN
    SVAL(EVT_SLOT_2, 0x890F178)
    SVAL(EVT_SLOT_3, 1)
    CALL(0x8A60380)
    CHECK_EVENTID(0x86)
    BNE(0, 0xC, 0)
    CHECK_EXISTS(0x12)
    BNE(0, 0xC, 0)
    LOAD1(1, 0x890F470)
    ENUN
    GOTO(1)
    LABEL(0)
    ENUT(7)
    LABEL(1)
    FADU(0x10)
    CURSOR_AT(0x17, 0xB)
    STAL(0x3C)
    CURE
    MUSS(0x2E)
    STAL(0x21)
    SVAL(EVT_SLOT_2, 0x39)
    SVAL(EVT_SLOT_3, 0xA2D)
    CALL(0x8A60448)
    LOAD1(1, 0x890F498)
    ENUN
    LOAD1(1, 0x890EFAC)
    ENUN
    DISA(0x53)
    CAMERA2(0xD, 9)
    LOAD2(1, 0x890F4C0)
    ENUN
    SVAL(EVT_SLOT_1, 0)
    SET_STATE(1)
    SVAL(EVT_SLOT_1, 0)
    SET_STATE(0x19)
    SVAL(EVT_SLOT_1, 0)
    SET_STATE(0xB)
    SVAL(EVT_SLOT_1, 0)
    SET_STATE(2)
    LOAD3(0, 0x890F524)
    ENUN
    SVAL(EVT_SLOT_1, 0xFFFFFFFF)
    SET_STATE(1)
    SVAL(EVT_SLOT_1, 0xFFFFFFFF)
    SET_STATE(0x19)
    SVAL(EVT_SLOT_1, 0xFFFFFFFF)
    SET_STATE(0xB)
    SVAL(EVT_SLOT_1, 0xFFFFFFFF)
    SET_STATE(2)
    CURSOR_CHAR(1)
    STAL(0x3C)
    CURE
    SVAL(EVT_SLOT_2, 0x23)
    CALL(0x8A60420)
    MURE(2)
    TEXTSHOW(0xA2E)
    TEXTEND
    REMA
    CALL(0x85B9DBC)
    ENDA
};
EventListScr frontier_df4_menu_010_A67EEC[] __attribute__((section(".data.frontier_df4_menu.gap10"))) = {
    FADI(0x10)
    SVAL(EVT_SLOT_2, 0x1C)
    CALL(0x8A606F4)
    MUSC(0x26)
    CLEA
    CLEE
    CLEN
    SVAL(EVT_SLOT_B, 0)
    LOMA(0x4A)
    FADU(0x10)
    LOAD1(1, 0x89109BC)
    ENUN
    CURSOR_CHAR(0x53)
    STAL(0x3C)
    CURE
    SVAL(EVT_SLOT_2, 0x13)
    SVAL(EVT_SLOT_3, 0xA4C)
    CALL(0x8A60448)
    MOVE_1STEP(0x10, 0x53, 3)
    ENUN
    SVAL(EVT_SLOT_D, 0)
    FIGHT_MAP(0x53, 0xCB, 0, 0)
    DISA(0xC0)
    CURSOR_CHAR(0x53)
    STAL(0x3C)
    CURE
    TEXTSTART
    TEXTSHOW(0xA4D)
    TEXTEND
    REMA
    SVAL(EVT_SLOT_2, 0x53)
    CALL(0x8A60CF0)
    MOVE(0x30, 0x40, 6, 3)
    ENUN
    CURSOR_CHAR(0x53)
    STAL(0x3C)
    CURE
    SVAL(EVT_SLOT_2, 0x13)
    CALL(0x8A60420)
    TEXTSHOW(0xA4E)
    TEXTEND
    REMA
    EvtBgmFadeIn(0x7FFF, 4)
    FADI(0x10)
    SVAL(EVT_SLOT_B, 0x7000A)
    LOMA(0xE)
    CLEA
    CLEE
    CLEN
    EvtSetLoadUnitNoREDA
    LOAD2(1, 0x891075C)
    ENUN
    FADU(0x10)
    CURSOR_CHAR(1)
    STAL(0x3C)
    CURE
    TEXTSTART
    TEXTSHOW(0xA4F)
    TEXTEND
    REMA
    LOAD2(1, 0x891075C)
    ENUN
    SPAWN_ENEMY(0x40, 0, 0)
    SVAL(EVT_SLOT_2, 0x40)
    MOVE_CLOSEST(0xFFFF, 0xFFFD, 9, 8)
    CALL(0x8A60630)
    STAL(0xF)
    MOVE_1STEP(0, 0x40, 2)
    ENUN
    CURSOR_CHAR(0x40)
    STAL(0x3C)
    CURE
    MUSC(0x2C)
    TEXTSTART
    TEXTSHOW(0xA50)
    TEXTEND
    REMA
    SVAL(EVT_SLOT_2, 0x40)
    CALL(0x8A60654)
    DISA(0x40)
    EvtBgmFadeIn(0x7FFF, 4)
    LOAD2(1, 0x89107AC)
    ENUN
    CURSOR_CHAR(0x19)
    STAL(0x3C)
    CURE
    TEXTSTART
    TEXTSHOW(0xA51)
    TEXTEND
    REMA
    LOAD2(1, 0x89107D4)
    STAL2(0x1E)
    FADI(0x10)
    ENUN
    SVAL(EVT_SLOT_2, 0x13)
    CALL(0x8A60420)
    CHECK_ALIVE(0x20)
    BEQ(0, 0xC, 0)
    TEXTSHOW(0xA52)
    TEXTEND
    EvtBgmFadeIn(0x29, 6)
    TEXTCONT
    TEXTEND
    REMA
    CALL(0x85B9D24)
    SVAL(EVT_SLOT_3, 0x91)
    GIVEITEMTO(0x20)
    CALL(0x85B9D24)
    SVAL(EVT_SLOT_3, 0x3E)
    GIVEITEMTO(0x20)
    GOTO(1)
    LABEL(0)
    TEXTSHOW(0xA55)
    TEXTEND
    EvtBgmFadeIn(0x29, 6)
    TEXTCONT
    TEXTEND
    REMA
    CALL(0x85B9D24)
    SVAL(EVT_SLOT_3, 0x91)
    GIVEITEMTO(1)
    CALL(0x85B9D24)
    SVAL(EVT_SLOT_3, 0x3E)
    GIVEITEMTO(1)
    LABEL(1)
    EvtBgmFadeIn(0x7FFF, 6)
    FADI(0x10)
    TILECHANGE(2)
    CLEAN
    CAMERA(0x18, 0)
    EvtSetLoadUnitNoREDA
    LOAD2(1, 0x8910810)
    ENUN
    DISA(0xCD)
    CHECK_ALIVE(0x20)
    BEQ(2, 0xC, 0)
    FADU(0x10)
    CURSOR_CHAR(0x20)
    STAL(0x3C)
    CURE
    SVAL(EVT_SLOT_2, 0x3F)
    CALL(0x8A60420)
    MUSC(0x32)
    TEXTSHOW(0xA53)
    TEXTEND
    REMA
    FADI(0x10)
    CLEAN
    LABEL(2)
    FADU(0x10)
    STAL(0xF)
    LOAD2(1, 0x8910810)
    ENUN
    CURSOR_CHAR(0xCD)
    STAL(0x3C)
    CURE
    SVAL(EVT_SLOT_2, 0x3F)
    CALL(0x8A60420)
    CHECK_ALIVE(0x20)
    BEQ(0xA, 0xC, 0)
    MUSC(0x26)
    TEXTSHOW(0xA54)
    TEXTEND
    GOTO(0xB)
    LABEL(0xA)
    MUSC(0x26)
    TEXTSHOW(0xA56)
    TEXTEND
    LABEL(0xB)
    EVENT_WORD(0x00422141)
    EVENT_WORD(0x00040001)
    REMOVEPORTRAITS
    TEXTCONT
    TEXTEND
    REMA
    FADI(0x10)
    CLEA
    CLEE
    CLEN
    SVAL(EVT_SLOT_B, 0x4000E)
    LOMA(0xF)
    FADU(0x10)
    LOAD2(1, 0x8910A34)
    ENUN
    CURSOR_CHAR(1)
    STAL(0x3C)
    CURE
    SVAL(EVT_SLOT_2, 0x49)
    CALL(0x8A60420)
    TEXTSHOW(0xA57)
    TEXTEND
    FADI(0x10)
    REMA
    ENUT(0x76)
    MNCH(0xF)
    ENDA
    MUSS(0x30)
    STAL(0x21)
    TEXTSTART
    TEXTSHOW(0xA58)
    TEXTEND
    REMA
    MURE(2)
    CUSA(0x1C)
    EVBIT_T(7)
    ENDA
};
EventListScr frontier_df4_menu_011_A71268[] __attribute__((section(".data.frontier_df4_menu.gap11"))) = {
    SVAL(EVT_SLOT_2, 0)
    CALL(0x8A60960)
    SVAL(EVT_SLOT_D, 0)
    SVAL(EVT_SLOT_1, 0x32)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x19)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0xF)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 5)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 5)
    SENQUEUE1
    CALL(0x8A60984)
    LOAD1(1, 0x8923AD8)
    ENUN
    CALL(0x85B9DBC)
    ENUT(8)
    ENDA
    SVAL(EVT_SLOT_2, 0x2E)
    SVAL(EVT_SLOT_3, 0x37)
    CALL(0x8A60A58)
    ENDA
    SVAL(EVT_SLOT_2, 0)
    CALL(0x8A602F0)
    SVAL(EVT_SLOT_1, 0x10000)
    CHAI(0xBD)
    EVBIT_T(7)
    ENDA
    SVAL(EVT_SLOT_2, 0)
    CALL(0x8A602F0)
    COUNTER_SET(7, 3)
    ENUF(8)
    EVBIT_T(7)
    ENDA
    SVAL(EVT_SLOT_2, 0x8923E5C)
    CALL(0x8A603AC)
    COUNTER_DEC(7)
    ENUF(8)
    COUNTER_CHECK(7)
    BNE(0, 0xC, 0)
    ENUT(8)
    LABEL(0)
    EVBIT_T(7)
    ENDA
    SVAL(EVT_SLOT_2, 0)
    CALL(0x8A60960)
    SVAL(EVT_SLOT_D, 0)
    SVAL(EVT_SLOT_1, 0x32)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x19)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0xF)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 5)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 5)
    SENQUEUE1
    CALL(0x8A60984)
    LOAD1(1, 0x8923F38)
    ENUN
    CALL(0x85B9DBC)
    ENDA
    SVAL(EVT_SLOT_2, 0x6D)
    CALL(0x8A602BC)
    SVAL(EVT_SLOT_2, 0x2E)
    CALL(0x8A60AB4)
    ENDA
    CHECK_EVENTID(0x88)
    BEQ(0x801C, 0xC, 0)
    CALL(0x8A65504)
    LABEL(0x801C)
    MUSC(0x31)
    SVAL(EVT_SLOT_2, 0x13)
    CALL(0x8A60420)
    CHECK_ALIVE(3)
    BEQ(0, 0xC, 0)
    TEXTSHOW(0xBBF)
    TEXTEND
    EvtBgmFadeIn(0x7FFF, 4)
    TEXTCONT
    TEXTEND
    MUSC(0x32)
    TEXTCONT
    TEXTEND
    GOTO(1)
    LABEL(0)
    TEXTSHOW(0xBC0)
    TEXTEND
    EvtBgmFadeIn(0x7FFF, 4)
    TEXTCONT
    TEXTEND
    MUSC(0x32)
    TEXTCONT
    TEXTEND
    LABEL(1)
    REMA
    CALL(0x85B9D24)
    SVAL(EVT_SLOT_3, 0x1388)
    GIVEITEMTOMAIN(0)
    FADI(4)
    REMOVEPORTRAITS
    BACG(0x15)
    MUSC(0x32)
    FADU(4)
    TEXTSHOW(0xBC1)
    TEXTEND
    REMA
    FADI(0x10)
    LOAD1(1, 0x8908958)
    ENUN
    ENUT(0x8A)
    MNCH(2)
    ENDA
    ENDA
    LOAD1(1, 0x8924118)
    ENUN
    CALL(0x85B9DBC)
    EVBIT_T(7)
    ENDA
    MNCH(0)
    ENDA
    LOAD1(1, 0x89253B0)
    ENUN
    LOAD1(1, 0x892548C)
    ENUN
    ENDA
    ENDA
    MNCH(0x3B)
    ENDA
    EVENT_WORD(0x615F5B58)
    EVENT_WORD(0x00000000)
    LABEL(0)
    STAL1(0xFFFF)
    CLEA
    CLEE
    CLEN
    ASMC(0x8088A6D)
    LOAD2(1, 0x3001CE0)
    ENUN
    GOTO(0)
    ENDA
    LOAD1(0, 0x89255E0)
    ENUN
    LOAD1(1, 0x8925AA4)
    ENUN
    EVBIT_T(7)
    ENDA
    MNCH(0x3C)
    EVBIT_T(7)
    ENDA
    BROWNBOXTEXT(6, 0x10, 0x10)
    EVBIT_T(7)
    ENDA
};
EventListScr frontier_df4_menu_012_A71CC4[] __attribute__((section(".data.frontier_df4_menu.gap12"))) = {
    CHECK_CHAPTER_NUMBER
    LABEL(0)
    SDEQUEUE(7)
    SDEQUEUE(2)
    BNE(0, 7, 0xC)
    CALL(0xFFFFFFFF)
    ENDA
    SVAL(EVT_SLOT_D, 0)
    SVAL(EVT_SLOT_1, 4)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x8A71F3C)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 7)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x8A71FCC)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0xB)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x8A72044)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0xD)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x8A720EC)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x11)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x8A72158)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x12)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x8A721F4)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x18)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x8A72264)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x1A)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x8A72318)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x1E)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x8A72158)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x1F)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x8A721F4)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x39)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x8A723A8)
    SENQUEUE1
    CALL(0x8A71CC4)
    TILECHANGE(0xFFFD)
    LOAD4(1, 0)
    ENUN
    CALL(0x85B9DBC)
    ENDA
    SVAL(EVT_SLOT_D, 0)
    SVAL(EVT_SLOT_1, 4)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x8A71FC0)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 7)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x8A72038)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0xB)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x8A720E0)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0xD)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x8A7214C)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x11)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x8A721E8)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x12)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x8A72258)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x18)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x8A7230C)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x1A)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x8A7239C)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x1E)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x8A721E8)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x1F)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x8A72258)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x39)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x8A72408)
    SENQUEUE1
    CALL(0x8A71CC4)
    MNCH(0xFFFF)
    ENDA
};
__asm__(
    ".section .data.frontier_df4_menu.gap13, \"aw\", %progbits\n"
    ".global frontier_df4_menu_013_A72408\n"
    "frontier_df4_menu_013_A72408:\n"
    ".4byte 0x00020540\n"
    ".4byte 0x00000004\n"
    ".4byte 0x00000120\n"
    ".4byte 0x00070228\n"
    ".4byte 0x00000120\n"
    ".4byte 0x00070228\n"
    ".4byte 0x00000120\n"
    ".4byte 0x00000d40\n"
    ".4byte StartBonusClaimScreen\n"
    ".4byte 0x00010e20\n"
    ".4byte 0x00000120\n"
    ".4byte 0x00021020\n"
    ".4byte 0x00331220\n"
    ".4byte 0x00020540\n"
    ".4byte UnitDef_UnusedAlly_1\n"
    ".4byte 0x00030540\n"
    ".4byte 0x00000bd9\n"
    ".4byte 0x00000a40\n"
    ".4byte EventScr_EphraimModeGameEnd + 0xb8\n"
    ".4byte 0x00203322\n"
    ".4byte 0x00000c40\n"
    ".4byte 0x0000000c\n"
    ".4byte 0x00012c41\n"
    ".4byte UnitDef_UnusedAlly_3\n"
    ".4byte 0x00003020\n"
    ".4byte 0x000b0540\n"
    ".4byte 0x00000017\n"
    ".4byte 0x000f2520\n"
    ".4byte 0x00101720\n"
    ".4byte 0x05ef3a41\n"
    ".4byte 0x00080008\n"
    ".4byte 0x00082f42\n"
    ".4byte 0x00020020\n"
    ".4byte 0x00003020\n"
    ".4byte 0x00203b21\n"
    ".4byte 0x003c0e20\n"
    ".4byte 0x00003b22\n"
    ".4byte 0x0bda1b20\n"
    ".4byte 0x00001d20\n"
    ".4byte 0x00010920\n"
    ".4byte 0x00000820\n"
    ".4byte 0x00012c41\n"
    ".4byte UnitDef_UnusedAlly_4\n"
    ".4byte 0x00003020\n"
    ".4byte 0x000b0540\n"
    ".4byte 0x00000017\n"
    ".4byte 0x000f2520\n"
    ".4byte 0x00101720\n"
    ".4byte 0x05ef3a41\n"
    ".4byte 0x00080008\n"
    ".4byte 0x00082f42\n"
    ".4byte 0x0002001e\n"
    ".4byte 0x00003020\n"
    ".4byte 0x001e3b21\n"
    ".4byte 0x003c0e20\n"
    ".4byte 0x00003b22\n"
    ".4byte 0x0bdb1b20\n"
    ".4byte 0x00001d20\n"
    ".4byte 0x00010820\n"
    ".4byte 0x00041721\n"
    ".4byte 0x00001b22\n"
    ".4byte 0x0000342a\n"
    ".4byte 0x0000342c\n"
    ".4byte 0x0000342b\n"
    ".4byte 0x00020540\n"
    ".4byte UnitDef_UnusedAlly_19\n"
    ".4byte 0x00030540\n"
    ".4byte 0x00000bdc\n"
    ".4byte 0x00000a40\n"
    ".4byte EventScr_EphraimModeGameEnd + 0x128\n"
    ".4byte 0x00020540\n"
    ".4byte data_08926134 + 0x58\n"
    ".4byte 0x00030540\n"
    ".4byte 0x00000bdd\n"
    ".4byte 0x00000a40\n"
    ".4byte EventScr_EphraimModeGameEnd + 0x1a0\n"
    ".4byte 0x00000a40\n"
    ".4byte EventScr_EphraimModeGameEnd + 0x1f4\n"
    ".4byte 0x00000120\n"
    ".4byte 0x00021020\n"
    ".4byte 0x00331220\n"
    ".4byte 0x00020540\n"
    ".4byte UnitDef_UnusedAlly_2\n"
    ".4byte 0x00030540\n"
    ".4byte 0x00000bde\n"
    ".4byte 0x00000a40\n"
    ".4byte EventScr_EphraimModeGameEnd + 0xb8\n"
    ".4byte 0x00012c41\n"
    ".4byte UnitDef_UnusedAlly_5\n"
    ".4byte 0x00003020\n"
    ".4byte 0x000b0540\n"
    ".4byte 0x0008000c\n"
    ".4byte 0x000c2520\n"
    ".4byte 0x00101720\n"
    ".4byte 0x05ed3a41\n"
    ".4byte 0x00080008\n"
    ".4byte 0x00001a20\n"
    ".4byte 0x00082f42\n"
    ".4byte 0x0002001e\n"
    ".4byte 0x00003020\n"
    ".4byte 0x001e3b21\n"
    ".4byte 0x003c0e20\n"
    ".4byte 0x00003b22\n"
    ".4byte 0x0bdf1b20\n"
    ".4byte 0x00001d20\n"
    ".4byte 0x00041721\n"
    ".4byte 0x00001b22\n"
    ".4byte 0x0000342a\n"
    ".4byte 0x0000342c\n"
    ".4byte 0x0000342b\n"
    ".4byte 0x00020540\n"
    ".4byte UnitDef_UnusedAlly_20\n"
    ".4byte 0x00030540\n"
    ".4byte 0x00000be0\n"
    ".4byte 0x00000a40\n"
    ".4byte EventScr_EphraimModeGameEnd + 0x128\n"
    ".4byte 0x00020540\n"
    ".4byte data_08926134 + 0x94\n"
    ".4byte 0x00030540\n"
    ".4byte 0x00000be1\n"
    ".4byte 0x00000a40\n"
    ".4byte EventScr_EphraimModeGameEnd + 0x1a0\n"
    ".4byte 0x00000a40\n"
    ".4byte EventScr_EphraimModeGameEnd + 0x1f4\n"
    ".4byte 0x00000120\n"
    ".4byte 0x00012c41\n"
    ".4byte UnitDef_UnusedMixed\n"
    ".4byte 0x00003020\n"
    ".4byte 0x00012c41\n"
    ".4byte 0xffffffff\n"
    ".4byte 0x00003020\n"
    ".4byte 0x000b0540\n"
    ".4byte 0x000c0011\n"
    ".4byte 0x00132520\n"
    ".4byte 0x00101720\n"
    ".4byte 0x05f93a41\n"
    ".4byte 0x00080008\n"
    ".4byte 0x00082f42\n"
    ".4byte 0x00020019\n"
    ".4byte 0x00003020\n"
    ".4byte 0x00193b21\n"
    ".4byte 0x003c0e20\n"
    ".4byte 0x00003b22\n"
    ".4byte 0x00001a20\n"
    ".4byte 0x00320620\n"
    ".4byte 0xffff1b20\n"
    ".4byte 0x00001d20\n"
    ".4byte 0x00041721\n"
    ".4byte 0x00001b22\n"
    ".4byte 0x0000342a\n"
    ".4byte 0x0000342c\n"
    ".4byte 0x0000342b\n"
    ".4byte 0x00000120\n"
    ".4byte 0x00002b22\n"
    ".4byte 0x00012c41\n"
    ".4byte data_08925F90 + 0x64\n"
    ".4byte 0x00003020\n"
    ".4byte 0x00012c41\n"
    ".4byte 0xffffffff\n"
    ".4byte 0x00003020\n"
    ".4byte 0x000b0540\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00402520\n"
    ".4byte 0x00101720\n"
    ".4byte 0x05f63a41\n"
    ".4byte 0x00080008\n"
    ".4byte 0x000b3b21\n"
    ".4byte 0x003c0e20\n"
    ".4byte 0x00003b22\n"
    ".4byte 0x00320620\n"
    ".4byte 0x00001a20\n"
    ".4byte 0xffff1b20\n"
    ".4byte 0x00001d20\n"
    ".4byte 0x00001b22\n"
    ".4byte 0x00012c41\n"
    ".4byte data_08925F90 + 0x64\n"
    ".4byte 0x00200e22\n"
    ".4byte 0x00041721\n"
    ".4byte 0x00003020\n"
    ".4byte 0x0000342a\n"
    ".4byte 0x0000342c\n"
    ".4byte 0x0000342b\n"
    ".4byte 0x00000120\n"
    ".4byte 0x000b0540\n"
    ".4byte 0x0005000e\n"
    ".4byte 0x00102520\n"
    ".4byte 0x00041720\n"
    ".4byte 0x00012c41\n"
    ".4byte 0xffffffff\n"
    ".4byte 0x00003020\n"
    ".4byte 0x00013b21\n"
    ".4byte 0x003c0e20\n"
    ".4byte 0x00003b22\n"
    ".4byte 0x00001a20\n"
    ".4byte 0x00320620\n"
    ".4byte 0xffff1b20\n"
    ".4byte 0x00001d20\n"
    ".4byte 0x7fff1328\n"
    ".4byte 0x00021721\n"
    ".4byte 0x00001b22\n"
    ".4byte 0x0000342a\n"
    ".4byte 0x0000342c\n"
    ".4byte 0x0000342b\n"
    ".4byte 0x00000120\n"
    ".4byte 0x00020220\n"
    ".4byte 0x00000d40\n"
    ".4byte BMapDispSuspend\n"
    ".4byte 0x00421220\n"
    ".4byte 0x00000d40\n"
    ".4byte StartEndingCredits\n"
    ".4byte 0x005a0e20\n"
    ".4byte 0x00001a22\n"
    ".4byte 0x00002142\n"
    ".4byte 0x00020000\n"
    ".4byte 0x0be21b20\n"
    ".4byte 0x00001d20\n"
    ".4byte 0x7fff1328\n"
    ".4byte 0x00021721\n"
    ".4byte 0x00001b22\n"
    ".4byte 0x00020220\n"
    ".4byte 0x00780e20\n"
    ".4byte 0x00000d40\n"
    ".4byte StartEndingTurnRecordScreen\n"
    ".4byte 0x00010e20\n"
    ".4byte 0x00000a40\n"
    ".4byte EventScr_Ruin_84 + 0x8\n"
    ".4byte 0x005a0e20\n"
    ".4byte 0x00002a20\n"
    ".4byte 0x00000120\n"
    ".4byte 0x00000002\n"
    ".4byte sub_8088E30\n"
    ".4byte 0x00000003\n"
    ".4byte BackgroundSlide_Loop\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x02003c14\n"
    ".4byte 0x00000007\n"
    ".4byte 0x02003c1c\n"
    ".4byte 0x00000007\n"
    ".4byte 0x02003c24\n"
    ".4byte 0x00000003\n"
    ".4byte 0x02003c2c\n"
    ".4byte 0x00000003\n"
    ".4byte 0x02003c34\n"
    ".4byte 0x00000003\n"
    ".4byte 0x02003c3c\n"
    ".4byte 0x00000003\n"
    ".4byte 0x02003c44\n"
    ".4byte 0x00000003\n"
    ".4byte 0x02003c4c\n"
    ".4byte 0x00000003\n"
    ".4byte 0x02003c54\n"
    ".4byte 0x00000003\n"
    ".4byte 0x02003c5c\n"
    ".4byte 0x00000003\n"
    ".4byte 0x02003c64\n"
    ".4byte 0x00000003\n"
    ".4byte 0x02003c6c\n"
    ".4byte 0x00000003\n"
    ".4byte 0x02003c74\n"
    ".4byte 0x00000009\n"
    ".4byte 0x02003c7c\n"
    ".4byte 0x00000007\n"
    ".4byte 0x02003c84\n"
    ".4byte 0x00000009\n"
    ".4byte 0x02003c8c\n"
    ".4byte 0x00000007\n"
    ".4byte 0x02003c94\n"
    ".4byte 0x00000007\n"
    ".4byte 0x02003c9c\n"
    ".4byte 0x00000007\n"
    ".4byte 0x02003ca4\n"
    ".4byte 0x00000007\n"
    ".4byte 0x02003cac\n"
    ".4byte 0x00000007\n"
    ".4byte 0x02003cb4\n"
    ".4byte 0x00000007\n"
    ".4byte 0x02003cbc\n"
    ".4byte 0x00000003\n"
    ".4byte 0x02003cc4\n"
    ".4byte 0x00000003\n"
    ".4byte 0x02003ccc\n"
    ".4byte 0x00000003\n"
    ".4byte 0x02003cd4\n"
    ".4byte 0x00000003\n"
    ".4byte 0x02003cdc\n"
    ".4byte 0x00000002\n"
    ".4byte 0x02003ce4\n"
    ".4byte 0x00000002\n"
    ".4byte 0x02003cec\n"
    ".4byte 0x00000002\n"
    ".4byte 0x02003cf4\n"
    ".4byte 0x00000002\n"
    ".4byte 0x02003cfc\n"
    ".4byte 0x00000007\n"
    ".4byte 0x02003d04\n"
    ".4byte 0x00000007\n"
    ".4byte 0x02003d0c\n"
    ".4byte 0x00000007\n"
    ".4byte 0x02003d14\n"
    ".4byte 0x00000007\n"
    ".4byte 0x02003d1c\n"
    ".4byte 0x00000007\n"
    ".4byte 0x02003d24\n"
    ".4byte 0x00000010\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0xf4f6f9fc\n"
    ".4byte 0x090d7ff2\n"
    ".4byte 0x02030507\n"
    ".4byte 0x00800001\n"
    ".4byte 0x00000003\n"
    ".4byte PageSlide_OnLoop\n"
    ".4byte 0x00000002\n"
    ".4byte PageSlide_OnEnd\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x0000000e\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte GlowBlendCtrl_OnInit\n"
    ".4byte 0x00000003\n"
    ".4byte GlowBlendCtrl_OnLoop\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x0000000e\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte EndGlowBlendCtrl\n"
    ".4byte 0x00000002\n"
    ".4byte UnitSlide_InitFadeOut\n"
    ".4byte 0x00000003\n"
    ".4byte UnitSlide_FadeOutLoop\n"
    ".4byte 0x00000002\n"
    ".4byte UnitSlide_SetNewUnit\n"
    ".4byte 0x00000002\n"
    ".4byte UnitSlide_InitFadeIn\n"
    ".4byte 0x00000003\n"
    ".4byte UnitSlide_FadeInLoop\n"
    ".4byte 0x0000000e\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte StartGlowBlendCtrl\n"
    ".4byte 0x00000002\n"
    ".4byte ClearSlide\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x41040003\n"
    ".4byte 0x00009008\n"
    ".4byte 0x90284104\n"
    ".4byte 0x41040004\n"
    ".4byte 0x00089048\n"
    ".4byte 0x41040002\n"
    ".4byte 0x0000901e\n"
    ".4byte 0x903e4104\n"
    ".4byte 0x00050004\n"
    ".4byte 0x90044108\n"
    ".4byte 0x41080006\n"
    ".4byte 0x000a9024\n"
    ".4byte 0x90444108\n"
    ".4byte 0x4100000e\n"
    ".4byte 0x00009000\n"
    ".4byte 0x50200100\n"
    ".4byte 0x00060004\n"
    ".4byte 0x80004002\n"
    ".4byte 0x00020000\n"
    ".4byte 0x00044020\n"
    ".4byte 0x00308002\n"
    ".4byte 0x80020006\n"
    ".4byte 0x00061032\n"
    ".4byte 0x503a0002\n"
    ".4byte 0x40020004\n"
    ".4byte 0x0000904a\n"
    ".4byte gProcScr_SSUnitSlide + 0x58\n"
    ".4byte gProcScr_SSUnitSlide + 0x6c\n"
    ".4byte gProcScr_SSUnitSlide + 0x7a\n"
    ".4byte 0x00400000\n"
    ".4byte 0x0000000e\n"
);
/* frontier_df4_menu_014_A72BF0: atomic relocation carve (was INCBIN); every embedded ROM
   pointer expressed as .4byte Sym(+addend), byte-exact. make compare is the oracle. */
__asm__(
"	.section .data.frontier_df4_menu.gap14, \"aw\", %progbits\n"
"	.global frontier_df4_menu_014_A72BF0\n"
"frontier_df4_menu_014_A72BF0:\n"
"	.4byte 0x00000000, frontier_df4_menu_014_A72BF0 + 0x1C, 0x00000000, gHelpInfo_Ss0Pow + 0x54, 0x00005018, 0x00000000\n"
"	.4byte 0x0808AE61, frontier_df4_menu_014_A72BF0, frontier_df4_menu_014_A72BF0 + 0x38, 0x00000000, gHelpInfo_Ss0Pow + 0x8C, 0x066B6806\n"
"	.4byte 0x00000000, 0x0808AE8D, frontier_df4_menu_014_A72BF0 + 0x1C, frontier_df4_menu_014_A72BF0 + 0x70, 0x00000000, frontier_df4_menu_014_A72BF0 + 0x54\n"
"	.4byte 0x04D77806, 0x00000000, 0x00000000, frontier_df4_menu_014_A72BF0 + 0x1C, frontier_df4_menu_014_A72BF0 + 0x70, frontier_df4_menu_014_A72BF0 + 0x38\n"
"	.4byte gHelpInfo_Ss0Pow + 0x8C, 0x04D87826, 0x00000000, 0x00000000, frontier_df4_menu_014_A72BF0 + 0x38, 0x00000000\n"
"	.4byte 0x00000000, gHelpInfo_Ss0Pow + 0x8C, 0x04D98806, 0x00000000, 0x00000000, 0x00000000\n"
"	.4byte gHelpInfo_Ss0Pow + 0x1C, frontier_df4_menu_014_A72BF0, gHelpInfo_Ss0Pow + 0xA8, 0x04DB1866, 0x00000000, 0x0808AD95\n"
"	.4byte gHelpInfo_Ss0Pow, gHelpInfo_Ss0Pow + 0x38, frontier_df4_menu_014_A72BF0, gHelpInfo_Ss0Pow + 0xC4, 0x04DD2869, 0x00000000\n"
"	.4byte 0x00000000, gHelpInfo_Ss0Pow + 0x1C, gHelpInfo_Ss0Pow + 0x54, frontier_df4_menu_014_A72BF0, gHelpInfo_Ss0Pow + 0xE0, 0x04DE3866\n"
"	.4byte 0x00000000, 0x00000000, gHelpInfo_Ss0Pow + 0x38, gHelpInfo_Ss0Pow + 0x70, frontier_df4_menu_014_A72BF0, gHelpInfo_Ss0Pow + 0xFC\n"
"	.4byte 0x04DF4866, 0x00000000, 0x00000000, gHelpInfo_Ss0Pow + 0x54, gHelpInfo_Ss0Pow + 0x8C, frontier_df4_menu_014_A72BF0\n"
"	.4byte gHelpInfo_Ss0Pow + 0x118, 0x04E05866, 0x00000000, 0x00000000, gHelpInfo_Ss0Pow + 0x70, 0x00000000\n"
"	.4byte frontier_df4_menu_014_A72BF0 + 0x1C, gHelpInfo_Ss0Pow + 0x134, 0x04E16866, 0x00000000, 0x00000000, 0x00000000\n"
"	.4byte gHelpInfo_Ss0Pow + 0xC4, gHelpInfo_Ss0Pow, 0x00000000, 0x04E218A6, 0x00000000, 0x00000000\n"
"	.4byte gHelpInfo_Ss0Pow + 0xA8, gHelpInfo_Ss0Pow + 0xE0, gHelpInfo_Ss0Pow + 0x1C, 0x00000000, 0x04E328A6, 0x00000000\n"
"	.4byte 0x00000000, gHelpInfo_Ss0Pow + 0xC4, gHelpInfo_Ss0Pow + 0xFC, gHelpInfo_Ss0Pow + 0x38, 0x00000000, 0x04E438A6\n"
"	.4byte 0x00000000, 0x00000000, gHelpInfo_Ss0Pow + 0xE0, gHelpInfo_Ss0Pow + 0x118, gHelpInfo_Ss0Pow + 0x54, 0x00000000\n"
"	.4byte 0x04E548A6, 0x00000000, 0x00000000, gHelpInfo_Ss0Pow + 0xFC, gHelpInfo_Ss0Pow + 0x134, gHelpInfo_Ss0Pow + 0x70\n"
"	.4byte 0x00000000, 0x04E658A6, 0x00000000, 0x00000000, gHelpInfo_Ss0Pow + 0x118, 0x00000000\n"
"	.4byte gHelpInfo_Ss0Pow + 0x8C, 0x00000000, 0x000068A6, 0x00000000, 0x0808ACB9, 0x00000000\n"
"	.4byte gHelpInfo_Ss0Pow + 0x16C, 0x00000000, gHelpInfo_Ss1Item0 + 0x54, 0x00005018, 0x00000000, 0x0808AE61\n"
"	.4byte gHelpInfo_Ss0Pow + 0x150, gHelpInfo_Ss0Pow + 0x188, 0x00000000, gHelpInfo_Ss1Item0 + 0x8C, 0x066B6806, 0x00000000\n"
"	.4byte 0x0808AE8D, gHelpInfo_Ss0Pow + 0x16C, gHelpInfo_Ss0Pow + 0x1C0, 0x00000000, gHelpInfo_Ss0Pow + 0x1A4, 0x04D77806\n"
"	.4byte 0x00000000, 0x00000000, gHelpInfo_Ss0Pow + 0x16C, gHelpInfo_Ss0Pow + 0x1C0, gHelpInfo_Ss0Pow + 0x188, gHelpInfo_Ss1Item0 + 0x8C\n"
"	.4byte 0x04D87826, 0x00000000, 0x00000000, gHelpInfo_Ss0Pow + 0x188, 0x00000000, 0x00000000\n"
"	.4byte gHelpInfo_Ss1Item0 + 0xA8, 0x04D98806, 0x00000000, 0x00000000, 0x00000000, gHelpInfo_Ss1Item0 + 0x1C\n"
"	.4byte gHelpInfo_Ss0Pow + 0x150, 0x00000000, 0x00001868, 0x0808ADCD, 0x0808AC8D, gHelpInfo_Ss1Item0\n"
"	.4byte gHelpInfo_Ss1Item0 + 0x38, gHelpInfo_Ss0Pow + 0x150, 0x00000000, 0x00012868, 0x0808ADCD, 0x0808AC8D\n"
"	.4byte gHelpInfo_Ss1Item0 + 0x1C, gHelpInfo_Ss1Item0 + 0x54, gHelpInfo_Ss0Pow + 0x150, 0x00000000, 0x00023868, 0x0808ADCD\n"
"	.4byte 0x0808AC8D, gHelpInfo_Ss1Item0 + 0x38, gHelpInfo_Ss1Item0 + 0x70, gHelpInfo_Ss0Pow + 0x150, 0x00000000, 0x00034868\n"
"	.4byte 0x0808ADCD, 0x0808AC8D, gHelpInfo_Ss1Item0 + 0x54, gHelpInfo_Ss1Item0 + 0x8C, gHelpInfo_Ss0Pow + 0x150, gHelpInfo_Ss1Item0 + 0xC4\n"
"	.4byte 0x00045868, 0x0808ADCD, 0x0808AC8D, gHelpInfo_Ss1Item0 + 0x70, gHelpInfo_Ss1Item0 + 0xA8, gHelpInfo_Ss0Pow + 0x1A4\n"
"	.4byte gHelpInfo_Ss1Item0 + 0xE0, 0x04F17876, 0x00000000, 0x00000000, gHelpInfo_Ss1Item0 + 0x8C, 0x00000000\n"
"	.4byte gHelpInfo_Ss0Pow + 0x1C0, gHelpInfo_Ss1Item0 + 0xFC, 0x04F28876, 0x00000000, 0x00000000, gHelpInfo_Ss1Item0 + 0x70\n"
"	.4byte gHelpInfo_Ss1Item0 + 0xE0, gHelpInfo_Ss1Item0 + 0x8C, 0x00000000, 0x04F368AE, 0x00000000, 0x00000000\n"
"	.4byte gHelpInfo_Ss1Item0 + 0xC4, gHelpInfo_Ss1Item0 + 0xFC, gHelpInfo_Ss1Item0 + 0x8C, 0x00000000, 0x04F478AE, 0x00000000\n"
"	.4byte 0x00000000, gHelpInfo_Ss1Item0 + 0xE0, 0x00000000, gHelpInfo_Ss1Item0 + 0xA8, 0x00000000, 0x04F588AE\n"
"	.4byte 0x00000000, 0x00000000, 0x00000000, gHelpInfo_Ss1Item0 + 0x134, 0x00000000, gHelpInfo_Ss2Rank0 + 0x70\n"
"	.4byte 0x00005018, 0x00000000, 0x0808AE61, gHelpInfo_Ss1Item0 + 0x118, gHelpInfo_Ss1Item0 + 0x150, 0x00000000\n"
"	.4byte gHelpInfo_Ss2Rank0 + 0x70, 0x066B6806, 0x00000000, 0x0808AE8D, gHelpInfo_Ss1Item0 + 0x134, gHelpInfo_Ss1Item0 + 0x188\n"
"	.4byte 0x00000000, gHelpInfo_Ss1Item0 + 0x16C, 0x04D77806, 0x00000000, 0x00000000, gHelpInfo_Ss1Item0 + 0x134\n"
"	.4byte gHelpInfo_Ss1Item0 + 0x188, gHelpInfo_Ss1Item0 + 0x150, gHelpInfo_Ss2Rank0 + 0x70, 0x04D87826, 0x00000000, 0x00000000\n"
"	.4byte gHelpInfo_Ss1Item0 + 0x150, 0x00000000, 0x00000000, gHelpInfo_Ss2Rank0 + 0x70, 0x04D98806, 0x00000000\n"
"	.4byte 0x00000000, 0x00000000, gHelpInfo_Ss2Rank0 + 0x1C, gHelpInfo_Ss1Item0 + 0x118, gHelpInfo_Ss2Rank0 + 0x38, 0x00001868\n"
"	.4byte 0x00000000, 0x0808AE21, gHelpInfo_Ss2Rank0, gHelpInfo_Ss2Rank0 + 0x70, gHelpInfo_Ss1Item0 + 0x118, gHelpInfo_Ss2Rank0 + 0x54\n"
"	.4byte 0x00012868, 0x00000000, 0x0808AE21, 0x00000000, gHelpInfo_Ss2Rank0 + 0x54, gHelpInfo_Ss2Rank0\n"
"	.4byte 0x00000000, 0x000218A8, 0x00000000, 0x0808AE21, gHelpInfo_Ss2Rank0 + 0x38, gHelpInfo_Ss2Rank0 + 0x70\n"
"	.4byte gHelpInfo_Ss2Rank0 + 0x1C, 0x00000000, 0x000328A8, 0x00000000, 0x0808AE21, gHelpInfo_Ss2Rank0 + 0x1C\n"
"	.4byte gHelpInfo_Ss1Item0 + 0x118, gHelpInfo_Ss1Item0 + 0x118, 0x00000000, 0x04FE4080, 0x0808AEA1, 0x00000000\n"
"	.4byte 0x00000000, gHelpInfo_MbpHp, 0x00000000, 0x00000000, 0x00000808, 0x00000000\n"
"	.4byte 0x08037555, gHelpInfo_Ss2Rank0 + 0x8C, gHelpInfo_MbpHp + 0x1C, 0x00000000, 0x00000000, 0x04D9181C\n"
"	.4byte 0x00000000, 0x00000000, gHelpInfo_MbpHp, gHelpInfo_MbpHp + 0x38, 0x00000000, 0x00000000\n"
"	.4byte 0x0506281C, 0x00000000, 0x00000000, gHelpInfo_MbpHp + 0x1C, gHelpInfo_MbpHp + 0x54, 0x00000000\n"
"	.4byte 0x00000000, 0x04F2381C, 0x00000000, 0x00000000, gHelpInfo_MbpHp + 0x38, gHelpInfo_MbpHp + 0x70\n"
"	.4byte 0x00000000, 0x00000000, 0x04F4481C, 0x00000000, 0x00000000, gHelpInfo_MbpHp + 0x54\n"
"	.4byte 0x00000000, 0x00000000, 0x00000000, 0x00005838, 0x00000000, 0x08037585\n"
"	.4byte 0x00000000, gHelpInfo_CbpHp, 0x00000000, 0x00000000, 0x00000808, 0x00000000\n"
"	.4byte 0x08037555, gHelpInfo_MbpHp + 0x8C, gHelpInfo_CbpHp + 0x1C, 0x00000000, 0x00000000, 0x04D9181C\n"
"	.4byte 0x00000000, 0x00000000, gHelpInfo_CbpHp, gHelpInfo_CbpHp + 0x38, 0x00000000, 0x00000000\n"
"	.4byte 0x04F1281C, 0x00000000, 0x00000000, gHelpInfo_CbpHp + 0x1C, gHelpInfo_CbpHp + 0x54, 0x00000000\n"
"	.4byte 0x00000000, 0x0508381C, 0x00000000, 0x00000000, gHelpInfo_CbpHp + 0x38, gHelpInfo_CbpHp + 0x70\n"
"	.4byte 0x00000000, 0x00000000, 0x04F2481C, 0x00000000, 0x00000000, gHelpInfo_CbpHp + 0x54\n"
"	.4byte gHelpInfo_CbpHp + 0x8C, 0x00000000, 0x00000000, 0x04F4581C, 0x00000000, 0x00000000\n"
"	.4byte gHelpInfo_CbpHp + 0x70, gHelpInfo_CbpHp + 0xA8, 0x00000000, 0x00000000, 0x0507681C, 0x00000000\n"
"	.4byte 0x00000000, gHelpInfo_CbpHp + 0x8C, 0x00000000, 0x00000000, 0x00000000, 0x00007838\n"
"	.4byte 0x00000000, 0x08037585, 0x00000476, 0x00000477, 0x00000478, 0x0000048D\n"
"	.4byte 0x0000048E, 0x0000047B, 0x0000047C, 0x0000047E, 0x0000047F, 0x0000047D\n"
"	.4byte 0x00000486, 0x00000487, 0x00000485, 0x00000488, 0x00000480, 0x0000048F\n"
"	.4byte 0x00000482, 0x00000483, 0x00000490, 0x00000484, 0x00000489, 0x00000492\n"
"	.4byte 0x00000491, 0x000004AE, 0x000004AF, 0x000004B0, 0x000004B1, 0x000004B2\n"
"	.4byte 0x000004B3, 0x000004B4, 0x000004B5, 0x000004C6, 0x000004A3, 0x000004A4\n"
"	.4byte 0x000004A5, 0x000004A6, 0x00000494, 0x00000495, 0x00000496, 0x00000497\n"
"	.4byte 0x00000498, 0x0000049D, 0x0000049E, 0x0000049F, frontier_chap_title_000_A7E188, frontier_chap_title_064_A8BFB0\n"
"	.4byte frontier_chap_title_087_A8DBFC, frontier_chap_title_001_A7E504, frontier_chap_title_065_A8C0EC, frontier_chap_title_088_A8DE6C, frontier_chap_title_002_A7E800, frontier_chap_title_066_A8C1E4\n"
"	.4byte frontier_chap_title_089_A8E080, frontier_chap_title_003_A7EB7C, frontier_chap_title_067_A8C308, frontier_chap_title_090_A8E2EC, frontier_chap_title_004_A7EF88, frontier_chap_title_068_A8C424\n"
"	.4byte frontier_chap_title_091_A8E600, frontier_chap_title_005_A7F360, frontier_chap_title_069_A8C534, frontier_chap_title_092_A8E8C8, frontier_chap_title_006_A7F754, frontier_chap_title_070_A8C734\n"
"	.4byte frontier_chap_title_093_A8EAF8, frontier_chap_title_007_A7FAA4, frontier_chap_title_071_A8C854, frontier_chap_title_094_A8ED30, frontier_chap_title_008_A7FE84, frontier_chap_title_072_A8C974\n"
"	.4byte frontier_chap_title_095_A8EFFC, frontier_chap_title_009_A8021C, frontier_chap_title_073_A8CA74, frontier_chap_title_096_A8F28C, frontier_chap_title_010_A80584, frontier_chap_title_074_A8CB94\n"
"	.4byte frontier_chap_title_097_A8F4CC, frontier_chap_title_011_A808BC, frontier_chap_title_075_A8CCAC, frontier_chap_title_098_A8F6F8, frontier_chap_title_013_A81068, frontier_chap_title_077_A8CF14\n"
"	.4byte frontier_chap_title_100_A8FC68, frontier_chap_title_014_A813F8, frontier_chap_title_078_A8D064, frontier_chap_title_101_A8FEC0, frontier_chap_title_015_A81774, frontier_chap_title_079_A8D1B0\n"
"	.4byte frontier_chap_title_102_A900FC, frontier_chap_title_022_A8306C, frontier_chap_title_080_A8D2F4, frontier_chap_title_109_A911D0, frontier_chap_title_023_A833D4, frontier_chap_title_081_A8D430\n"
"	.4byte frontier_chap_title_110_A91418, frontier_chap_title_024_A8383C, frontier_chap_title_082_A8D574, frontier_chap_title_111_A91760, frontier_chap_title_025_A83C0C, frontier_chap_title_083_A8D6AC\n"
"	.4byte frontier_chap_title_112_A919F8, frontier_chap_title_026_A83F64, frontier_chap_title_084_A8D7F4, frontier_chap_title_113_A91C28, frontier_chap_title_027_A8436C, frontier_chap_title_085_A8D948\n"
"	.4byte frontier_chap_title_114_A91F08, frontier_chap_title_028_A84720, frontier_chap_title_086_A8DAB0, frontier_chap_title_115_A92170, frontier_chap_title_028_A84720, 0x00000000\n"
"	.4byte 0x00000000, frontier_chap_title_016_A81B1C, frontier_chap_title_074_A8CB94, frontier_chap_title_103_A90378, frontier_chap_title_017_A81F28, frontier_chap_title_075_A8CCAC\n"
"	.4byte frontier_chap_title_104_A9065C, frontier_chap_title_019_A8258C, frontier_chap_title_077_A8CF14, frontier_chap_title_106_A90A98, frontier_chap_title_020_A829B4, frontier_chap_title_078_A8D064\n"
"	.4byte frontier_chap_title_107_A90D84, frontier_chap_title_021_A82D58, frontier_chap_title_079_A8D1B0, frontier_chap_title_108_A90FF0, frontier_chap_title_022_A8306C, frontier_chap_title_080_A8D2F4\n"
"	.4byte frontier_chap_title_109_A911D0, frontier_chap_title_023_A833D4, frontier_chap_title_081_A8D430, frontier_chap_title_110_A91418, frontier_chap_title_024_A8383C, frontier_chap_title_082_A8D574\n"
"	.4byte frontier_chap_title_111_A91760, frontier_chap_title_025_A83C0C, frontier_chap_title_083_A8D6AC, frontier_chap_title_112_A919F8, frontier_chap_title_026_A83F64, frontier_chap_title_084_A8D7F4\n"
"	.4byte frontier_chap_title_113_A91C28, frontier_chap_title_027_A8436C, frontier_chap_title_085_A8D948, frontier_chap_title_114_A91F08, frontier_chap_title_028_A84720, frontier_chap_title_086_A8DAB0\n"
"	.4byte frontier_chap_title_115_A92170, frontier_chap_title_028_A84720, 0x00000000, 0x00000000, frontier_chap_title_029_A84BFC, 0x00000000\n"
"	.4byte 0x00000000, frontier_chap_title_030_A84F64, 0x00000000, 0x00000000, frontier_chap_title_031_A852E8, 0x00000000\n"
"	.4byte 0x00000000, frontier_chap_title_032_A85670, 0x00000000, 0x00000000, frontier_chap_title_033_A859E4, 0x00000000\n"
"	.4byte 0x00000000, frontier_chap_title_034_A85D6C, 0x00000000, 0x00000000, frontier_chap_title_035_A860F4, 0x00000000\n"
"	.4byte 0x00000000, frontier_chap_title_036_A86460, 0x00000000, 0x00000000, frontier_chap_title_037_A867E4, 0x00000000\n"
"	.4byte 0x00000000, frontier_chap_title_038_A86B60, 0x00000000, 0x00000000, frontier_chap_title_039_A86EF8, 0x00000000\n"
"	.4byte 0x00000000, frontier_chap_title_040_A8729C, 0x00000000, 0x00000000, frontier_chap_title_041_A8765C, 0x00000000\n"
"	.4byte 0x00000000, frontier_chap_title_042_A87A14, 0x00000000, 0x00000000, frontier_chap_title_043_A87DBC, 0x00000000\n"
"	.4byte 0x00000000, frontier_chap_title_044_A88174, 0x00000000, 0x00000000, frontier_chap_title_045_A88530, 0x00000000\n"
"	.4byte 0x00000000, frontier_chap_title_046_A888D0, 0x00000000, 0x00000000, frontier_chap_title_047_A88C8C, 0x00000000\n"
"	.4byte 0x00000000, frontier_chap_title_048_A89048, 0x00000000, 0x00000000, frontier_chap_title_062_A8B7F0, 0x00000000\n"
"	.4byte 0x00000000, frontier_chap_title_061_A8B5DC, 0x00000000, 0x00000000, frontier_chap_title_061_A8B5DC, 0x00000000\n"
"	.4byte 0x00000000, frontier_chap_title_061_A8B5DC, 0x00000000, 0x00000000, frontier_chap_title_061_A8B5DC, 0x00000000\n"
"	.4byte 0x00000000, frontier_chap_title_012_A80CA0, frontier_chap_title_076_A8CDF8, frontier_chap_title_099_A8F9C0, frontier_chap_title_018_A82294, frontier_chap_title_076_A8CDF8\n"
"	.4byte frontier_chap_title_105_A90898, frontier_chap_title_061_A8B5DC, 0x00000000, 0x00000000, frontier_chap_title_061_A8B5DC, 0x00000000\n"
"	.4byte 0x00000000, frontier_chap_title_061_A8B5DC, 0x00000000, 0x00000000, frontier_chap_title_061_A8B5DC, 0x00000000\n"
"	.4byte 0x00000000, frontier_chap_title_061_A8B5DC, 0x00000000, 0x00000000, frontier_chap_title_061_A8B5DC, 0x00000000\n"
"	.4byte 0x00000000, frontier_chap_title_061_A8B5DC, 0x00000000, 0x00000000, frontier_chap_title_049_A89428, 0x00000000\n"
"	.4byte 0x00000000, frontier_chap_title_050_A89710, 0x00000000, 0x00000000, frontier_chap_title_051_A899E8, 0x00000000\n"
"	.4byte 0x00000000, frontier_chap_title_052_A89CD8, 0x00000000, 0x00000000, frontier_chap_title_053_A89F80, 0x00000000\n"
"	.4byte 0x00000000, frontier_chap_title_054_A8A260, 0x00000000, 0x00000000, frontier_chap_title_055_A8A5A0, 0x00000000\n"
"	.4byte 0x00000000, frontier_chap_title_056_A8A85C, 0x00000000, 0x00000000, frontier_chap_title_057_A8AB8C, 0x00000000\n"
"	.4byte 0x00000000, frontier_chap_title_061_A8B5DC, 0x00000000, 0x00000000, frontier_chap_title_061_A8B5DC, 0x00000000\n"
"	.4byte 0x00000000, frontier_chap_title_061_A8B5DC, 0x00000000, 0x00000000, frontier_chap_title_061_A8B5DC, 0x00000000\n"
"	.4byte 0x00000000, frontier_chap_title_061_A8B5DC, 0x00000000, 0x00000000, frontier_chap_title_058_A8AE74, 0x00000000\n"
"	.4byte 0x00000000, frontier_chap_title_059_A8B168, 0x00000000, 0x00000000, frontier_chap_title_060_A8B39C, 0x00000000\n"
"	.4byte 0x00000000, frontier_chap_title_063_A8BB88, 0x00000000, 0x00000000, 0x00000003, 0x0808C169\n"
"	.4byte 0x00000000, 0x00000000, 0x0000000E, 0x00000000, 0x00000002, 0x0808C1FD\n"
"	.4byte 0x00000000, 0x00000000, 0x0006000E, 0x00000000, 0x00000003, 0x0808C269\n"
"	.4byte 0x00000003, 0x0808C2DD, 0x00000002, 0x0808C31D, 0x00000000, 0x00000000\n"
"	.4byte 0x00000003, 0x0808C471, 0x00000002, 0x0808C499, 0x00000003, 0x0808C4C9\n"
"	.4byte 0x00000000, 0x00000000, 0x0001000E, 0x00000000, 0x0000000B, 0x00000000\n"
"	.4byte 0x00000002, 0x0808C60D, 0x00000003, 0x0808C631, 0x00000002, 0x0808C5E1\n"
"	.4byte 0x00000000, 0x00000000, 0x00000003, 0x0808C7B5, 0x00000000, 0x00000000\n"
"	.4byte 0x000007BB, 0x000007BC, 0x0000000E, 0x00000000, 0x00000002, 0x0808CB59\n"
"	.4byte 0x0000000B, 0x00000000, 0x00000003, 0x0808CB8D, 0x0001000B, 0x00000000\n"
"	.4byte 0x00000010, 0x00000000, 0x0003000B, 0x00000000, 0x0006000E, 0x00000000\n"
"	.4byte 0x0002000B, 0x00000000, 0x00000002, 0x0808CBBD, 0x000A000E, 0x00000000\n"
"	.4byte 0x00000000, 0x00000000, 0x00000003, 0x0808CC85, 0x00000002, 0x0808CCAD\n"
"	.4byte 0x00000003, 0x0808CCD1, 0x00000000, 0x00000000, 0x0000000E, 0x00000000\n"
"	.4byte 0x00000002, 0x0808D3AD, 0x0000000B, 0x00000000, 0x00000003, 0x0808D489\n"
"	.4byte 0x0002000C, 0x00000000, 0x0001000B, 0x00000000, 0x00000003, 0x0808DA99\n"
"	.4byte 0x0004000B, 0x00000000, 0x00000003, 0x0808DAC9, 0x0000000C, 0x00000000\n"
"	.4byte 0x0005000B, 0x00000000, 0x00000003, 0x0808DAC9, 0x00000002, 0x0808DB15\n"
"	.4byte 0x0000000C, 0x00000000, 0x0006000B, 0x00000000, 0x00000003, 0x0808DB81\n"
"	.4byte 0x0000000C, 0x00000000, 0x0002000B, 0x00000000, 0x00000002, 0x0808DB55\n"
"	.4byte 0x00000000, 0x00000000, 0x0006000E, 0x00000000, 0x00000002, 0x0808DC39\n"
"	.4byte 0x00000000, 0x00000000, 0x00000010, 0x00000000, 0x00000000, 0x00000000\n"
);
__asm__(
    ".section .data.frontier_df4_menu.gap15, \"aw\", %progbits\n"
    ".global frontier_df4_menu_015_A73900\n"
    "frontier_df4_menu_015_A73900:\n"
    ".4byte 0x01010101\n"
    ".4byte 0x01010101\n"
    ".4byte 0x01010101\n"
    ".4byte 0x01010101\n"
    ".4byte 0x03030101\n"
    ".4byte 0x03030303\n"
    ".4byte 0x00faff00\n"
    ".4byte 0xfafafaff\n"
    ".4byte 0x030303fa\n"
    ".4byte gUnkData_50\n"
    ".4byte gUnkData_50\n"
    ".4byte gUnkData_50\n"
    ".4byte gUnkData_51\n"
    ".4byte gUnkData_52\n"
    ".4byte gUnkData_53\n"
    ".4byte gUnkData_55\n"
    ".4byte gUnkData_56\n"
    ".4byte gUnkData_57\n"
    ".4byte gUnkData_58\n"
    ".4byte gUnkData_58\n"
    ".4byte gUnkData_58\n"
    ".4byte 0x0d0b0905\n"
    ".4byte 0x0400070b\n"
    ".4byte 0x04050605\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000001\n"
    ".4byte sPage2TextInfo_Magical + 0x90\n"
    ".4byte 0x00000015\n"
    ".4byte 0x00000000\n"
    ".4byte 0x0000000e\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte TerrainDisplay_Init\n"
    ".4byte 0x0000000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000008\n"
    ".4byte ProcScr_CamMove\n"
    ".4byte 0x00000003\n"
    ".4byte TerrainDisplay_Loop_OnSideChange\n"
    ".4byte 0x00000003\n"
    ".4byte TerrainDisplay_Loop_SlideIn\n"
    ".4byte 0x00000003\n"
    ".4byte TerrainDisplay_Loop_Display\n"
    ".4byte 0x00000003\n"
    ".4byte TerrainDisplay_Loop_SlideOut\n"
    ".4byte 0x0000000c\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000001\n"
    ".4byte sPage2TextInfo_Magical + 0x94\n"
    ".4byte 0x00000015\n"
    ".4byte 0x00000000\n"
    ".4byte 0x0000000e\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte MMB_Init\n"
    ".4byte 0x0000000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000008\n"
    ".4byte ProcScr_CamMove\n"
    ".4byte 0x00000003\n"
    ".4byte MMB_Loop_OnSideChange\n"
    ".4byte 0x00000003\n"
    ".4byte MMB_Loop_SlideIn\n"
    ".4byte 0x0002000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000003\n"
    ".4byte MMB_Loop_Display\n"
    ".4byte 0x0003000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000003\n"
    ".4byte MMB_Loop_SlideOut\n"
    ".4byte 0x0000000c\n"
    ".4byte 0x00000000\n"
    ".4byte 0x0001000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte MMB_CheckForUnit\n"
    ".4byte 0x0002000c\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000001\n"
    ".4byte sPage2TextInfo_Magical + 0x98\n"
    ".4byte 0x00000015\n"
    ".4byte 0x00000000\n"
    ".4byte 0x0000000e\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte BurstDisplay_Init\n"
    ".4byte 0x00000003\n"
    ".4byte BurstDisplay_Loop_Display\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000014\n"
    ".4byte DoesBMXFADEExist\n"
    ".4byte 0x00000002\n"
    ".4byte InitPlayerPhaseInterface\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x05040301\n"
    ".4byte 0x00010306\n"
    ".4byte 0x00000001\n"
    ".4byte GoalString_Turn + 0x8\n"
    ".4byte 0x00000015\n"
    ".4byte 0x00000000\n"
    ".4byte 0x0000000e\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte GoalDisplay_Init\n"
    ".4byte 0x0000000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000008\n"
    ".4byte ProcScr_CamMove\n"
    ".4byte 0x00000003\n"
    ".4byte GoalDisplay_Loop_OnSideChange\n"
    ".4byte 0x00000003\n"
    ".4byte GoalDisplay_Loop_SlideIn\n"
    ".4byte 0x00000003\n"
    ".4byte GoalDisplay_Loop_Display\n"
    ".4byte 0x00000003\n"
    ".4byte GoalDisplay_Loop_SlideOut\n"
    ".4byte 0x0000000c\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000015\n"
    ".4byte 0x00000000\n"
    ".4byte 0x0000000e\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte MenuButtonDisp_Init\n"
    ".4byte 0x0000000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000008\n"
    ".4byte ProcScr_CamMove\n"
    ".4byte 0x00000014\n"
    ".4byte IsAnyPlayerSideWindowRetracting\n"
    ".4byte 0x00000002\n"
    ".4byte MenuButtonDisp_UpdateCursorPos\n"
    ".4byte 0x00000003\n"
    ".4byte MenuButtonDisp_Loop_OnSlideIn\n"
    ".4byte 0x00000003\n"
    ".4byte MenuButtonDisp_Loop_Display\n"
    ".4byte 0x00000003\n"
    ".4byte MenuButtonDisp_Loop_OnSlideOut\n"
    ".4byte 0x0000000c\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000001\n"
    ".4byte 0x47404000\n"
    ".4byte 0x40000002\n"
    ".4byte 0x47544000\n"
    ".4byte 0x00204000\n"
    ".4byte 0x00024758\n"
    ".4byte 0x40004000\n"
    ".4byte 0x4000475a\n"
    ".4byte 0x475e0020\n"
    ".4byte 0x40000002\n"
    ".4byte 0x47438000\n"
    ".4byte 0x80204000\n"
    ".4byte 0x00014747\n"
    ".4byte 0x80004000\n"
    ".4byte 0x0001474b\n"
    ".4byte 0x80004000\n"
    ".4byte 0x0008474f\n"
    ".4byte 0x00004000\n"
    ".4byte 0x40000018\n"
    ".4byte 0x00190010\n"
    ".4byte 0x00204000\n"
    ".4byte 0x40000019\n"
    ".4byte 0x00181030\n"
    ".4byte 0x20004008\n"
    ".4byte 0x40080018\n"
    ".4byte 0x00192010\n"
    ".4byte 0x20204008\n"
    ".4byte 0x40080019\n"
    ".4byte 0x00183030\n"
    ".4byte 0x40000003\n"
    ".4byte 0x0000c000\n"
    ".4byte 0xc0404000\n"
    ".4byte 0x40000008\n"
    ".4byte 0x0010c080\n"
    ".4byte 0x40000002\n"
    ".4byte 0x0090c000\n"
    ".4byte 0x80408000\n"
    ".4byte 0x00000098\n"
    ".4byte 0x02004bac\n"
    ".4byte 0x0000000c\n"
    ".4byte 0x02004bb4\n"
    ".4byte 0x0000000c\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte LockGame\n"
    ".4byte 0x00000002\n"
    ".4byte StartFastFadeToBlack\n"
    ".4byte 0x00000003\n"
    ".4byte WaitForFade\n"
    ".4byte 0x00000002\n"
    ".4byte BMapDispSuspend\n"
    ".4byte 0x00000002\n"
    ".4byte ChapterStatus_Init\n"
    ".4byte 0x00000002\n"
    ".4byte ChapterStatus_DrawText\n"
    ".4byte 0x00000002\n"
    ".4byte ChapterStatus_ShowAllLayers\n"
    ".4byte 0x0000000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000003\n"
    ".4byte ChapterStatus_LoopKeyHandler\n"
    ".4byte 0x0001000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte FadeOutBlackSpeed40Locking\n"
    ".4byte 0x0000000e\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte EndMuralBackground\n"
    ".4byte 0x00000002\n"
    ".4byte ChapterStatus_OnEnd\n"
    ".4byte 0x00000002\n"
    ".4byte BMapDispResume\n"
    ".4byte 0x00000002\n"
    ".4byte RefreshBMapGraphics\n"
    ".4byte 0x00000002\n"
    ".4byte StartFastFadeFromBlack\n"
    ".4byte 0x00000003\n"
    ".4byte WaitForFade\n"
    ".4byte 0x00000002\n"
    ".4byte ChapterStatus_FocusLeaderUnit\n"
    ".4byte 0x0000000e\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte UnlockGame\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x0000000e\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte ChapterStatus_Init\n"
    ".4byte 0x00000002\n"
    ".4byte ChapterStatus_DrawText\n"
    ".4byte 0x0000000e\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte ChapterStatus_ShowAllLayers\n"
    ".4byte 0x00000002\n"
    ".4byte FadeInBlackSpeed40\n"
    ".4byte 0x0000000e\n"
    ".4byte 0x00000000\n"
    ".4byte 0x0000000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000003\n"
    ".4byte ChapterStatus_LoopKeyHandler\n"
    ".4byte 0x0001000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte FadeOutBlackSpeed40Locking\n"
    ".4byte 0x0000000e\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte EndMuralBackground\n"
    ".4byte 0x00000002\n"
    ".4byte ChapterStatus_OnEnd\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x40000006\n"
    ".4byte 0x00008000\n"
    ".4byte 0x80204000\n"
    ".4byte 0x40000004\n"
    ".4byte 0x00088040\n"
    ".4byte 0x80604000\n"
    ".4byte 0x4000000c\n"
    ".4byte 0x00108080\n"
    ".4byte 0x80a04000\n"
    ".4byte 0x00000014\n"
    ".4byte 0x0000000e\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte StatusScreenSpriteDraw_Init\n"
    ".4byte 0x00000003\n"
    ".4byte StatusScreenSpriteDraw_Loop\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte sHelpInfo_ChapterStatus_AllyUnits\n"
    ".4byte sHelpInfo_ChapterStatus_TurnCount\n"
    ".4byte 0x00000000\n"
    ".4byte sHelpInfo_ChapterStatus_Leader\n"
    ".4byte 0x06744424\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte sHelpInfo_ChapterStatus_Goal\n"
    ".4byte sHelpInfo_ChapterStatus_Funds\n"
    ".4byte 0x00000000\n"
    ".4byte sHelpInfo_ChapterStatus_TimePlayed\n"
    ".4byte 0x06757410\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte sHelpInfo_ChapterStatus_TurnCount\n"
    ".4byte sHelpInfo_ChapterStatus_AllyUnits\n"
    ".4byte 0x00000000\n"
    ".4byte sHelpInfo_ChapterStatus_TimePlayed\n"
    ".4byte 0x06768410\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte sHelpInfo_ChapterStatus_Funds\n"
    ".4byte sHelpInfo_ChapterStatus_Goal\n"
    ".4byte 0x00000000\n"
    ".4byte sHelpInfo_ChapterStatus_EnemyUnits\n"
    ".4byte 0x06702b14\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte sHelpInfo_ChapterStatus_Funds\n"
    ".4byte sHelpInfo_ChapterStatus_Goal\n"
    ".4byte sHelpInfo_ChapterStatus_AllyUnits\n"
    ".4byte sHelpInfo_ChapterStatus_Leader\n"
    ".4byte 0x06712b4c\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte sHelpInfo_ChapterStatus_TimePlayed\n"
    ".4byte sHelpInfo_ChapterStatus_TimePlayed\n"
    ".4byte sHelpInfo_ChapterStatus_Goal\n"
    ".4byte 0x00000000\n"
    ".4byte 0x06723e88\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte sHelpInfo_ChapterStatus_Leader\n"
    ".4byte sHelpInfo_ChapterStatus_Leader\n"
    ".4byte sHelpInfo_ChapterStatus_Funds\n"
    ".4byte 0x00000000\n"
    ".4byte 0x06737f98\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x44000006\n"
    ".4byte 0x00004000\n"
    ".4byte 0x40204400\n"
    ".4byte 0x44080004\n"
    ".4byte 0x00084000\n"
    ".4byte 0x40204408\n"
    ".4byte 0x4410000c\n"
    ".4byte 0x00104000\n"
    ".4byte 0x40204410\n"
    ".4byte 0x00020014\n"
    ".4byte 0x80004400\n"
    ".4byte 0x44000000\n"
    ".4byte 0x00048020\n"
    ".4byte 0x00000004\n"
    ".4byte CgText_OnEnd\n"
    ".4byte 0x0000000e\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte CgText_Init\n"
    ".4byte 0x0001000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte CgText_InitBlendAmt\n"
    ".4byte 0x0002000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000003\n"
    ".4byte CgText_LoopFadeIn\n"
    ".4byte 0x0003000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte CgText_2\n"
    ".4byte 0x00000003\n"
    ".4byte CgText_0\n"
    ".4byte 0x0004000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000010\n"
    ".4byte 0x00000000\n"
    ".4byte 0x0000000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte CgText_InitFadeOut\n"
    ".4byte 0x00000003\n"
    ".4byte CgText_LoopFadeOut\n"
    ".4byte 0x00000002\n"
    ".4byte CgText_1\n"
    ".4byte 0x0000000e\n"
    ".4byte 0x00000000\n"
    ".4byte 0x0005000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x000007bf\n"
    ".4byte 0x000007c0\n"
    ".4byte 0x000007bb\n"
    ".4byte 0x000007bc\n"
    ".4byte 0x0000000e\n"
    ".4byte 0x00000000\n"
    ".4byte 0x0000000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000003\n"
    ".4byte CgTextInterpreter_Loop_Main\n"
    ".4byte 0x0001000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte BackgroundSlide_Init\n"
    ".4byte 0x00000003\n"
    ".4byte CgTextInterpreter_1\n"
    ".4byte 0x0000000c\n"
    ".4byte 0x00000000\n"
    ".4byte 0x0002000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte CgTextInterpreter_2\n"
    ".4byte 0x0000000c\n"
    ".4byte 0x00000000\n"
    ".4byte 0x0063000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x0008000e\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000003\n"
    ".4byte YesNoChoice_Loop_KeyHandler\n"
    ".4byte 0x0005000e\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
);
u8 frontier_df4_menu_016_A74CEC[] __attribute__((section(".data.frontier_df4_menu.gap16"))) = INCBIN_U8("graphics/frontier_df4_menu/frontier_df4_menu_016_A74CEC.bin");
u8 frontier_df4_menu_017_A79E90[] __attribute__((section(".data.frontier_df4_menu.gap17"))) = INCBIN_U8("graphics/frontier_df4_menu/frontier_df4_menu_017_A79E90.bin");
u8 frontier_df4_menu_018_A92B38[] __attribute__((section(".data.frontier_df4_menu.gap18"))) = INCBIN_U8("graphics/frontier_df4_menu/frontier_df4_menu_018_A92B38.bin");
__asm__(
    ".section .data.frontier_df4_menu.gap19, \"aw\", %progbits\n"
    ".global frontier_df4_menu_019_A934EC\n"
    "frontier_df4_menu_019_A934EC:\n"
    ".4byte 0x00000001\n"
    ".4byte data_081F5548 + 0x4\n"
    ".4byte 0x0008000f\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte LockGame\n"
    ".4byte 0x00000002\n"
    ".4byte StartFastFadeToBlack\n"
    ".4byte 0x00000003\n"
    ".4byte WaitForFade\n"
    ".4byte 0x00000002\n"
    ".4byte BMapDispSuspend\n"
    ".4byte 0x00000002\n"
    ".4byte UnitList_Init\n"
    ".4byte 0x00000002\n"
    ".4byte StartFastFadeFromBlack\n"
    ".4byte 0x00000003\n"
    ".4byte WaitForFade\n"
    ".4byte 0x0001000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte UnitList_SetBlendEffects\n"
    ".4byte 0x00000003\n"
    ".4byte UnitList_Loop\n"
    ".4byte 0x00000002\n"
    ".4byte StartFastFadeToBlack\n"
    ".4byte 0x00000003\n"
    ".4byte WaitForFade\n"
    ".4byte 0x00000002\n"
    ".4byte UnitList_OnEnd\n"
    ".4byte 0x00000002\n"
    ".4byte BMapDispResume\n"
    ".4byte 0x00000002\n"
    ".4byte RefreshBMapGraphics\n"
    ".4byte 0x00000002\n"
    ".4byte EndAllMus\n"
    ".4byte 0x00000002\n"
    ".4byte StartFastFadeFromBlack\n"
    ".4byte 0x00000003\n"
    ".4byte WaitForFade\n"
    ".4byte 0x00000002\n"
    ".4byte UnlockGame\n"
    ".4byte 0x0004000c\n"
    ".4byte 0x00000000\n"
    ".4byte 0x0002000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte UnitList_StartPageChange\n"
    ".4byte 0x00000003\n"
    ".4byte UnitList_PageChangeOut_Loop\n"
    ".4byte 0x00000003\n"
    ".4byte UnitList_PageChangeIn_Loop\n"
    ".4byte 0x0001000c\n"
    ".4byte 0x00000000\n"
    ".4byte 0x0003000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte UnitList_StartStatScreen\n"
    ".4byte 0x0001000e\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte UnitList_ResetFromStatScreen\n"
    ".4byte 0x0001000e\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte EnableAllDisplay\n"
    ".4byte 0x0001000c\n"
    ".4byte 0x00000000\n"
    ".4byte 0x0004000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000001\n"
    ".4byte data_081F5548 + 0x4\n"
    ".4byte 0x0001000e\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte UnitList_Init\n"
    ".4byte 0x00000002\n"
    ".4byte StartMidFadeFromBlack\n"
    ".4byte 0x00000003\n"
    ".4byte WaitForFade\n"
    ".4byte 0x0001000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte UnitList_SetBlendEffects\n"
    ".4byte 0x00000003\n"
    ".4byte UnitList_Loop\n"
    ".4byte 0x00000002\n"
    ".4byte StartMidFadeToBlack\n"
    ".4byte 0x00000003\n"
    ".4byte WaitForFade\n"
    ".4byte 0x00000002\n"
    ".4byte UnitList_OnEnd\n"
    ".4byte 0x0004000c\n"
    ".4byte 0x00000000\n"
    ".4byte 0x0002000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte UnitList_StartPageChange\n"
    ".4byte 0x00000003\n"
    ".4byte UnitList_PageChangeOut_Loop\n"
    ".4byte 0x00000003\n"
    ".4byte UnitList_PageChangeIn_Loop\n"
    ".4byte 0x0001000c\n"
    ".4byte 0x00000000\n"
    ".4byte 0x0003000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte UnitList_StartStatScreen\n"
    ".4byte 0x0001000e\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte UnitList_ResetFromStatScreen\n"
    ".4byte 0x0001000e\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte EnableAllDisplay\n"
    ".4byte 0x0001000c\n"
    ".4byte 0x00000000\n"
    ".4byte 0x0004000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x0000000e\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte UnitList_Init\n"
    ".4byte 0x00000002\n"
    ".4byte StartFastFadeFromBlack\n"
    ".4byte 0x00000003\n"
    ".4byte WaitForFade\n"
    ".4byte 0x0001000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte UnitList_SetBlendEffects\n"
    ".4byte 0x00000003\n"
    ".4byte UnitList_Loop\n"
    ".4byte 0x00000002\n"
    ".4byte StartFastFadeToBlack\n"
    ".4byte 0x00000003\n"
    ".4byte WaitForFade\n"
    ".4byte 0x00000002\n"
    ".4byte UnitList_OnEnd\n"
    ".4byte 0x0004000c\n"
    ".4byte 0x00000000\n"
    ".4byte 0x0003000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte UnitList_StartStatScreen\n"
    ".4byte 0x0001000e\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte UnitList_ResetFromStatScreen\n"
    ".4byte 0x0001000e\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte EnableAllDisplay\n"
    ".4byte 0x0001000c\n"
    ".4byte 0x00000000\n"
    ".4byte 0x0004000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000001\n"
    ".4byte data_081F5548 + 0x4\n"
    ".4byte 0x00000002\n"
    ".4byte LockGame\n"
    ".4byte 0x00000002\n"
    ".4byte UnitList_Init\n"
    ".4byte 0x00000002\n"
    ".4byte StartFastFadeFromBlack\n"
    ".4byte 0x00000003\n"
    ".4byte WaitForFade\n"
    ".4byte 0x0001000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte UnitList_SetBlendEffects\n"
    ".4byte 0x00000003\n"
    ".4byte UnitList_Loop\n"
    ".4byte 0x00000002\n"
    ".4byte StartFastFadeToBlack\n"
    ".4byte 0x00000003\n"
    ".4byte WaitForFade\n"
    ".4byte 0x00000002\n"
    ".4byte UnitList_OnEnd\n"
    ".4byte 0x00000002\n"
    ".4byte UnlockGame\n"
    ".4byte 0x0004000c\n"
    ".4byte 0x00000000\n"
    ".4byte 0x0002000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte UnitList_StartPageChange\n"
    ".4byte 0x00000003\n"
    ".4byte UnitList_PageChangeOut_Loop\n"
    ".4byte 0x00000003\n"
    ".4byte UnitList_PageChangeIn_Loop\n"
    ".4byte 0x0001000c\n"
    ".4byte 0x00000000\n"
    ".4byte 0x0003000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte UnitList_StartStatScreen\n"
    ".4byte 0x0001000e\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte UnitList_ResetFromStatScreen\n"
    ".4byte 0x0001000e\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte EnableAllDisplay\n"
    ".4byte 0x0001000c\n"
    ".4byte 0x00000000\n"
    ".4byte 0x0004000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000001\n"
    ".4byte data_081F5548 + 0xc\n"
    ".4byte 0x00000002\n"
    ".4byte UnitListScreenSprites_Init\n"
    ".4byte 0x00000003\n"
    ".4byte UnitListScreenSprites_Main\n"
    ".4byte 0x00000002\n"
    ".4byte nullsub_76\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x03040405\n"
    ".4byte 0x04050203\n"
    ".4byte 0x02020203\n"
    ".4byte 0x00010101\n"
    ".4byte 0x80000001\n"
    ".4byte 0x025c0000\n"
    ".4byte 0x00000001\n"
    ".4byte 0x025d4000\n"
    ".4byte 0x80000001\n"
    ".4byte 0x025f0000\n"
    ".4byte gUnitlistscreen_11 + 0xa\n"
    ".4byte gUnitlistscreen_11 + 0x12\n"
    ".4byte gUnitlistscreen_11 + 0x1a\n"
    ".4byte 0x80000001\n"
    ".4byte 0x02df0000\n"
    ".4byte 0x40000007\n"
    ".4byte 0x0a4b4000\n"
    ".4byte 0x40204000\n"
    ".4byte 0x40000a4c\n"
    ".4byte 0x0a4c4040\n"
    ".4byte 0x40604000\n"
    ".4byte 0x40000a4c\n"
    ".4byte 0x0a4c4080\n"
    ".4byte 0x40a04000\n"
    ".4byte 0x40000a4c\n"
    ".4byte 0x0a4b50c0\n"
    ".4byte 0x40000002\n"
    ".4byte 0x02c08010\n"
    ".4byte 0x80304000\n"
    ".4byte 0x000302c4\n"
    ".4byte 0x80084000\n"
    ".4byte 0x400002ca\n"
    ".4byte 0x02ce8028\n"
    ".4byte 0x40480000\n"
    ".4byte 0x000302d2\n"
    ".4byte 0x800c4000\n"
    ".4byte 0x400002d4\n"
    ".4byte 0x02d8802c\n"
    ".4byte 0x404c0000\n"
    ".4byte 0x000302dc\n"
    ".4byte 0x80084000\n"
    ".4byte 0x40000300\n"
    ".4byte 0x03048028\n"
    ".4byte 0x40480000\n"
    ".4byte 0x00030308\n"
    ".4byte 0x80084000\n"
    ".4byte 0x4000030a\n"
    ".4byte 0x030e8028\n"
    ".4byte 0x40480000\n"
    ".4byte 0x00030312\n"
    ".4byte 0x80004000\n"
    ".4byte 0x40000314\n"
    ".4byte 0x03188020\n"
    ".4byte 0x80404000\n"
    ".4byte 0x0003031c\n"
    ".4byte 0x800c4000\n"
    ".4byte 0x400002c0\n"
    ".4byte 0x02c4802c\n"
    ".4byte 0x004c8000\n"
    ".4byte 0x000002c8\n"
    ".4byte Sprite_Unitlistscreen_4 + 0x9e\n"
    ".4byte Sprite_Unitlistscreen_4 + 0x2c\n"
    ".4byte Sprite_Unitlistscreen_4 + 0x3a\n"
    ".4byte Sprite_Unitlistscreen_4 + 0x4e\n"
    ".4byte Sprite_Unitlistscreen_4 + 0x62\n"
    ".4byte Sprite_Unitlistscreen_4 + 0x76\n"
    ".4byte Sprite_Unitlistscreen_4 + 0x8a\n"
    ".4byte Sprite_Unitlistscreen_4 + 0x8a\n"
    ".4byte Sprite_Unitlistscreen_4 + 0x8a\n"
    ".4byte Sprite_Unitlistscreen_4 + 0x8a\n"
    ".4byte 0x00000001\n"
    ".4byte 0x00000474\n"
    ".4byte 0x00000014\n"
    ".4byte 0x0000066a\n"
    ".4byte 0x00000002\n"
    ".4byte 0x00000475\n"
    ".4byte 0x00000040\n"
    ".4byte 0x0000066b\n"
    ".4byte 0x0000000e\n"
    ".4byte 0x00000481\n"
    ".4byte 0x00000088\n"
    ".4byte 0x0000066e\n"
    ".4byte 0x00000020\n"
    ".4byte 0x0000048b\n"
    ".4byte 0x000000c0\n"
    ".4byte 0x00000677\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000001\n"
    ".4byte 0x00000474\n"
    ".4byte 0x00000014\n"
    ".4byte 0x0000066a\n"
    ".4byte 0x00000002\n"
    ".4byte 0x00000475\n"
    ".4byte 0x00000044\n"
    ".4byte 0x0000066b\n"
    ".4byte 0x00000003\n"
    ".4byte 0x00000476\n"
    ".4byte 0x00000081\n"
    ".4byte 0x000004d7\n"
    ".4byte 0x00000004\n"
    ".4byte 0x00000477\n"
    ".4byte 0x00000098\n"
    ".4byte 0x000004d8\n"
    ".4byte 0x00000005\n"
    ".4byte 0x00000478\n"
    ".4byte 0x000000b0\n"
    ".4byte 0x000004d9\n"
    ".4byte 0x00000006\n"
    ".4byte 0x00000479\n"
    ".4byte 0x000000c4\n"
    ".4byte 0x0000066c\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000001\n"
    ".4byte 0x00000474\n"
    ".4byte 0x00000014\n"
    ".4byte 0x0000066a\n"
    ".4byte 0x00000007\n"
    ".4byte 0x0000047a\n"
    ".4byte 0x00000040\n"
    ".4byte 0x0000066d\n"
    ".4byte 0x00000008\n"
    ".4byte 0x0000047b\n"
    ".4byte 0x0000005f\n"
    ".4byte 0x000004dd\n"
    ".4byte 0x00000009\n"
    ".4byte 0x0000047c\n"
    ".4byte 0x00000071\n"
    ".4byte 0x000004de\n"
    ".4byte 0x0000000a\n"
    ".4byte 0x0000047d\n"
    ".4byte 0x00000088\n"
    ".4byte 0x000004df\n"
    ".4byte 0x0000000b\n"
    ".4byte 0x0000047e\n"
    ".4byte 0x000000a1\n"
    ".4byte 0x000004e0\n"
    ".4byte 0x0000000c\n"
    ".4byte 0x0000047f\n"
    ".4byte 0x000000b8\n"
    ".4byte 0x000004e1\n"
    ".4byte 0x0000000d\n"
    ".4byte 0x00000480\n"
    ".4byte 0x000000ce\n"
    ".4byte 0x000004e6\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000001\n"
    ".4byte 0x00000474\n"
    ".4byte 0x00000014\n"
    ".4byte 0x0000066a\n"
    ".4byte 0x0000000e\n"
    ".4byte 0x00000481\n"
    ".4byte 0x00000050\n"
    ".4byte 0x0000066e\n"
    ".4byte 0x0000000f\n"
    ".4byte 0x00000482\n"
    ".4byte 0x00000087\n"
    ".4byte 0x000004f1\n"
    ".4byte 0x00000010\n"
    ".4byte 0x00000483\n"
    ".4byte 0x000000a6\n"
    ".4byte 0x000004f2\n"
    ".4byte 0x00000011\n"
    ".4byte 0x00000484\n"
    ".4byte 0x000000c8\n"
    ".4byte 0x000004f5\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000001\n"
    ".4byte 0x00000474\n"
    ".4byte 0x00000014\n"
    ".4byte 0x0000066a\n"
    ".4byte 0x00000012\n"
    ".4byte 0x00000485\n"
    ".4byte 0x00000047\n"
    ".4byte 0x000004e2\n"
    ".4byte 0x00000013\n"
    ".4byte 0x00000486\n"
    ".4byte 0x0000005f\n"
    ".4byte 0x000004e3\n"
    ".4byte 0x00000014\n"
    ".4byte 0x00000487\n"
    ".4byte 0x00000078\n"
    ".4byte 0x000004e4\n"
    ".4byte 0x00000016\n"
    ".4byte 0x00000488\n"
    ".4byte 0x00000093\n"
    ".4byte 0x000004e5\n"
    ".4byte 0x00000015\n"
    ".4byte 0x00000489\n"
    ".4byte 0x000000ba\n"
    ".4byte 0x0000066f\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000001\n"
    ".4byte 0x00000474\n"
    ".4byte 0x00000014\n"
    ".4byte 0x0000066a\n"
    ".4byte 0x00000017\n"
    ".4byte 0x00000000\n"
    ".4byte 0x0000004c\n"
    ".4byte 0x000004f6\n"
    ".4byte 0x00000018\n"
    ".4byte 0x00000000\n"
    ".4byte 0x0000005c\n"
    ".4byte 0x000004f7\n"
    ".4byte 0x00000019\n"
    ".4byte 0x00000000\n"
    ".4byte 0x0000006c\n"
    ".4byte 0x000004f8\n"
    ".4byte 0x0000001a\n"
    ".4byte 0x00000000\n"
    ".4byte 0x0000007c\n"
    ".4byte 0x000004f9\n"
    ".4byte 0x0000001b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x0000008c\n"
    ".4byte 0x000004fd\n"
    ".4byte 0x0000001c\n"
    ".4byte 0x00000000\n"
    ".4byte 0x0000009c\n"
    ".4byte 0x000004fa\n"
    ".4byte 0x0000001d\n"
    ".4byte 0x00000000\n"
    ".4byte 0x000000ac\n"
    ".4byte 0x000004fb\n"
    ".4byte 0x0000001e\n"
    ".4byte 0x00000000\n"
    ".4byte 0x000000bc\n"
    ".4byte 0x000004fc\n"
    ".4byte 0x00000001\n"
    ".4byte 0x00000474\n"
    ".4byte 0x00000014\n"
    ".4byte 0x0000066a\n"
    ".4byte 0x0000001f\n"
    ".4byte 0x0000048a\n"
    ".4byte 0x0000004a\n"
    ".4byte 0x000004ff\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000001\n"
    ".4byte 0x00000474\n"
    ".4byte 0x00000014\n"
    ".4byte 0x0000066a\n"
    ".4byte 0x0000001f\n"
    ".4byte 0x0000048a\n"
    ".4byte 0x0000004a\n"
    ".4byte 0x000004ff\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000001\n"
    ".4byte 0x00000474\n"
    ".4byte 0x00000014\n"
    ".4byte 0x0000066a\n"
    ".4byte 0x0000001f\n"
    ".4byte 0x0000048a\n"
    ".4byte 0x0000004a\n"
    ".4byte 0x000004ff\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000001\n"
    ".4byte 0x00000474\n"
    ".4byte 0x00000014\n"
    ".4byte 0x0000066a\n"
    ".4byte 0x0000001f\n"
    ".4byte 0x0000048a\n"
    ".4byte 0x0000004a\n"
    ".4byte 0x000004ff\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0xe0000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x0000e800\n"
    ".4byte 0xf0000000\n"
    ".4byte 0x80000000\n"
    ".4byte 0x0000f800\n"
    ".4byte 0x00000539\n"
    ".4byte 0x00000539\n"
    ".4byte 0x000006f1\n"
    ".4byte 0x0000053a\n"
    ".4byte 0x0000053b\n"
    ".4byte 0x000006f2\n"
    ".4byte 0x0000053c\n"
    ".4byte 0x0000053f\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x000006f3\n"
    ".4byte 0x0000053c\n"
    ".4byte 0x0000054c\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x0000053e\n"
    ".4byte 0x0000053e\n"
    ".4byte 0x00000000\n"
    ".4byte 0x000006ee\n"
    ".4byte 0x000006ef\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte PrepMenuDescOnInit\n"
    ".4byte 0x0001000e\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte PrepMenuDescOnParse\n"
    ".4byte 0x0000000e\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte PrepMenuDescOnDraw\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000001\n"
    ".4byte frontier_df4_misc_lo_021bt_1F5598 + 0x10\n"
    ".4byte 0x00000002\n"
    ".4byte AtMenu_LockGame\n"
    ".4byte 0x00000002\n"
    ".4byte EndPrepAtMenuIfNoUnitAvailable\n"
    ".4byte 0x00000002\n"
    ".4byte PrepAtMenu_OnInit\n"
    ".4byte 0x0002000e\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte AtMenu_Reinitialize\n"
    ".4byte 0x0002000e\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00080018\n"
    ".4byte NewFadeIn\n"
    ".4byte 0x00000014\n"
    ".4byte FadeInExists\n"
    ".4byte 0x00000014\n"
    ".4byte MusicProc4Exists\n"
    ".4byte 0x0001000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte EnablePrepScreenMenu\n"
    ".4byte 0x00000003\n"
    ".4byte AtMenu_UpdateDescLoop\n"
    ".4byte 0x0004000c\n"
    ".4byte 0x00000000\n"
    ".4byte 0x000c000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte AtMenu_InitSubmenuCursor\n"
    ".4byte 0x00000003\n"
    ".4byte AtMenu_CtrlLoop\n"
    ".4byte 0x0001000c\n"
    ".4byte 0x00000000\n"
    ".4byte 0x000d000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte AtMenu_Reinitialize\n"
    ".4byte 0x00000002\n"
    ".4byte AtMenu_InitSubmenuCursor\n"
    ".4byte 0x00080018\n"
    ".4byte NewFadeIn\n"
    ".4byte 0x00000014\n"
    ".4byte FadeInExists\n"
    ".4byte 0x00000014\n"
    ".4byte MusicProc4Exists\n"
    ".4byte 0x00000003\n"
    ".4byte AtMenu_CtrlLoop\n"
    ".4byte 0x0001000c\n"
    ".4byte 0x00000000\n"
    ".4byte 0x0002000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000003\n"
    ".4byte AtMenu_StartSubmenu\n"
    ".4byte 0x00000003\n"
    ".4byte AtMenu_OnSubmenuEnd\n"
    ".4byte 0x00000010\n"
    ".4byte 0x00000000\n"
    ".4byte 0x000a000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00100018\n"
    ".4byte NewFadeOut\n"
    ".4byte 0x00000014\n"
    ".4byte FadeOutExists\n"
    ".4byte 0x0002000c\n"
    ".4byte 0x00000000\n"
    ".4byte 0x0009000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte AtMenu_Reinitialize\n"
    ".4byte 0x00100018\n"
    ".4byte NewFadeIn\n"
    ".4byte 0x00000014\n"
    ".4byte FadeInExists\n"
    ".4byte 0x0001000c\n"
    ".4byte 0x00000000\n"
    ".4byte 0x0008000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00080018\n"
    ".4byte NewFadeOut\n"
    ".4byte 0x00000014\n"
    ".4byte FadeOutExists\n"
    ".4byte 0x0002000c\n"
    ".4byte 0x00000000\n"
    ".4byte 0x0007000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte AtMenu_Reinitialize\n"
    ".4byte 0x00080018\n"
    ".4byte NewFadeIn\n"
    ".4byte 0x00000014\n"
    ".4byte FadeInExists\n"
    ".4byte 0x0001000c\n"
    ".4byte 0x00000000\n"
    ".4byte 0x000b000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte AtMenuSetUnitStateAndEndFlag\n"
    ".4byte 0x0005000c\n"
    ".4byte 0x00000000\n"
    ".4byte 0x0004000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte AtMenuSetUnitStateAndEndFlag\n"
    ".4byte 0x000a000e\n"
    ".4byte 0x00000000\n"
    ".4byte 0x0005000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00080018\n"
    ".4byte NewFadeOut\n"
    ".4byte 0x00000014\n"
    ".4byte FadeOutExists\n"
    ".4byte 0x0001000e\n"
    ".4byte 0x00000000\n"
    ".4byte 0x0006000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte AtMenu_ResetScreenEffect\n"
    ".4byte 0x0000000e\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte AtMenu_ResetBmUiEffect\n"
    ".4byte 0x0000000e\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte EndAllMus\n"
    ".4byte 0x00000002\n"
    ".4byte AtMenu_UnlockGame\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000014\n"
    ".4byte MusicProc4Exists\n"
    ".4byte 0x00000002\n"
    ".4byte DoPromoteAnimForChar100\n"
    ".4byte 0x00000003\n"
    ".4byte IsGameLockLevelReserved\n"
    ".4byte 0x0008000e\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte NullExpForChar100AndResetScreen\n"
    ".4byte 0x001e000e\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000014\n"
    ".4byte MusicProc4Exists\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte AtMenu_LockGame\n"
    ".4byte 0x00000002\n"
    ".4byte StartTraineePromoScreen\n"
    ".4byte 0x0000000e\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00c8000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte TraineePromo_ResetScreenEffect\n"
    ".4byte 0x00000002\n"
    ".4byte AtMenu_UnlockGame\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x40000001\n"
    ".4byte 0x77808000\n"
    ".4byte 0x40000002\n"
    ".4byte 0x77c08000\n"
    ".4byte 0x80204000\n"
    ".4byte 0x000277c4\n"
    ".4byte 0x60004000\n"
    ".4byte 0x40006798\n"
    ".4byte 0x679ca020\n"
    ".4byte 0x40000002\n"
    ".4byte 0x67985020\n"
    ".4byte 0x90004000\n"
    ".4byte 0x0001679c\n"
    ".4byte 0x80004000\n"
    ".4byte 0x00016798\n"
    ".4byte 0x80004000\n"
    ".4byte 0x0003679c\n"
    ".4byte 0x80004000\n"
    ".4byte 0x40000412\n"
    ".4byte 0x04168020\n"
    ".4byte 0x40400000\n"
    ".4byte 0x0002041a\n"
    ".4byte 0x80004000\n"
    ".4byte 0x00000400\n"
    ".4byte 0x04044020\n"
    ".4byte 0x40000002\n"
    ".4byte 0x04408000\n"
    ".4byte 0x40200000\n"
    ".4byte 0x00020444\n"
    ".4byte 0x80004000\n"
    ".4byte 0x80000446\n"
    ".4byte 0x044a0020\n"
    ".4byte 0x40000002\n"
    ".4byte 0x044b8000\n"
    ".4byte 0x80204000\n"
    ".4byte 0x0001044f\n"
    ".4byte 0x00008000\n"
    ".4byte 0x00010406\n"
    ".4byte 0x00008000\n"
    ".4byte 0x00010407\n"
    ".4byte 0x00008000\n"
    ".4byte 0x00010408\n"
    ".4byte 0x00008000\n"
    ".4byte 0x00010409\n"
    ".4byte 0x00008000\n"
    ".4byte 0x0001040a\n"
    ".4byte 0x00008000\n"
    ".4byte 0x0001040b\n"
    ".4byte 0x00008000\n"
    ".4byte 0x0001040c\n"
    ".4byte 0x00008000\n"
    ".4byte 0x0001040d\n"
    ".4byte 0x00008000\n"
    ".4byte 0x0001040e\n"
    ".4byte 0x00008000\n"
    ".4byte 0x0001040f\n"
    ".4byte 0x00008000\n"
    ".4byte 0x00000410\n"
    ".4byte Sprite_PrepExMap + 0xe\n"
    ".4byte Sprite_PrepExMap + 0x16\n"
    ".4byte Sprite_PrepExMap + 0x1e\n"
    ".4byte Sprite_PrepExMap + 0x26\n"
    ".4byte Sprite_PrepExMap + 0x2e\n"
    ".4byte Sprite_PrepExMap + 0x36\n"
    ".4byte Sprite_PrepExMap + 0x3e\n"
    ".4byte Sprite_PrepExMap + 0x46\n"
    ".4byte Sprite_PrepExMap + 0x4e\n"
    ".4byte Sprite_PrepExMap + 0x56\n"
    ".4byte Sprite_PrepExMap + 0x5e\n"
    ".4byte Sprite_PrepExMap + 0xe\n"
    ".4byte 0x04000001\n"
    ".4byte 0x0c808000\n"
    ".4byte 0x44000003\n"
    ".4byte 0x0c948020\n"
    ".4byte 0x80484400\n"
    ".4byte 0x04000c98\n"
    ".4byte 0x0c9c4068\n"
    ".4byte 0x44000004\n"
    ".4byte 0x0c948008\n"
    ".4byte 0x80304400\n"
    ".4byte 0x44000cc4\n"
    ".4byte 0x0cc88050\n"
    ".4byte 0x40700400\n"
    ".4byte 0x00040ccc\n"
    ".4byte 0x80004400\n"
    ".4byte 0x44000c84\n"
    ".4byte 0x0c888020\n"
    ".4byte 0x80404400\n"
    ".4byte 0x44000c8c\n"
    ".4byte 0x0c908060\n"
    ".4byte 0x44000002\n"
    ".4byte 0x0c948030\n"
    ".4byte 0x80584400\n"
    ".4byte 0x00000cce\n"
    ".4byte SpriteArray_PrepChapterNumbers + 0x38\n"
    ".4byte SpriteArray_PrepChapterNumbers + 0x4c\n"
    ".4byte SpriteArray_PrepChapterNumbers + 0x66\n"
    ".4byte SpriteArray_PrepChapterNumbers + 0x80\n"
    ".4byte 0x0000000e\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte PrepSpriteDraw_Init\n"
    ".4byte 0x00000004\n"
    ".4byte PrepSpriteDraw_OnEnd\n"
    ".4byte 0x00000003\n"
    ".4byte PrepSpriteDraw_Loop\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000010\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
);
__asm__(
    ".section .data.frontier_df4_menu.gap19, \"aw\", %progbits\n"
    ".global data_08A94430\n"
    "data_08A94430:\n"
    ".4byte 0x00000002\n"
    ".4byte PrepMenu_OnInit\n"
    ".4byte 0x00000004\n"
    ".4byte PrepMenu_OnEnd\n"
    ".4byte 0x0000000e\n"
    ".4byte 0x00000000\n"
    ".4byte 0x0000000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000003\n"
    ".4byte PrepMenu_ShowActiveHand\n"
    ".4byte 0x0001000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000003\n"
    ".4byte PrepMenu_CtrlLoop\n"
    ".4byte 0x0002000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000003\n"
    ".4byte PrepMenu_ShowFrozenHand\n"
    ".4byte 0x000a000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
);
u8 frontier_df4_menu_020_A9454C[] __attribute__((section(".data.frontier_df4_menu.gap20"))) = INCBIN_U8("graphics/frontier_df4_menu/frontier_df4_menu_020_A9454C.bin", 0x0, 0x38);
u8 data_08A94584[] __attribute__((section(".data.frontier_df4_menu.gap20"))) = INCBIN_U8("graphics/frontier_df4_menu/frontier_df4_menu_020_A9454C.bin", 0x38, 0xF08);
u8 data_08A9548C[] __attribute__((section(".data.frontier_df4_menu.gap20"))) = INCBIN_U8("graphics/frontier_df4_menu/frontier_df4_menu_020_A9454C.bin", 0xF40, 0x64C);
u8 data_08A95AD8[] __attribute__((section(".data.frontier_df4_menu.gap20"))) = INCBIN_U8("graphics/frontier_df4_menu/frontier_df4_menu_020_A9454C.bin", 0x158C, 0x3C);
u8 frontier_df4_menu_021_A95B4E[] __attribute__((section(".data.frontier_df4_menu.gap21"))) = INCBIN_U8("graphics/frontier_df4_menu/frontier_df4_menu_021_A95B4E.bin");
u8 frontier_df4_menu_022_A96D18[] __attribute__((section(".data.frontier_df4_menu.gap22"))) = INCBIN_U8("graphics/frontier_df4_menu/frontier_df4_menu_022_A96D18.bin");
u8 frontier_df4_menu_023_A99FA8[] __attribute__((section(".data.frontier_df4_menu.gap23"))) = INCBIN_U8("graphics/frontier_df4_menu/frontier_df4_menu_023_A99FA8.bin");
u8 frontier_df4_menu_024_A9AC28[] __attribute__((section(".data.frontier_df4_menu.gap24"))) = INCBIN_U8("graphics/frontier_df4_menu/frontier_df4_menu_024_A9AC28.bin", 0, 1020);
__asm__(
    ".section .data.frontier_df4_menu.gap26, \"aw\", %progbits\n"
    ".global frontier_df4_menu_026_A9CF7C\n"
    "frontier_df4_menu_026_A9CF7C:\n"
    ".4byte 0x60000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00006800\n"
    ".4byte 0x70008000\n"
    ".4byte 0x80000000\n"
    ".4byte 0x00007800\n"
    ".4byte 0x0000000e\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte SaveMenuPopupHelpBox_Init\n"
    ".4byte 0x0008000e\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000003\n"
    ".4byte SaveMenuPopupHelpBox_WaitInput\n"
    ".4byte 0x0008000e\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
);
__asm__(
    ".section .data.frontier_df4_menu.gap26, \"aw\", %progbits\n"
    ".global data_08A9CFC4\n"
    "data_08A9CFC4:\n"
    ".4byte 0x00000002\n"
    ".4byte ExtraMapStartSomeBgm\n"
    ".4byte 0x0000000e\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte ExecExtraMap\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000001\n"
    ".4byte frontier_df4_voice_000_1F578C + 0x50\n"
    ".4byte 0x0000000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x0000000e\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte SaveMenu_Init\n"
    ".4byte 0x0000000e\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte SaveMenu_InitScreen\n"
    ".4byte 0x00000002\n"
    ".4byte SaveMenu_LoadExtraMenuGraphics\n"
    ".4byte 0x0000000e\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00080018\n"
    ".4byte NewFadeIn\n"
    ".4byte 0x00000014\n"
    ".4byte FadeInExists\n"
    ".4byte 0x0000000e\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000014\n"
    ".4byte MusicProc4Exists\n"
    ".4byte 0x00000002\n"
    ".4byte SaveMenu_JumpToTarget\n"
    ".4byte 0x0002000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000003\n"
    ".4byte SameMenu_CtrlLoop\n"
    ".4byte 0x000f000c\n"
    ".4byte 0x00000000\n"
    ".4byte 0x0001000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte SaveMenu_ResetLcdFormDifficulty\n"
    ".4byte 0x00080018\n"
    ".4byte NewFadeOut\n"
    ".4byte 0x00000014\n"
    ".4byte FadeOutExists\n"
    ".4byte 0x00000002\n"
    ".4byte DisableAllDisplay\n"
    ".4byte 0x00000002\n"
    ".4byte sub_80B0E88\n"
    ".4byte 0x0000000e\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte SaveMenu_ReloadScreenFormDifficulty\n"
    ".4byte 0x00000002\n"
    ".4byte SaveMenu_ResetLcdFormDifficulty\n"
    ".4byte 0x00080018\n"
    ".4byte NewFadeIn\n"
    ".4byte 0x00000014\n"
    ".4byte FadeInExists\n"
    ".4byte 0x00000002\n"
    ".4byte SaveMenu_PostDifficultHandler\n"
    ".4byte 0x0005000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte SaveMenuSlotSelDrawSprite\n"
    ".4byte 0x0000000e\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000003\n"
    ".4byte SaveMenu_SaveSlotSelectLoop\n"
    ".4byte 0x000f000c\n"
    ".4byte 0x00000000\n"
    ".4byte 0x0007000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x0005000e\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte _ExecSaveMenuMiscOption\n"
    ".4byte 0x0005000c\n"
    ".4byte 0x00000000\n"
    ".4byte 0x0006000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x0001000e\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte SaveMenuRegisterSlotSelected\n"
    ".4byte 0x0001000e\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000003\n"
    ".4byte SaveMenuWaitSlotBoxScrolling\n"
    ".4byte 0x0005000c\n"
    ".4byte 0x00000000\n"
    ".4byte 0x0003000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000003\n"
    ".4byte SaveMenuScrollSlot\n"
    ".4byte 0x0005000c\n"
    ".4byte 0x00000000\n"
    ".4byte 0x0004000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte SaveMenu_EndHelpPromptSprite\n"
    ".4byte 0x00000003\n"
    ".4byte SaveMenuScrollBackToMain\n"
    ".4byte 0x0002000c\n"
    ".4byte 0x00000000\n"
    ".4byte 0x0008000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000003\n"
    ".4byte SaveMenuScrollExtrasIn\n"
    ".4byte 0x0009000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000003\n"
    ".4byte SaveMenuScrollExtrasOut\n"
    ".4byte 0x000c000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte SaveMenuLoadExtraOptionGfx\n"
    ".4byte 0x00000003\n"
    ".4byte SaveMenuScrollExtraSlotIn\n"
    ".4byte 0x000d000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000003\n"
    ".4byte SaveMenuScrollExtraSlotOut\n"
    ".4byte 0x000a000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000003\n"
    ".4byte gap_000AE5A4 + 0x1\n"
    ".4byte 0x000b000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte SaveMenuStartBonusClaim\n"
    ".4byte 0x0000000e\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000003\n"
    ".4byte SaveMenuExtraSlotSelectLoop\n"
    ".4byte 0x000e000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00080018\n"
    ".4byte NewFadeOut\n"
    ".4byte 0x00000014\n"
    ".4byte FadeOutExists\n"
    ".4byte 0x00000014\n"
    ".4byte IsMusicProc2Running\n"
    ".4byte 0x00000002\n"
    ".4byte sub_80AEBAC\n"
    ".4byte 0x0000000e\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte SaveMenu_Init\n"
    ".4byte 0x0000000e\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte SaveMenu_InitScreen\n"
    ".4byte 0x00000002\n"
    ".4byte SaveMenu_LoadExtraMenuGraphics\n"
    ".4byte 0x0000000e\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00080018\n"
    ".4byte NewFadeIn\n"
    ".4byte 0x00000014\n"
    ".4byte FadeInExists\n"
    ".4byte 0x00000014\n"
    ".4byte IsMusicProc2Running\n"
    ".4byte 0x00000002\n"
    ".4byte SaveMenuPostExtraMiscScreen\n"
    ".4byte 0x0015000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000010\n"
    ".4byte 0x00000000\n"
    ".4byte 0x0012000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00040018\n"
    ".4byte NewFadeOut\n"
    ".4byte 0x00000014\n"
    ".4byte FadeOutExists\n"
    ".4byte 0x000f000c\n"
    ".4byte 0x00000000\n"
    ".4byte 0x0011000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00080018\n"
    ".4byte NewFadeOut\n"
    ".4byte 0x00000014\n"
    ".4byte FadeOutExists\n"
    ".4byte 0x000f000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x0000000e\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte PostSaveMenuHandler\n"
    ".4byte 0x0000000e\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000001\n"
    ".4byte frontier_df4_voice_000_1F578C + 0x50\n"
    ".4byte 0x0000000e\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte SaveMenuInit\n"
    ".4byte 0x00000002\n"
    ".4byte SaveMenu_SetLcdChapterIdx\n"
    ".4byte 0x0000000e\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte SaveMenu_InitScreen\n"
    ".4byte 0x0000000e\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte SaveMenuDirectlySelectSlotOnPrepScreen\n"
    ".4byte 0x00080018\n"
    ".4byte NewFadeIn\n"
    ".4byte 0x00000014\n"
    ".4byte FadeInExists\n"
    ".4byte 0x0005000c\n"
    ".4byte 0x00000000\n"
    ".4byte 0x0014000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00040018\n"
    ".4byte NewFadeIn\n"
    ".4byte 0x00000014\n"
    ".4byte FadeInExists\n"
    ".4byte 0x0005000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000003\n"
    ".4byte SaveMenu_SaveSlotSelectLoop\n"
    ".4byte 0x000f000c\n"
    ".4byte 0x00000000\n"
    ".4byte 0x0006000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x0001000e\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte SaveMenuRegisterSlotSelected\n"
    ".4byte 0x0001000e\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000003\n"
    ".4byte SaveMenuWaitSlotBoxScrolling\n"
    ".4byte 0x0005000c\n"
    ".4byte 0x00000000\n"
    ".4byte 0x0012000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00040018\n"
    ".4byte NewFadeOut\n"
    ".4byte 0x00000014\n"
    ".4byte FadeOutExists\n"
    ".4byte 0x000f000c\n"
    ".4byte 0x00000000\n"
    ".4byte 0x0011000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00080018\n"
    ".4byte NewFadeOut\n"
    ".4byte 0x00000014\n"
    ".4byte FadeOutExists\n"
    ".4byte 0x000f000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x0000000e\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte PostSaveMenuHandler\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x02000968\n"
    ".4byte 0x00000002\n"
    ".4byte BonusClaimMenu_Init\n"
    ".4byte 0x00000002\n"
    ".4byte BonusClaimMenu_PromptSong4\n"
    ".4byte 0x00000003\n"
    ".4byte BonusClaimMenu_WaitInput\n"
    ".4byte 0x0010000e\n"
    ".4byte 0x00000000\n"
    ".4byte 0x0000000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte BonusClaimMenu_PromptSong3\n"
    ".4byte 0x00000003\n"
    ".4byte BonusClaimMenu_WaitInput\n"
    ".4byte 0x0010000e\n"
    ".4byte 0x00000000\n"
    ".4byte 0x0001000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte BonusClaimMenu_SaveData\n"
    ".4byte 0x000a000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
);
u8 frontier_df4_menu_027_A9D462[] __attribute__((section(".data.frontier_df4_menu.gap27"))) = INCBIN_U8("graphics/frontier_df4_menu/frontier_df4_menu_027_A9D462.bin", 0x0, 0x226);
u8 data_08A9D688[] __attribute__((section(".data.frontier_df4_menu.gap27"))) = INCBIN_U8("graphics/frontier_df4_menu/frontier_df4_menu_027_A9D462.bin", 0x226, 0x1CE);
__asm__(
    ".section .data.frontier_df4_menu.gap28, \"aw\", %progbits\n"
    ".global frontier_df4_menu_028_A9E244\n"
    "frontier_df4_menu_028_A9E244:\n"
    ".4byte 0x02021188\n"
    ".4byte 0x02021388\n"
    ".4byte 0x00000002\n"
    ".4byte SoundRoomSongChange_FadeOutPrevious\n"
    ".4byte 0x0000000e\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte SoundRoomSongChange_StartNext\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x03005400\n"
    ".4byte 0x0000000e\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte sub_80B3E40\n"
    ".4byte 0x0000000e\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte nullsub_89\n"
    ".4byte 0x00000003\n"
    ".4byte VolumeGraphBuffer_Loop\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
);
__asm__(
    ".section .data.frontier_df4_menu.gap28, \"aw\", %progbits\n"
    ".global data_08A9E2A0\n"
    "data_08A9E2A0:\n"
    ".4byte 0x0000000e\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte SoundRoomUi_Init\n"
    ".4byte 0x00040018\n"
    ".4byte NewFadeIn\n"
    ".4byte 0x00000014\n"
    ".4byte FadeInExists\n"
    ".4byte 0x00000014\n"
    ".4byte MusicProc4Exists\n"
    ".4byte 0x0000000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000003\n"
    ".4byte SoundRoomUi_Loop_MainKeyHandler\n"
    ".4byte 0x0001000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte SoundRoomUi_0\n"
    ".4byte 0x00000003\n"
    ".4byte SoundRoomUi_Loop_MainUiSlideOut\n"
    ".4byte 0x00000003\n"
    ".4byte SoundRoomUi_1\n"
    ".4byte 0x00000002\n"
    ".4byte SoundRoomUi_2\n"
    ".4byte 0x00000003\n"
    ".4byte SoundRoomUi_Loop_MainUiSlideIn\n"
    ".4byte 0x0000000c\n"
    ".4byte 0x00000000\n"
    ".4byte 0x0002000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte SoundRoomUi_0\n"
    ".4byte 0x00000003\n"
    ".4byte SoundRoomUi_Loop_MainUiSlideOut\n"
    ".4byte 0x00000002\n"
    ".4byte SoundRoomUi_3\n"
    ".4byte 0x00000003\n"
    ".4byte SoundRoomUi_Loop_ShufflePlayUiSlideIn\n"
    ".4byte 0x0010000e\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000003\n"
    ".4byte SoundRoomUi_Loop_ShufflePlayKeyHandler\n"
    ".4byte 0x00000003\n"
    ".4byte SoundRoomUi_Loop_ShufflePlayUiSlideOut\n"
    ".4byte 0x00000002\n"
    ".4byte SoundRoomUi_2\n"
    ".4byte 0x00000003\n"
    ".4byte SoundRoomUi_Loop_MainUiSlideIn\n"
    ".4byte 0x0010000e\n"
    ".4byte 0x00000000\n"
    ".4byte 0x0000000c\n"
    ".4byte 0x00000000\n"
    ".4byte 0x0003000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000003\n"
    ".4byte SoundRoomUi_RestartTitleMusic\n"
    ".4byte 0x00040018\n"
    ".4byte NewFadeOut\n"
    ".4byte 0x00000014\n"
    ".4byte FadeOutExists\n"
    ".4byte 0x00000002\n"
    ".4byte SoundRoomUi_OnEnd\n"
    ".4byte 0x0000000e\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte 0x05504008\n"
    ".4byte 0x80204000\n"
    ".4byte 0x00020512\n"
    ".4byte 0x80004000\n"
    ".4byte 0x40000552\n"
    ".4byte 0x05168020\n"
    ".4byte 0x40000002\n"
    ".4byte 0x05568000\n"
    ".4byte 0x80204000\n"
    ".4byte 0x0005051a\n"
    ".4byte 0x80004000\n"
    ".4byte 0x40000500\n"
    ".4byte 0x05048020\n"
    ".4byte 0x80404000\n"
    ".4byte 0x40000508\n"
    ".4byte 0x050c8060\n"
    ".4byte 0x40800000\n"
    ".4byte 0x00030510\n"
    ".4byte 0x40004000\n"
    ".4byte 0x40000560\n"
    ".4byte 0x05644020\n"
    ".4byte 0x00400000\n"
    ".4byte 0x00010568\n"
    ".4byte 0x00000000\n"
    ".4byte 0x0001014f\n"
    ".4byte 0x40004000\n"
    ".4byte 0x00010140\n"
    ".4byte 0x00000000\n"
    ".4byte 0x0001014e\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00010144\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00010145\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00010146\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00010147\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00010148\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00010149\n"
    ".4byte 0x00000000\n"
    ".4byte 0x0001014a\n"
    ".4byte 0x00000000\n"
    ".4byte 0x0001014b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x0001014c\n"
    ".4byte 0x00000000\n"
    ".4byte 0x0000014d\n"
    ".4byte gSprite_MusicPlayer_Colon + 0x8\n"
    ".4byte gSprite_MusicPlayer_Colon + 0x10\n"
    ".4byte gSprite_MusicPlayer_Colon + 0x18\n"
    ".4byte gSprite_MusicPlayer_Colon + 0x20\n"
    ".4byte gSprite_MusicPlayer_Colon + 0x28\n"
    ".4byte gSprite_MusicPlayer_Colon + 0x30\n"
    ".4byte gSprite_MusicPlayer_Colon + 0x38\n"
    ".4byte gSprite_MusicPlayer_Colon + 0x40\n"
    ".4byte gSprite_MusicPlayer_Colon + 0x48\n"
    ".4byte gSprite_MusicPlayer_Colon + 0x50\n"
    ".4byte 0x0000000e\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte sub_80B4F34\n"
    ".4byte 0x00000003\n"
    ".4byte SoundRoom_DrawSprites_Loop\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x60000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00006800\n"
    ".4byte 0x78008000\n"
    ".4byte 0x80000000\n"
    ".4byte 0x00007800\n"
);
__asm__(
    ".section .data.frontier_df4_menu.gap28, \"aw\", %progbits\n"
    ".global data_08A9E4D0\n"
    "data_08A9E4D0:\n"
    ".4byte 0x00000002\n"
    ".4byte ExtramenuUnk_Init\n"
    ".4byte 0x00000002\n"
    ".4byte ExtramenuUnk_LoadGfx\n"
    ".4byte 0x00000004\n"
    ".4byte nullsub_90\n"
    ".4byte 0x00000003\n"
    ".4byte ExtramenuUnk_DrawIconLoop\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
    ".4byte 0x02000968\n"
    ".4byte 0x02000d68\n"
    ".4byte 0x02001168\n"
    ".4byte 0x02001568\n"
    ".4byte 0x02001668\n"
    ".4byte 0x02001368\n"
);
__asm__(
    ".section .data.frontier_df4_menu.gap28, \"aw\", %progbits\n"
    ".global data_08A9E510\n"
    "data_08A9E510:\n"
    ".4byte 0x0000000e\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte BonusClaim_Init\n"
    ".4byte 0x00080018\n"
    ".4byte NewFadeIn\n"
    ".4byte 0x00000014\n"
    ".4byte FadeInExists\n"
    ".4byte 0x0000000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000003\n"
    ".4byte BonusClaim_Loop_MainKeyHandler\n"
    ".4byte 0x0064000c\n"
    ".4byte 0x00000000\n"
    ".4byte 0x0001000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte BonusClaim_StartSelectTargetSubMenu\n"
    ".4byte 0x00000003\n"
    ".4byte BonusClaim_Loop_SelectTargetKeyHandler\n"
    ".4byte 0x00000002\n"
    ".4byte BonusClaim_EndSelectTargetSubMenu\n"
    ".4byte 0x0000000c\n"
    ".4byte 0x00000000\n"
    ".4byte 0x0002000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000002\n"
    ".4byte BonusClaim_DrawItemSentPopup\n"
    ".4byte 0x00000003\n"
    ".4byte BonusClaim_Loop_PopupDisplayTimer\n"
    ".4byte 0x00000002\n"
    ".4byte BonusClaim_ClearItemSentPopup\n"
    ".4byte 0x0000000c\n"
    ".4byte 0x00000000\n"
    ".4byte 0x0064000b\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00080018\n"
    ".4byte NewFadeOut\n"
    ".4byte 0x00000014\n"
    ".4byte FadeOutExists\n"
    ".4byte 0x00000002\n"
    ".4byte BonusClaim_OnEnd\n"
    ".4byte 0x00000000\n"
    ".4byte 0x00000000\n"
);
u8 frontier_df4_menu_029_AA3860[] __attribute__((section(".data.frontier_df4_menu.gap29"))) = INCBIN_U8("graphics/frontier_df4_menu/frontier_df4_menu_029_AA3860.bin");
u8 frontier_df4_menu_030_AA71D4[] __attribute__((section(".data.frontier_df4_menu.gap30"))) = INCBIN_U8("graphics/frontier_df4_menu/frontier_df4_menu_030_AA71D4.bin");
u8 frontier_df4_menu_031_AA9F98[] __attribute__((section(".data.frontier_df4_menu.gap31"))) = INCBIN_U8("graphics/frontier_df4_menu/frontier_df4_menu_031_AA9F98.bin");
u8 frontier_df4_menu_032_AAAC4C[] __attribute__((section(".data.frontier_df4_menu.gap32"))) = INCBIN_U8("graphics/frontier_df4_menu/frontier_df4_menu_032_AAAC4C.bin", 0x0, 0x7F4);
u8 data_08AAB440[] __attribute__((section(".data.frontier_df4_menu.gap32"))) = INCBIN_U8("graphics/frontier_df4_menu/frontier_df4_menu_032_AAAC4C.bin", 0x7F4, 0x2818);
u8 frontier_df4_menu_033_AAEB40[] __attribute__((section(".data.frontier_df4_menu.gap33"))) = INCBIN_U8("graphics/frontier_df4_menu/frontier_df4_menu_033_AAEB40.bin");
struct ProcCmd frontier_df4_menu_034_AAF9EC[] __attribute__((section(".data.frontier_df4_menu.gap34"))) = {
    PROC_NAME((const char *)0x081F5868),
    PROC_SLEEP(0x1),
    PROC_CALL((ProcFunc)0x080B63A5),
    PROC_END,
    PROC_NAME((const char *)0x081F5878),
    PROC_CALL((ProcFunc)0x080B6541),
    PROC_LABEL(0x0),
    PROC_CALL((ProcFunc)0x080B6559),
    PROC_SLEEP(0x0),
    PROC_GOTO(0x0),
    PROC_END,
    PROC_NAME((const char *)0x081F5898),
    PROC_CALL((ProcFunc)0x08015385),
    PROC_CALL_ARG((ProcFunc)0x080B2D71, 0x10),
    PROC_WHILE((ProcFunc)0x080B2D35),
    PROC_CALL((ProcFunc)0x080300D5),
    PROC_LABEL(0x0),
    PROC_SLEEP(0x0),
    PROC_CALL((ProcFunc)0x080B6629),
    PROC_CALL_ARG((ProcFunc)0x080B2D4D, 0x10),
    PROC_WHILE((ProcFunc)0x080B2D1D),
    PROC_REPEAT((ProcFunc)0x080B6E25),
    PROC_CALL((ProcFunc)0x08013E39),
    PROC_REPEAT((ProcFunc)0x08014121),
    PROC_CALL((ProcFunc)0x0808B2C9),
    PROC_CALL_2((ProcFunc)0x080B707D),
    PROC_CALL((ProcFunc)0x08030109),
    PROC_CALL((ProcFunc)0x080310F5),
    PROC_CALL((ProcFunc)0x08013E5D),
    PROC_REPEAT((ProcFunc)0x08014121),
    PROC_CALL((ProcFunc)0x08015395),
    PROC_END,
    PROC_NAME((const char *)0x081F5898),
    PROC_CALL((ProcFunc)0x08015385),
    PROC_LABEL(0x0),
    PROC_SLEEP(0x0),
    PROC_CALL((ProcFunc)0x080B6629),
    PROC_CALL((ProcFunc)0x080B70C5),
    PROC_CALL_ARG((ProcFunc)0x080B2D4D, 0x10),
    PROC_WHILE((ProcFunc)0x080B2D1D),
    PROC_REPEAT((ProcFunc)0x080B6E25),
    PROC_CALL((ProcFunc)0x08013E39),
    PROC_REPEAT((ProcFunc)0x08014121),
    PROC_CALL((ProcFunc)0x0808B2C9),
    PROC_CALL_2((ProcFunc)0x080B707D),
    PROC_CALL((ProcFunc)0x08015395),
    PROC_END,
    PROC_NAME((const char *)0x081F5898),
    PROC_CALL((ProcFunc)0x08015385),
    PROC_CALL((ProcFunc)0x080300D5),
    PROC_LABEL(0x0),
    PROC_SLEEP(0x0),
    PROC_CALL((ProcFunc)0x080B6629),
    PROC_CALL((ProcFunc)0x080B70D9),
    PROC_CALL((ProcFunc)0x08013E5D),
    PROC_REPEAT((ProcFunc)0x08014121),
    PROC_REPEAT((ProcFunc)0x080B6E25),
    PROC_CALL((ProcFunc)0x08013E39),
    PROC_REPEAT((ProcFunc)0x08014121),
    PROC_CALL((ProcFunc)0x0808B2C9),
    PROC_CALL_2((ProcFunc)0x080B707D),
    PROC_CALL((ProcFunc)0x08030109),
    PROC_CALL((ProcFunc)0x080310F5),
    PROC_CALL((ProcFunc)0x08015395),
    PROC_END,
    PROC_NAME((const char *)0x081F58A4),
    PROC_SLEEP(0x2),
    PROC_CALL((ProcFunc)0x080B70F5),
    PROC_SLEEP(0x0),
    PROC_REPEAT((ProcFunc)0x080B7135),
    PROC_END,
    PROC_NAME((const char *)0x081F58B0),
    PROC_SLEEP(0x2),
    PROC_CALL((ProcFunc)0x080B7131),
    PROC_SLEEP(0x0),
    PROC_REPEAT((ProcFunc)0x080B7221),
    PROC_END,
    PROC_NAME((const char *)0x081F58BC),
    PROC_SLEEP(0x0),
    PROC_CALL((ProcFunc)0x080B7431),
    PROC_REPEAT((ProcFunc)0x080B751D),
    PROC_LABEL(0x4),
    PROC_CALL((ProcFunc)0x080B75ED),
    PROC_SLEEP(0x3C),
    PROC_LABEL(0x5),
    PROC_CALL((ProcFunc)0x080B75F9),
    PROC_SLEEP(0x1E),
    PROC_END,
};
/* data_08AAFCAC: atomic relocation carve (was INCBIN); every embedded ROM
   pointer expressed as .4byte Sym(+addend), byte-exact. make compare is the oracle. */
__asm__(
"	.section .data.frontier_df4_menu.gap34, \"aw\", %progbits\n"
"	.global data_08AAFCAC\n"
"data_08AAFCAC:\n"
"	.4byte 0x03000001, 0x04008000, 0x00000001, gUnkData_ClassIntroBgConfig + 0x18, 0x00100018, 0x080B2D4D\n"
"	.4byte 0x00000014, 0x080B2D1D, 0x0001000E, 0x00000000, 0x00000002, 0x080B77A5\n"
"	.4byte 0x00000003, 0x080B7A19, 0x003C000E, 0x00000000, 0x00000003, 0x080B7A99\n"
"	.4byte 0x00000002, 0x080B7AF9, 0x00000002, 0x08013E21, 0x00000003, 0x08014121\n"
"	.4byte 0x0004000B, 0x00000000, 0x00000002, 0x080B7B1D, 0x00000000, 0x00000000\n"
"	.4byte 0x00000001, gUnkData_ClassIntroBgConfig + 0x24, 0x0001000E, 0x00000000, 0x00000002, 0x080B7B49\n"
"	.4byte 0x00000003, 0x080B7B65, 0x00000003, 0x080B7BC1, 0x00000003, 0x080B7BE9\n"
"	.4byte 0x00000000, 0x00000000, 0x00000001, gUnkData_ClassIntroBgConfig + 0x30, 0x0001000E, 0x00000000\n"
"	.4byte 0x00000002, 0x080B7C79, 0x00000003, 0x080B7DA1, 0x00000003, 0x080B7DDD\n"
"	.4byte 0x0004000B, 0x00000000, 0x00000003, 0x080B7DF9, 0x00000000, 0x00000000\n"
"	.4byte 0x0001000E, 0x00000000, 0x00000002, 0x080B7E6D, 0x00000005, gProcScr_ClassIntro_FlareFX + 0x30\n"
"	.4byte 0x00000003, 0x080B7E9D, 0x001E000E, 0x00000000, 0x00000000, 0x00000000\n"
"	.4byte 0x001E000E, 0x00000000, 0x00000002, 0x080B7FD5, 0x00000003, 0x080B8089\n"
"	.4byte 0x00000000, 0x00000000, 0x0000000E, 0x00000000, 0x00080018, 0x080B2D71\n"
"	.4byte 0x00000014, 0x080B2D35, 0x00000002, 0x080B83A9, 0x00000004, 0x080B8A49\n"
"	.4byte 0x0002000E, 0x00000000, 0x00000003, 0x080B87FD, 0x0009000B, 0x00000000\n"
"	.4byte 0x00000002, 0x080B8931, 0x00000003, 0x080B89C5, 0x0009000C, 0x00000000\n"
"	.4byte 0x000A000B, 0x00000000, 0x00000010, 0x00000000, 0x0004000B, 0x00000000\n"
"	.4byte 0x00080018, 0x080B2D71, 0x00000014, 0x080B2D35, 0x0008000C, 0x00000000\n"
"	.4byte 0x0007000B, 0x00000000, 0x00020018, 0x080B2D71, 0x00000014, 0x080B2D35\n"
"	.4byte 0x0008000B, 0x00000000, 0x00000000, 0x00000000, 0x00000001, gOpinfo_0 + 0x30\n"
"	.4byte 0x0003000E, 0x00000000, 0x00000002, 0x080B8AA9, 0x00000003, 0x080B8B29\n"
"	.4byte 0x00000000, 0x00000000, 0x00000001, 0x093F0000, 0x00000001, 0x093E0000\n"
"	.4byte 0x00000001, 0x093D0000, 0x00000001, 0x093C0000, gProcScr_opinfogaugedraw + 0x28, gProcScr_opinfogaugedraw + 0x30\n"
"	.4byte gProcScr_opinfogaugedraw + 0x38, gProcScr_opinfogaugedraw + 0x40, 0x00000001, 0x07008000, 0x00000001, 0x07048000\n"
"	.4byte 0x00000001, 0x07088000, 0x00000001, 0x070C8000, 0x00000001, 0x07108000\n"
"	.4byte 0x00000001, 0x07148000, 0x00000001, 0x07188000, 0x00000001, 0x071C8000\n"
"	.4byte gProcScr_opinfogaugedraw + 0x58, gProcScr_opinfogaugedraw + 0x60, gProcScr_opinfogaugedraw + 0x68, gProcScr_opinfogaugedraw + 0x70, gProcScr_opinfogaugedraw + 0x78, gProcScr_opinfogaugedraw + 0x80\n"
"	.4byte gProcScr_opinfogaugedraw + 0x88, gProcScr_opinfogaugedraw + 0x90, 0x00000001, 0x07804000, 0x00011E05, 0x28050008\n"
"	.4byte 0x50050003, 0x00080001, 0x00032805, 0x28050000, 0x00080001, 0x00032805\n"
"	.4byte 0x00016405, 0x28050008, 0x00000003, 0x00012805, 0x5A050008, 0x00000003\n"
"	.4byte 0x00043C05, 0x46050008, 0x00000003, 0x00013C05, 0x28050008, 0x00000003\n"
"	.4byte 0x00042805, 0x28050008, 0x48050003, 0x00080004, 0x00032805, 0x28050000\n"
"	.4byte 0x00080004, 0x00032805, 0x50050000, 0x00080004, 0x00035A05, 0x50050000\n"
"	.4byte 0x00080004, 0x00035A05, 0x50050000, 0x00080001, 0x00036405, 0x78050000\n"
"	.4byte 0x00080001, 0x00032805, 0x28050000, 0x00080004, 0x0003AA05, 0x3C050000\n"
"	.4byte 0x00080004, 0x00036005, 0x28050000, 0x00080004, 0x0003C805, 0x00000000\n"
"	.4byte gUnkData_96 + 0x20, gUnkData_96 + 0xD4, gUnkData_96 + 0x144, gUnkData_96 + 0x1E4, gUnkData_96 + 0x28C, gUnkData_96 + 0x344\n"
"	.4byte gUnkData_96 + 0x404, gUnkData_96 + 0x4A8, gUnkData_96 + 0x560, gUnkData_96 + 0x610, gUnkData_96 + 0x6A4, gUnkData_96 + 0x72C\n"
"	.4byte gUnkData_96 + 0x7E4, gUnkData_96 + 0x884, gUnkData_96 + 0x944, gUnkData_96 + 0xA18, gUnkData_96 + 0xAD4, gUnkData_96 + 0xB70\n"
"	.4byte gUnkData_96 + 0xC18, gUnkData_96 + 0xCBC, gUnkData_96 + 0xD60, gUnkData_96 + 0xDF8, gUnkData_96 + 0xE80, gUnkData_96 + 0xF10\n"
"	.4byte gUnkData_96 + 0xFAC, gUnkData_96 + 0x1068, gUnkData_96 + 0x1110, gUnkData_96 + 0x11C8, gUnkData_96 + 0x1250, gUnkData_96 + 0x12FC\n"
"	.4byte gUnkData_96 + 0x1370, gUnkData_96 + 0x1448, gUnkData_96 + 0x1504, gUnkData_96 + 0x15C0, gUnkData_96 + 0x165C, gUnkData_96 + 0x170C\n"
"	.4byte gUnkData_96 + 0x17AC, gUnkData_96 + 0x1890, gUnkData_96 + 0x1924, gUnkData_96 + 0x19C4, gUnkData_96 + 0x1A7C, gUnkData_96 + 0x1B08\n"
"	.4byte gUnkData_96 + 0x1BB0, gUnkData_96 + 0x1C74, gUnkData_96 + 0x1D38, gUnkData_96 + 0x1DC8, gUnkData_96 + 0x1E88, gUnkData_96 + 0x1F2C\n"
"	.4byte gUnkData_96 + 0x1FB8, gUnkData_96 + 0x2068, gUnkData_96 + 0x20F4, gUnkData_96 + 0x2194, gUnkData_96 + 0x222C, gUnkData_96 + 0x22D4\n"
"	.4byte gUnkData_96 + 0x2398, gUnkData_96 + 0x242C, gUnkData_96 + 0x24BC, gUnkData_96 + 0x25F4, gUnkData_96 + 0x26DC, gUnkData_96 + 0x27E0\n"
"	.4byte gUnkData_96 + 0x28D4, gUnkData_96 + 0x29E4, gUnkData_96 + 0x2B24, gUnkData_96 + 0x2BD0, gUnkData_96 + 0x2C74, gUnkData_96 + 0x2DA4\n"
"	.4byte gUnkData_96 + 0x2EE0, gUnkData_96 + 0x2FEC, gUnkData_96 + 0x3090, gUnkData_96 + 0x31B4, gUnkData_96 + 0x32E0, gUnkData_96 + 0x33E4\n"
"	.4byte gUnkData_96 + 0x34D8, gUnkData_96 + 0x35A4, gUnkData_96 + 0x36C8, gUnkData_96 + 0x37D4, gUnkData_96 + 0x3900, gUnkData_96 + 0x39A0\n"
"	.4byte gUnkData_96 + 0x3A60, gUnkData_96 + 0x3B80, gUnkData_96 + 0x3C38, gUnkData_96 + 0x3D54, gUnkData_96 + 0x3E30, gUnkData_96 + 0x3F28\n"
"	.4byte gUnkData_96 + 0x4048, gUnkData_96 + 0x40E8, gUnkData_96 + 0x4220, gUnkData_96 + 0x42D8, gUnkData_96 + 0x43DC, gUnkData_96 + 0x44B4\n"
"	.4byte gUnkData_96 + 0x457C, gUnkData_96 + 0x4654, 0xFF020100, 0x01050403, 0xFF020100, 0x3AFF3938\n"
"	.4byte 0x433CFF3B, 0x020106FF, 0x01050403, 0xFF433DFF, 0x0A010908, 0x403EFF0B\n"
"	.4byte 0x0D010CFF, 0xFF010E01, 0x100F010B, 0x1104FF01, 0xFF011216, 0x04140913\n"
"	.4byte 0x15161115, 0x0B1706FF, 0x15161118, 0x1A1912FF, 0x0BFF211B, 0x11010301\n"
"	.4byte 0x1CFF1516, 0x18191E1D, 0x01141FFF, 0x15161115, 0x201902FF, 0x15161121\n"
"	.4byte 0x201902FF, 0x05040321, 0x1622FF01, 0x1121010C, 0x23FF1516, 0x11040D24\n"
"	.4byte 0x13FF1516, 0x21261825, 0xFF151611, 0xFF434241, 0x03FF3B44, 0x16111C01\n"
"	.4byte 0x1017FF15, 0xFF210301, 0x02161802, 0x11030DFF, 0x4245FF01, 0x4746FF43\n"
"	.4byte 0x050417FF, 0x4948FF01, 0x0C1815FF, 0xFF180102, 0x2B18252A, 0xFF0B0A2C\n"
"	.4byte 0x0BFF404A, 0xFF21170D, 0xFF1F0100, 0xFF4D4C4B, 0x101C1806, 0x404EFF01\n"
"	.4byte 0x002D1EFF, 0x010D2103, 0x012C17FF, 0x4FFF0105, 0xFF433D50, 0xFF27212E\n"
"	.4byte 0xFF012F03, 0x15183004, 0x1831FF21, 0xFF210151, 0xFF18010C, 0x0C351836\n"
"	.4byte 0x0DFF1801, 0x29002D16, 0x0132FF04, 0x0133020D, 0x1830FF1F, 0xFF040034\n"
"	.4byte 0x092A1805, 0x1F03FF04, 0xFF181635, 0xFF181F27, 0x272D010B, 0x20FF181F\n"
"	.4byte 0xFF212001, 0x21200120, 0xFF1F3736, 0x16200124, 0x041AFF18, 0x16200124\n"
"	.4byte 0x1902FF18, 0x212E2120, 0x3F41FF27, 0x2D0703FF, 0x58FF1501, 0x3D5B5A59\n"
"	.4byte 0x4241FF43, 0x54535243, 0x575655FF, 0x0000FF43\n"
);
/* frontier_df4_menu_035_AB0830: atomic relocation carve (was INCBIN); every embedded ROM
   pointer expressed as .4byte Sym(+addend), byte-exact. make compare is the oracle. */
__asm__(
"	.section .data.frontier_df4_menu.gap35, \"aw\", %progbits\n"
"	.global frontier_df4_menu_035_AB0830\n"
"frontier_df4_menu_035_AB0830:\n"
"	.4byte 0x012FFF04, 0x00000576, 0x15150000, sSprite_Opinfo_13 + 0xAA, gOpinfo_0 + 0x218, 0x0000067F\n"
"	.4byte gOpinfo_1 + 0x1CB, 0x010BFF05, 0x00000044, 0x02020000, sSprite_Opinfo_13 + 0x34, gOpinfo_0 + 0x220\n"
"	.4byte 0x00000684, gOpinfo_1 + 0x185, 0x0015FF07, 0x00000014, 0x09090000, sSprite_Opinfo_13 + 0x34\n"
"	.4byte gOpinfo_0 + 0x22C, 0x0000068B, gOpinfo_1 + 0x1EA, 0x00236808, 0x00000061, 0x16160000\n"
"	.4byte sSprite_Opinfo_13 + 0x34, gOpinfo_0 + 0x23C, 0x0000068F, gOpinfo_1 + 0x22E, 0x002B0D02, 0x00000481\n"
"	.4byte 0x14140000, sSprite_Opinfo_13 + 0x7A, gOpinfo_0 + 0x244, 0x0000068A, gOpinfo_1 + 0x1E1, 0x00211708\n"
"	.4byte 0x0000005C, 0x16160000, sSprite_Opinfo_13 + 0x34, gOpinfo_0 + 0x254, 0x00000682, gOpinfo_1 + 0x17F\n"
"	.4byte 0x00116B02, 0x0000000D, 0x17170000, sSprite_Opinfo_13 + 0x8, gOpinfo_0 + 0x25C, 0x000006A3\n"
"	.4byte gOpinfo_1 + 0x1FB, 0x00491C08, 0x00000067, 0x0D0D0000, sSprite_Opinfo_13 + 0x34, gOpinfo_0 + 0x26C\n"
"	.4byte 0x000006B2, gOpinfo_1 + 0x284, 0x0159FF06, 0x000000AC, 0x04040000, sSprite_Opinfo_13 + 0x34\n"
"	.4byte gOpinfo_0 + 0x278, 0x000006B6, gOpinfo_1 + 0x2A0, 0x015DFF05, 0x000000B2, 0x01010000\n"
"	.4byte sSprite_Opinfo_13 + 0x8, gOpinfo_0 + 0x280, 0x000006BD, gOpinfo_1 + 0x2CA, 0x0164FF07, 0x000000BE\n"
"	.4byte 0x16160000, sSprite_Opinfo_13 + 0x34, gOpinfo_0 + 0x290, 0x000006B5, gOpinfo_1 + 0x29A, 0x015CFF05\n"
"	.4byte 0x000000B1, 0x13130000, sSprite_Opinfo_13 + 0x8, gOpinfo_0 + 0x29C, 0x000006BA, gOpinfo_1 + 0x2B7\n"
"	.4byte 0x0161FF04, 0x000008BB, 0x01010000, sSprite_Opinfo_13 + 0xC2, gOpinfo_0 + 0x2A4, 0x000006AA\n"
"	.4byte gOpinfo_1 + 0x259, 0x014FFF07, 0x0000029C, 0x14140000, sSprite_Opinfo_13 + 0x7A, gOpinfo_0 + 0x2B0\n"
"	.4byte 0x0000069D, gOpinfo_1 + 0x21D, 0x01314F04, 0x0000057A, 0x15150000, sSprite_Opinfo_13 + 0xAA\n"
"	.4byte gOpinfo_0 + 0x2BC, 0x00000692, gOpinfo_1 + 0x2DD, 0x003CFF05, 0x000006C4, 0x10100000\n"
"	.4byte sSprite_Opinfo_13 + 0x9E, gOpinfo_0 + 0x2C4, 0x000006B9, gOpinfo_1 + 0x2B0, 0x0160FF06, 0x000007BA\n"
"	.4byte 0x06060000, sSprite_Opinfo_13 + 0xB6, gOpinfo_0 + 0x2D0, 0x00000689, gOpinfo_1 + 0x1D9, 0x001F1507\n"
"	.4byte 0x00000057, 0x04040000, sSprite_Opinfo_13 + 0x8, gOpinfo_0 + 0x2E0, 0x000006A8, gOpinfo_1 + 0x250\n"
"	.4byte 0x014EFF05, 0x00000097, 0x14140000, sSprite_Opinfo_13 + 0x8, 0x23292F35, 0x0C12181D\n"
"	.4byte 0x00000006\n"
);
u8 frontier_df4_menu_036_AB0D18[] __attribute__((section(".data.frontier_df4_menu.gap36"))) = INCBIN_U8("graphics/frontier_df4_menu/frontier_df4_menu_036_AB0D18.bin");
u8 frontier_df4_menu_037_AB7144[] __attribute__((section(".data.frontier_df4_menu.gap37"))) = INCBIN_U8("graphics/frontier_df4_menu/frontier_df4_menu_037_AB7144.bin");
u8 frontier_df4_menu_038_ABCD24[] __attribute__((section(".data.frontier_df4_menu.gap38"))) = INCBIN_U8("graphics/frontier_df4_menu/frontier_df4_menu_038_ABCD24.bin");
u8 frontier_df4_menu_039_AC00A8[] __attribute__((section(".data.frontier_df4_menu.gap39"))) = INCBIN_U8("graphics/frontier_df4_menu/frontier_df4_menu_039_AC00A8.bin");
