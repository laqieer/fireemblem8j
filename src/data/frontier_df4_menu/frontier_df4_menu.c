#include "global.h"
#include "event.h"
#include "eventinfo.h"
#include "EAstdlib.h"
#define EVENT_WORD(w)      (EventListScr)(w),
#define EVENT_WORD_SYM(s)  (EventListScr)(s),

/* Migrated from asm/frontier_df4_menu.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

u8 frontier_df4_menu_000_A149D4[] __attribute__((section(".data.frontier_df4_menu.gap0"))) = INCBIN_U8("graphics/frontier_df4_menu/frontier_df4_menu_000_A149D4.bin", 0x0, 0x3C0);
u8 data_08A14D94[] __attribute__((section(".data.frontier_df4_menu.gap0"))) = INCBIN_U8("graphics/frontier_df4_menu/frontier_df4_menu_000_A149D4.bin", 0x3C0, 0x58);
u8 frontier_df4_menu_001_A588C0[] __attribute__((section(".data.frontier_df4_menu.gap1"))) = INCBIN_U8("graphics/frontier_df4_menu/frontier_df4_menu_001_A588C0.bin");
u8 frontier_df4_menu_002_A5D648[] __attribute__((section(".data.frontier_df4_menu.gap2"))) = INCBIN_U8("graphics/frontier_df4_menu/frontier_df4_menu_002_A5D648.bin");
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
u8 frontier_df4_menu_013_A72408[] __attribute__((section(".data.frontier_df4_menu.gap13"))) = INCBIN_U8("graphics/frontier_df4_menu/frontier_df4_menu_013_A72408.bin");
u8 frontier_df4_menu_014_A72BF0[] __attribute__((section(".data.frontier_df4_menu.gap14"))) = INCBIN_U8("graphics/frontier_df4_menu/frontier_df4_menu_014_A72BF0.bin");
u8 frontier_df4_menu_015_A73900[] __attribute__((section(".data.frontier_df4_menu.gap15"))) = INCBIN_U8("graphics/frontier_df4_menu/frontier_df4_menu_015_A73900.bin");
u8 frontier_df4_menu_016_A74CEC[] __attribute__((section(".data.frontier_df4_menu.gap16"))) = INCBIN_U8("graphics/frontier_df4_menu/frontier_df4_menu_016_A74CEC.bin");
u8 frontier_df4_menu_017_A79E90[] __attribute__((section(".data.frontier_df4_menu.gap17"))) = INCBIN_U8("graphics/frontier_df4_menu/frontier_df4_menu_017_A79E90.bin");
u8 frontier_df4_menu_018_A92B38[] __attribute__((section(".data.frontier_df4_menu.gap18"))) = INCBIN_U8("graphics/frontier_df4_menu/frontier_df4_menu_018_A92B38.bin");
u8 frontier_df4_menu_019_A934EC[] __attribute__((section(".data.frontier_df4_menu.gap19"))) = INCBIN_U8("graphics/frontier_df4_menu/frontier_df4_menu_019_A934EC.bin", 0x0, 0xF44);
u8 data_08A94430[] __attribute__((section(".data.frontier_df4_menu.gap19"))) = INCBIN_U8("graphics/frontier_df4_menu/frontier_df4_menu_019_A934EC.bin", 0xF44, 0x58);
u8 frontier_df4_menu_020_A9454C[] __attribute__((section(".data.frontier_df4_menu.gap20"))) = INCBIN_U8("graphics/frontier_df4_menu/frontier_df4_menu_020_A9454C.bin", 0x0, 0x38);
u8 data_08A94584[] __attribute__((section(".data.frontier_df4_menu.gap20"))) = INCBIN_U8("graphics/frontier_df4_menu/frontier_df4_menu_020_A9454C.bin", 0x38, 0xF08);
u8 data_08A9548C[] __attribute__((section(".data.frontier_df4_menu.gap20"))) = INCBIN_U8("graphics/frontier_df4_menu/frontier_df4_menu_020_A9454C.bin", 0xF40, 0x64C);
u8 data_08A95AD8[] __attribute__((section(".data.frontier_df4_menu.gap20"))) = INCBIN_U8("graphics/frontier_df4_menu/frontier_df4_menu_020_A9454C.bin", 0x158C, 0x3C);
u8 frontier_df4_menu_021_A95B4E[] __attribute__((section(".data.frontier_df4_menu.gap21"))) = INCBIN_U8("graphics/frontier_df4_menu/frontier_df4_menu_021_A95B4E.bin");
u8 frontier_df4_menu_022_A96D18[] __attribute__((section(".data.frontier_df4_menu.gap22"))) = INCBIN_U8("graphics/frontier_df4_menu/frontier_df4_menu_022_A96D18.bin");
u8 frontier_df4_menu_023_A99FA8[] __attribute__((section(".data.frontier_df4_menu.gap23"))) = INCBIN_U8("graphics/frontier_df4_menu/frontier_df4_menu_023_A99FA8.bin");
u8 frontier_df4_menu_024_A9AC28[] __attribute__((section(".data.frontier_df4_menu.gap24"))) = INCBIN_U8("graphics/frontier_df4_menu/frontier_df4_menu_024_A9AC28.bin", 0, 1020);
u8 frontier_df4_menu_026_A9CF7C[] __attribute__((section(".data.frontier_df4_menu.gap26"))) = INCBIN_U8("graphics/frontier_df4_menu/frontier_df4_menu_026_A9CF7C.bin", 0x0, 0x48);
u8 data_08A9CFC4[] __attribute__((section(".data.frontier_df4_menu.gap26"))) = INCBIN_U8("graphics/frontier_df4_menu/frontier_df4_menu_026_A9CF7C.bin", 0x48, 0x484);
u8 frontier_df4_menu_027_A9D462[] __attribute__((section(".data.frontier_df4_menu.gap27"))) = INCBIN_U8("graphics/frontier_df4_menu/frontier_df4_menu_027_A9D462.bin", 0x0, 0x226);
u8 data_08A9D688[] __attribute__((section(".data.frontier_df4_menu.gap27"))) = INCBIN_U8("graphics/frontier_df4_menu/frontier_df4_menu_027_A9D462.bin", 0x226, 0x1CE);
u8 frontier_df4_menu_028_A9E244[] __attribute__((section(".data.frontier_df4_menu.gap28"))) = INCBIN_U8("graphics/frontier_df4_menu/frontier_df4_menu_028_A9E244.bin", 0x0, 0x5C);
u8 data_08A9E2A0[] __attribute__((section(".data.frontier_df4_menu.gap28"))) = INCBIN_U8("graphics/frontier_df4_menu/frontier_df4_menu_028_A9E244.bin", 0x5C, 0x230);
u8 data_08A9E4D0[] __attribute__((section(".data.frontier_df4_menu.gap28"))) = INCBIN_U8("graphics/frontier_df4_menu/frontier_df4_menu_028_A9E244.bin", 0x28C, 0x40);
u8 data_08A9E510[] __attribute__((section(".data.frontier_df4_menu.gap28"))) = INCBIN_U8("graphics/frontier_df4_menu/frontier_df4_menu_028_A9E244.bin", 0x2CC, 0xB0);
u8 frontier_df4_menu_029_AA3860[] __attribute__((section(".data.frontier_df4_menu.gap29"))) = INCBIN_U8("graphics/frontier_df4_menu/frontier_df4_menu_029_AA3860.bin");
u8 frontier_df4_menu_030_AA71D4[] __attribute__((section(".data.frontier_df4_menu.gap30"))) = INCBIN_U8("graphics/frontier_df4_menu/frontier_df4_menu_030_AA71D4.bin");
u8 frontier_df4_menu_031_AA9F98[] __attribute__((section(".data.frontier_df4_menu.gap31"))) = INCBIN_U8("graphics/frontier_df4_menu/frontier_df4_menu_031_AA9F98.bin");
u8 frontier_df4_menu_032_AAAC4C[] __attribute__((section(".data.frontier_df4_menu.gap32"))) = INCBIN_U8("graphics/frontier_df4_menu/frontier_df4_menu_032_AAAC4C.bin", 0x0, 0x7F4);
u8 data_08AAB440[] __attribute__((section(".data.frontier_df4_menu.gap32"))) = INCBIN_U8("graphics/frontier_df4_menu/frontier_df4_menu_032_AAAC4C.bin", 0x7F4, 0x2818);
u8 frontier_df4_menu_033_AAEB40[] __attribute__((section(".data.frontier_df4_menu.gap33"))) = INCBIN_U8("graphics/frontier_df4_menu/frontier_df4_menu_033_AAEB40.bin");
u8 frontier_df4_menu_034_AAF9EC[] __attribute__((section(".data.frontier_df4_menu.gap34"))) = INCBIN_U8("graphics/frontier_df4_menu/frontier_df4_menu_034_AAF9EC.bin", 0x0, 0x2C0);
u8 data_08AAFCAC[] __attribute__((section(".data.frontier_df4_menu.gap34"))) = INCBIN_U8("graphics/frontier_df4_menu/frontier_df4_menu_034_AAF9EC.bin", 0x2C0, 0x670);
u8 frontier_df4_menu_035_AB0830[] __attribute__((section(".data.frontier_df4_menu.gap35"))) = INCBIN_U8("graphics/frontier_df4_menu/frontier_df4_menu_035_AB0830.bin");
u8 frontier_df4_menu_036_AB0D18[] __attribute__((section(".data.frontier_df4_menu.gap36"))) = INCBIN_U8("graphics/frontier_df4_menu/frontier_df4_menu_036_AB0D18.bin");
u8 frontier_df4_menu_037_AB7144[] __attribute__((section(".data.frontier_df4_menu.gap37"))) = INCBIN_U8("graphics/frontier_df4_menu/frontier_df4_menu_037_AB7144.bin");
u8 frontier_df4_menu_038_ABCD24[] __attribute__((section(".data.frontier_df4_menu.gap38"))) = INCBIN_U8("graphics/frontier_df4_menu/frontier_df4_menu_038_ABCD24.bin");
u8 frontier_df4_menu_039_AC00A8[] __attribute__((section(".data.frontier_df4_menu.gap39"))) = INCBIN_U8("graphics/frontier_df4_menu/frontier_df4_menu_039_AC00A8.bin");
