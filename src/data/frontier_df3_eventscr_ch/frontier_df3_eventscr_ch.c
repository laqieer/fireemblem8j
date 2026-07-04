#include "global.h"
#include "event.h"
#include "eventinfo.h"
#include "EAstdlib.h"
#define EVENT_WORD(w)      (EventListScr)(w),
#define EVENT_WORD_SYM(s)  (EventListScr)(s),

/* forward declarations for intra-file table cross-references (#145 shiftability) */
extern EventListScr frontier_df3_eventscr_ch_000_A69464[];
extern EventListScr frontier_df3_eventscr_ch_001_A696D4[];
extern EventListScr frontier_df3_eventscr_ch_002_A6A06C[];
extern EventListScr frontier_df3_eventscr_ch_003_A6AA20[];
extern EventListScr frontier_df3_eventscr_ch_005_A6B460[];
extern EventListScr frontier_df3_eventscr_ch_012_A6DE0C[];
extern EventListScr frontier_df3_eventscr_ch_016_A6EFD8[];
/* external targets referenced as relocatable symbols (#145 shiftability) */
extern const u8 EventScr_9EE84C[];
extern const u8 EventScr_9EE8F0[];
extern const u8 EventScr_9EEA58[];
extern const u8 EventScr_Ch10B_2[];
extern const u8 EventScr_Ch16A_11[];
extern const u8 EventScr_Ch16A_12[];
extern const u8 EventScr_Ch18A_11[];
extern const u8 EventScr_Ch19A_11[];
extern const u8 EventScr_Ch21A_8[];
extern const u8 EventScr_Ch8_11[];
extern const u8 EventScr_ChangeAIinQueue[];
extern const u8 EventScr_ConfigHardModeLoadUnitHard[];
extern const u8 EventScr_FloorClearInTower[];
extern const u8 EventScr_LoadUniqueAlly[];
extern const u8 EventScr_MoveUnitS2ToLeader[];
extern const u8 EventScr_SetFlagIfPlayedThrough[];
extern const u8 EventScr_StrictLoadUniqueAlly[];
extern const u8 EventScr_UnitFlushingOUT[];
extern const u8 EventScr_UnitWarpIN[];
extern const u8 EventScr_UnitWarpOUT[];
extern const u8 EventScr_WholeTowerClear[];
extern const u8 InitRuinsDungeonState[];
extern const u8 StartDemonKingSummonAnim[];
extern const u8 StartMapEventcallFx0[];
extern const u8 StartMapEventcallFx1[];
extern const u8 UnitDef_Ch10BEnemy_7[];
extern const u8 UnitDef_Ch10BMixed_0[];
extern const u8 UnitDef_Ch11BEnemy_0[];
extern const u8 UnitDef_Ch11BEnemy_3[];
extern const u8 UnitDef_Ch12BEnemy_5[];
extern const u8 UnitDef_Ch12BEnemy_6[];
extern const u8 UnitDef_Ch12BEnemy_7[];
extern const u8 UnitDef_Ch12BEnemy_8[];
extern const u8 UnitDef_Ch13BEnemy_6[];
extern const u8 UnitDef_Ch14BAlly_2[];
extern const u8 UnitDef_Ch14BAlly_7[];
extern const u8 UnitDef_Ch14BEnemy_8[];
extern const u8 UnitDef_Ch14BEnemy_9[];
extern const u8 UnitDef_Ch14BMixed[];
extern const u8 UnitDef_Ch16BEnemy_0[];
extern const u8 UnitDef_Ch16BEnemy_5[];
extern const u8 UnitDef_Ch16BEnemy_6[];
extern const u8 UnitDef_Ch16BEnemy_7[];
extern const u8 UnitDef_Ch17AAlly_2[];
extern const u8 UnitDef_Ch18AAlly_1[];
extern const u8 UnitDef_Ch18AEnemy_0[];
extern const u8 UnitDef_Ch18BAlly_1[];
extern const u8 UnitDef_Ch18BAlly_2[];
extern const u8 UnitDef_Ch18BEnemy_0[];
extern const u8 UnitDef_Ch19ANPC_1[];
extern const u8 UnitDef_Ch19BEnemy_0[];
extern const u8 UnitDef_Ch19BEnemy_8[];
extern const u8 UnitDef_Ch21BEnemy_1[];
extern const u8 UnitDef_Ch9BEnemy_3[];
extern const u8 UnitDef_Ch9BEnemy_4[];
extern const u8 UnitDef_Ch9BEnemy_5[];
extern const u8 UnitDef_Ch9BEnemy_6[];
extern const u8 UnitDef_RuinEnemy_0[];
extern const u8 UnitDef_RuinEnemy_1[];
extern const u8 UnitDef_RuinEnemy_10[];
extern const u8 UnitDef_RuinEnemy_11[];
extern const u8 UnitDef_RuinEnemy_12[];
extern const u8 UnitDef_RuinEnemy_13[];
extern const u8 UnitDef_RuinEnemy_14[];
extern const u8 UnitDef_RuinEnemy_15[];
extern const u8 UnitDef_RuinEnemy_16[];
extern const u8 UnitDef_RuinEnemy_17[];
extern const u8 UnitDef_RuinEnemy_2[];
extern const u8 UnitDef_RuinEnemy_22[];
extern const u8 UnitDef_RuinEnemy_23[];
extern const u8 UnitDef_RuinEnemy_24[];
extern const u8 UnitDef_RuinEnemy_25[];
extern const u8 UnitDef_RuinEnemy_26[];
extern const u8 UnitDef_RuinEnemy_27[];
extern const u8 UnitDef_RuinEnemy_28[];
extern const u8 UnitDef_RuinEnemy_3[];
extern const u8 UnitDef_RuinEnemy_30[];
extern const u8 UnitDef_RuinEnemy_31[];
extern const u8 UnitDef_RuinEnemy_32[];
extern const u8 UnitDef_RuinEnemy_33[];
extern const u8 UnitDef_RuinEnemy_34[];
extern const u8 UnitDef_RuinEnemy_35[];
extern const u8 UnitDef_RuinEnemy_5[];
extern const u8 UnitDef_RuinEnemy_6[];
extern const u8 UnitDef_RuinEnemy_7[];
extern const u8 UnitDef_RuinEnemy_8[];
extern const u8 UnitDef_RuinEnemy_9[];
extern const u8 UnitDef_TowerEnemy_0[];
extern const u8 UnitDef_TowerEnemy_6[];
extern const u8 UnitDef_TowerEnemy_8[];
extern const u8 data_085B9BBC[];
extern const u8 data_08A60354[];
extern const u8 data_08A60BE4[];
extern const u8 frontier_df3_unitdef_b_007_911200_tail[];
extern const u8 frontier_df3_unitdef_b_009_91187C[];
extern const u8 frontier_df3_unitdef_b_017_912480[];
extern const u8 frontier_df3_unitdef_b_017_912480_residue[];
extern const u8 frontier_df3_unitdef_b_019_913958[];
extern const u8 frontier_df3_unitdef_b_020_9148F4[];
extern const u8 frontier_df3_unitdef_b_021_914BD8[];
extern const u8 frontier_df3_unitdef_b_021_914BD8_residue[];
extern const u8 frontier_df3_unitdef_b_023_91512C_p34[];
extern const u8 frontier_df3_unitdef_b_023_91512C_p36[];
extern const u8 frontier_df3_unitdef_b_024_915E08[];
extern const u8 frontier_df3_unitdef_b_024_915E08_residue[];
extern const u8 frontier_df3_unitdef_b_025_9163BC_p14[];
extern const u8 frontier_df3_unitdef_b_025_9163BC_tail_p5[];
extern const u8 frontier_df3_unitdef_b_026_916D14[];
extern const u8 frontier_df3_unitdef_b_026_916D14_p4[];
extern const u8 frontier_df3_unitdef_b_026_916D14_p6[];
extern const u8 frontier_df3_unitdef_b_026_916D14_tail_p1[];
extern const u8 frontier_df3_unitdef_b_027_917600[];
extern const u8 frontier_df3_unitdef_b_028_9178F8[];
extern const u8 frontier_df3_unitdef_b_028_9178F8_p10[];
extern const u8 frontier_df3_unitdef_b_030_918784[];
extern const u8 frontier_df3_unitdef_b_030_918784_residue[];
extern const u8 frontier_df3_unitdef_b_031_918C90[];
extern const u8 frontier_df3_unitdef_b_031_918C90_residue[];
extern const u8 frontier_df3_unitdef_b_033_9191E0[];
extern const u8 frontier_df3_unitdef_b_033_9191E0_residue[];
extern const u8 frontier_df3_unitdef_b_033_9191E0_residue_p15[];
extern const u8 frontier_df3_unitdef_b_035_91A580[];
extern const u8 frontier_df3_unitdef_b_035_91A580_residue[];
extern const u8 frontier_df3_unitdef_b_036_91AB20[];
extern const u8 frontier_df3_unitdef_b_037_91AC38[];
extern const u8 frontier_df3_unitdef_b_037_91AC38_p19[];
extern const u8 frontier_df3_unitdef_b_037_91AC38_p27[];
extern const u8 frontier_df3_unitdef_b_037_91AC38_p6[];
extern const u8 frontier_df3_unitdef_b_042_91C230_residue[];
extern const u8 frontier_df3_unitdef_b_043_91D314[];
extern const u8 frontier_df3_unitdef_b_047_91E280[];
extern const u8 frontier_df3_unitdef_b_047_91E280_residue[];
extern const u8 frontier_df3_unitdef_b_050_91EE14[];
extern const u8 frontier_df3_unitdef_b_050_91EE14_residue[];
extern const u8 frontier_df3_unitdef_b_051_91F300_residue[];
extern const u8 frontier_df3_unitdef_b_052_91F89C[];
extern const u8 frontier_df3_unitdef_b_055_91FE20[];
extern const u8 frontier_df3_unitdef_b_055_91FE20_residue[];
extern const u8 frontier_df3_unitdef_b_056_920140[];
extern const u8 frontier_df3_unitdef_b_057_92042C[];
extern const u8 frontier_df3_unitdef_b_058_920698[];
extern const u8 frontier_df3_unitdef_b_059_920AD0[];
extern const u8 frontier_df3_unitdef_b_060_921140_residue[];
extern const u8 frontier_df3_unitdef_b_061_9212BC[];
extern const u8 frontier_df3_unitdef_b_064_921F00[];
extern const u8 frontier_df3_unitdef_b_068_922FCC[];
extern const u8 frontier_df3_unitdef_b_070_923510[];
extern const u8 frontier_df4_menu_010_A67EEC[];

/* Migrated from asm/frontier_df3_eventscr_ch.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

EventListScr frontier_df3_eventscr_ch_000_A69464[] __attribute__((section(".data.frontier_df3_eventscr_ch.gap0"))) = {
    EVENT_WORD(0x00000002)
    BNE(0, 0xC, 1)
    TUTORIALTEXTBOXSTART
    SVAL(EVT_SLOT_B, 0xFFFFFFFF)
    TEXTSHOW(0xB1B)
    TEXTEND
    REMA
    CALL((u8 *)frontier_df3_eventscr_ch_000_A69464 + 0x70)
    CALL((u8 *)frontier_df3_eventscr_ch_000_A69464 + 0xF0)
    GOTO(1)
    LABEL(0)
    TUTORIALTEXTBOXSTART
    SVAL(EVT_SLOT_B, 0xFFFFFFFF)
    TEXTSHOW(0xB1C)
    TEXTEND
    REMA
    CALL((u8 *)frontier_df3_eventscr_ch_000_A69464 + 0xF0)
    CALL((u8 *)frontier_df3_eventscr_ch_000_A69464 + 0x70)
    LABEL(1)
    FAWI(0x10)
    ENDA
    TUTORIALTEXTBOXSTART
    SVAL(EVT_SLOT_B, 0xFFFFFFFF)
    TEXTSHOW(0xB1D)
    TEXTEND
    REMA
    SVAL(EVT_SLOT_7, 1)
    BNE(0, 0xC, 7)
    FADI(0x10)
    CALL(data_085B9BBC + 0x18C)
    PROM(1, 4, 0x98)
    EVBIT_MODIFY(4)
    REMOVEPORTRAITS
    BACG(0x4F)
    STARTFADE
    EvtColorFadeSetup(6, 0xA, 0, 0x200, 0x200, 0x200)
    FADU(0x10)
    GOTO(1)
    LABEL(0)
    CALL((u8 *)frontier_df3_eventscr_ch_000_A69464 + 0x170)
    LABEL(1)
    ENDA
    TUTORIALTEXTBOXSTART
    SVAL(EVT_SLOT_B, 0xFFFFFFFF)
    TEXTSHOW(0xB1E)
    TEXTEND
    REMA
    SVAL(EVT_SLOT_7, 1)
    BNE(0, 0xC, 7)
    FADI(0x10)
    CALL(data_085B9BBC + 0x18C)
    PROM(0xF, 3, 0x99)
    EVBIT_MODIFY(4)
    REMOVEPORTRAITS
    BACG(0x4F)
    STARTFADE
    EvtColorFadeSetup(6, 0xA, 0, 0x200, 0x200, 0x200)
    FADU(0x10)
    GOTO(1)
    LABEL(0)
    CALL((u8 *)frontier_df3_eventscr_ch_000_A69464 + 0x1A4)
    LABEL(1)
    ENDA
    CALL(data_085B9BBC + 0x168)
    SVAL(EVT_SLOT_3, 0x98)
    GIVEITEMTO(1)
    EVBIT_MODIFY(4)
    TUTORIALTEXTBOXSTART
    SVAL(EVT_SLOT_B, 0xFFFFFFFF)
    TEXTSHOW(0xB1F)
    TEXTEND
    REMA
    ENDA
    CALL(data_085B9BBC + 0x168)
    SVAL(EVT_SLOT_3, 0x99)
    GIVEITEMTO(0xF)
    EVBIT_MODIFY(4)
    TUTORIALTEXTBOXSTART
    SVAL(EVT_SLOT_B, 0xFFFFFFFF)
    TEXTSHOW(0xB20)
    TEXTEND
    REMA
    ENDA
    SVAL(EVT_SLOT_2, frontier_df3_unitdef_b_009_91187C + 0x28)
    CALL(data_08A60354 + 0x58)
    EVBIT_T(7)
    ENDA
    SVAL(EVT_SLOT_2, 0)
    CALL(UnitDef_Ch14BAlly_7)
    SVAL(EVT_SLOT_1, 0x10000)
    CHAI(0x8F)
    SVAL(EVT_SLOT_1, 0x10303)
    CHAI(0x90)
    ENUF(0xC)
    EVBIT_T(7)
    ENDA
};
EventListScr frontier_df3_eventscr_ch_001_A696D4[] __attribute__((section(".data.frontier_df3_eventscr_ch.gap1"))) = {
    SVAL(EVT_SLOT_2, frontier_df3_unitdef_b_009_91187C + 0x50)
    CALL(data_08A60354 + 0x80)
    EVBIT_T(7)
    ENDA
    SVAL(EVT_SLOT_2, frontier_df3_unitdef_b_017_912480)
    CALL((u8 *)frontier_df3_eventscr_ch_001_A696D4 + 0x30)
    ENUT(0xE)
    ENDA
    EvtBgmFadeIn(0x2C, 6)
    SADD(EVT_SLOT_A, EVT_SLOT_2, EVT_SLOT_0)
    REMOVEPORTRAITS
    BACG(0x4F)
    FAWI(2)
    BACG(0x14)
    FAWU(2)
    BROWNBOXTEXT(0x197, 8, 8)
    TEXTSHOW(0xB21)
    TEXTEND
    EvtBgmFadeIn(0x7FFF, 8)
    FAWI(2)
    REMA
    BACG(0x2C)
    MUSC(0x52)
    FAWU(2)
    TEXTSHOW(0xB22)
    TEXTEND
    REMA
    FADI(0x10)
    CALL((u8 *)frontier_df3_eventscr_ch_001_A696D4 + 0x23C)
    CAMERA2(0xD, 0xB)
    SADD(EVT_SLOT_2, EVT_SLOT_A, EVT_SLOT_0)
    LOAD1(1, 0xFFFFFFFF)
    ENUN
    MOVE(0xFFFF, 0x40, 0, 0)
    FADU(0x10)
    LOAD1(1, frontier_df3_unitdef_b_017_912480_residue)
    ENUN
    CURSOR_CHAR(0xF7)
    STAL(0x3C)
    CURE
    SVAL(EVT_SLOT_2, 0x1F)
    SVAL(EVT_SLOT_3, 0xB24)
    CALL(data_08A60354 + 0xF4)
    CAMERA2(0xB, 0xF)
    LOAD2(1, frontier_df3_unitdef_b_017_912480_residue + 0x35C)
    ENUN
    CURSOR_CHAR(1)
    STAL(0x3C)
    CURE
    SVAL(EVT_SLOT_2, 0x1F)
    CALL(data_08A60354 + 0xCC)
    TEXTSHOW(0xB25)
    TEXTEND
    EvtBgmFadeIn(0x7FFF, 1)
    TEXTCONT
    TEXTEND
    REMA
    FADI(0x10)
    CLEAN
    FADU(0x10)
    SVAL(EVT_SLOT_2, 0x40)
    MOVE_CLOSEST(0xFFFF, 0xFFFD, 8, 0xE)
    CALL(EventScr_UnitWarpIN)
    CURSOR_CHAR(0x40)
    STAL(0x3C)
    CURE
    CHECK_MODE
    SVAL(EVT_SLOT_1, 2)
    BNE(0, 0xC, 1)
    SVAL(EVT_SLOT_2, 0x1F)
    CALL(data_08A60354 + 0xCC)
    TEXTSHOW(0xB26)
    TEXTEND
    MUSC(0x2D)
    TEXTCONT
    TEXTEND
    EvtBgmFadeIn(0x7FFF, 1)
    TEXTCONT
    TEXTEND
    MUSC(0x26)
    TEXTCONT
    TEXTEND
    CALL(data_08A60354 + 0xA8)
    GOTO(1)
    LABEL(0)
    SVAL(EVT_SLOT_2, 0x1F)
    CALL(data_08A60354 + 0xCC)
    TEXTSHOW(0xB27)
    TEXTEND
    MUSC(0x2D)
    TEXTCONT
    TEXTEND
    EvtBgmFadeIn(0x7FFF, 1)
    TEXTCONT
    TEXTEND
    MUSC(0x26)
    TEXTCONT
    TEXTEND
    CALL(data_08A60354 + 0xA8)
    LABEL(1)
    SVAL(EVT_SLOT_2, 0x40)
    CALL(EventScr_UnitWarpOUT)
    CAMERA2(0xF, 6)
    SVAL(EVT_SLOT_2, 0x40)
    MOVE_CLOSEST(0xFFFF, 0xFFFD, 0x14, 6)
    CALL(EventScr_UnitWarpIN)
    CALL(data_085B9BBC + 0x200)
    ENDA
    CLEA
    CHECK_MODE
    SVAL(EVT_SLOT_1, 2)
    BNE(0, 0xC, 1)
    SVAL(EVT_SLOT_B, 0)
    LOMA(0x11)
    GOTO(1)
    LABEL(0)
    SVAL(EVT_SLOT_B, 0)
    LOMA(0x1E)
    LABEL(1)
    MUSC(0x26)
    CAMERA2(7, 8)
    FADU(0x10)
    TEXTSTART
    TEXTSHOW(0xB23)
    TEXTEND
    REMA
    LOAD1(1, frontier_df3_unitdef_b_017_912480_residue + 0x1B8)
    ENUN
    SVAL(EVT_SLOT_D, 0)
    SVAL(EVT_SLOT_1, 0x1701)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x10F00)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x6401)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0xFFFFFFFF)
    SENQUEUE1
    FIGHT_MAP(0xC0, 0x8D, 0, 0)
    DISA(0xC0)
    KILL(0xC1)
    DISA_IF(0xC1)
    KILL(0xC1)
    DISA_IF(0xC1)
    KILL(0xC1)
    DISA_IF(0xC1)
    FADI(0x10)
    CLEA
    CLEE
    CLEN
    CAMERA2(0xD, 0xB)
    FADU(0x10)
    LOAD1(1, frontier_df3_unitdef_b_017_912480_residue + 0x26C)
    ENUN
    SVAL(EVT_SLOT_D, 0)
    SVAL(EVT_SLOT_1, 0x500)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x16401)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0xFFFFFFFF)
    SENQUEUE1
    FIGHT_MAP(0xC0, 0x8D, 0, 0)
    DISA(0xC0)
    KILL(0xC1)
    DISA_IF(0xC1)
    FADI(0x10)
    CLEA
    CLEE
    CLEN
    CAMERA2(0xF, 6)
    FADU(0x10)
    LOAD1(1, frontier_df3_unitdef_b_017_912480_residue + 0x2D0)
    ENUN
    SVAL(EVT_SLOT_D, 0)
    SVAL(EVT_SLOT_1, 0x16401)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0xFFFFFFFF)
    SENQUEUE1
    FIGHT_MAP(0xC0, 0x8D, 0, 0)
    DISA(0xC0)
    KILL(0xC1)
    DISA_IF(0xC1)
    KILL(0xC1)
    DISA_IF(0xC1)
    FADI(0x10)
    CLEA
    CLEE
    CLEN
    ENDA
    CALL((u8 *)frontier_df3_eventscr_ch_001_A696D4 + 0x3E4)
    MNCH(0x12)
    ENDA
    SVAL(EVT_SLOT_7, 0)
    CHECK_ALIVE(0x21)
    BEQ(0, 0xC, 0)
    CHECK_ALIVE(0xF6)
    BEQ(0, 0xC, 0)
    CHECK_ALIVE(0xF7)
    BEQ(0, 0xC, 0)
    CHECK_ALIVE(0xF4)
    BEQ(0, 0xC, 0)
    CHECK_ALIVE(0xF5)
    BEQ(0, 0xC, 0)
    SVAL(EVT_SLOT_7, 1)
    LABEL(0)
    EvtBgmFadeIn(0x7FFF, 4)
    FADI(0x10)
    SVAL(EVT_SLOT_2, 0x21)
    CALL(EventScr_LoadUniqueAlly)
    CLEA
    CLEE
    CLEN
    CAMERA2(0xB, 8)
    FADU(0x10)
    SPAWN_ENEMY(0x40, 0, 0)
    SVAL(EVT_SLOT_2, 0x40)
    MOVE_CLOSEST(0xFFFF, 0xFFFD, 0xC, 7)
    CALL(EventScr_UnitWarpIN)
    STAL(0x10)
    MOVE_1STEP(4, 0x40, 2)
    ENUN
    CURSOR_CHAR(0x40)
    STAL(0x3C)
    CURE
    MUSC(0x2D)
    CHECK_MODE
    SVAL(EVT_SLOT_1, 2)
    BNE(0xA, 0xC, 1)
    SVAL(EVT_SLOT_2, 0xB2E)
    GOTO(0xB)
    LABEL(0xA)
    SVAL(EVT_SLOT_2, 0xB30)
    LABEL(0xB)
    TEXTSTART
    TEXTSHOW(0xFFFF)
    TEXTEND
    REMA
    SVAL(EVT_SLOT_D, 0)
    SVAL(EVT_SLOT_1, 0x424C)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x428C)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x100000)
    SENQUEUE1
    MOVE_DEFINED(0x40)
    STAL2(0x1E)
    LOAD2(1, UnitDef_Ch17AAlly_2)
    ENUN
    CURSOR_CHAR(0x40)
    STAL(0x3C)
    CURE
    SVAL(EVT_SLOT_2, 0x1F)
    CALL(data_08A60354 + 0xCC)
    CHECK_MODE
    SVAL(EVT_SLOT_1, 2)
    BNE(0x14, 0xC, 1)
    TEXTSHOW(0xB2F)
    TEXTEND
    GOTO(0x15)
    LABEL(0x14)
    TEXTSHOW(0xB31)
    TEXTEND
    LABEL(0x15)
    REMA
    CALL(data_08A60354 + 0xA8)
    SVAL(EVT_SLOT_2, 0x40)
    CALL(EventScr_UnitWarpOUT)
    DISA(0x40)
    MOVE_1STEP(0, 0xF, 2)
    ENUN
    EvtBgmFadeIn(0x7FFF, 4)
    CURSOR_CHAR(0xF)
    STAL(0x3C)
    CURE
    MUSC(0x26)
    TEXTSTART
    TEXTSHOW(0xB32)
    TEXTEND
    REMA
    FADI(4)
    SVAL(EVT_SLOT_2, 0x28)
    CALL(data_08A60354 + 0xCC)
    MUSI
    CHECK_MODE
    SVAL(EVT_SLOT_1, 2)
    BNE(0x1E, 0xC, 1)
    TEXTSHOW(0xB33)
    TEXTEND
    GOTO(0x1F)
    LABEL(0x1E)
    TEXTSHOW(0xB34)
    TEXTEND
    LABEL(0x1F)
    REMA
    MUNO
    CALL(data_085B9BBC + 0x168)
    SVAL(EVT_SLOT_3, 0x94)
    GIVEITEMTO(0)
    CALL(data_085B9BBC + 0x168)
    SVAL(EVT_SLOT_3, 0x8E)
    GIVEITEMTO(0)
    BEQ(0x34, 7, 0)
    MUSC(0x26)
    STAL(0x32)
    MUSI
    SVAL(EVT_SLOT_2, 0x28)
    CALL(data_08A60354 + 0xCC)
    CHECK_MODE
    SVAL(EVT_SLOT_1, 2)
    BNE(0x32, 0xC, 1)
    TEXTSHOW(0xB35)
    TEXTEND
    GOTO(0x33)
    LABEL(0x32)
    TEXTSHOW(0xB36)
    TEXTEND
    LABEL(0x33)
    REMA
    MUNO
    CALL(data_085B9BBC + 0x168)
    SVAL(EVT_SLOT_3, 0x55)
    GIVEITEMTO(0)
    LABEL(0x34)
    ENDA
    MUSS(0x30)
    STAL(0x21)
    TEXTSTART
    TEXTSHOW(0xB37)
    TEXTEND
    REMA
    MURE(2)
    CUSA(0x21)
    EVBIT_T(7)
    ENDA
    MUSS(0x30)
    STAL(0x21)
    TEXTSTART
    TEXTSHOW(0xB38)
    TEXTEND
    REMA
    MURE(2)
    CUSA(0x21)
    EVBIT_T(7)
    ENDA
    MUSS(0x30)
    STAL(0x21)
    TEXTSTART
    TEXTSHOW(0xB39)
    TEXTEND
    REMA
    MURE(2)
    CUSA(0x21)
    EVBIT_T(7)
    ENDA
    SVAL(EVT_SLOT_2, frontier_df3_unitdef_b_017_912480_residue + 0x78)
    CALL(data_08A60354 + 0x58)
    EVBIT_T(7)
    ENDA
    SVAL(EVT_SLOT_2, frontier_df3_unitdef_b_017_912480_residue + 0x104)
    CALL(data_08A60354 + 0x58)
    EVBIT_T(7)
    ENDA
    SVAL(EVT_SLOT_2, frontier_df3_unitdef_b_017_912480_residue + 0x140)
    CALL(data_08A60354 + 0x58)
    EVBIT_T(7)
    ENDA
    SVAL(EVT_SLOT_2, frontier_df3_unitdef_b_017_912480_residue + 0x17C)
    CALL(data_08A60354 + 0x58)
    EVBIT_T(7)
    ENDA
    SVAL(EVT_SLOT_2, 0)
    CALL(UnitDef_Ch14BAlly_7)
    COUNTER_SET(0, 5)
    ENUF(0xE)
    EVBIT_T(7)
    ENDA
    SVAL(EVT_SLOT_2, frontier_df3_unitdef_b_017_912480_residue + 0xC8)
    CALL(data_08A60354 + 0x58)
    COUNTER_DEC(0)
    ENUF(0xE)
    COUNTER_CHECK(0)
    BNE(0, 0xC, 0)
    ENUT(0xE)
    LABEL(0)
    EVBIT_T(7)
    ENDA
    SVAL(EVT_SLOT_2, 0)
    CALL(UnitDef_Ch14BAlly_7)
    SVAL(EVT_SLOT_D, 0)
    SVAL(EVT_SLOT_1, 0xC0013)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0xE0011)
    SENQUEUE1
    SVAL(EVT_SLOT_2, 0x11200)
    CALL(EventScr_ChangeAIinQueue)
    SVAL(EVT_SLOT_1, 0xD0012)
    SENQUEUE1
    SVAL(EVT_SLOT_2, 0x10E00)
    CALL(EventScr_ChangeAIinQueue)
    EVBIT_T(7)
    ENDA
    LOAD1(1, UnitDef_Ch18AEnemy_0)
    ENUN
    SVAL(EVT_SLOT_2, frontier_df3_unitdef_b_019_913958 + 0x78)
    SVAL(EVT_SLOT_3, 1)
    CALL(data_08A60354 + 0x2C)
    CALL(EventScr_Ch18A_11)
    ENDA
};
EventListScr frontier_df3_eventscr_ch_002_A6A06C[] __attribute__((section(".data.frontier_df3_eventscr_ch.gap2"))) = {
    MUSC(0x49)
    FADI(0x10)
    CAMERA2(0xE, 0xE)
    CLEA
    CLEE
    CLEN
    LOAD2(1, UnitDef_Ch18AAlly_1)
    ENUN
    FADU(0x10)
    SPAWN_ENEMY(0x40, 0, 0)
    SVAL(EVT_SLOT_2, 0x40)
    MOVE_CLOSEST(0xFFFF, 0xFFFD, 0x12, 0xB)
    CALL(EventScr_UnitWarpIN)
    CURSOR_CHAR(0x40)
    STAL(0x3C)
    CURE
    TEXTSTART
    TEXTSHOW(0xB3E)
    TEXTEND
    REMA
    MOVE_1STEP(0, 1, 1)
    SVAL(EVT_SLOT_2, 0x40)
    CALL(EventScr_UnitWarpOUT)
    MOVE(0, 1, 0x10, 0xD)
    STAL2(0x10)
    MOVE(0, 0xF, 0xE, 0xD)
    ENUN
    CURSOR_CHAR(1)
    STAL(0x3C)
    CURE
    TEXTSTART
    TEXTSHOW(0xB3F)
    TEXTEND
    REMA
    MOVE(0, 1, 0x12, 9)
    STAL2(0x14)
    FADI(0x10)
    ENUN
    CAMERA(0x16, 0)
    MOVE(0, 1, 0x10, 4)
    FADU(0x10)
    ENUN
    CURSOR_CHAR(1)
    STAL(0x3C)
    CURE
    EvtBgmFadeIn(0x2C, 4)
    TEXTSTART
    TEXTSHOW(0xB40)
    TEXTEND
    REMA
    SVAL(EVT_SLOT_2, 0x40)
    MOVE_CLOSEST(0xFFFF, 0xFFFD, 0x13, 4)
    CALL(EventScr_UnitWarpIN)
    MOVE_1STEP(0, 1, 1)
    ENUN
    CURSOR_CHAR(1)
    STAL(0x3C)
    CURE
    TEXTSTART
    TEXTSHOW(0xB41)
    TEXTEND
    REMA
    MOVE_1STEP(0x10, 1, 1)
    ENUN
    CURSOR_CHAR(0x40)
    STAL(0x3C)
    CURE
    TEXTSTART
    TEXTSHOW(0xB42)
    TEXTEND
    EvtBgmFadeIn(0x7FFF, 2)
    TEXTCONT
    TEXTEND
    MUSC(0x2D)
    TEXTCONT
    TEXTEND
    REMA
    SVAL(EVT_SLOT_2, 0x40)
    CALL(EventScr_UnitWarpOUT)
    SVAL(EVT_SLOT_2, 0x40)
    MOVE_CLOSEST(0xFFFF, 0xFFFD, 0x13, 1)
    CALL(EventScr_UnitWarpIN)
    SVAL(EVT_SLOT_2, 0x40)
    CALL(data_08A60BE4 + 0x10C)
    CURSOR_CHAR(0x40)
    STAL(0x3C)
    CURE
    TEXTSTART
    TEXTSHOW(0xB43)
    TEXTEND
    REMA
    EvtBgmFadeIn(0x7FFF, 6)
    SVAL(EVT_SLOT_2, 0x40)
    CALL(EventScr_UnitWarpOUT)
    LOAD2(1, frontier_df3_unitdef_b_019_913958)
    ENUN
    CURSOR_CHAR(0xF)
    STAL(0x3C)
    CURE
    MUSC(0x32)
    TEXTSTART
    TEXTSHOW(0xB44)
    TEXTEND
    REMA
    FADI(4)
    SVAL(EVT_SLOT_2, 0x4C)
    CALL(data_08A60354 + 0xCC)
    TEXTSHOW(0xB4A)
    TEXTEND
    REMA
    MNCH(0x13)
    ENDA
    CHECK_EVENTID(6)
    BEQ(0, 0xC, 0)
    ENUT(3)
    CALL(frontier_df3_eventscr_ch_002_A6A06C)
    ENDB
    LABEL(0)
    EVBIT_T(7)
    ENDA
    SVAL(EVT_SLOT_2, 0)
    CALL(UnitDef_Ch14BAlly_7)
    ENUF(8)
    EVBIT_T(7)
    ENDA
    SVAL(EVT_SLOT_2, frontier_df3_unitdef_b_019_913958 + 0x104)
    CALL(data_08A60354 + 0x80)
    EVBIT_T(7)
    ENDA
    SVAL(EVT_SLOT_2, 0)
    CALL(UnitDef_Ch14BAlly_7)
    ENUF(0xA)
    EVBIT_T(7)
    ENDA
    SVAL(EVT_SLOT_2, frontier_df3_unitdef_b_019_913958 + 0x140)
    CALL(data_08A60354 + 0x80)
    EVBIT_T(7)
    ENDA
    SVAL(EVT_SLOT_2, 0)
    CALL(UnitDef_Ch14BAlly_7)
    ENUF(0xC)
    EVBIT_T(7)
    ENDA
    SVAL(EVT_SLOT_2, frontier_df3_unitdef_b_019_913958 + 0x17C)
    CALL(data_08A60354 + 0x80)
    SVAL(EVT_SLOT_2, frontier_df3_unitdef_b_019_913958 + 0x1CC)
    CALL(data_08A60354 + 0x80)
    EVBIT_T(7)
    ENDA
    SVAL(EVT_SLOT_2, 0)
    CALL(UnitDef_Ch14BAlly_7)
    ENUF(0xE)
    EVBIT_T(7)
    ENDA
    SVAL(EVT_SLOT_2, frontier_df3_unitdef_b_019_913958 + 0x1F4)
    CALL(data_08A60354 + 0x80)
    SVAL(EVT_SLOT_2, frontier_df3_unitdef_b_019_913958 + 0x230)
    CALL(data_08A60354 + 0x80)
    EVBIT_T(7)
    ENDA
    SVAL(EVT_SLOT_2, frontier_df3_unitdef_b_020_9148F4 + 0x1F4)
    SVAL(EVT_SLOT_3, UnitDef_Ch19ANPC_1)
    SVAL(EVT_SLOT_4, frontier_df3_unitdef_b_020_9148F4)
    CALL((u8 *)frontier_df3_eventscr_ch_002_A6A06C + 0x374)
    EVBIT_T(7)
    ENDA
    SADD(EVT_SLOT_9, EVT_SLOT_3, EVT_SLOT_0)
    SADD(EVT_SLOT_A, EVT_SLOT_4, EVT_SLOT_0)
    MUSC(0x24)
    LOAD1(1, 0xFFFFFFFF)
    ENUN
    EvtChangeFogVision(0, 0)
    FADU(0x10)
    LOAD2(1, frontier_df3_unitdef_b_021_914BD8_residue + 0x1A4)
    ENUN
    CURSOR_CHAR(0x19)
    STAL(0x3C)
    CURE
    TEXTSTART
    TEXTSHOW(0xB4B)
    TEXTEND
    REMA
    SVAL(EVT_SLOT_D, 0)
    SVAL(EVT_SLOT_1, 0x10311)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x10291)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0)
    SENQUEUE1
    MOVE_DEFINED(0x19)
    ENUN
    MOVE_1STEP(0x10, 1, 3)
    MOVE_1STEP(0x10, 0xF, 3)
    ENUN
    CURSOR_CHAR(1)
    STAL(0x3C)
    CURE
    TEXTSTART
    TEXTSHOW(0xB4C)
    TEXTEND
    FADI(4)
    REMA
    FADU(4)
    CURSOR_CHAR(0xC8)
    STAL(0x3C)
    CURE
    TEXTSHOW(0xB4D)
    TEXTEND
    EvtBgmFadeIn(0x7FFF, 6)
    FADI(4)
    REMA
    CLEA
    EvtChangeFogVision(0, 0xFFFF)
    REMOVEPORTRAITS
    BACG(0x13)
    FADU(4)
    CHECK_MODE
    SVAL(EVT_SLOT_1, 2)
    BNE(0, 0xC, 1)
    TEXTSHOW(0xB4E)
    TEXTEND
    MUSC(0x29)
    TEXTCONT
    TEXTEND
    GOTO(2)
    LABEL(0)
    CHECK_ALIVE(0x22)
    BEQ(1, 0xC, 0)
    TEXTSHOW(0xB4F)
    TEXTEND
    MUSC(0x29)
    TEXTCONT
    TEXTEND
    GOTO(2)
    LABEL(1)
    TEXTSHOW(0xB50)
    TEXTEND
    MUSC(0x29)
    TEXTCONT
    TEXTEND
    LABEL(2)
    REMA
    EvtBgmFadeIn(0x7FFF, 4)
    FADI(0x10)
    CLEAN
    CAMERA(0, 0x18)
    UNIT_COLORS(3)
    EvtSetLoadUnitNoREDA
    LOAD2(1, frontier_df3_unitdef_b_021_914BD8_residue + 0x21C)
    ENUN
    LOAD1(1, frontier_df3_unitdef_b_021_914BD8_residue + 0x244)
    ENUN
    FADU(0x10)
    LOAD2(1, frontier_df3_unitdef_b_021_914BD8_residue + 0x21C)
    ENUN
    CURSOR_CHAR(0xCE)
    STAL(0x3C)
    CURE
    MUSC(0x2E)
    TEXTSTART
    TEXTSHOW(0xB51)
    TEXTEND
    REMA
    SVAL(EVT_SLOT_2, 0x57)
    MOVE_CLOSEST(0xFFFF, 0xFFFD, 8, 0x15)
    CALL(EventScr_UnitWarpIN)
    SVAL(EVT_SLOT_2, 0x8D)
    MOVE_CLOSEST(0xFFFF, 0xFFFD, 6, 0x15)
    CALL(EventScr_UnitWarpIN)
    SVAL(EVT_SLOT_D, 0)
    SVAL(EVT_SLOT_1, 0x16400)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0xFFFFFFFF)
    SENQUEUE1
    FIGHT_MAP(0x8D, 0xCE, 0, 0)
    DISA(0xCE)
    TEXTSTART
    TEXTSHOW(0xB52)
    TEXTEND
    REMA
    EvtBgmFadeIn(0x7FFF, 4)
    FADI(0x10)
    UNIT_COLORS(0)
    CLEE
    CAMERA2(0x10, 0xB)
    EvtSetLoadUnitNoREDA
    LOAD2(1, frontier_df3_unitdef_b_021_914BD8_residue + 0x280)
    ENUN
    FADU(0x10)
    LOAD2(1, frontier_df3_unitdef_b_021_914BD8_residue + 0x2E4)
    ENUN
    CURSOR_CHAR(0xC0)
    STAL(0x3C)
    CURE
    MUSC(0x26)
    TEXTSTART
    TEXTSHOW(0xB53)
    TEXTEND
    REMA
    MOVE(0, 0xC0, 0x10, 0x11)
    ENUN
    DISA(0xC0)
    LOAD2(1, frontier_df3_unitdef_b_021_914BD8_residue + 0x280)
    ENUN
    CURSOR_CHAR(2)
    STAL(0x3C)
    CURE
    CHECK_MODE
    SVAL(EVT_SLOT_1, 2)
    BNE(0xA, 0xC, 1)
    TEXTSTART
    TEXTSHOW(0xB54)
    TEXTEND
    REMA
    GOTO(0xB)
    LABEL(0xA)
    TEXTSTART
    TEXTSHOW(0xB55)
    TEXTEND
    REMA
    LABEL(0xB)
    FADI(0x10)
    CLEA
    SADD(EVT_SLOT_2, EVT_SLOT_9, EVT_SLOT_0)
    LOAD1(1, 0xFFFFFFFF)
    ENUN
    SADD(EVT_SLOT_2, EVT_SLOT_A, EVT_SLOT_0)
    LOAD1(1, 0xFFFFFFFF)
    ENUN
    CALL(data_085B9BBC + 0x200)
    CAMERA(0, 0x18)
    MUSC(0x18)
    FADU(0x10)
    TEXTSTART
    TEXTSHOW(0xB56)
    TEXTEND
    REMA
    ENDA
    CAMERA_CAHR(1)
    CURSOR_CHAR(1)
    STAL(0x3C)
    CURE
    MUSC(0x11)
    SVAL(EVT_SLOT_2, 0x10)
    SVAL(EVT_SLOT_3, 0xB57)
    CALL(data_08A60354 + 0xF4)
    EVBIT_T(7)
    ENDA
    CALL(EventScr_Ch19A_11)
    MNCH(0x14)
    ENDA
};
EventListScr frontier_df3_eventscr_ch_003_A6AA20[] __attribute__((section(".data.frontier_df3_eventscr_ch.gap3"))) = {
    SVAL(EVT_SLOT_2, frontier_df3_unitdef_b_021_914BD8)
    CALL(data_08A60354 + 0x58)
    EVBIT_T(7)
    ENDA
    SVAL(EVT_SLOT_2, frontier_df3_unitdef_b_021_914BD8 + 0x28)
    CALL(data_08A60354 + 0x58)
    EVBIT_T(7)
    ENDA
    CHECK_TURNS
    SVAL(EVT_SLOT_1, 1)
    SAND(EVT_SLOT_C, EVT_SLOT_C, EVT_SLOT_1)
    BEQ(0, 0xC, 0)
    SVAL(EVT_SLOT_2, frontier_df3_unitdef_b_021_914BD8_residue)
    CALL(data_08A60354 + 0x58)
    LABEL(0)
    EVBIT_T(7)
    ENDA
    CHECK_TURNS
    SVAL(EVT_SLOT_1, 1)
    SAND(EVT_SLOT_C, EVT_SLOT_C, EVT_SLOT_1)
    BNE(0, 0xC, 0)
    SVAL(EVT_SLOT_2, frontier_df3_unitdef_b_021_914BD8_residue + 0x3C)
    CALL(data_08A60354 + 0x58)
    LABEL(0)
    EVBIT_T(7)
    ENDA
    CHECK_TURNS
    SVAL(EVT_SLOT_1, 1)
    SAND(EVT_SLOT_C, EVT_SLOT_C, EVT_SLOT_1)
    BEQ(0, 0xC, 0)
    SVAL(EVT_SLOT_2, frontier_df3_unitdef_b_021_914BD8_residue + 0x78)
    CALL(data_08A60354 + 0x58)
    LABEL(0)
    EVBIT_T(7)
    ENDA
    CHECK_TURNS
    SVAL(EVT_SLOT_1, 1)
    SAND(EVT_SLOT_C, EVT_SLOT_C, EVT_SLOT_1)
    BNE(0, 0xC, 0)
    SVAL(EVT_SLOT_2, frontier_df3_unitdef_b_021_914BD8_residue + 0xB4)
    CALL(data_08A60354 + 0x58)
    LABEL(0)
    EVBIT_T(7)
    ENDA
    SVAL(EVT_SLOT_2, frontier_df3_unitdef_b_021_914BD8_residue + 0xF0)
    CALL(data_08A60354 + 0x58)
    EVBIT_T(7)
    ENDA
    SVAL(EVT_SLOT_2, frontier_df3_unitdef_b_021_914BD8_residue + 0x154)
    CALL(data_08A60354 + 0x58)
    EVBIT_T(7)
    ENDA
    SVAL(EVT_SLOT_2, frontier_df3_unitdef_b_023_91512C_p34 + 0x17C)
    CALL((u8 *)frontier_df3_eventscr_ch_003_A6AA20 + 0x18C)
    LOAD1(1, frontier_df3_unitdef_b_023_91512C_p34 + 0x17C)
    ENUN
    LOAD1(1, frontier_df3_unitdef_b_023_91512C_p34 + 0x528)
    ENUN
    SVAL(EVT_SLOT_2, frontier_df3_unitdef_b_023_91512C_p34 + 0x550)
    SVAL(EVT_SLOT_3, 1)
    CALL(data_08A60354 + 0x2C)
    CALL(data_085B9BBC + 0x200)
    ENUT(0xA)
    ENUT(0xC)
    ENUT(0xE)
    ENUT(0x10)
    ENDA
    SADD(EVT_SLOT_A, EVT_SLOT_2, EVT_SLOT_0)
    LOAD1(1, frontier_df3_unitdef_b_023_91512C_p34 + 0x8C0)
    ENUN
    FADU(0x10)
    MUSC(0x2D)
    CURSOR_CHAR(0x40)
    STAL(0x3C)
    CURE
    SVAL(EVT_SLOT_2, 0x4B)
    CALL(data_08A60354 + 0xCC)
    CHECK_MODE
    SVAL(EVT_SLOT_1, 2)
    BNE(0, 0xC, 1)
    TEXTSHOW(0xB69)
    TEXTEND
    GOTO(1)
    LABEL(0)
    TEXTSHOW(0xB6A)
    TEXTEND
    LABEL(1)
    REMA
    EvtBgmFadeIn(0x7FFF, 6)
    FADI(4)
    CLEAN
    CAMERA(0x1D, 0x14)
    MUSC(0x4D)
    FADU(4)
    LOAD2(1, frontier_df3_unitdef_b_023_91512C_p34 + 0x8E8)
    ENUN
    CURSOR_CHAR(0xF)
    STAL(0x3C)
    CURE
    SVAL(EVT_SLOT_2, 0x4B)
    CALL(data_08A60354 + 0xCC)
    CHECK_MODE
    SVAL(EVT_SLOT_1, 2)
    BNE(2, 0xC, 1)
    TEXTSHOW(0xB6B)
    TEXTEND
    MUSC(0x26)
    TEXTCONT
    TEXTEND
    GOTO(3)
    LABEL(2)
    TEXTSHOW(0xB6C)
    TEXTEND
    MUSC(0x26)
    TEXTCONT
    TEXTEND
    LABEL(3)
    REMA
    FADI(0x10)
    CLEAN
    CAMERA2(0xB, 0xC)
    SADD(EVT_SLOT_2, EVT_SLOT_A, EVT_SLOT_0)
    LOAD1(1, 0xFFFFFFFF)
    ENUN
    LOAD1(1, frontier_df3_unitdef_b_023_91512C_p34 + 0x528)
    ENUN
    REMU(0x41)
    FADU(0x10)
    STAL(0xF)
    STARTFADE
    EvtColorFadeSetup(6, 0xA, 8, 0x80, 0x80, 0x80)
    BREAKSTONE(0x41)
    EvtColorFadeSetup(6, 0xA, 8, 0x100, 0x100, 0x100)
    CURSOR_CHAR(0x40)
    STAL(0x3C)
    CURE
    SVAL(EVT_SLOT_2, 0x4B)
    SVAL(EVT_SLOT_3, 0xB6D)
    CALL(data_08A60354 + 0xF4)
    MOVE(0x10, 0x40, 0xB, 0xB)
    ENUN
    DISA(0x40)
    FADI(0x10)
    CLEA
    CLEE
    CLEN
    ENDA
    CAMERA2_CAHR(0x57)
    MUSC(0x15)
    CURSOR_CHAR(0x57)
    STAL(0x3C)
    CURE
    TEXTSTART
    TEXTSHOW(0xB6E)
    TEXTEND
    REMA
    EVBIT_T(7)
    ENDA
    CALL(UnitDef_Ch18BAlly_2)
    MUSC(0x2D)
    CURSOR_CHAR(0x40)
    STAL(0x3C)
    CURE
    SVAL(EVT_SLOT_2, 0x4E)
    CALL(data_08A60354 + 0xCC)
    TEXTSHOW(0xB76)
    TEXTEND
    FADI(0x10)
    REMA
    MNC2(0x15)
    ENDA
};
EventListScr frontier_df3_eventscr_ch_004_A6AE28[] __attribute__((section(".data.frontier_df3_eventscr_ch.gap4"))) = {
    EVENT_WORD(0x0001000C)
    TEXTSHOW(0xB74)
    TEXTEND
    GOTO(1)
    LABEL(0)
    TEXTSHOW(0xB75)
    TEXTEND
    LABEL(1)
    REMA
    EvtBgmFadeIn(0x7FFF, 4)
    FADI(0x10)
    CLEA
    CLEE
    CLEN
    SVAL(EVT_SLOT_B, 0x12000C)
    LOMA(0x15)
    FADU(0x10)
    LOAD1(1, frontier_df3_unitdef_b_023_91512C_p36 + 0x14)
    ENUN
    ENDA
    CHECK_TURNS
    SVAL(EVT_SLOT_1, 1)
    SAND(EVT_SLOT_C, EVT_SLOT_C, EVT_SLOT_1)
    BNE(0, 0xC, 0)
    SVAL(EVT_SLOT_2, frontier_df3_unitdef_b_023_91512C_p34 + 0x5A0)
    CALL(data_08A60354 + 0x58)
    SVAL(EVT_SLOT_2, frontier_df3_unitdef_b_023_91512C_p34 + 0x5DC)
    CALL(data_08A60354 + 0x80)
    LABEL(0)
    EVBIT_T(7)
    ENDA
    CHECK_TURNS
    SVAL(EVT_SLOT_1, 1)
    SAND(EVT_SLOT_C, EVT_SLOT_C, EVT_SLOT_1)
    BEQ(0, 0xC, 0)
    SVAL(EVT_SLOT_2, frontier_df3_unitdef_b_023_91512C_p34 + 0x604)
    CALL(data_08A60354 + 0x58)
    SVAL(EVT_SLOT_2, frontier_df3_unitdef_b_023_91512C_p34 + 0x640)
    CALL(data_08A60354 + 0x80)
    LABEL(0)
    EVBIT_T(7)
    ENDA
    SVAL(EVT_SLOT_2, 0)
    CALL(UnitDef_Ch14BAlly_7)
    COUNTER_SET(0, 3)
    ENUF(0xA)
    EVBIT_T(7)
    ENDA
    SVAL(EVT_SLOT_2, frontier_df3_unitdef_b_023_91512C_p34 + 0x668)
    CALL(data_08A60354 + 0x58)
    COUNTER_DEC(0)
    ENUF(0xA)
    COUNTER_CHECK(0)
    BNE(0, 0xC, 0)
    ENUT(0xA)
    LABEL(0)
    EVBIT_T(7)
    ENDA
    SVAL(EVT_SLOT_2, 0)
    CALL(UnitDef_Ch14BAlly_7)
    ENUF(0xC)
    COUNTER_SET(1, 6)
    EVBIT_T(7)
    ENDA
    ENUF(0xC)
    COUNTER_CHECK(1)
    SVAL(EVT_SLOT_7, 5)
    BEQ(0, 0xC, 7)
    SVAL(EVT_SLOT_7, 3)
    BEQ(0, 0xC, 7)
    SVAL(EVT_SLOT_7, 1)
    BEQ(0, 0xC, 7)
    SVAL(EVT_SLOT_2, frontier_df3_unitdef_b_023_91512C_p34 + 0x6A4)
    CALL(data_08A60354 + 0x58)
    COUNTER_CHECK(1)
    BNE(0, 0xC, 0)
    ENUT(0xC)
    LABEL(0)
    COUNTER_DEC(1)
    EVBIT_T(7)
    ENDA
    SVAL(EVT_SLOT_2, 0)
    CALL(UnitDef_Ch14BAlly_7)
    ENUF(0xE)
    COUNTER_SET(2, 6)
    EVBIT_T(7)
    ENDA
    ENUF(0xE)
    COUNTER_CHECK(2)
    SVAL(EVT_SLOT_7, 5)
    BEQ(0, 0xC, 7)
    SVAL(EVT_SLOT_7, 3)
    BEQ(0, 0xC, 7)
    SVAL(EVT_SLOT_7, 1)
    BEQ(0, 0xC, 7)
    SVAL(EVT_SLOT_2, frontier_df3_unitdef_b_023_91512C_p34 + 0x6F4)
    CALL(data_08A60354 + 0x58)
    COUNTER_CHECK(2)
    BNE(0, 0xC, 0)
    ENUT(0xE)
    LABEL(0)
    COUNTER_DEC(2)
    EVBIT_T(7)
    ENDA
    SVAL(EVT_SLOT_2, 0)
    CALL(UnitDef_Ch14BAlly_7)
    ENUF(0x10)
    COUNTER_SET(3, 0xD)
    EVBIT_T(7)
    ENDA
    ENUF(0x10)
    COUNTER_CHECK(3)
    SVAL(EVT_SLOT_7, 0xB)
    BEQ(0, 0xC, 7)
    SVAL(EVT_SLOT_7, 0xA)
    BEQ(0, 0xC, 7)
    SVAL(EVT_SLOT_7, 8)
    BEQ(0, 0xC, 7)
    SVAL(EVT_SLOT_7, 7)
    BEQ(0, 0xC, 7)
    SVAL(EVT_SLOT_7, 5)
    BEQ(0, 0xC, 7)
    SVAL(EVT_SLOT_7, 4)
    BEQ(0, 0xC, 7)
    SVAL(EVT_SLOT_7, 2)
    BEQ(0, 0xC, 7)
    SVAL(EVT_SLOT_7, 1)
    BEQ(0, 0xC, 7)
    SVAL(EVT_SLOT_2, frontier_df3_unitdef_b_023_91512C_p34 + 0x744)
    CALL(data_08A60354 + 0x58)
    COUNTER_CHECK(3)
    BNE(0, 0xC, 0)
    ENUT(0x10)
    LABEL(0)
    COUNTER_DEC(3)
    EVBIT_T(7)
    ENDA
    CHECK_TURNS
    SVAL(EVT_SLOT_1, 1)
    SAND(EVT_SLOT_C, EVT_SLOT_C, EVT_SLOT_1)
    BNE(0, 0xC, 0)
    SVAL(EVT_SLOT_2, frontier_df3_unitdef_b_023_91512C_p34 + 0x794)
    CALL(data_08A60354 + 0x58)
    SVAL(EVT_SLOT_2, frontier_df3_unitdef_b_023_91512C_p34 + 0x7E4)
    CALL(data_08A60354 + 0x80)
    SVAL(EVT_SLOT_2, frontier_df3_unitdef_b_023_91512C_p34 + 0x820)
    CALL(data_08A60354 + 0x80)
    SVAL(EVT_SLOT_2, frontier_df3_unitdef_b_023_91512C_p34 + 0x848)
    CALL(data_08A60354 + 0x80)
    LABEL(0)
    EVBIT_T(7)
    ENDA
    SVAL(EVT_SLOT_2, frontier_df3_unitdef_b_023_91512C_p34 + 0x870)
    CALL(data_08A60354 + 0x80)
    EVBIT_T(7)
    ENDA
    CALL(EventScr_Ch21A_8)
    CURSOR_CHAR(0x6C)
    STAL(0x3C)
    CURE
    MUSC(0x2D)
    TEXTSTART
    TEXTSHOW(0xB7D)
    TEXTEND
    REMA
    SVAL(EVT_SLOT_2, 0x6C)
    CALL(EventScr_UnitWarpOUT)
    DISA(0x6C)
    FADI(0x10)
    LOAD1(1, frontier_df3_unitdef_b_024_915E08)
    ENUN
    CALL(data_085B9BBC + 0x200)
    ENUT(0xB)
    ENUT(0xC)
    ENUT(0xD)
    ENDA
};
EventListScr frontier_df3_eventscr_ch_005_A6B460[] __attribute__((section(".data.frontier_df3_eventscr_ch.gap5"))) = {
    SVAL(EVT_SLOT_2, 0)
    CALL(UnitDef_Ch14BAlly_7)
    ENUF(0xB)
    COUNTER_SET(0, 1)
    EVBIT_T(7)
    ENDA
    SVAL(EVT_SLOT_2, frontier_df3_unitdef_b_024_915E08_residue)
    CALL(data_08A60354 + 0x58)
    COUNTER_DEC(0)
    ENUF(0xB)
    COUNTER_CHECK(0)
    BNE(0, 0xC, 0)
    ENUT(0xB)
    LABEL(0)
    EVBIT_T(7)
    ENDA
    SVAL(EVT_SLOT_2, 0)
    CALL(UnitDef_Ch14BAlly_7)
    ENUF(0xC)
    COUNTER_SET(1, 1)
    EVBIT_T(7)
    ENDA
    SVAL(EVT_SLOT_2, frontier_df3_unitdef_b_024_915E08_residue + 0x78)
    CALL(data_08A60354 + 0x58)
    COUNTER_DEC(1)
    ENUF(0xC)
    COUNTER_CHECK(1)
    BNE(0, 0xC, 0)
    ENUT(0xC)
    LABEL(0)
    EVBIT_T(7)
    ENDA
    SVAL(EVT_SLOT_2, 0)
    CALL(UnitDef_Ch14BAlly_7)
    ENUF(0xD)
    COUNTER_SET(2, 0xA)
    EVBIT_T(7)
    ENDA
    SVAL(EVT_SLOT_2, frontier_df3_unitdef_b_024_915E08_residue + 0xDC)
    CALL(data_08A60354 + 0x58)
    COUNTER_DEC(2)
    ENUF(0xD)
    COUNTER_CHECK(2)
    BNE(0, 0xC, 0)
    ENUT(0xD)
    LABEL(0)
    EVBIT_T(7)
    ENDA
    SVAL(EVT_SLOT_2, 0)
    CALL(UnitDef_Ch14BAlly_7)
    SVAL(EVT_SLOT_1, 0x10000)
    CHAI(0xB1)
    EVBIT_T(7)
    ENDA
    CALL((u8 *)frontier_df3_eventscr_ch_005_A6B460 + 0x12C)
    ENDA
    STARTFADE
    EvtColorFadeSetup(6, 0xA, 0, 0, 0, 0)
    FADU(0x80)
    SOLOTEXTBOXSTART
    CHECK_MODE
    SVAL(EVT_SLOT_1, 2)
    BNE(0, 0xC, 1)
    SVAL(EVT_SLOT_B, 0x680030)
    TEXTSHOW(0xB89)
    TEXTEND
    GOTO(1)
    LABEL(0)
    SVAL(EVT_SLOT_B, 0x680028)
    TEXTSHOW(0xB8A)
    TEXTEND
    LABEL(1)
    REMA
    CHECK_EVBIT(2)
    BNE(2, 0xC, 0)
    EVBIT_MODIFY(1)
    ASMC(StartMapEventcallFx0)
    LOAD1(1, frontier_df3_unitdef_b_025_9163BC_p14 + 0x154)
    ENUN
    EvtColorFadeSetup(6, 0xA, 8, 0x100, 0x100, 0x100)
    MUSC(0x2F)
    ASMC(StartMapEventcallFx1)
    EVBIT_MODIFY(0)
    GOTO(3)
    LABEL(2)
    MUSC(0x2F)
    LOAD1(1, frontier_df3_unitdef_b_025_9163BC_p14 + 0x154)
    ENUN
    LABEL(3)
    CAMERA2(0xB, 0xA)
    LOAD1(0, frontier_df3_unitdef_b_025_9163BC_p14)
    ENUN
    CURSOR_CHAR(0)
    STAL(0x3C)
    CURE
    CHECK_MODE
    SVAL(EVT_SLOT_1, 2)
    BNE(0xA, 0xC, 1)
    TEXTSTART
    TEXTSHOW(0xB8B)
    TEXTEND
    REMA
    GOTO(0xB)
    LABEL(0xA)
    TEXTSTART
    TEXTSHOW(0xB8C)
    TEXTEND
    REMA
    LABEL(0xB)
    CAMERA2(0xB, 0xF)
    LOAD2(1, frontier_df3_unitdef_b_025_9163BC_p14 + 0x3C)
    SVAL(EVT_SLOT_1, 0)
    SET_STATE(1)
    SVAL(EVT_SLOT_1, 0)
    SET_STATE(0xF)
    SVAL(EVT_SLOT_1, 0)
    SET_STATE(0x19)
    SVAL(EVT_SLOT_1, 0)
    SET_STATE(2)
    LOAD3(0, frontier_df3_unitdef_b_025_9163BC_p14 + 0x78)
    ENUN
    SVAL(EVT_SLOT_1, 0xFFFFFFFF)
    SET_STATE(1)
    SVAL(EVT_SLOT_1, 0xFFFFFFFF)
    SET_STATE(0xF)
    SVAL(EVT_SLOT_1, 0xFFFFFFFF)
    SET_STATE(0x19)
    SVAL(EVT_SLOT_1, 0xFFFFFFFF)
    SET_STATE(2)
    CURSOR_CHAR(0)
    STAL(0x3C)
    CURE
    CHECK_MODE
    SVAL(EVT_SLOT_1, 2)
    BNE(0xC, 0xC, 1)
    TEXTSTART
    TEXTSHOW(0xB8D)
    TEXTEND
    REMA
    GOTO(0xD)
    LABEL(0xC)
    TEXTSTART
    TEXTSHOW(0xB8E)
    TEXTEND
    REMA
    LABEL(0xD)
    MUSC(0x45)
    CHECK_MODE
    SVAL(EVT_SLOT_1, 2)
    BNE(0xE, 0xC, 1)
    CHECK_ALIVE(0xF)
    BEQ(0x8095, 0xC, 0)
    CHECK_DEPLOYED(0xF)
    BEQ(0x8095, 0xC, 0)
    CURSOR_CHAR(0xF)
    STAL(0x3C)
    CURE
    TEXTSTART
    TEXTSHOW(0xB90)
    TEXTEND
    REMA
    LABEL(0x8095)
    GOTO(0xF)
    LABEL(0xE)
    CHECK_ALIVE(1)
    BEQ(0x8099, 0xC, 0)
    CHECK_DEPLOYED(1)
    BEQ(0x8099, 0xC, 0)
    CURSOR_CHAR(1)
    STAL(0x3C)
    CURE
    TEXTSTART
    TEXTSHOW(0xB8F)
    TEXTEND
    REMA
    LABEL(0x8099)
    LABEL(0xF)
    CHECK_ALIVE(2)
    BEQ(0x809C, 0xC, 0)
    CHECK_DEPLOYED(2)
    BEQ(0x809C, 0xC, 0)
    CURSOR_CHAR(2)
    STAL(0x3C)
    CURE
    TEXTSTART
    TEXTSHOW(0xB91)
    TEXTEND
    REMA
    LABEL(0x809C)
    CHECK_ALIVE(0x11)
    BEQ(0x809D, 0xC, 0)
    CHECK_DEPLOYED(0x11)
    BEQ(0x809D, 0xC, 0)
    CURSOR_CHAR(0x11)
    STAL(0x3C)
    CURE
    TEXTSTART
    TEXTSHOW(0xB9E)
    TEXTEND
    REMA
    LABEL(0x809D)
    CHECK_ALIVE(0x10)
    BEQ(0x809E, 0xC, 0)
    CHECK_DEPLOYED(0x10)
    BEQ(0x809E, 0xC, 0)
    CURSOR_CHAR(0x10)
    STAL(0x3C)
    CURE
    TEXTSTART
    TEXTSHOW(0xB9F)
    TEXTEND
    REMA
    LABEL(0x809E)
    CHECK_ALIVE(4)
    BEQ(0x809F, 0xC, 0)
    CHECK_DEPLOYED(4)
    BEQ(0x809F, 0xC, 0)
    CURSOR_CHAR(4)
    STAL(0x3C)
    CURE
    TEXTSTART
    TEXTSHOW(0xB92)
    TEXTEND
    REMA
    LABEL(0x809F)
    CHECK_ALIVE(0xB)
    BEQ(0x80A1, 0xC, 0)
    CHECK_DEPLOYED(0xB)
    BEQ(0x80A1, 0xC, 0)
    CURSOR_CHAR(0xB)
    STAL(0x3C)
    CURE
    TEXTSTART
    TEXTSHOW(0xBA1)
    TEXTEND
    REMA
    LABEL(0x80A1)
    CHECK_ALIVE(0x22)
    BEQ(0x80A2, 0xC, 0)
    CHECK_DEPLOYED(0x22)
    BEQ(0x80A2, 0xC, 0)
    CURSOR_CHAR(0x22)
    STAL(0x3C)
    CURE
    TEXTSTART
    TEXTSHOW(0xBA0)
    TEXTEND
    REMA
    LABEL(0x80A2)
    CHECK_ALIVE(6)
    BEQ(0x80A3, 0xC, 0)
    CHECK_DEPLOYED(6)
    BEQ(0x80A3, 0xC, 0)
    CURSOR_CHAR(6)
    STAL(0x3C)
    CURE
    TEXTSTART
    TEXTSHOW(0xB95)
    TEXTEND
    REMA
    LABEL(0x80A3)
    CHECK_ALIVE(0x21)
    BEQ(0x80A4, 0xC, 0)
    CHECK_DEPLOYED(0x21)
    BEQ(0x80A4, 0xC, 0)
    CURSOR_CHAR(0x21)
    STAL(0x3C)
    CURE
    TEXTSTART
    TEXTSHOW(0xBAF)
    TEXTEND
    REMA
    LABEL(0x80A4)
    CHECK_ALIVE(3)
    BEQ(0x80A5, 0xC, 0)
    CHECK_DEPLOYED(3)
    BEQ(0x80A5, 0xC, 0)
    CURSOR_CHAR(3)
    STAL(0x3C)
    CURE
    TEXTSTART
    TEXTSHOW(0xB93)
    TEXTEND
    REMA
    LABEL(0x80A5)
    CHECK_ALIVE(5)
    BEQ(0x80A6, 0xC, 0)
    CHECK_DEPLOYED(5)
    BEQ(0x80A6, 0xC, 0)
    CURSOR_CHAR(5)
    STAL(0x3C)
    CURE
    TEXTSTART
    TEXTSHOW(0xB94)
    TEXTEND
    REMA
    LABEL(0x80A6)
    CHECK_ALIVE(0x1D)
    BEQ(0x80A8, 0xC, 0)
    CHECK_DEPLOYED(0x1D)
    BEQ(0x80A8, 0xC, 0)
    CURSOR_CHAR(0x1D)
    STAL(0x3C)
    CURE
    TEXTSTART
    TEXTSHOW(0xBAC)
    TEXTEND
    REMA
    LABEL(0x80A8)
    CHECK_ALIVE(0x1F)
    BEQ(0x80A9, 0xC, 0)
    CHECK_DEPLOYED(0x1F)
    BEQ(0x80A9, 0xC, 0)
    CURSOR_CHAR(0x1F)
    STAL(0x3C)
    CURE
    TEXTSTART
    TEXTSHOW(0xBAE)
    TEXTEND
    REMA
    LABEL(0x80A9)
    CHECK_ALIVE(0xD)
    BEQ(0x80AA, 0xC, 0)
    CHECK_DEPLOYED(0xD)
    BEQ(0x80AA, 0xC, 0)
    CURSOR_CHAR(0xD)
    STAL(0x3C)
    CURE
    TEXTSTART
    TEXTSHOW(0xB9C)
    TEXTEND
    REMA
    LABEL(0x80AA)
    CHECK_ALIVE(0xE)
    BEQ(0x80AB, 0xC, 0)
    CHECK_DEPLOYED(0xE)
    BEQ(0x80AB, 0xC, 0)
    CURSOR_CHAR(0xE)
    STAL(0x3C)
    CURE
    TEXTSTART
    TEXTSHOW(0xBA9)
    TEXTEND
    REMA
    LABEL(0x80AB)
    CHECK_ALIVE(0x12)
    BEQ(0x80AC, 0xC, 0)
    CHECK_DEPLOYED(0x12)
    BEQ(0x80AC, 0xC, 0)
    CURSOR_CHAR(0x12)
    STAL(0x3C)
    CURE
    TEXTSTART
    TEXTSHOW(0xBAA)
    TEXTEND
    REMA
    LABEL(0x80AC)
    CHECK_ALIVE(0x14)
    BEQ(0x80AE, 0xC, 0)
    CHECK_DEPLOYED(0x14)
    BEQ(0x80AE, 0xC, 0)
    CURSOR_CHAR(0x14)
    STAL(0x3C)
    CURE
    TEXTSTART
    TEXTSHOW(0xBA2)
    TEXTEND
    REMA
    LABEL(0x80AE)
    CHECK_ALIVE(0x15)
    BEQ(0x80AF, 0xC, 0)
    CHECK_DEPLOYED(0x15)
    BEQ(0x80AF, 0xC, 0)
    CURSOR_CHAR(0x15)
    STAL(0x3C)
    CURE
    TEXTSTART
    TEXTSHOW(0xBA3)
    TEXTEND
    REMA
    LABEL(0x80AF)
    CHECK_ALIVE(0x16)
    BEQ(0x80B0, 0xC, 0)
    CHECK_DEPLOYED(0x16)
    BEQ(0x80B0, 0xC, 0)
    CURSOR_CHAR(0x16)
    STAL(0x3C)
    CURE
    TEXTSTART
    TEXTSHOW(0xBA4)
    TEXTEND
    REMA
    LABEL(0x80B0)
    CHECK_ALIVE(0x20)
    BEQ(0x80B1, 0xC, 0)
    CHECK_DEPLOYED(0x20)
    BEQ(0x80B1, 0xC, 0)
    CURSOR_CHAR(0x20)
    STAL(0x3C)
    CURE
    TEXTSTART
    TEXTSHOW(0xB9D)
    TEXTEND
    REMA
    LABEL(0x80B1)
    CHECK_ALIVE(0x17)
    BEQ(0x80B3, 0xC, 0)
    CHECK_DEPLOYED(0x17)
    BEQ(0x80B3, 0xC, 0)
    CURSOR_CHAR(0x17)
    STAL(0x3C)
    CURE
    TEXTSTART
    TEXTSHOW(0xBA5)
    TEXTEND
    REMA
    LABEL(0x80B3)
    CHECK_ALIVE(0x18)
    BEQ(0x80B4, 0xC, 0)
    CHECK_DEPLOYED(0x18)
    BEQ(0x80B4, 0xC, 0)
    CURSOR_CHAR(0x18)
    STAL(0x3C)
    CURE
    TEXTSTART
    TEXTSHOW(0xBA6)
    TEXTEND
    REMA
    LABEL(0x80B4)
    CHECK_ALIVE(0x1E)
    BEQ(0x80B5, 0xC, 0)
    CHECK_DEPLOYED(0x1E)
    BEQ(0x80B5, 0xC, 0)
    CURSOR_CHAR(0x1E)
    STAL(0x3C)
    CURE
    TEXTSTART
    TEXTSHOW(0xBAD)
    TEXTEND
    REMA
    LABEL(0x80B5)
    CHECK_ALIVE(0xA)
    BEQ(0x80B7, 0xC, 0)
    CHECK_DEPLOYED(0xA)
    BEQ(0x80B7, 0xC, 0)
    CURSOR_CHAR(0xA)
    STAL(0x3C)
    CURE
    TEXTSTART
    TEXTSHOW(0xB96)
    TEXTEND
    REMA
    LABEL(0x80B7)
    CHECK_ALIVE(7)
    BEQ(0x80B8, 0xC, 0)
    CHECK_DEPLOYED(7)
    BEQ(0x80B8, 0xC, 0)
    CURSOR_CHAR(7)
    STAL(0x3C)
    CURE
    TEXTSTART
    TEXTSHOW(0xB97)
    TEXTEND
    REMA
    LABEL(0x80B8)
    CHECK_ALIVE(9)
    BEQ(0x80B9, 0xC, 0)
    CHECK_DEPLOYED(9)
    BEQ(0x80B9, 0xC, 0)
    CURSOR_CHAR(9)
    STAL(0x3C)
    CURE
    TEXTSTART
    TEXTSHOW(0xB98)
    TEXTEND
    REMA
    LABEL(0x80B9)
    CHECK_ALIVE(8)
    BEQ(0x80BA, 0xC, 0)
    CHECK_DEPLOYED(8)
    BEQ(0x80BA, 0xC, 0)
    CURSOR_CHAR(8)
    STAL(0x3C)
    CURE
    TEXTSTART
    TEXTSHOW(0xB99)
    TEXTEND
    REMA
    LABEL(0x80BA)
    CHECK_ALIVE(0x13)
    BEQ(0x80BB, 0xC, 0)
    CHECK_DEPLOYED(0x13)
    BEQ(0x80BB, 0xC, 0)
    CURSOR_CHAR(0x13)
    STAL(0x3C)
    CURE
    TEXTSTART
    TEXTSHOW(0xB9A)
    TEXTEND
    REMA
    LABEL(0x80BB)
    CHECK_ALIVE(0xC)
    BEQ(0x80BC, 0xC, 0)
    CHECK_DEPLOYED(0xC)
    BEQ(0x80BC, 0xC, 0)
    CURSOR_CHAR(0xC)
    STAL(0x3C)
    CURE
    TEXTSTART
    TEXTSHOW(0xB9B)
    TEXTEND
    REMA
    LABEL(0x80BC)
    CHECK_ALIVE(0x19)
    BEQ(0x80BE, 0xC, 0)
    CHECK_DEPLOYED(0x19)
    BEQ(0x80BE, 0xC, 0)
    CURSOR_CHAR(0x19)
    STAL(0x3C)
    CURE
    TEXTSTART
    TEXTSHOW(0xBA7)
    TEXTEND
    REMA
    LABEL(0x80BE)
    CHECK_ALIVE(0x1A)
    BEQ(0x80BF, 0xC, 0)
    CHECK_DEPLOYED(0x1A)
    BEQ(0x80BF, 0xC, 0)
    CURSOR_CHAR(0x1A)
    STAL(0x3C)
    CURE
    TEXTSTART
    TEXTSHOW(0xBA8)
    TEXTEND
    REMA
    LABEL(0x80BF)
    CHECK_ALIVE(0x1C)
    BEQ(0x80C0, 0xC, 0)
    CHECK_DEPLOYED(0x1C)
    BEQ(0x80C0, 0xC, 0)
    CURSOR_CHAR(0x1C)
    STAL(0x3C)
    CURE
    TEXTSTART
    TEXTSHOW(0xBAB)
    TEXTEND
    REMA
    LABEL(0x80C0)
    CHECK_MODE
    SVAL(EVT_SLOT_1, 2)
    BNE(0x10, 0xC, 1)
    CHECK_ALIVE(1)
    BEQ(0x80C4, 0xC, 0)
    CHECK_DEPLOYED(1)
    BEQ(0x80C4, 0xC, 0)
    CURSOR_CHAR(1)
    STAL(0x3C)
    CURE
    TEXTSTART
    TEXTSHOW(0xB8F)
    TEXTEND
    REMA
    LABEL(0x80C4)
    GOTO(0x11)
    LABEL(0x10)
    CHECK_ALIVE(0xF)
    BEQ(0x80C8, 0xC, 0)
    CHECK_DEPLOYED(0xF)
    BEQ(0x80C8, 0xC, 0)
    CURSOR_CHAR(0xF)
    STAL(0x3C)
    CURE
    TEXTSTART
    TEXTSHOW(0xB90)
    TEXTEND
    REMA
    LABEL(0x80C8)
    LABEL(0x11)
    CAMERA2(0xB, 6)
    SOLOTEXTBOXSTART
    SVAL(EVT_SLOT_B, 0x68001C)
    TEXTSHOW(0xBB0)
    TEXTEND
    CAMERA2(0xB, 0xA)
    ASMC2(StartDemonKingSummonAnim)
    CURSOR_CHAR(0)
    STAL(0x3C)
    CURE
    CHECK_MODE
    SVAL(EVT_SLOT_1, 2)
    BNE(0x12, 0xC, 1)
    TEXTSTART
    TEXTSHOW(0xBB1)
    TEXTEND
    REMA
    GOTO(0x13)
    LABEL(0x12)
    TEXTSTART
    TEXTSHOW(0xBB2)
    TEXTEND
    REMA
    LABEL(0x13)
    SVAL(EVT_SLOT_2, 0x19)
    CALL(EventScr_MoveUnitS2ToLeader)
    SVAL(EVT_SLOT_2, 2)
    CALL(EventScr_MoveUnitS2ToLeader)
    EVBIT_T(7)
    ENDA
    CALL(UnitDef_Ch21BEnemy_1)
    MNC4
    ENDA
};
EventListScr frontier_df3_eventscr_ch_006_A6C078[] __attribute__((section(".data.frontier_df3_eventscr_ch.gap6"))) = {
    CHECK_ALIVE(0x14)
    BEQ(1, 0xC, 0)
    CHECK_ALIVE(0x16)
    BEQ(1, 0xC, 0)
    CHECK_ALIVE(0x15)
    BEQ(1, 0xC, 0)
    TEXTSHOW(0xBB7)
    TEXTEND
    REMA
    LABEL(1)
    CHECK_ALIVE(0xD)
    BEQ(2, 0xC, 0)
    CHECK_ALIVE(0x12)
    BEQ(2, 0xC, 0)
    CHECK_ALIVE(0x1D)
    BEQ(2, 0xC, 0)
    CHECK_ALIVE(0xE)
    BEQ(2, 0xC, 0)
    CHECK_ALIVE(0x1F)
    BEQ(2, 0xC, 0)
    TEXTSHOW(0xBB8)
    TEXTEND
    REMA
    LABEL(2)
    CHECK_ALIVE(0x1A)
    BEQ(3, 0xC, 0)
    CHECK_ALIVE(0x1C)
    BEQ(3, 0xC, 0)
    TEXTSHOW(0xBB9)
    TEXTEND
    REMA
    LABEL(3)
    CHECK_ALIVE(0x17)
    BEQ(4, 0xC, 0)
    CHECK_ALIVE(0x18)
    BEQ(4, 0xC, 0)
    TEXTSHOW(0xBBA)
    TEXTEND
    REMA
    LABEL(4)
    CHECK_ALIVE(0xA)
    BEQ(5, 0xC, 0)
    CHECK_ALIVE(7)
    BEQ(5, 0xC, 0)
    CHECK_ALIVE(9)
    BEQ(5, 0xC, 0)
    CHECK_ALIVE(8)
    BEQ(5, 0xC, 0)
    CHECK_ALIVE(0x13)
    BEQ(5, 0xC, 0)
    CHECK_ALIVE(0xC)
    BEQ(5, 0xC, 0)
    TEXTSHOW(0xBBB)
    TEXTEND
    REMA
    LABEL(5)
    CHECK_ALIVE(4)
    BEQ(6, 0xC, 0)
    CHECK_ALIVE(0x11)
    BEQ(6, 0xC, 0)
    CHECK_ALIVE(0x10)
    BEQ(6, 0xC, 0)
    TEXTSHOW(0xBBC)
    TEXTEND
    REMA
    LABEL(6)
    CHECK_MODE
    SVAL(EVT_SLOT_1, 2)
    BNE(7, 0xC, 1)
    TEXTSHOW(0xBBD)
    TEXTEND
    GOTO(8)
    LABEL(7)
    TEXTSHOW(0xBBE)
    TEXTEND
    LABEL(8)
    FADI(4)
    REMA
    REVEAL(0x19)
    REVEAL(2)
    ENDA
    MUSC(0x2E)
    SVAL(EVT_SLOT_2, 0xA5F)
    SVAL(EVT_SLOT_3, 0xA60)
    SVAL(EVT_SLOT_4, 0xA61)
    CALL(EventScr_Ch8_11)
    CAMERA2(0x13, 9)
    FADU(0x10)
    LOAD1(1, frontier_df3_unitdef_b_026_916D14_p4 + 0x14)
    ENUN
    CURSOR_CHAR(0x1D)
    STAL(0x3C)
    CURE
    SVAL(EVT_SLOT_2, 0x11)
    CALL(data_08A60354 + 0xCC)
    TEXTSHOW(0xA62)
    TEXTEND
    REMA
    FADI(0x10)
    CLEA
    CLEE
    CLEN
    SVAL(EVT_SLOT_B, 0xA0012)
    LOMA(0x17)
    LOAD1(1, frontier_df3_unitdef_b_025_9163BC_tail_p5 + 0xF0)
    ENUN
    LOAD1(1, frontier_df3_unitdef_b_026_916D14 + 0x64)
    ENUN
    SVAL(EVT_SLOT_B, 0x3000C)
    TILECHANGE(0xFFFF)
    EvtBgmFadeIn(0x7FFF, 4)
    FADU(0x10)
    LOAD2(1, frontier_df3_unitdef_b_026_916D14)
    ENUN
    CURSOR_CHAR(0x5A)
    STAL(0x3C)
    CURE
    MUSC(0x25)
    SVAL(EVT_SLOT_2, 0x3B)
    CALL(data_08A60354 + 0xCC)
    TEXTSHOW(0xA63)
    TEXTEND
    REMA
    FADI(0x10)
    CLEA
    CLEE
    CLEN
    SVAL(EVT_SLOT_2, 0x33)
    CALL(data_08A60354 + 0xCC)
    TEXTSHOW(0xA64)
    TEXTEND
    REMA
    FADI(0x10)
    CLEAN
    CAMERA(0, 0)
    LOAD1(1, frontier_df3_unitdef_b_025_9163BC_tail_p5 + 0xF0)
    ENUN
    EvtSetLoadUnitNoREDA
    LOAD1(1, frontier_df3_unitdef_b_026_916D14 + 0x3C)
    ENUN
    FADU(0x10)
    SVAL(EVT_SLOT_1, 1)
    SET_STATE(0xF)
    LOAD3(0, frontier_df3_unitdef_b_025_9163BC_tail_p5)
    ENUN
    DISA(0x83)
    LOAD1(1, frontier_df3_unitdef_b_026_916D14 + 0x3C)
    ENUN
    FADI(0x10)
    CLEA
    CLEE
    CLEN
    LOAD1(1, frontier_df3_unitdef_b_025_9163BC_tail_p5 + 0xF0)
    ENUN
    LOAD1(1, frontier_df3_unitdef_b_026_916D14 + 0x64)
    ENUN
    CAMERA2(0x11, 0xA)
    FADU(0x10)
    CURSOR_CHAR(0x83)
    STAL(0x3C)
    CURE
    MUSC(0x2E)
    SVAL(EVT_SLOT_2, 0x3B)
    SVAL(EVT_SLOT_3, 0xA65)
    CALL(data_08A60354 + 0xF4)
    MOVE_1STEP(0x10, 0x5A, 2)
    ENUN
    CURSOR_CHAR(0x5A)
    STAL(0x3C)
    CURE
    SVAL(EVT_SLOT_2, 0x3B)
    SVAL(EVT_SLOT_3, 0xA66)
    CALL(data_08A60354 + 0xF4)
    MOVE_1STEP(0x10, 0x5A, 3)
    SVAL(EVT_SLOT_D, 0)
    SVAL(EVT_SLOT_1, 0x256)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x216)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0)
    SENQUEUE1
    MOVE_DEFINED(0x12)
    ENUN
    CURSOR_CHAR(0x12)
    STAL(0x3C)
    CURE
    SVAL(EVT_SLOT_2, 0x3B)
    SVAL(EVT_SLOT_3, 0xA67)
    CALL(data_08A60354 + 0xF4)
    MOVE_1STEP(8, 0x12, 2)
    ENUN
    SVAL(EVT_SLOT_D, 0)
    SVAL(EVT_SLOT_1, 0x10215)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x10295)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x10296)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0)
    SENQUEUE1
    MOVE_DEFINED(0x83)
    ENUN
    CURSOR_CHAR(0x12)
    STAL(0x3C)
    CURE
    SVAL(EVT_SLOT_2, 0x3B)
    SVAL(EVT_SLOT_3, 0xA68)
    CALL(data_08A60354 + 0xF4)
    MOVE(0x10, 0x83, 0x17, 0xF)
    MOVE(0x10, 0x12, 0x17, 0xF)
    LOAD1(1, frontier_df3_unitdef_b_025_9163BC_tail_p5 + 0x348)
    STAL2(0x1E)
    FADI(0x10)
    ENUN
    CLEA
    CLEE
    CLEN
    LOAD1(1, frontier_df3_unitdef_b_025_9163BC_tail_p5 + 0xF0)
    ENUN
    LOAD1(1, frontier_df3_unitdef_b_025_9163BC_tail_p5 + 0x348)
    ENUN
    LOAD1(1, frontier_df3_unitdef_b_025_9163BC_tail_p5 + 0x3D4)
    ENUN
    CALL(data_085B9BBC + 0x200)
    MUSC(0xC)
    CAMERA2(8, 4)
    FADU(0x10)
    LOAD1(1, frontier_df3_unitdef_b_025_9163BC_tail_p5 + 0x410)
    ENUN
    SVAL(EVT_SLOT_B, 0x3000C)
    TILEREVERT(0xFFFF)
    CURSOR_CHAR(0x22)
    STAL(0x3C)
    CURE
    MUSI
    SVAL(EVT_SLOT_2, 0x1D)
    SVAL(EVT_SLOT_3, 0xA69)
    CALL(data_08A60354 + 0xF4)
    MUNO
    ENUT(0x12)
    ENUT(0xC)
    ENUT(0x10)
    ENUT(0xE)
    EVBIT_T(7)
    ENDA
    MUSC(0x31)
    SVAL(EVT_SLOT_2, 0x3B)
    CALL(data_08A60354 + 0xCC)
    TEXTSHOW(0xA6D)
    TEXTEND
    REMA
    FADI(0x10)
    SVAL(EVT_SLOT_2, 0x12)
    CALL(EventScr_StrictLoadUniqueAlly)
    CLEAN
    CAMERA2(0x11, 9)
    CLEA
    CLEE
    CLEN
    EvtSetLoadUnitNoREDA
    LOAD2(1, frontier_df3_unitdef_b_026_916D14 + 0xA0)
    ENUN
    FADU(0x10)
    LOAD2(1, frontier_df3_unitdef_b_026_916D14 + 0xA0)
    ENUN
    MOVE_1STEP(0x10, 0xF, 2)
    ENUN
    CURSOR_CHAR(0xF)
    STAL(0x3C)
    CURE
    SVAL(EVT_SLOT_2, 0x3B)
    CALL(data_08A60354 + 0xCC)
    TEXTSHOW(0xA6E)
    TEXTEND
    EvtBgmFadeIn(0x7FFF, 2)
    TEXTCONT
    TEXTEND
    MUSC(0x32)
    TEXTCONT
    TEXTEND
    REMA
    FADI(4)
    SVAL(EVT_SLOT_2, 0x33)
    CALL(data_08A60354 + 0xCC)
    TEXTSHOW(0xA6F)
    TEXTEND
    REMA
    SVAL(EVT_SLOT_2, 0x1E)
    CALL(data_08A60354 + 0xCC)
    MUSI
    TEXTSHOW(0xA70)
    TEXTEND
    REMA
    EvtBgmFadeIn(0x7FFF, 4)
    SVAL(EVT_SLOT_2, 0x2000F)
    CALL(EventScr_9EEA58)
    LOAD1(1, frontier_df3_unitdef_b_026_916D14_p6 + 0x14)
    ENUN
    MUSC(0x2E)
    FADU(0x10)
    TILECHANGE(0)
    LOAD1(1, frontier_df3_unitdef_b_026_916D14_p6 + 0x50)
    ENUN
    CURSOR_CHAR(0x6B)
    STAL(0x3C)
    CURE
    TEXTSTART
    TEXTSHOW(0xA71)
    TEXTEND
    REMA
    ENUT(0x71)
    MNCH(0x18)
    ENDA
    MUSS(0x30)
    STAL(0x21)
    TEXTSTART
    TEXTSHOW(0xA73)
    TEXTEND
    REMA
    MURE(2)
    CUSA(0x12)
    EVBIT_T(7)
    ENDA
    MUSS(0x30)
    STAL(0x21)
    TEXTSTART
    TEXTSHOW(0xA72)
    TEXTEND
    SOUN(0x2D9)
    TEXTCONT
    TEXTEND
    REMA
    MURE(2)
    CUSA(0x12)
    EVBIT_T(7)
    ENDA
    MUSS(0x30)
    STAL(0x21)
    TEXTSTART
    TEXTSHOW(0xA74)
    TEXTEND
    REMA
    MURE(2)
    EVBIT_T(7)
    ENDA
    SVAL(EVT_SLOT_2, 0)
    CALL(UnitDef_Ch14BAlly_7)
    SVAL(EVT_SLOT_1, 0x10000)
    CHAI(0x81)
    COUNTER_SET(0, 1)
    ENUF(0x12)
    EVBIT_T(7)
    ENDA
    SVAL(EVT_SLOT_2, UnitDef_Ch9BEnemy_3)
    CALL(data_08A60354 + 0x80)
    COUNTER_DEC(0)
    ENUF(0x12)
    COUNTER_CHECK(0)
    BNE(0, 0xC, 0)
    ENUT(0x12)
    LABEL(0)
    EVBIT_T(7)
    ENDA
    SVAL(EVT_SLOT_2, 0)
    CALL(UnitDef_Ch14BAlly_7)
    COUNTER_SET(1, 2)
    ENUF(0xC)
    EVBIT_T(7)
    ENDA
    SVAL(EVT_SLOT_2, UnitDef_Ch9BEnemy_4)
    CALL(data_08A60354 + 0x80)
    COUNTER_DEC(1)
    ENUF(0xC)
    COUNTER_CHECK(1)
    BNE(0, 0xC, 0)
    ENUT(0xC)
    LABEL(0)
    EVBIT_T(7)
    ENDA
    COUNTER_SET(2, 2)
    ENUF(0x10)
    EVBIT_T(7)
    ENDA
    SVAL(EVT_SLOT_2, UnitDef_Ch9BEnemy_5)
    CALL(data_08A60354 + 0x58)
    COUNTER_DEC(2)
    ENUF(0x10)
    COUNTER_CHECK(2)
    BNE(0, 0xC, 0)
    ENUT(0x10)
    LABEL(0)
    EVBIT_T(7)
    ENDA
};
EventListScr frontier_df3_eventscr_ch_007_A6C8CC[] __attribute__((section(".data.frontier_df3_eventscr_ch.gap7"))) = {
    SVAL(EVT_SLOT_2, UnitDef_Ch9BEnemy_6)
    CALL(data_08A60354 + 0x58)
    COUNTER_DEC(3)
    ENUF(0xE)
    COUNTER_CHECK(3)
    BNE(0, 0xC, 0)
    ENUT(0xE)
    LABEL(0)
    EVBIT_T(7)
    ENDA
    MUSC(0x25)
    SVAL(EVT_SLOT_B, 0)
    LOMA(0x4C)
    FADU(0x10)
    LOAD2(1, frontier_df3_unitdef_b_028_9178F8_p10 + 0xB4)
    SVAL(EVT_SLOT_1, 0)
    SET_STATE(0xF)
    SVAL(EVT_SLOT_1, 0)
    SET_STATE(2)
    LOAD3(0, frontier_df3_unitdef_b_028_9178F8_p10)
    ENUN
    SVAL(EVT_SLOT_1, 0xFFFFFFFF)
    SET_STATE(0xF)
    SVAL(EVT_SLOT_1, 0xFFFFFFFF)
    SET_STATE(2)
    CURSOR_CHAR(0xCC)
    STAL(0x3C)
    CURE
    SVAL(EVT_SLOT_2, 0x24)
    SVAL(EVT_SLOT_3, 0xA75)
    CALL(data_08A60354 + 0xF4)
    MUSI
    EARTHQUAKE_START(0, 1)
    STAL(0x78)
    EARTHQUAKE_END
    MOVE_1STEP(0, 2, 2)
    ENUN
    CURSOR_CHAR(0xF)
    STAL(0x3C)
    CURE
    SVAL(EVT_SLOT_2, 0x24)
    CALL(data_08A60354 + 0xCC)
    TEXTSHOW(0xA76)
    TEXTEND
    REMA
    EvtBgmFadeIn(0x7FFF, 4)
    FADI(0x10)
    CLEA
    CLEE
    CLEN
    SVAL(EVT_SLOT_B, 0xE000C)
    LOMA(0x18)
    UNIT_COLORS(0x222)
    LOAD1(1, frontier_df3_unitdef_b_026_916D14_tail_p1 + 0x1B8)
    ENUN
    LOAD1(1, frontier_df3_unitdef_b_027_917600 + 0x3C)
    ENUN
    EvtSetLoadUnitNoREDA
    LOAD2(1, frontier_df3_unitdef_b_027_917600 + 0xA0)
    ENUN
    EvtSetLoadUnitNoREDA
    LOAD2(1, frontier_df3_unitdef_b_027_917600 + 0xC8)
    ENUN
    FADU(0x10)
    CURSOR_CHAR(0x1D)
    STAL(0x3C)
    CURE
    MUSC(0x2E)
    SVAL(EVT_SLOT_2, 0xC)
    CALL(data_08A60354 + 0xCC)
    TEXTSHOW(0xA77)
    TEXTEND
    EvtBgmFadeIn(0x7FFF, 2)
    TEXTCONT
    TEXTEND
    MUSC(0x26)
    TEXTCONT
    TEXTEND
    CALL(data_08A60354 + 0xA8)
    CLEN
    UNIT_COLORS(0x22)
    LOAD1(1, frontier_df3_unitdef_b_026_916D14_tail_p1 + 0x348)
    ENUN
    CURSOR_CHAR(0x44)
    STAL(0x3C)
    CURE
    TEXTSTART
    TEXTSHOW(0xA78)
    TEXTEND
    REMA
    LOAD2(1, frontier_df3_unitdef_b_027_917600 + 0xA0)
    LOAD2(1, frontier_df3_unitdef_b_027_917600 + 0xC8)
    ENUN
    LOAD1(1, frontier_df3_unitdef_b_026_916D14_tail_p1 + 0x104)
    ENUN
    FADI(0x10)
    UNIT_COLORS(0)
    CLEA
    CLEE
    CLEN
    LOAD1(1, frontier_df3_unitdef_b_026_916D14_tail_p1 + 0x1B8)
    ENUN
    LOAD1(1, frontier_df3_unitdef_b_026_916D14_tail_p1 + 0xDC)
    ENUN
    LOAD1(1, frontier_df3_unitdef_b_026_916D14_tail_p1 + 0x104)
    ENUN
    LOAD1(1, frontier_df3_unitdef_b_026_916D14_tail_p1 + 0x3E8)
    ENUN
    LOAD1(1, frontier_df3_unitdef_b_026_916D14_tail_p1 + 0x348)
    ENUN
    SVAL(EVT_SLOT_2, frontier_df3_unitdef_b_026_916D14_tail_p1 + 0x2E4)
    SVAL(EVT_SLOT_3, 1)
    CALL(data_08A60354 + 0x2C)
    CAMERA(0x16, 0)
    FADU(0x10)
    LOAD2(1, frontier_df3_unitdef_b_027_917600 + 0x118)
    STAL2(0x20)
    SVAL(EVT_SLOT_1, 0)
    SET_STATE(0xF)
    SVAL(EVT_SLOT_1, 0)
    SET_STATE(2)
    LOAD3(0, frontier_df3_unitdef_b_027_917600 + 0x154)
    ENUN
    SVAL(EVT_SLOT_1, 0xFFFFFFFF)
    SET_STATE(0xF)
    SVAL(EVT_SLOT_1, 0xFFFFFFFF)
    SET_STATE(2)
    CURSOR_CHAR(2)
    STAL(0x3C)
    CURE
    SVAL(EVT_SLOT_2, 0x24)
    CALL(data_08A60354 + 0xCC)
    TEXTSHOW(0xA79)
    TEXTEND
    REMA
    CALL(data_085B9BBC + 0x200)
    ENDA
};
EventListScr frontier_df3_eventscr_ch_008_A6CD00[] __attribute__((section(".data.frontier_df3_eventscr_ch.gap8"))) = {
    SVAL(EVT_SLOT_7, 0)
    CHECK_ALIVE(0x89)
    BEQ(0, 0xC, 0)
    CHECK_ALIVE(0x8A)
    BEQ(0, 0xC, 0)
    CHECK_ALIVE(0x8B)
    BEQ(0, 0xC, 0)
    SVAL(EVT_SLOT_7, 1)
    LABEL(0)
    CHECK_EVENTID(2)
    BNE(1, 0xC, 0)
    MUSC(0x2E)
    CAMERA_CAHR(0x5B)
    CURSOR_CHAR(0x5B)
    STAL(0x3C)
    CURE
    SVAL(EVT_SLOT_2, 0x17)
    CALL(data_08A60354 + 0xCC)
    TEXTSHOW(0xA81)
    TEXTEND
    REMA
    EvtBgmFadeIn(0x7FFF, 4)
    FADI(0x10)
    CLEAN
    SVAL(EVT_SLOT_2, 0xE)
    CALL(EventScr_StrictLoadUniqueAlly)
    CLEE
    FADU(0x10)
    CAMERA_CAHR(0xF)
    CURSOR_CHAR(0xF)
    STAL(0x3C)
    CURE
    MUSC(0x31)
    SVAL(EVT_SLOT_2, 0x24)
    CALL(data_08A60354 + 0xCC)
    TEXTSHOW(0xA82)
    TEXTEND
    REMA
    FADI(0x10)
    GOTO(2)
    LABEL(1)
    MUSC(0x31)
    FADI(0x10)
    LABEL(2)
    MUSC(0x31)
    SVAL(EVT_SLOT_2, 0x1D)
    CALL(EventScr_LoadUniqueAlly)
    CLEA
    CLEE
    CLEN
    CLEAN
    CAMERA2(0xF, 0xC)
    FADU(0x10)
    CURSOR_AT(0x12, 0xD)
    STAL(0x3C)
    CURE
    SVAL(EVT_SLOT_2, 0x17)
    CALL(data_08A60354 + 0xCC)
    TEXTSHOW(0xA83)
    TEXTEND
    EvtBgmFadeIn(0x7FFF, 4)
    TEXTCONT
    TEXTEND
    MUSC(0x28)
    TEXTCONT
    TEXTEND
    BEQ(3, 7, 0)
    EvtTextShow2(0xA84)
    TEXTEND
    REMA
    CALL(data_085B9BBC + 0x168)
    SVAL(EVT_SLOT_3, 0x65)
    GIVEITEMTO(0x1D)
    LABEL(3)
    REMA
    EvtBgmFadeIn(0x7FFF, 4)
    FADI(0x10)
    CLEAN
    CAMERA(0, 0x13)
    EvtSetLoadUnitNoREDA
    LOAD2(1, UnitDef_Ch10BMixed_0)
    ENUN
    FADU(0x10)
    CURSOR_CHAR(2)
    STAL(0x3C)
    CURE
    MUSC(0x24)
    SVAL(EVT_SLOT_2, 0xC)
    SVAL(EVT_SLOT_3, 0xA85)
    CALL(data_08A60354 + 0xF4)
    CLEN
    LOAD2(1, UnitDef_Ch10BMixed_0)
    ENUN
    CURSOR_CHAR(0x19)
    STAL(0x3C)
    CURE
    MUSS(0x2A)
    STAL(0x21)
    SVAL(EVT_SLOT_2, 0xC)
    SVAL(EVT_SLOT_3, 0xA86)
    CALL(data_08A60354 + 0xF4)
    MURE(4)
    SVAL(EVT_SLOT_D, 0)
    SVAL(EVT_SLOT_1, 0x10387)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x10347)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x1034F)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0)
    SENQUEUE1
    MOVE_DEFINED(0x19)
    STAL2(0x32)
    SVAL(EVT_SLOT_D, 0)
    MOVE(0x10, 0x1A, 0xF, 0xD)
    MOVE(0x10, 0x1C, 0xF, 0xD)
    ENUN
    LOAD2(1, frontier_df3_unitdef_b_028_9178F8)
    ENUN
    CURSOR_CHAR(2)
    STAL(0x3C)
    CURE
    SVAL(EVT_SLOT_2, 0xC)
    CALL(data_08A60354 + 0xCC)
    TEXTSHOW(0xA87)
    TEXTEND
    REMA
    ENUT(0x72)
    MNCH(0x19)
    ENDA
    MUSS(0x30)
    STAL(0x21)
    TEXTSTART
    TEXTSHOW(0xA88)
    TEXTEND
    REMA
    MURE(2)
    CUSA(0x1D)
    EVBIT_T(7)
    ENDA
    MUSS(0x30)
    STAL(0x21)
    TEXTSTART
    TEXTSHOW(0xA89)
    TEXTEND
    REMA
    MURE(2)
    CUSA(0xE)
    EVBIT_T(7)
    ENDA
    MUSS(0x30)
    STAL(0x21)
    TEXTSTART
    TEXTSHOW(0xA8A)
    TEXTEND
    REMA
    MURE(2)
    CUSA(0xE)
    EVBIT_T(7)
    ENDA
    MUSI
    SVAL(EVT_SLOT_2, 2)
    SVAL(EVT_SLOT_3, 0xA8B)
    CALL(data_08A60354 + 0xF4)
    MUNO
    CALL(data_085B9BBC + 0x168)
    SVAL(EVT_SLOT_3, 0x56)
    GIVEITEMTO(0xFFFF)
    EVBIT_T(7)
    ENDA
    MUSI
    SVAL(EVT_SLOT_2, 2)
    SVAL(EVT_SLOT_3, 0xA8C)
    CALL(data_08A60354 + 0xF4)
    MUNO
    CALL(data_085B9BBC + 0x168)
    SVAL(EVT_SLOT_3, 0x64)
    GIVEITEMTO(0xFFFF)
    EVBIT_T(7)
    ENDA
    MUSI
    SVAL(EVT_SLOT_2, 0)
    SVAL(EVT_SLOT_3, 0xA8D)
    CALL(data_08A60354 + 0xF4)
    MUNO
    EVBIT_T(7)
    ENDA
    MUSI
    SVAL(EVT_SLOT_2, 0)
    SVAL(EVT_SLOT_3, 0xA8E)
    CALL(data_08A60354 + 0xF4)
    MUNO
    EVBIT_T(7)
    ENDA
    SVAL(EVT_SLOT_2, frontier_df3_unitdef_b_026_916D14_tail_p1 + 0x3AC)
    CALL(data_08A60354 + 0x58)
    EVBIT_T(7)
    ENDA
    CALL(EventScr_Ch10B_2)
    SVAL(EVT_SLOT_1, 0x10000)
    CHAI(0xE)
    SVAL(EVT_SLOT_1, 0x10000)
    CHAI(0x83)
    EVBIT_T(7)
    ENDA
    SVAL(EVT_SLOT_2, UnitDef_Ch10BEnemy_7)
    CALL(data_08A60354 + 0x58)
    SVAL(EVT_SLOT_2, frontier_df3_unitdef_b_027_917600)
    CALL(data_08A60354 + 0x80)
    EVBIT_T(7)
    ENDA
    MUSC(0x2E)
    EvtChangeFogVision(0, 0)
    SVAL(EVT_SLOT_2, 0x2000F)
    CALL(EventScr_9EEA58)
    LOAD1(1, frontier_df3_unitdef_b_030_918784_residue + 0x230)
    ENUN
    FADU(0x10)
    SPAWN_ENEMY(0x44, 0xE, 9)
    ENUN
    TILECHANGE(0)
    MOVE(0x10, 0x44, 0xE, 5)
    ENUN
    CURSOR_CHAR(0x44)
    STAL(0x3C)
    CURE
    TEXTSTART
    TEXTSHOW(0xA8F)
    TEXTEND
    REMA
    EvtBgmFadeIn(0x7FFF, 4)
    FADI(0x10)
    CLEA
    CLEE
    CLEN
    SVAL(EVT_SLOT_B, 0)
    LOMA(0x3E)
    EvtSetLoadUnitNoREDA
    LOAD2(1, frontier_df3_unitdef_b_030_918784)
    ENUN
    MUSC(0x4B)
    FADU(4)
    STAL(0xF)
    CURSOR_CHAR(0x1E)
    STAL(0x3C)
    CURE
    SVAL(EVT_SLOT_2, 0xD)
    SVAL(EVT_SLOT_3, 0xA90)
    CALL(data_08A60354 + 0xF4)
    LOAD2(1, frontier_df3_unitdef_b_030_918784_residue)
    ENUN
    CURSOR_CHAR(2)
    STAL(0x3C)
    CURE
    SVAL(EVT_SLOT_2, 0xD)
    CALL(data_08A60354 + 0xCC)
    TEXTSHOW(0xA91)
    TEXTEND
    REMA
    FADI(0x10)
    CLEAN
    EvtChangeFogVision(0, 0xFFFF)
    TILECHANGE(0)
    LOAD1(1, UnitDef_Ch11BEnemy_0)
    ENUN
    SPAWN_ENEMY(0x57, 0x10, 0xD)
    FADU(0x10)
    CAMERA(0x14, 0x12)
    CURSOR_CHAR(0x57)
    STAL(0x3C)
    CURE
    MUSC(0x26)
    TEXTSTART
    TEXTSHOW(0xA92)
    TEXTEND
    REMA
    SVAL(EVT_SLOT_2, 0x57)
    CALL(EventScr_UnitWarpOUT)
    DISA(0x57)
    CALL(data_085B9BBC + 0x200)
    ENDA
};
EventListScr frontier_df3_eventscr_ch_009_A6D3F8[] __attribute__((section(".data.frontier_df3_eventscr_ch.gap9"))) = {
    MUSC(0x31)
    SVAL(EVT_SLOT_2, 0xD)
    CALL(data_08A60354 + 0xCC)
    TEXTSHOW(0xA97)
    TEXTEND
    FADI(4)
    REMA
    FADU(0x10)
    TEXTSHOW(0xA98)
    TEXTEND
    CHECK_ALIVE(0x1A)
    BEQ(0, 0xC, 0)
    EvtTextShow2(0xA99)
    TEXTEND
    LABEL(0)
    REMA
    FADI(0x10)
    SVAL(EVT_SLOT_2, 0x19)
    CALL(EventScr_LoadUniqueAlly)
    SVAL(EVT_SLOT_2, 0x1A)
    CALL(EventScr_LoadUniqueAlly)
    ENUT(0x73)
    MNC2(0x19)
    ENDA
    MUSS(0x30)
    STAL(0x21)
    TEXTSTART
    TEXTSHOW(0xA9A)
    TEXTEND
    REMA
    MURE(2)
    CUSA(0x19)
    EVBIT_T(7)
    ENDA
    MUSS(0x30)
    STAL(0x21)
    TEXTSTART
    TEXTSHOW(0xA9B)
    TEXTEND
    REMA
    MURE(2)
    CUSA(0x1A)
    EVBIT_T(7)
    ENDA
    SVAL(EVT_SLOT_2, UnitDef_Ch11BEnemy_3)
    CALL(data_08A60354 + 0x58)
    EVBIT_T(7)
    ENDA
};
EventListScr frontier_df3_eventscr_ch_010_A6D524[] __attribute__((section(".data.frontier_df3_eventscr_ch.gap10"))) = {
    SVAL(EVT_SLOT_1, 0x10000)
    CHAI(0xB0)
    EVBIT_T(7)
    ENDA
    SVAL(EVT_SLOT_2, frontier_df3_unitdef_b_030_918784_residue + 0x104)
    CALL(data_08A60354 + 0x58)
    SVAL(EVT_SLOT_2, frontier_df3_unitdef_b_030_918784_residue + 0x140)
    CALL(data_08A60354 + 0x58)
    EVBIT_T(7)
    ENDA
    SVAL(EVT_SLOT_2, frontier_df3_unitdef_b_030_918784_residue + 0x1A4)
    CALL(data_08A60354 + 0x58)
    SVAL(EVT_SLOT_2, frontier_df3_unitdef_b_030_918784_residue + 0x1E0)
    CALL(data_08A60354 + 0x58)
    EVBIT_T(7)
    ENDA
    SVAL(EVT_SLOT_1, 0x10000)
    CHAI(0xB9)
    SVAL(EVT_SLOT_1, 0x11200)
    CHAI(0xBA)
    SVAL(EVT_SLOT_1, 0x10B00)
    CHAI(0xB1)
    EVBIT_T(7)
    ENDA
    MUSC(0x24)
    EvtSetLoadUnitNoREDA
    LOAD2(1, frontier_df3_unitdef_b_033_9191E0)
    ENUN
    EvtSetLoadUnitNoREDA
    LOAD2(1, frontier_df3_unitdef_b_033_9191E0_residue + 0x28)
    ENUN
    FADU(0x10)
    CURSOR_CHAR(2)
    STAL(0x3C)
    CURE
    SVAL(EVT_SLOT_2, 0xD)
    CALL(data_08A60354 + 0xCC)
    TEXTSHOW(0xA9C)
    TEXTEND
    FADI(4)
    REMA
    CLEAN
    CAMERA2(7, 7)
    FADU(0x10)
    LOAD1(1, frontier_df3_unitdef_b_033_9191E0_residue + 0x50)
    ENUN
    CURSOR_CHAR(0x17)
    STAL(0x3C)
    CURE
    MUSI
    SVAL(EVT_SLOT_2, 0xC)
    SVAL(EVT_SLOT_3, 0xA9D)
    CALL(data_08A60354 + 0xF4)
    MOVE(0x10, 0x17, 8, 0xC)
    ENUN
    DISA(0x17)
    CURSOR_CHAR(0x18)
    STAL(0x3C)
    CURE
    TEXTSTART
    TEXTSHOW(0xA9E)
    TEXTEND
    REMA
    MOVE(0x10, 0x18, 5, 5)
    ENUN
    DISA(0x18)
    FADI(0x10)
    MUNO
    CAMERA2(7, 0x11)
    FADU(0x10)
    MOVE_1STEP(8, 0x1E, 3)
    ENUN
    CURSOR_CHAR(0x1E)
    STAL(0x3C)
    CURE
    SVAL(EVT_SLOT_2, 0xD)
    SVAL(EVT_SLOT_3, 0xA9F)
    CALL(data_08A60354 + 0xF4)
    EvtBgmFadeIn(0x7FFF, 4)
    LOAD2(1, frontier_df3_unitdef_b_033_9191E0)
    ENUN
    DISA(0x1E)
    LOAD1(1, frontier_df3_unitdef_b_031_918C90)
    LOAD2(1, frontier_df3_unitdef_b_033_9191E0_residue + 0x28)
    ENUN
    CURSOR_CHAR(0x40)
    STAL(0x3C)
    CURE
    MUSC(0x25)
    SVAL(EVT_SLOT_2, 0xD)
    CALL(data_08A60354 + 0xCC)
    TEXTSHOW(0xAA0)
    TEXTEND
    REMA
    FADI(0x10)
    DISA(0x40)
    CALL(data_085B9BBC + 0x200)
    ENDA
    MUSC(0x14)
    CAMERA(0x14, 0)
    CURSOR_CHAR(0x53)
    STAL(0x3C)
    CURE
    TEXTSTART
    TEXTSHOW(0xAA1)
    TEXTEND
    REMA
    EVBIT_T(7)
    ENDA
};
EventListScr frontier_df3_eventscr_ch_011_A6D850[] __attribute__((section(".data.frontier_df3_eventscr_ch.gap11"))) = {
    MUSC(0x31)
    FADI(0x10)
    SVAL(EVT_SLOT_A, 0)
    CHECK_EXISTS(0x16)
    BEQ(0, 0xC, 0)
    CHECK_ALLEGIANCE(0x16)
    SVAL(EVT_SLOT_1, 0)
    BEQ(1, 0xC, 1)
    CHECK_ALIVE(0x18)
    BEQ(0, 0xC, 0)
    SVAL(EVT_SLOT_A, 1)
    SVAL(EVT_SLOT_2, 0x16)
    CALL(EventScr_LoadUniqueAlly)
    GOTO(1)
    LABEL(0)
    SVAL(EVT_SLOT_2, 0x16)
    CALL(EventScr_StrictLoadUniqueAlly)
    LABEL(1)
    CLEA
    CLEE
    CLEN
    CAMERA(0x14, 0)
    EvtSetLoadUnitNoREDA
    LOAD2(1, frontier_df3_unitdef_b_033_9191E0_residue + 0x8C)
    ENUN
    FADU(0x10)
    LOAD2(1, frontier_df3_unitdef_b_033_9191E0_residue + 0x8C)
    ENUN
    CURSOR_CHAR(2)
    STAL(0x3C)
    CURE
    TEXTSTART
    TEXTSHOW(0xAA4)
    TEXTEND
    EvtBgmFadeIn(0x7FFF, 4)
    FADI(4)
    REMA
    CAMERA2(0xD, 0xD)
    MUSC(0x4B)
    FADU(0x10)
    LOAD2(1, frontier_df3_unitdef_b_033_9191E0_residue + 0xC8)
    ENUN
    CURSOR_CHAR(0x1E)
    STAL(0x3C)
    CURE
    SVAL(EVT_SLOT_2, 0xC)
    SVAL(EVT_SLOT_3, 0xAA5)
    CALL(data_08A60354 + 0xF4)
    IGNORE_KEYS(1)
    MOVE(0x10, 0x1E, 0x14, 0xC)
    FADI(4)
    IGNORE_KEYS(0)
    ENUN
    DISA(0x1E)
    CAMERA(0x14, 0)
    FADU(4)
    CURSOR_CHAR(0xF)
    STAL(0x3C)
    CURE
    SVAL(EVT_SLOT_2, 0xC)
    CALL(data_08A60354 + 0xCC)
    TEXTSHOW(0xAA6)
    TEXTEND
    MUSC(0x32)
    TEXTCONT
    TEXTEND
    EvtBgmFadeIn(0x7FFF, 4)
    FADI(4)
    REMA
    BEQ(0xA, 0xA, 0)
    MUSC(0x31)
    SVAL(EVT_SLOT_2, 0xC)
    CALL(data_08A60354 + 0xCC)
    TEXTSHOW(0xAA7)
    TEXTEND
    REMA
    FADI(0x10)
    LABEL(0xA)
    ENUT(0x74)
    MNCH(0x1A)
    ENDA
    MUSS(0x30)
    STAL(0x21)
    TEXTSTART
    TEXTSHOW(0xAA8)
    TEXTEND
    REMA
    MURE(2)
    CUSA(0x16)
    EVBIT_T(7)
    ENDA
    MUSS(0x30)
    STAL(0x21)
    SVAL(EVT_SLOT_2, 0)
    SVAL(EVT_SLOT_3, 0xAA9)
    CALL(data_08A60354 + 0xF4)
    MURE(2)
    SVAL(EVT_SLOT_2, frontier_df3_unitdef_b_031_918C90_residue + 0x104)
    CALL(data_08A60354 + 0x58)
    EVBIT_T(7)
    ENDA
    MUSI
    SVAL(EVT_SLOT_2, 0xE)
    SVAL(EVT_SLOT_3, 0xAAA)
    CALL(data_08A60354 + 0xF4)
    MUNO
    EVBIT_T(7)
    ENDA
    SVAL(EVT_SLOT_2, UnitDef_Ch12BEnemy_5)
    CALL(data_08A60354 + 0x80)
    EVBIT_T(7)
    ENDA
    SVAL(EVT_SLOT_2, UnitDef_Ch12BEnemy_6)
    CALL(data_08A60354 + 0x80)
    EVBIT_T(7)
    ENDA
    SVAL(EVT_SLOT_2, UnitDef_Ch12BEnemy_7)
    CALL(data_08A60354 + 0x80)
    EVBIT_T(7)
    ENDA
    SVAL(EVT_SLOT_2, UnitDef_Ch12BEnemy_8)
    CALL(data_08A60354 + 0x80)
    EVBIT_T(7)
    ENDA
    MUSC(0x53)
    LOAD2(1, frontier_df3_unitdef_b_033_9191E0_residue_p15 + 0x4B0)
    ENUN
    DISA(0x1E)
    CURSOR_AT(0x11, 0xD)
    STAL(0x3C)
    CURE
    MUSI
    SVAL(EVT_SLOT_2, 2)
    CALL(data_08A60354 + 0xCC)
    TEXTSHOW(0xAAB)
    TEXTEND
    MUSC(0x2B)
    TEXTCONT
    TEXTEND
    FADI(4)
    REMA
    SVAL(EVT_SLOT_2, 2)
    CALL(data_08A60354 + 0xCC)
    TEXTSHOW(0xAAC)
    TEXTEND
    MUSC(0x29)
    TEXTCONT
    TEXTEND
    MUSC(0x25)
    TEXTCONT
    TEXTEND
    REMA
    FADI(0x10)
    CLEAN
    CAMERA2(0xC, 0xC)
    LOAD1(1, frontier_df3_unitdef_b_033_9191E0_residue_p15 + 0x104)
    ENUN
    FADU(0x10)
    LOAD1(1, frontier_df3_unitdef_b_033_9191E0_residue_p15 + 0xDC)
    ENUN
    CURSOR_CHAR(0x44)
    STAL(0x3C)
    CURE
    TEXTSTART
    TEXTSHOW(0xAAD)
    TEXTEND
    REMA
    FADI(0x10)
    CAMERA(0, 0)
    FADU(0x10)
    LOAD2(1, frontier_df3_unitdef_b_033_9191E0_residue_p15 + 0x4D8)
    SVAL(EVT_SLOT_1, 0)
    SET_STATE(0xF)
    SVAL(EVT_SLOT_1, 0)
    SET_STATE(2)
    SVAL(EVT_SLOT_1, 0)
    SET_STATE(0x19)
    LOAD3(0, frontier_df3_unitdef_b_033_9191E0_residue_p15 + 0x528)
    ENUN
    SVAL(EVT_SLOT_1, 0xFFFFFFFF)
    SET_STATE(0xF)
    SVAL(EVT_SLOT_1, 0xFFFFFFFF)
    SET_STATE(2)
    SVAL(EVT_SLOT_1, 0xFFFFFFFF)
    SET_STATE(0x19)
    CURSOR_CHAR(0xF)
    STAL(0x3C)
    CURE
    SVAL(EVT_SLOT_2, 0x2C)
    CALL(data_08A60354 + 0xCC)
    TEXTSHOW(0xAAE)
    TEXTEND
    REMA
    FADI(0x10)
    LOAD1(1, UnitDef_Ch13BEnemy_6)
    ENUN
    CALL(data_085B9BBC + 0x200)
    CAMERA(0x15, 0)
    MUSC(0x25)
    FADU(0x10)
    LOAD1(1, frontier_df3_unitdef_b_033_9191E0_residue_p15 + 0x3C0)
    ENUN
    CURSOR_CHAR(0x14)
    STAL(0x3C)
    CURE
    SVAL(EVT_SLOT_2, 0x25)
    CALL(data_08A60354 + 0xCC)
    TEXTSHOW(0xAAF)
    TEXTEND
    REMA
    FADI(0x10)
    CLEAN
    EvtSetLoadUnitNoREDA
    LOAD2(1, frontier_df3_unitdef_b_033_9191E0_residue_p15 + 0x5DC)
    ENUN
    FADU(0x10)
    EVBIT_T(9)
    LOAD2(1, frontier_df3_unitdef_b_033_9191E0_residue_p15 + 0x5DC)
    ENUN
    EVBIT_F(9)
    CURSOR_CHAR(0x1E)
    STAL(0x3C)
    CURE
    SVAL(EVT_SLOT_2, 0x2C)
    CALL(data_08A60354 + 0xCC)
    TEXTSHOW(0xAB0)
    TEXTEND
    REMA
    FADI(0x10)
    DISA(0x1E)
    ENDA
};
EventListScr frontier_df3_eventscr_ch_012_A6DE0C[] __attribute__((section(".data.frontier_df3_eventscr_ch.gap12"))) = {
    MUSS(0x30)
    STAL(0x21)
    TEXTSTART
    TEXTSHOW(0xAB6)
    TEXTEND
    REMA
    MURE(2)
    EVBIT_T(7)
    ENDA
    MUSI
    TEXTSTART
    TEXTSHOW(0xAB7)
    TEXTEND
    REMA
    MUNO
    EVBIT_T(7)
    ENDA
    MUSI
    TEXTSTART
    TEXTSHOW(0xAB8)
    TEXTEND
    REMA
    MUNO
    EVBIT_T(7)
    ENDA
    MUSI
    SVAL(EVT_SLOT_2, 2)
    SVAL(EVT_SLOT_3, 0xAB9)
    CALL(data_08A60354 + 0xF4)
    MUNO
    CALL(data_085B9BBC + 0x168)
    SVAL(EVT_SLOT_3, 0x59)
    GIVEITEMTO(0xFFFF)
    EVBIT_T(7)
    ENDA
    MUSI
    SVAL(EVT_SLOT_2, 2)
    SVAL(EVT_SLOT_3, 0xABA)
    CALL(data_08A60354 + 0xF4)
    MUNO
    CALL(data_085B9BBC + 0x168)
    SVAL(EVT_SLOT_3, 0x61)
    GIVEITEMTO(0xFFFF)
    EVBIT_T(7)
    ENDA
    SVAL(EVT_SLOT_2, frontier_df3_unitdef_b_033_9191E0_residue_p15 + 0x3FC)
    CALL(data_08A60354 + 0x58)
    EVBIT_T(7)
    ENDA
    SVAL(EVT_SLOT_2, frontier_df3_unitdef_b_033_9191E0_residue_p15 + 0x424)
    CALL(data_08A60354 + 0x58)
    EVBIT_T(7)
    ENDA
    SVAL(EVT_SLOT_2, frontier_df3_unitdef_b_033_9191E0_residue_p15 + 0x44C)
    CALL(data_08A60354 + 0x58)
    EVBIT_T(7)
    ENDA
    SVAL(EVT_SLOT_2, frontier_df3_unitdef_b_033_9191E0_residue_p15 + 0x488)
    CALL(data_08A60354 + 0x58)
    EVBIT_T(7)
    ENDA
    SVAL(EVT_SLOT_1, 0x10000)
    CHAI(0x80)
    EVBIT_T(7)
    ENDA
    MUSC(0x4D)
    SVAL(EVT_SLOT_B, 0)
    LOMA(0x3F)
    FADU(0x10)
    LOAD2(1, frontier_df3_unitdef_b_037_91AC38_p6)
    ENUN
    MOVE_1STEP(8, 0xF, 3)
    ENUN
    CURSOR_CHAR(0xF)
    STAL(0x3C)
    CURE
    TEXTSTART
    TEXTSHOW(0xABB)
    TEXTEND
    FAWI(2)
    REMA
    REMOVEPORTRAITS
    BACG(0x14)
    EvtBgmFadeIn(0x2C, 8)
    FAWU(2)
    BROWNBOXTEXT(0x197, 8, 8)
    TEXTSHOW(0xABC)
    TEXTEND
    REMA
    EvtBgmFadeIn(0x7FFF, 8)
    FAWI(2)
    CLEAN
    EvtBgmFadeIn(0x4D, 6)
    FAWU(2)
    MOVE_1STEP(8, 0x1E, 3)
    ENUN
    TEXTSTART
    TEXTSHOW(0xABD)
    TEXTEND
    CHECK_EVBIT(3)
    BNE(0, 0xC, 0)
    EARTHQUAKE_START(0, 1)
    STAL(0x78)
    EARTHQUAKE_END
    TEXTCONT
    TEXTEND
    LABEL(0)
    REMA
    MOVE(8, 0xF, 0xA, 4)
    STAL2(0x10)
    MOVE(8, 2, 0xA, 4)
    MOVE(8, 0x1E, 0xA, 4)
    EvtBgmFadeIn(0x7FFF, 4)
    FADI(0x10)
    ENUN
    CLEA
    CLEE
    CLEN
    SVAL(EVT_SLOT_B, 0x2000F)
    LOMA(0x1B)
    LOAD1(1, frontier_df3_unitdef_b_035_91A580)
    ENUN
    FADU(4)
    CURSOR_CHAR(0x40)
    STAL(0x3C)
    CURE
    TEXTSTART
    TEXTSHOW(0xABE)
    TEXTEND
    REMA
    SOUN(0xB1)
    TILECHANGE(0)
    LOAD1(1, frontier_df3_unitdef_b_036_91AB20)
    ENUN
    CURSOR_CHAR(0x83)
    STAL(0x3C)
    CURE
    MUSC(0x2E)
    TEXTSTART
    TEXTSHOW(0xABF)
    TEXTEND
    REMA
    MOVE(0, 0x83, 0xE, 9)
    ENUN
    TILEREVERT(0)
    DISA(0x83)
    CURSOR_CHAR(0x40)
    STAL(0x3C)
    CURE
    TEXTSTART
    TEXTSHOW(0xAC0)
    TEXTEND
    REMA
    SVAL(EVT_SLOT_2, 0x40)
    CALL(EventScr_UnitWarpOUT)
    DISA(0x40)
    FADI(0x10)
    LOAD1(1, frontier_df3_unitdef_b_035_91A580 + 0x3C)
    ENUN
    CALL(data_085B9BBC + 0x200)
    ENUT(0xD)
    ENUT(0x10)
    ENDA
    CURSOR_CHAR(0x1C)
    STAL(0x3C)
    CURE
    TEXTSTART
    TEXTSHOW(0xAC1)
    TEXTEND
    REMA
    ENDA
    EvtBgmFadeIn(0x7FFF, 4)
    FADI(0x10)
    SVAL(EVT_SLOT_2, 0x1C)
    CALL(EventScr_StrictLoadUniqueAlly)
    CLEA
    CLEE
    CLEN
    TILECHANGE(0)
    CAMERA2(0xE, 4)
    LOAD2(1, UnitDef_Ch14BMixed)
    ENUN
    FADU(0x10)
    STARTFADE
    EvtColorFadeSetup(6, 0xA, 4, 0x80, 0x80, 0x80)
    EvtColorFadeSetup(0x1D, 1, 2, 0, 0, 0)
    SOUN(0xD6)
    SVAL(EVT_SLOT_2, 0x6B)
    CALL(EventScr_UnitFlushingOUT)
    DISA(0x6B)
    EvtColorFadeSetup(6, 0xA, 8, 0x100, 0x100, 0x100)
    ENDFADE
    MOVE_1STEP(0x10, 0xF, 3)
    ENUN
    CURSOR_CHAR(0xF)
    STAL(0x3C)
    CURE
    TEXTSTART
    TEXTSHOW(0xAC6)
    TEXTEND
    REMA
    MOVE(0x10, 0xF, 0xE, 0xA)
    STAL2(0x20)
    MOVE(0x10, 2, 0xF, 0xA)
    STAL2(0x10)
    FADI(0x10)
    ENUN
    CLEA
    CLEE
    CLEN
    SVAL(EVT_SLOT_B, 0)
    LOMA(0x46)
    LOAD1(1, frontier_df3_unitdef_b_037_91AC38_p19 + 0x3C)
    ENUN
    FADU(0x10)
    LOAD2(1, frontier_df3_unitdef_b_037_91AC38_p19)
    ENUN
    CURSOR_CHAR(0x40)
    STAL(0x3C)
    CURE
    SVAL(EVT_SLOT_2, 0x16)
    CALL(data_08A60354 + 0xCC)
    TEXTSHOW(0xAC7)
    TEXTEND
    MUSC(0x2D)
    TEXTCONT
    TEXTEND
    REMA
    CALL(data_08A60354 + 0xA8)
    EvtBgmFadeIn(0x7FFF, 2)
    SVAL(EVT_SLOT_2, 0x40)
    CALL(EventScr_UnitWarpOUT)
    DISA(0x40)
    CURSOR_CHAR(0xF)
    STAL(0x3C)
    CURE
    TEXTSTART
    TEXTSHOW(0xAC8)
    TEXTEND
    REMA
    LOAD2(1, frontier_df3_unitdef_b_037_91AC38_p19 + 0x64)
    ENUN
    CURSOR_CHAR(0xC0)
    STAL(0x3C)
    CURE
    MUSC(0x32)
    TEXTSTART
    TEXTSHOW(0xAC9)
    TEXTEND
    REMA
    LOAD2(1, frontier_df3_unitdef_b_037_91AC38_p19 + 0x8C)
    STAL2(0xF)
    FADI(0x10)
    ENUN
    CLEA
    CLEE
    CLEN
    CAMERA(0x1A, 0xD)
    EvtSetLoadUnitNoREDA
    LOAD2(1, frontier_df3_unitdef_b_037_91AC38_p19 + 0xDC)
    ENUN
    FADU(0x10)
    LOAD2(1, frontier_df3_unitdef_b_037_91AC38_p19 + 0xDC)
    ENUN
    SOUN(0xB1)
    TILECHANGE(0)
    LOAD2(1, frontier_df3_unitdef_b_037_91AC38_p19 + 0x140)
    ENUN
    STAL(0xF)
    CAMERA(0x1A, 0)
    MOVE_1STEP(8, 0x1F, 2)
    ENUN
    CURSOR_CHAR(0x1F)
    STAL(0x3C)
    CURE
    SVAL(EVT_SLOT_2, 0x1D)
    CALL(data_08A60354 + 0xCC)
    TEXTSHOW(0xACA)
    TEXTEND
    EvtBgmFadeIn(0x7FFF, 8)
    FAWI(2)
    REMA
    CLEA
    CLEE
    CLEN
    SVAL(EVT_SLOT_B, 0)
    LOMA(0x4B)
    UNIT_COLORS(4)
    LOAD2(1, frontier_df3_unitdef_b_037_91AC38_p27 + 0x28)
    ENUN
    FAWU(2)
    BROWNBOXTEXT(0x195, 8, 8)
    LOAD2(1, frontier_df3_unitdef_b_037_91AC38_p27)
    ENUN
    CURSOR_CHAR(0x1F)
    STAL(0x3C)
    CURE
    EvtBgmFadeIn(0x2D, 6)
    SVAL(EVT_SLOT_2, 0x44)
    SVAL(EVT_SLOT_3, 0xACB)
    CALL(data_08A60354 + 0xF4)
    LOAD2(1, frontier_df3_unitdef_b_037_91AC38_p27 + 0x64)
    ENUN
    CURSOR_CHAR(0x40)
    STAL(0x3C)
    CURE
    SVAL(EVT_SLOT_2, 0x44)
    SVAL(EVT_SLOT_3, 0xACC)
    CALL(data_08A60354 + 0xF4)
    LOAD2(1, frontier_df3_unitdef_b_037_91AC38_p27 + 0xA0)
    ENUN
    SVAL(EVT_SLOT_2, 0x40)
    CALL(data_08A60BE4 + 0x10C)
    CURSOR_CHAR(0x1F)
    STAL(0x3C)
    CURE
    SVAL(EVT_SLOT_2, 0x44)
    CALL(data_08A60354 + 0xCC)
    TEXTSHOW(0xACD)
    TEXTEND
    REMA
    EvtBgmFadeIn(0x7FFF, 8)
    FAWI(2)
    CLEA
    CLEE
    CLEN
    UNIT_COLORS(0)
    SVAL(EVT_SLOT_B, 0x1A)
    LOMA(0x46)
    TILECHANGE(0)
    LOAD2(1, frontier_df3_unitdef_b_037_91AC38_p19 + 0xDC)
    ENUN
    LOAD2(1, frontier_df3_unitdef_b_037_91AC38_p19 + 0x140)
    ENUN
    MOVE_1STEP(0xFFFF, 0x1F, 2)
    EvtBgmFadeIn(0x32, 6)
    FAWU(2)
    CURSOR_CHAR(0x1F)
    STAL(0x3C)
    CURE
    SVAL(EVT_SLOT_2, 0x1D)
    CALL(data_08A60354 + 0xCC)
    TEXTSHOW(0xACE)
    TEXTEND
    FADI(0x10)
    REMA
    CLEA
    CLEE
    CLEN
    LOAD1(1, frontier_df3_unitdef_b_035_91A580 + 0x384)
    ENUN
    CLEA
    CLEE
    CLEN
    SVAL(EVT_SLOT_B, 0)
    LOMA(0x4D)
    FADU(0x10)
    LOAD2(1, frontier_df3_unitdef_b_037_91AC38_p27 + 0xC8)
    ENUN
    CURSOR_CHAR(0x1F)
    STAL(0x3C)
    CURE
    SVAL(EVT_SLOT_2, 0x43)
    CALL(data_08A60354 + 0xCC)
    TEXTSHOW(0xACF)
    TEXTEND
    REMA
    SVAL(EVT_SLOT_2, 0x43)
    CALL(data_08A60354 + 0xCC)
    TEXTSHOW(0xAD0)
    TEXTEND
    REMA
    CALL(data_085B9BBC + 0x168)
    SVAL(EVT_SLOT_3, 0x4A)
    GIVEITEMTO(0xF)
    CALL(data_085B9BBC + 0x168)
    SVAL(EVT_SLOT_3, 0x93)
    GIVEITEMTO(0xF)
    FADI(0x10)
    CLEA
    CLEE
    CLEN
    SVAL(EVT_SLOT_B, 0x4000E)
    LOMA(0x1B)
    TILECHANGE(0)
    LOAD2(1, UnitDef_Ch14BAlly_2)
    ENUN
    MUSC(0x26)
    FADU(0x10)
    LOAD2(1, frontier_df3_unitdef_b_037_91AC38)
    ENUN
    CURSOR_CHAR(0xCC)
    STAL(0x3C)
    CURE
    TEXTSTART
    TEXTSHOW(0xAD1)
    TEXTEND
    REMA
    FADI(0x10)
    ENUT(0x76)
    MNCH(0x1C)
    ENDA
    CALL(frontier_df4_menu_010_A67EEC + 0x3D8)
    ENDA
};
EventListScr frontier_df3_eventscr_ch_013_A6E680[] __attribute__((section(".data.frontier_df3_eventscr_ch.gap13"))) = {
    SVAL(EVT_SLOT_2, frontier_df3_unitdef_b_035_91A580_residue)
    CALL(data_08A60354 + 0x58)
    CALL((u8 *)frontier_df3_eventscr_ch_012_A6DE0C + 0x320)
    EVBIT_T(7)
    ENDA
    SVAL(EVT_SLOT_2, frontier_df3_unitdef_b_035_91A580_residue + 0x28)
    CALL(data_08A60354 + 0x58)
    SVAL(EVT_SLOT_2, frontier_df3_unitdef_b_037_91AC38 + 0x28)
    CALL(data_08A60354 + 0x58)
    EVBIT_T(7)
    ENDA
    SVAL(EVT_SLOT_2, frontier_df3_unitdef_b_035_91A580_residue + 0x64)
    CALL(data_08A60354 + 0x58)
    SVAL(EVT_SLOT_2, frontier_df3_unitdef_b_037_91AC38 + 0x64)
    CALL(data_08A60354 + 0x58)
    EVBIT_T(7)
    ENDA
    SVAL(EVT_SLOT_2, frontier_df3_unitdef_b_035_91A580_residue + 0xA0)
    CALL(data_08A60354 + 0x58)
    SVAL(EVT_SLOT_2, frontier_df3_unitdef_b_037_91AC38 + 0xA0)
    CALL(data_08A60354 + 0x58)
    EVBIT_T(7)
    ENDA
    SVAL(EVT_SLOT_2, frontier_df3_unitdef_b_035_91A580_residue + 0xDC)
    CALL(data_08A60354 + 0x58)
    SVAL(EVT_SLOT_2, frontier_df3_unitdef_b_037_91AC38 + 0xDC)
    CALL(data_08A60354 + 0x58)
    EVBIT_T(7)
    ENDA
    COUNTER_SET(0, 2)
    CHECK_TUTORIAL
    BNE(0, 0xC, 0)
    CHECK_HARD
    BEQ(0, 0xC, 0)
    COUNTER_SET(0, 4)
    LABEL(0)
    ENUF(0xD)
    EVBIT_T(7)
    ENDA
    SVAL(EVT_SLOT_2, frontier_df3_unitdef_b_035_91A580_residue + 0x118)
    CALL(data_08A60354 + 0x58)
    COUNTER_DEC(0)
    ENUF(0xD)
    COUNTER_CHECK(0)
    BNE(0, 0xC, 0)
    ENUT(0xD)
    LABEL(0)
    EVBIT_T(7)
    ENDA
    SVAL(EVT_SLOT_2, UnitDef_Ch14BEnemy_8)
    CALL(data_08A60354 + 0x80)
    SVAL(EVT_SLOT_2, UnitDef_Ch14BEnemy_9)
    CALL(data_08A60354 + 0x80)
    EVBIT_T(7)
    ENDA
    COUNTER_SET(1, 1)
    ENUF(0x10)
    EVBIT_T(7)
    ENDA
};
EventListScr frontier_df3_eventscr_ch_014_A6EDFC[] __attribute__((section(".data.frontier_df3_eventscr_ch.gap14"))) = {
    CALL(EventScr_Ch16A_11)
    SVAL(EVT_SLOT_B, 0)
    LOMA(0x1D)
    LOAD1(0, frontier_df3_unitdef_b_007_911200_tail)
    ENUN
    LOAD1(1, UnitDef_Ch16BEnemy_0)
    ENUN
    SVAL(EVT_SLOT_2, UnitDef_Ch16BEnemy_7)
    SVAL(EVT_SLOT_3, 1)
    CALL(data_08A60354 + 0x2C)
    CALL(data_085B9BBC + 0x200)
    ENUT(0xE)
    ENUT(0xD)
    ENDA
    CALL(EventScr_Ch16A_12)
    MNCH(0x1E)
    ENDA
    SVAL(EVT_SLOT_2, UnitDef_Ch16BEnemy_5)
    CALL(data_08A60354 + 0x58)
    EVBIT_T(7)
    ENDA
    SVAL(EVT_SLOT_2, UnitDef_Ch16BEnemy_6)
    CALL(data_08A60354 + 0x58)
    EVBIT_T(7)
    ENDA
    SVAL(EVT_SLOT_2, 0)
    CALL(UnitDef_Ch14BAlly_7)
    SVAL(EVT_SLOT_1, 0x10000)
    CHAI(0x90)
    COUNTER_SET(0, 1)
    ENUF(0xE)
    EVBIT_T(7)
    ENDA
};
EventListScr frontier_df3_eventscr_ch_015_A6EF04[] __attribute__((section(".data.frontier_df3_eventscr_ch.gap15"))) = {
    SVAL(EVT_SLOT_2, 0)
    CALL(UnitDef_Ch14BAlly_7)
    SVAL(EVT_SLOT_1, 0x10000)
    CHAI(0x8F)
    SVAL(EVT_SLOT_1, 0x10303)
    CHAI(0x91)
    COUNTER_SET(1, 1)
    ENUF(0xD)
    EVBIT_T(7)
    ENDA
};
EventListScr frontier_df3_eventscr_ch_016_A6EFD8[] __attribute__((section(".data.frontier_df3_eventscr_ch.gap16"))) = {
    EVENT_WORD(data_08A60354 + 0x58)
    EVBIT_T(7)
    ENDA
    SVAL(EVT_SLOT_2, frontier_df3_unitdef_b_042_91C230_residue + 0x8C)
    CALL(data_08A60354 + 0x58)
    EVBIT_T(7)
    ENDA
    SVAL(EVT_SLOT_2, frontier_df3_unitdef_b_042_91C230_residue + 0xC8)
    CALL(data_08A60354 + 0x58)
    EVBIT_T(7)
    ENDA
    SVAL(EVT_SLOT_2, frontier_df3_unitdef_b_042_91C230_residue + 0x104)
    CALL(data_08A60354 + 0x58)
    EVBIT_T(7)
    ENDA
    SVAL(EVT_SLOT_2, 0)
    CALL(UnitDef_Ch14BAlly_7)
    COUNTER_SET(0, 5)
    ENUF(0xE)
    EVBIT_T(7)
    ENDA
    SVAL(EVT_SLOT_2, frontier_df3_unitdef_b_042_91C230_residue + 0x50)
    CALL(data_08A60354 + 0x58)
    COUNTER_DEC(0)
    ENUF(0xE)
    COUNTER_CHECK(0)
    BNE(0, 0xC, 0)
    ENUT(0xE)
    LABEL(0)
    EVBIT_T(7)
    ENDA
    SVAL(EVT_SLOT_2, 0)
    CALL(UnitDef_Ch14BAlly_7)
    SVAL(EVT_SLOT_D, 0)
    SVAL(EVT_SLOT_1, 0xC0013)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0xE0011)
    SENQUEUE1
    SVAL(EVT_SLOT_2, 0x11200)
    CALL(EventScr_ChangeAIinQueue)
    SVAL(EVT_SLOT_1, 0xD0012)
    SENQUEUE1
    SVAL(EVT_SLOT_2, 0x10E00)
    CALL(EventScr_ChangeAIinQueue)
    EVBIT_T(7)
    ENDA
    LOAD1(1, UnitDef_Ch18BEnemy_0)
    ENUN
    SVAL(EVT_SLOT_2, frontier_df3_unitdef_b_043_91D314 + 0x78)
    SVAL(EVT_SLOT_3, 1)
    CALL(data_08A60354 + 0x2C)
    CALL(EventScr_Ch18A_11)
    ENUT(8)
    ENUT(0xA)
    ENUT(0xC)
    ENUT(0xE)
    ENDA
    MUSC(0x49)
    FADI(0x10)
    CLEA
    CLEE
    CLEN
    CAMERA2(0xE, 0xE)
    LOAD2(1, UnitDef_Ch18BAlly_1)
    ENUN
    FADU(0x10)
    SPAWN_ENEMY(0x40, 0, 0)
    SVAL(EVT_SLOT_2, 0x40)
    MOVE_CLOSEST(0xFFFF, 0xFFFD, 0x12, 0xB)
    CALL(EventScr_UnitWarpIN)
    CURSOR_CHAR(0x40)
    STAL(0x3C)
    CURE
    TEXTSTART
    TEXTSHOW(0xB3E)
    TEXTEND
    REMA
    MOVE_1STEP(0, 0xF, 1)
    SVAL(EVT_SLOT_2, 0x40)
    CALL(EventScr_UnitWarpOUT)
    DISA(0x40)
    MOVE_1STEP(0, 1, 1)
    MOVE(0, 0xF, 0x12, 9)
    STAL2(0x14)
    FADI(0x10)
    ENUN
    CAMERA(0x16, 0)
    SPAWN_ENEMY(0x40, 0x13, 1)
    MOVE(0, 0xF, 0x13, 4)
    FADU(0x10)
    ENUN
    MUSC(0x2D)
    CURSOR_CHAR(0xF)
    STAL(0x3C)
    CURE
    TEXTSTART
    TEXTSHOW(0xB45)
    TEXTEND
    REMA
    MOVE_1STEP(0, 0xF, 3)
    ENUN
    EVENT_WORD(0x000F4620)
    STAL(0x1E)
    EVENT_WORD(0x0000462F)
    CURSOR_CHAR(0xF)
    STAL(0x3C)
    CURE
    TEXTSTART
    TEXTSHOW(0xB46)
    TEXTEND
    REMA
    SVAL(EVT_SLOT_2, 0x40)
    CALL(EventScr_UnitWarpOUT)
    SVAL(EVT_SLOT_2, 0x40)
    MOVE_CLOSEST(0xFFFF, 0xFFFD, 0x13, 2)
    CALL(EventScr_UnitWarpIN)
    CURSOR_CHAR(0x40)
    STAL(0x3C)
    CURE
    TEXTSTART
    TEXTSHOW(0xB47)
    TEXTEND
    REMA
    SVAL(EVT_SLOT_2, 0x40)
    CALL(data_08A60BE4 + 0x10C)
    CURSOR_CHAR(0x40)
    STAL(0x3C)
    CURE
    TEXTSTART
    TEXTSHOW(0xB48)
    TEXTEND
    EvtBgmFadeIn(0x7FFF, 2)
    TEXTCONT
    TEXTEND
    MUSC(0x2C)
    TEXTCONT
    TEXTEND
    REMA
    EvtBgmFadeIn(0x7FFF, 6)
    SVAL(EVT_SLOT_2, 0x40)
    CALL(EventScr_UnitWarpOUT)
    LOAD2(1, frontier_df3_unitdef_b_043_91D314)
    ENUN
    CURSOR_CHAR(1)
    STAL(0x3C)
    CURE
    TEXTSTART
    TEXTSHOW(0xB49)
    TEXTEND
    MUSC(0x32)
    TEXTCONT
    TEXTEND
    REMA
    SVAL(EVT_SLOT_2, 0x4C)
    CALL(data_08A60354 + 0xCC)
    TEXTSHOW(0xB4A)
    TEXTEND
    REMA
    MNCH(0x20)
    ENDA
    CHECK_EVENTID(6)
    BEQ(0, 0xC, 0)
    ENUT(3)
    CALL((u8 *)frontier_df3_eventscr_ch_016_A6EFD8 + 0x14C)
    ENDB
    LABEL(0)
    EVBIT_T(7)
    ENDA
    SVAL(EVT_SLOT_2, 0)
    CALL(UnitDef_Ch14BAlly_7)
    ENUF(8)
    EVBIT_T(7)
    ENDA
    SVAL(EVT_SLOT_2, frontier_df3_unitdef_b_043_91D314 + 0x104)
    CALL(data_08A60354 + 0x80)
    EVBIT_T(7)
    ENDA
    SVAL(EVT_SLOT_2, 0)
    CALL(UnitDef_Ch14BAlly_7)
    ENUF(0xA)
    EVBIT_T(7)
    ENDA
    SVAL(EVT_SLOT_2, frontier_df3_unitdef_b_043_91D314 + 0x140)
    CALL(data_08A60354 + 0x80)
    EVBIT_T(7)
    ENDA
    SVAL(EVT_SLOT_2, 0)
    CALL(UnitDef_Ch14BAlly_7)
    ENUF(0xC)
    EVBIT_T(7)
    ENDA
    SVAL(EVT_SLOT_2, frontier_df3_unitdef_b_043_91D314 + 0x17C)
    CALL(data_08A60354 + 0x80)
    SVAL(EVT_SLOT_2, frontier_df3_unitdef_b_043_91D314 + 0x1CC)
    CALL(data_08A60354 + 0x80)
    EVBIT_T(7)
    ENDA
    SVAL(EVT_SLOT_2, 0)
    CALL(UnitDef_Ch14BAlly_7)
    ENUF(0xE)
    EVBIT_T(7)
    ENDA
    SVAL(EVT_SLOT_2, frontier_df3_unitdef_b_043_91D314 + 0x1F4)
    CALL(data_08A60354 + 0x80)
    SVAL(EVT_SLOT_2, frontier_df3_unitdef_b_043_91D314 + 0x230)
    CALL(data_08A60354 + 0x80)
    EVBIT_T(7)
    ENDA
};
EventListScr frontier_df3_eventscr_ch_017_A6F47C[] __attribute__((section(".data.frontier_df3_eventscr_ch.gap17"))) = {
    EVENT_WORD(0x00000010)
    SVAL(EVT_SLOT_3, 0xB58)
    CALL(data_08A60354 + 0xF4)
    EVBIT_T(7)
    ENDA
    CALL(EventScr_Ch19A_11)
    MNCH(0x21)
    ENDA
    SVAL(EVT_SLOT_2, frontier_df3_unitdef_b_047_91E280 + 0x1F4)
    CALL(data_08A60354 + 0x58)
    EVBIT_T(7)
    ENDA
    SVAL(EVT_SLOT_2, frontier_df3_unitdef_b_047_91E280 + 0x21C)
    CALL(data_08A60354 + 0x58)
    EVBIT_T(7)
    ENDA
    CHECK_TURNS
    SVAL(EVT_SLOT_1, 1)
    SAND(EVT_SLOT_C, EVT_SLOT_C, EVT_SLOT_1)
    BEQ(0, 0xC, 0)
    SVAL(EVT_SLOT_2, frontier_df3_unitdef_b_047_91E280_residue)
    CALL(data_08A60354 + 0x58)
    LABEL(0)
    EVBIT_T(7)
    ENDA
    CHECK_TURNS
    SVAL(EVT_SLOT_1, 1)
    SAND(EVT_SLOT_C, EVT_SLOT_C, EVT_SLOT_1)
    BNE(0, 0xC, 0)
    SVAL(EVT_SLOT_2, frontier_df3_unitdef_b_047_91E280_residue + 0x3C)
    CALL(data_08A60354 + 0x58)
    LABEL(0)
    EVBIT_T(7)
    ENDA
    CHECK_TURNS
    SVAL(EVT_SLOT_1, 1)
    SAND(EVT_SLOT_C, EVT_SLOT_C, EVT_SLOT_1)
    BEQ(0, 0xC, 0)
    SVAL(EVT_SLOT_2, frontier_df3_unitdef_b_047_91E280_residue + 0x78)
    CALL(data_08A60354 + 0x58)
    LABEL(0)
    EVBIT_T(7)
    ENDA
    CHECK_TURNS
    SVAL(EVT_SLOT_1, 1)
    SAND(EVT_SLOT_C, EVT_SLOT_C, EVT_SLOT_1)
    BNE(0, 0xC, 0)
    SVAL(EVT_SLOT_2, frontier_df3_unitdef_b_047_91E280_residue + 0xB4)
    CALL(data_08A60354 + 0x58)
    LABEL(0)
    EVBIT_T(7)
    ENDA
    SVAL(EVT_SLOT_2, frontier_df3_unitdef_b_047_91E280_residue + 0xF0)
    CALL(data_08A60354 + 0x58)
    EVBIT_T(7)
    ENDA
    SVAL(EVT_SLOT_2, frontier_df3_unitdef_b_047_91E280_residue + 0x154)
    CALL(data_08A60354 + 0x58)
    EVBIT_T(7)
    ENDA
    SVAL(EVT_SLOT_2, UnitDef_Ch19BEnemy_0)
    CALL((u8 *)frontier_df3_eventscr_ch_003_A6AA20 + 0x18C)
    LOAD1(1, UnitDef_Ch19BEnemy_0)
    ENUN
    LOAD1(1, frontier_df3_unitdef_b_050_91EE14 + 0x1A4)
    ENUN
    SVAL(EVT_SLOT_2, frontier_df3_unitdef_b_051_91F300_residue + 0xB4)
    SVAL(EVT_SLOT_3, 1)
    CALL(data_08A60354 + 0x2C)
    CALL(data_085B9BBC + 0x200)
    ENUT(0xA)
    ENUT(0xC)
    ENUT(0xE)
    ENUT(0x10)
    ENDA
    CALL((u8 *)frontier_df3_eventscr_ch_003_A6AA20 + 0x324)
    ENDA
    CALL(UnitDef_Ch18BAlly_2)
    STAL(0x1E)
    CURSOR_CHAR(0x40)
    STAL(0x3C)
    CURE
    FAWI(2)
    EvtBgmFadeIn(0x2C, 8)
    REMOVEPORTRAITS
    BACG(0x14)
    FAWU(2)
    BROWNBOXTEXT(0x195, 8, 8)
    TEXTSHOW(0xB77)
    TEXTEND
    REMA
    FAWI(0x10)
    REMOVEPORTRAITS
    BACG(0x12)
    FAWU(0x10)
    TEXTSHOW(0xB78)
    TEXTEND
    REMA
    EvtBgmFadeIn(0x7FFF, 8)
    FAWI(2)
    CLEAN
    FAWU(2)
    MUSC(0x2D)
    CURSOR_CHAR(0x40)
    STAL(0x3C)
    CURE
    SVAL(EVT_SLOT_2, 0x4E)
    CALL(data_08A60354 + 0xCC)
    TEXTSHOW(0xB79)
    TEXTEND
    FADI(0x10)
    REMA
    MNC2(0x22)
    ENDA
    CHECK_TURNS
    SVAL(EVT_SLOT_1, 1)
    SAND(EVT_SLOT_C, EVT_SLOT_C, EVT_SLOT_1)
    BNE(0, 0xC, 0)
    SVAL(EVT_SLOT_2, frontier_df3_unitdef_b_050_91EE14_residue)
    CALL(data_08A60354 + 0x58)
    SVAL(EVT_SLOT_2, frontier_df3_unitdef_b_050_91EE14_residue + 0x3C)
    CALL(data_08A60354 + 0x80)
    LABEL(0)
    EVBIT_T(7)
    ENDA
    CHECK_TURNS
    SVAL(EVT_SLOT_1, 1)
    SAND(EVT_SLOT_C, EVT_SLOT_C, EVT_SLOT_1)
    BEQ(0, 0xC, 0)
    SVAL(EVT_SLOT_2, frontier_df3_unitdef_b_050_91EE14_residue + 0x64)
    CALL(data_08A60354 + 0x58)
    SVAL(EVT_SLOT_2, frontier_df3_unitdef_b_050_91EE14_residue + 0xA0)
    CALL(data_08A60354 + 0x80)
    LABEL(0)
    EVBIT_T(7)
    ENDA
    SVAL(EVT_SLOT_2, 0)
    CALL(UnitDef_Ch14BAlly_7)
    COUNTER_SET(0, 3)
    ENUF(0xA)
    EVBIT_T(7)
    ENDA
    SVAL(EVT_SLOT_2, frontier_df3_unitdef_b_050_91EE14_residue + 0xC8)
    CALL(data_08A60354 + 0x58)
    COUNTER_DEC(0)
    ENUF(0xA)
    COUNTER_CHECK(0)
    BNE(0, 0xC, 0)
    ENUT(0xA)
    LABEL(0)
    EVBIT_T(7)
    ENDA
    SVAL(EVT_SLOT_2, 0)
    CALL(UnitDef_Ch14BAlly_7)
    ENUF(0xC)
    COUNTER_SET(1, 6)
    EVBIT_T(7)
    ENDA
    ENUF(0xC)
    COUNTER_CHECK(1)
    SVAL(EVT_SLOT_7, 5)
    BEQ(0, 0xC, 7)
    SVAL(EVT_SLOT_7, 3)
    BEQ(0, 0xC, 7)
    SVAL(EVT_SLOT_7, 1)
    BEQ(0, 0xC, 7)
    SVAL(EVT_SLOT_2, frontier_df3_unitdef_b_050_91EE14_residue + 0x104)
    CALL(data_08A60354 + 0x58)
    COUNTER_CHECK(1)
    BNE(0, 0xC, 0)
    ENUT(0xC)
    LABEL(0)
    COUNTER_DEC(1)
    EVBIT_T(7)
    ENDA
    SVAL(EVT_SLOT_2, 0)
    CALL(UnitDef_Ch14BAlly_7)
    ENUF(0xE)
    COUNTER_SET(2, 6)
    EVBIT_T(7)
    ENDA
    ENUF(0xE)
    COUNTER_CHECK(2)
    SVAL(EVT_SLOT_7, 5)
    BEQ(0, 0xC, 7)
    SVAL(EVT_SLOT_7, 3)
    BEQ(0, 0xC, 7)
    SVAL(EVT_SLOT_7, 1)
    BEQ(0, 0xC, 7)
    SVAL(EVT_SLOT_2, frontier_df3_unitdef_b_050_91EE14_residue + 0x154)
    CALL(data_08A60354 + 0x58)
    COUNTER_CHECK(2)
    BNE(0, 0xC, 0)
    ENUT(0xE)
    LABEL(0)
    COUNTER_DEC(2)
    EVBIT_T(7)
    ENDA
    SVAL(EVT_SLOT_2, 0)
    CALL(UnitDef_Ch14BAlly_7)
    ENUF(0x10)
    COUNTER_SET(3, 0xD)
    EVBIT_T(7)
    ENDA
    ENUF(0x10)
    COUNTER_CHECK(3)
    SVAL(EVT_SLOT_7, 0xB)
    BEQ(0, 0xC, 7)
    SVAL(EVT_SLOT_7, 0xA)
    BEQ(0, 0xC, 7)
    SVAL(EVT_SLOT_7, 8)
    BEQ(0, 0xC, 7)
    SVAL(EVT_SLOT_7, 7)
    BEQ(0, 0xC, 7)
    SVAL(EVT_SLOT_7, 5)
    BEQ(0, 0xC, 7)
    SVAL(EVT_SLOT_7, 4)
    BEQ(0, 0xC, 7)
    SVAL(EVT_SLOT_7, 2)
    BEQ(0, 0xC, 7)
    SVAL(EVT_SLOT_7, 1)
    BEQ(0, 0xC, 7)
    SVAL(EVT_SLOT_2, frontier_df3_unitdef_b_050_91EE14_residue + 0x1A4)
    CALL(data_08A60354 + 0x58)
    COUNTER_CHECK(3)
    BNE(0, 0xC, 0)
    ENUT(0x10)
    LABEL(0)
    COUNTER_DEC(3)
    EVBIT_T(7)
    ENDA
    CHECK_TURNS
    SVAL(EVT_SLOT_1, 1)
    SAND(EVT_SLOT_C, EVT_SLOT_C, EVT_SLOT_1)
    BNE(0, 0xC, 0)
    SVAL(EVT_SLOT_2, frontier_df3_unitdef_b_050_91EE14_residue + 0x1F4)
    CALL(data_08A60354 + 0x58)
    SVAL(EVT_SLOT_2, frontier_df3_unitdef_b_050_91EE14_residue + 0x244)
    CALL(data_08A60354 + 0x80)
    SVAL(EVT_SLOT_2, frontier_df3_unitdef_b_050_91EE14_residue + 0x280)
    CALL(data_08A60354 + 0x80)
    SVAL(EVT_SLOT_2, frontier_df3_unitdef_b_050_91EE14_residue + 0x2A8)
    CALL(data_08A60354 + 0x80)
    LABEL(0)
    EVBIT_T(7)
    ENDA
    SVAL(EVT_SLOT_2, UnitDef_Ch19BEnemy_8)
    CALL(data_08A60354 + 0x80)
    EVBIT_T(7)
    ENDA
};
u8 frontier_df3_eventscr_ch_018_A6FAE4[] __attribute__((section(".data.frontier_df3_eventscr_ch.gap18"))) = INCBIN_U8("graphics/frontier_df3_eventscr_ch/frontier_df3_eventscr_ch_018_A6FAE4.gbapal");
EventListScr frontier_df3_eventscr_ch_019_A6FB48[] __attribute__((section(".data.frontier_df3_eventscr_ch.gap19"))) = {
    ENUF(0xC)
    COUNTER_SET(1, 1)
    EVBIT_T(7)
    ENDA
};
EventListScr frontier_df3_eventscr_ch_020_A6FB9C[] __attribute__((section(".data.frontier_df3_eventscr_ch.gap20"))) = {
    ENUF(0xD)
    COUNTER_SET(2, 0xA)
    EVBIT_T(7)
    ENDA
    SVAL(EVT_SLOT_2, frontier_df3_unitdef_b_052_91F89C + 0xDC)
    CALL(data_08A60354 + 0x58)
    COUNTER_DEC(2)
    ENUF(0xD)
    COUNTER_CHECK(2)
    BNE(0, 0xC, 0)
    ENUT(0xD)
    LABEL(0)
    EVBIT_T(7)
    ENDA
    SVAL(EVT_SLOT_2, 0)
    CALL(UnitDef_Ch14BAlly_7)
    SVAL(EVT_SLOT_1, 0x10000)
    CHAI(0xB1)
    EVBIT_T(7)
    ENDA
};
EventListScr frontier_df3_eventscr_ch_021_A6FC48[] __attribute__((section(".data.frontier_df3_eventscr_ch.gap21"))) = {
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0x19)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 0xF)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 5)
    SENQUEUE1
    SVAL(EVT_SLOT_1, 5)
    SENQUEUE1
    CALL(EventScr_9EE84C)
    LOAD1(1, UnitDef_TowerEnemy_0)
    ENUN
    CALL(data_085B9BBC + 0x200)
    ENDA
    SVAL(EVT_SLOT_2, 0x71)
    SVAL(EVT_SLOT_3, 0x24)
    CALL(EventScr_9EE8F0)
    SVAL(EVT_SLOT_2, 0x24)
    SVAL(EVT_SLOT_3, 0x25)
    CALL(EventScr_FloorClearInTower)
    ENDA
    SVAL(EVT_SLOT_2, 0)
    CALL(EventScr_ConfigHardModeLoadUnitHard)
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
    CALL(EventScr_9EE84C)
    LOAD1(1, frontier_df3_unitdef_b_055_91FE20)
    ENUN
    CALL(data_085B9BBC + 0x200)
    ENUT(8)
    ENDA
    SVAL(EVT_SLOT_2, 0x72)
    SVAL(EVT_SLOT_3, 0x24)
    CALL(EventScr_9EE8F0)
    SVAL(EVT_SLOT_2, 0x24)
    SVAL(EVT_SLOT_3, 0x26)
    CALL(EventScr_FloorClearInTower)
    ENDA
    SVAL(EVT_SLOT_2, 0)
    CALL(UnitDef_Ch14BAlly_7)
    SVAL(EVT_SLOT_1, 0x10000)
    CHAI(0xB9)
    SVAL(EVT_SLOT_1, 0x11200)
    CHAI(0xBA)
    ENUF(8)
    EVBIT_T(7)
    ENDA
    SVAL(EVT_SLOT_2, frontier_df3_unitdef_b_055_91FE20_residue)
    CALL(data_08A60354 + 0x58)
    EVBIT_T(7)
    ENDA
    SVAL(EVT_SLOT_2, 0)
    CALL(EventScr_ConfigHardModeLoadUnitHard)
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
    CALL(EventScr_9EE84C)
    LOAD1(1, frontier_df3_unitdef_b_056_920140)
    ENUN
    CALL(data_085B9BBC + 0x200)
    ENDA
    SVAL(EVT_SLOT_2, 0x67)
    CALL(EventScr_SetFlagIfPlayedThrough)
    SVAL(EVT_SLOT_2, 0x73)
    SVAL(EVT_SLOT_3, 0x24)
    CALL(EventScr_9EE8F0)
    SVAL(EVT_SLOT_2, 0x24)
    SVAL(EVT_SLOT_3, 0x27)
    CALL(EventScr_FloorClearInTower)
    ENDA
    SVAL(EVT_SLOT_2, 0)
    CALL(EventScr_ConfigHardModeLoadUnitHard)
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
    CALL(EventScr_9EE84C)
    LOAD1(1, frontier_df3_unitdef_b_057_92042C)
    ENUN
    CALL(data_085B9BBC + 0x200)
    ENDA
    SVAL(EVT_SLOT_2, 0x74)
    SVAL(EVT_SLOT_3, 0x24)
    CALL(EventScr_9EE8F0)
    SVAL(EVT_SLOT_2, 0x24)
    SVAL(EVT_SLOT_3, 0x28)
    CALL(EventScr_FloorClearInTower)
    ENDA
    SVAL(EVT_SLOT_2, 0)
    CALL(EventScr_ConfigHardModeLoadUnitHard)
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
    CALL(EventScr_9EE84C)
    LOAD1(1, frontier_df3_unitdef_b_058_920698)
    ENUN
    CALL(data_085B9BBC + 0x200)
    ENDA
    SVAL(EVT_SLOT_2, 0x75)
    SVAL(EVT_SLOT_3, 0x24)
    CALL(EventScr_9EE8F0)
    SVAL(EVT_SLOT_2, 0x24)
    SVAL(EVT_SLOT_3, 0x29)
    CALL(EventScr_FloorClearInTower)
    ENDA
    SVAL(EVT_SLOT_2, UnitDef_TowerEnemy_6)
    CALL(data_08A60354 + 0x58)
    EVBIT_T(7)
    ENDA
    SVAL(EVT_SLOT_2, 0)
    CALL(EventScr_ConfigHardModeLoadUnitHard)
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
    CALL(EventScr_9EE84C)
    LOAD1(1, frontier_df3_unitdef_b_059_920AD0)
    ENUN
    CALL(data_085B9BBC + 0x200)
    ENDA
    SVAL(EVT_SLOT_2, 0x69)
    CALL(EventScr_SetFlagIfPlayedThrough)
    SVAL(EVT_SLOT_2, 0x76)
    SVAL(EVT_SLOT_3, 0x24)
    CALL(EventScr_9EE8F0)
    SVAL(EVT_SLOT_2, 0x24)
    SVAL(EVT_SLOT_3, 0x2A)
    CALL(EventScr_FloorClearInTower)
    ENDA
    SVAL(EVT_SLOT_2, 0)
    CALL(EventScr_ConfigHardModeLoadUnitHard)
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
    CALL(EventScr_9EE84C)
    LOAD1(1, UnitDef_TowerEnemy_8)
    ENUN
    CALL(data_085B9BBC + 0x200)
    ENUT(0xC)
    ENUT(0xD)
    ENUT(0xE)
    ENDA
    SVAL(EVT_SLOT_2, 0x77)
    SVAL(EVT_SLOT_3, 0x24)
    CALL(EventScr_9EE8F0)
    SVAL(EVT_SLOT_2, 0x24)
    SVAL(EVT_SLOT_3, 0x2B)
    CALL(EventScr_FloorClearInTower)
    ENDA
    CHECK_EXISTS(0xAA)
    BEQ(0, 0xC, 0)
    CALL(UnitDef_Ch14BAlly_7 + 0x1C)
    LABEL(0)
    CAMERA(9, 0x10)
    TILECHANGE(0)
    EVBIT_T(7)
    ENDA
    CHECK_EXISTS(0xAC)
    BEQ(1, 0xC, 0)
    CALL(UnitDef_Ch14BAlly_7 + 0x1C)
    LABEL(1)
    CAMERA(0x11, 0xD)
    TILECHANGE(1)
    EVBIT_T(7)
    ENDA
    CHECK_EXISTS(0xB0)
    BEQ(2, 0xC, 0)
    CALL(UnitDef_Ch14BAlly_7 + 0x1C)
    LABEL(2)
    CAMERA(0x17, 4)
    TILECHANGE(2)
    ENUF(0xC)
    EVBIT_T(7)
    ENDA
    CHECK_EXISTS(0xB3)
    BEQ(3, 0xC, 0)
    CALL(UnitDef_Ch14BAlly_7 + 0x1C)
    LABEL(3)
    CAMERA(0xC, 0)
    TILECHANGE(3)
    ENUF(0xD)
    EVBIT_T(7)
    ENDA
    CHECK_EXISTS(0xB7)
    BEQ(4, 0xC, 0)
    CALL(UnitDef_Ch14BAlly_7 + 0x1C)
    LABEL(4)
    CAMERA(5, 0)
    TILECHANGE(4)
    ENUF(0xE)
    EVBIT_T(7)
    ENDA
    SVAL(EVT_SLOT_2, frontier_df3_unitdef_b_060_921140_residue)
    CALL(data_08A60354 + 0x58)
    EVBIT_T(7)
    ENDA
    SVAL(EVT_SLOT_2, frontier_df3_unitdef_b_060_921140_residue + 0x3C)
    CALL(data_08A60354 + 0x58)
    EVBIT_T(7)
    ENDA
    SVAL(EVT_SLOT_2, frontier_df3_unitdef_b_060_921140_residue + 0x78)
    CALL(data_08A60354 + 0x58)
    EVBIT_T(7)
    ENDA
    SVAL(EVT_SLOT_2, 0)
    CALL(EventScr_ConfigHardModeLoadUnitHard)
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
    CALL(EventScr_9EE84C)
    LOAD1(1, frontier_df3_unitdef_b_061_9212BC)
    ENUN
    CALL(data_085B9BBC + 0x200)
    ENDA
    SVAL(EVT_SLOT_2, 0x6E)
    CALL(EventScr_SetFlagIfPlayedThrough)
    SVAL(EVT_SLOT_2, 0x24)
    CALL(EventScr_WholeTowerClear)
    ENDA
    ASMC(InitRuinsDungeonState)
    SVAL(EVT_SLOT_2, 0)
    CALL(EventScr_ConfigHardModeLoadUnitHard)
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
    CALL(EventScr_9EE84C)
    LOAD1(1, UnitDef_RuinEnemy_0)
    ENUN
    CALL(data_085B9BBC + 0x200)
    ENDA
    SVAL(EVT_SLOT_2, 0x2E)
    SVAL(EVT_SLOT_3, 0x2F)
    CALL(EventScr_FloorClearInTower)
    ENDA
    SVAL(EVT_SLOT_2, UnitDef_RuinEnemy_1)
    CALL(data_08A60354 + 0x58)
    EVBIT_T(7)
    ENDA
    SVAL(EVT_SLOT_2, UnitDef_RuinEnemy_2)
    CALL(data_08A60354 + 0x58)
    EVBIT_T(7)
    ENDA
    SVAL(EVT_SLOT_2, 0)
    CALL(UnitDef_Ch14BAlly_7)
    SVAL(EVT_SLOT_1, 0x10000)
    CHAI(0xB9)
    SVAL(EVT_SLOT_1, 0x11200)
    CHAI(0xBA)
    EVBIT_T(7)
    ENDA
    SVAL(EVT_SLOT_2, 0)
    CALL(EventScr_ConfigHardModeLoadUnitHard)
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
    CALL(EventScr_9EE84C)
    LOAD1(1, UnitDef_RuinEnemy_3)
    ENUN
    CALL(data_085B9BBC + 0x200)
    ENDA
    SVAL(EVT_SLOT_2, 0x2E)
    SVAL(EVT_SLOT_3, 0x30)
    CALL(EventScr_FloorClearInTower)
    ENDA
    SVAL(EVT_SLOT_2, 0)
    CALL(UnitDef_Ch14BAlly_7)
    SVAL(EVT_SLOT_1, 0x10000)
    CHAI(0xB9)
    SVAL(EVT_SLOT_1, 0x11200)
    CHAI(0xBA)
    SVAL(EVT_SLOT_1, 0x10E06)
    CHAI(0xBD)
    EVBIT_T(7)
    ENDA
    SVAL(EVT_SLOT_2, 0)
    CALL(EventScr_ConfigHardModeLoadUnitHard)
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
    CALL(EventScr_9EE84C)
    LOAD1(1, frontier_df3_unitdef_b_064_921F00)
    ENUN
    CALL(data_085B9BBC + 0x200)
    ENDA
    SVAL(EVT_SLOT_2, 0x2E)
    SVAL(EVT_SLOT_3, 0x31)
    CALL(EventScr_FloorClearInTower)
    ENDA
    SVAL(EVT_SLOT_2, UnitDef_RuinEnemy_5)
    CALL(data_08A60354 + 0x58)
    EVBIT_T(7)
    ENDA
    SVAL(EVT_SLOT_2, UnitDef_RuinEnemy_6)
    CALL(data_08A60354 + 0x58)
    EVBIT_T(7)
    ENDA
    SVAL(EVT_SLOT_2, UnitDef_RuinEnemy_7)
    CALL(data_08A60354 + 0x58)
    EVBIT_T(7)
    ENDA
    SVAL(EVT_SLOT_2, UnitDef_RuinEnemy_8)
    CALL(data_08A60354 + 0x58)
    EVBIT_T(7)
    ENDA
    SVAL(EVT_SLOT_2, UnitDef_RuinEnemy_9)
    CALL(data_08A60354 + 0x58)
    EVBIT_T(7)
    ENDA
    SVAL(EVT_SLOT_2, 0)
    CALL(EventScr_ConfigHardModeLoadUnitHard)
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
    CALL(EventScr_9EE84C)
    LOAD1(1, UnitDef_RuinEnemy_10)
    ENUN
    CALL(data_085B9BBC + 0x200)
    ENDA
    SVAL(EVT_SLOT_2, UnitDef_RuinEnemy_11)
    CALL(data_08A60354 + 0x58)
    EVBIT_T(7)
    ENDA
    SVAL(EVT_SLOT_2, UnitDef_RuinEnemy_12)
    CALL(data_08A60354 + 0x58)
    EVBIT_T(7)
    ENDA
    SVAL(EVT_SLOT_2, 0x2E)
    SVAL(EVT_SLOT_3, 0x32)
    CALL(EventScr_FloorClearInTower)
    ENDA
    SVAL(EVT_SLOT_2, 0)
    CALL(EventScr_ConfigHardModeLoadUnitHard)
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
    CALL(EventScr_9EE84C)
    LOAD1(1, UnitDef_RuinEnemy_13)
    ENUN
    CALL(data_085B9BBC + 0x200)
    ENDA
    SVAL(EVT_SLOT_2, 0x68)
    CALL(EventScr_SetFlagIfPlayedThrough)
    SVAL(EVT_SLOT_2, 0x2E)
    SVAL(EVT_SLOT_3, 0x33)
    CALL(EventScr_FloorClearInTower)
    ENDA
    SVAL(EVT_SLOT_2, UnitDef_RuinEnemy_14)
    CALL(data_08A60354 + 0x58)
    EVBIT_T(7)
    ENDA
    SVAL(EVT_SLOT_2, UnitDef_RuinEnemy_15)
    CALL(data_08A60354 + 0x58)
    EVBIT_T(7)
    ENDA
    SVAL(EVT_SLOT_2, UnitDef_RuinEnemy_16)
    CALL(data_08A60354 + 0x58)
    EVBIT_T(7)
    ENDA
    SVAL(EVT_SLOT_2, 0)
    CALL(EventScr_ConfigHardModeLoadUnitHard)
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
    CALL(EventScr_9EE84C)
    LOAD1(1, UnitDef_RuinEnemy_17)
    ENUN
    CALL(data_085B9BBC + 0x200)
    ENDA
    SVAL(EVT_SLOT_2, 0x2E)
    SVAL(EVT_SLOT_3, 0x34)
    CALL(EventScr_FloorClearInTower)
    ENDA
    SVAL(EVT_SLOT_2, frontier_df3_unitdef_b_068_922FCC + 0x14)
    CALL(data_08A60354 + 0x58)
    EVBIT_T(7)
    ENDA
    SVAL(EVT_SLOT_2, frontier_df3_unitdef_b_068_922FCC + 0x50)
    CALL(data_08A60354 + 0x58)
    EVBIT_T(7)
    ENDA
    SVAL(EVT_SLOT_2, frontier_df3_unitdef_b_068_922FCC + 0x8C)
    CALL(data_08A60354 + 0x58)
    EVBIT_T(7)
    ENDA
    SVAL(EVT_SLOT_2, frontier_df3_unitdef_b_068_922FCC + 0xC8)
    CALL(data_08A60354 + 0x58)
    EVBIT_T(7)
    ENDA
    SVAL(EVT_SLOT_2, 0)
    CALL(EventScr_ConfigHardModeLoadUnitHard)
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
    CALL(EventScr_9EE84C)
    LOAD1(1, UnitDef_RuinEnemy_22)
    ENUN
    CALL(data_085B9BBC + 0x200)
    ENUT(8)
    ENUT(0xA)
    ENUT(0xC)
    ENDA
    SVAL(EVT_SLOT_2, 0x6A)
    CALL(EventScr_SetFlagIfPlayedThrough)
    SVAL(EVT_SLOT_2, 0x2E)
    SVAL(EVT_SLOT_3, 0x35)
    CALL(EventScr_FloorClearInTower)
    ENDA
    SVAL(EVT_SLOT_2, UnitDef_RuinEnemy_23)
    CALL(data_08A60354 + 0x58)
    EVBIT_T(7)
    ENDA
    SVAL(EVT_SLOT_2, UnitDef_RuinEnemy_24)
    CALL(data_08A60354 + 0x58)
    EVBIT_T(7)
    ENDA
    SVAL(EVT_SLOT_2, UnitDef_RuinEnemy_25)
    CALL(data_08A60354 + 0x58)
    EVBIT_T(7)
    ENDA
    SVAL(EVT_SLOT_2, UnitDef_RuinEnemy_26)
    CALL(data_08A60354 + 0x58)
    EVBIT_T(7)
    ENDA
    SVAL(EVT_SLOT_2, 0)
    CALL(UnitDef_Ch14BAlly_7)
    COUNTER_SET(0, 3)
    ENUF(8)
    EVBIT_T(7)
    ENDA
    SVAL(EVT_SLOT_2, UnitDef_RuinEnemy_27)
    CALL(data_08A60354 + 0x58)
    COUNTER_DEC(0)
    ENUF(8)
    COUNTER_CHECK(0)
    BNE(0, 0xC, 0)
    ENUT(8)
    LABEL(0)
    EVBIT_T(7)
    ENDA
    SVAL(EVT_SLOT_2, 0)
    CALL(UnitDef_Ch14BAlly_7)
    COUNTER_SET(1, 3)
    ENUF(0xA)
    EVBIT_T(7)
    ENDA
    SVAL(EVT_SLOT_2, UnitDef_RuinEnemy_28)
    CALL(data_08A60354 + 0x58)
    COUNTER_DEC(1)
    ENUF(0xA)
    COUNTER_CHECK(1)
    BNE(0, 0xC, 0)
    ENUT(0xA)
    LABEL(0)
    EVBIT_T(7)
    ENDA
    SVAL(EVT_SLOT_2, 0)
    CALL(UnitDef_Ch14BAlly_7)
    COUNTER_SET(2, 5)
    ENUF(0xC)
    EVBIT_T(7)
    ENDA
    SVAL(EVT_SLOT_2, frontier_df3_unitdef_b_070_923510)
    CALL(data_08A60354 + 0x58)
    COUNTER_DEC(2)
    ENUF(0xC)
    COUNTER_CHECK(2)
    BNE(0, 0xC, 0)
    ENUT(0xC)
    LABEL(0)
    EVBIT_T(7)
    ENDA
    SVAL(EVT_SLOT_2, UnitDef_RuinEnemy_30)
    CALL(data_08A60354 + 0x58)
    EVBIT_T(7)
    ENDA
    SVAL(EVT_SLOT_2, 0)
    CALL(EventScr_ConfigHardModeLoadUnitHard)
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
    CALL(EventScr_9EE84C)
    LOAD1(1, UnitDef_RuinEnemy_31)
    ENUN
    CALL(data_085B9BBC + 0x200)
    ENUT(8)
    ENUT(0xA)
    ENUT(0xC)
    ENUT(0xE)
    ENDA
    SVAL(EVT_SLOT_2, 0x2E)
    SVAL(EVT_SLOT_3, 0x36)
    CALL(EventScr_FloorClearInTower)
    ENDA
    SVAL(EVT_SLOT_2, 0)
    CALL(UnitDef_Ch14BAlly_7)
    COUNTER_SET(3, 2)
    ENUF(8)
    EVBIT_T(7)
    ENDA
    SVAL(EVT_SLOT_2, UnitDef_RuinEnemy_32)
    CALL(data_08A60354 + 0x58)
    COUNTER_DEC(3)
    ENUF(8)
    COUNTER_CHECK(3)
    BNE(0, 0xC, 0)
    ENUT(8)
    LABEL(0)
    EVBIT_T(7)
    ENDA
    SVAL(EVT_SLOT_2, 0)
    CALL(UnitDef_Ch14BAlly_7)
    COUNTER_SET(4, 2)
    ENUF(0xA)
    EVBIT_T(7)
    ENDA
    SVAL(EVT_SLOT_2, UnitDef_RuinEnemy_33)
    CALL(data_08A60354 + 0x58)
    COUNTER_DEC(4)
    ENUF(0xA)
    COUNTER_CHECK(4)
    BNE(0, 0xC, 0)
    ENUT(0xA)
    LABEL(0)
    EVBIT_T(7)
    ENDA
    SVAL(EVT_SLOT_2, 0)
    CALL(UnitDef_Ch14BAlly_7)
    COUNTER_SET(5, 2)
    ENUF(0xC)
    EVBIT_T(7)
    ENDA
    SVAL(EVT_SLOT_2, UnitDef_RuinEnemy_34)
    CALL(data_08A60354 + 0x58)
    COUNTER_DEC(5)
    ENUF(0xC)
    COUNTER_CHECK(5)
    BNE(0, 0xC, 0)
    ENUT(0xC)
    LABEL(0)
    EVBIT_T(7)
    ENDA
    SVAL(EVT_SLOT_2, 0)
    CALL(UnitDef_Ch14BAlly_7)
    SVAL(EVT_SLOT_1, 0x10300)
    CHAI(0xBD)
    COUNTER_SET(6, 4)
    ENUF(0xE)
    EVBIT_T(7)
    ENDA
    SVAL(EVT_SLOT_2, UnitDef_RuinEnemy_35)
    CALL(data_08A60354 + 0x58)
    COUNTER_DEC(6)
    ENUF(0xE)
    COUNTER_CHECK(6)
    BNE(0, 0xC, 0)
    ENUT(0xE)
    LABEL(0)
    EVBIT_T(7)
    ENDA
};
