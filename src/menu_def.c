#include "global.h"

#include "uimenu.h"
#include "bmdebug.h"
#include "bmmenu.h"
#include "bmitemuse.h"
#include "sio.h"

/* Menu item tables + their Shift-JIS label strings, decoded from the JP ROM into
 * editable C (axis #6, fe8u src/menu_def.c parity). Previously these lived as
 * inline-asm pointer tables in src/data/*_ref/ pointing into a raw Shift-JIS
 * string-pool INCBIN (graphics/frontier_df4_misc_lo). Here the strings are real
 * editable literals and the tables are typed struct MenuItemDef[]. The .rodata is
 * pinned at the JP ROM addresses in the layout manifest so the bytes still match
 * (make compare). */

/* nullsub_41: empty callback used by gItemUseMenuItems (real compiled-C function
 * src/nullsub_41.c, void(void)); not in any JP header, declared here. Referenced
 * via (void*) like every menu callback, so the signature is irrelevant to codegen. */
void nullsub_41(void);

extern u8 data_080DF228[]; /* Sio menu label pool (frontier_df4_misc_lo gap4b2) */

/* Pool + label symbols are defined in the .rodata.menu_def_pool asm block
 * below; declare them so the typed tables reference them as constants. */
extern const u8 frontier_df4_misc_lo_001_0DC974[];
extern const char gMenuStr_00C[];
extern const char gMenuStr_024[];
extern const char gMenuStr_03C[];
extern const char gMenuStr_054[];
extern const char gMenuStr_060[];
extern const char gMenuStr_07C[];
extern const char gMenuStr_090[];
extern const char gMenuStr_09C[];
extern const char gMenuStr_0AC[];
extern const char gMenuStr_0C0[];
extern const char gMenuStr_0CC[];
extern const char gMenuStr_0E0[];
extern const char gMenuStr_0F0[];
extern const char gMenuStr_0FC[];
extern const char gMenuStr_104[];
extern const char gMenuStr_10C[];
extern const char gMenuStr_118[];
extern const char gMenuStr_124[];
extern const char gMenuStr_12C[];
extern const char gMenuStr_134[];
extern const char gMenuStr_13C[];
extern const char gMenuStr_144[];
extern const char gMenuStr_14C[];
extern const char gMenuStr_154[];
extern const char gMenuStr_15C[];
extern const char gMenuStr_168[];
extern const char gMenuStr_170[];
extern const char gMenuStr_17C[];
extern const char gMenuStr_188[];
extern const char gMenuStr_194[];
extern const char gMenuStr_1A0[];
extern const char gMenuStr_1A8[];
extern const char gMenuStr_1B4[];
extern const char gMenuStr_1C0[];
extern const char gMenuStr_1CC[];
extern const char gMenuStr_1D8[];
extern const char gMenuStr_1E0[];
extern const char gMenuStr_1E8[];
extern const char gMenuStr_1F0[];
extern const char gMenuStr_1F8[];
extern const char gMenuStr_200[];
extern const char gMenuStr_20C[];
extern const char gMenuStr_214[];
extern const char gMenuStr_21C[];
extern const char gMenuStr_224[];
extern const char gMenuStr_22C[];
extern const char gMenuStr_238[];
extern const char gMenuStr_244[];
extern const char gMenuStr_24C[];
extern const char gMenuStr_254[];
extern const char gMenuStr_25C[];
extern const char gMenuStr_264[];
extern const char gMenuStr_26C[];
extern const char gMenuStr_274[];
extern const char gMenuStr_27C[];
extern const char gMenuStr_284[];
extern const char gMenuStr_28C[];
extern const char gMenuStr_294[];
extern const char gMenuStr_29C[];

/* String pool (frontier_df4_misc_lo_001_0DC974, ROM 0x080DC974). The menu
 * label strings the JP build packs here are emitted as editable Shift-JIS
 * literals (UTF-8 in source; the cpp->iconv UTF-8->CP932->agbcc pipeline
 * encodes them). The 12-byte header and the 0x78-byte MAPTASK tail are
 * non-string binary kept as raw bytes. Pinned at 0x080DC974 in the layout
 * manifest so the bytes match; other tables (gDebugMenuItems/data_085C4830)
 * still reference frontier_df4_misc_lo_001_0DC974 + offset. */
/* String pool (frontier_df4_misc_lo_001_0DC974, ROM 0x080DC974) -- converted from
 * inline asm to typed C in place (#152). Japanese labels are editable Shift-JIS
 * C literals (cpp->iconv UTF-8->CP932->agbcc); each gMenuStr array is sized to fold in
 * the original .asciz null + .space padding. Header + MAPTASK tail are raw bytes. All
 * offsets are 4-aligned so agbcc's string .align 2,0 is a no-op; section pinned at
 * 0x080DC974 in layout/carved_rom.d/menu_def.tsv so bytes match (make compare). */
const u8 frontier_df4_misc_lo_001_0DC974[] __attribute__((section(".rodata.menu_def_pool"))) = {
    0x01, 0x0F, 0x08, 0x08, 0x0F, 0x19, 0x1E, 0x14, 0x0A, 0x00, 0x00, 0x00,
};
const char gMenuStr_00C[24] __attribute__((section(".rodata.menu_def_pool"))) = "　　　　　　　　　了解";
const char gMenuStr_024[24] __attribute__((section(".rodata.menu_def_pool"))) = "以後プレイできません";
const char gMenuStr_03C[24] __attribute__((section(".rodata.menu_def_pool"))) = "クリアずみファイルでは";
const char gMenuStr_054[12] __attribute__((section(".rodata.menu_def_pool"))) = "しますか？";
const char gMenuStr_060[28] __attribute__((section(".rodata.menu_def_pool"))) = "ファイルをクリアずみに";
const char gMenuStr_07C[20] __attribute__((section(".rodata.menu_def_pool"))) = "　ファイル初期化";
const char gMenuStr_090[12] __attribute__((section(".rodata.menu_def_pool"))) = "　手再開";
const char gMenuStr_09C[16] __attribute__((section(".rodata.menu_def_pool"))) = "　どこでも再開";
const char gMenuStr_0AC[20] __attribute__((section(".rodata.menu_def_pool"))) = "　リリースエントリ";
const char gMenuStr_0C0[12] __attribute__((section(".rodata.menu_def_pool"))) = "　手中断";
const char gMenuStr_0CC[20] __attribute__((section(".rodata.menu_def_pool"))) = "　おやすみなさい";
const char gMenuStr_0E0[16] __attribute__((section(".rodata.menu_def_pool"))) = "　クリアずみ";
const char gMenuStr_0F0[12] __attribute__((section(".rodata.menu_def_pool"))) = "　周回数";
const char gMenuStr_0FC[8] __attribute__((section(".rodata.menu_def_pool"))) = "　索敵";
const char gMenuStr_104[8] __attribute__((section(".rodata.menu_def_pool"))) = "　天気";
const char gMenuStr_10C[12] __attribute__((section(".rodata.menu_def_pool"))) = "　デブ情報";
const char gMenuStr_118[12] __attribute__((section(".rodata.menu_def_pool"))) = "　マップ";
const char gMenuStr_124[8] __attribute__((section(".rodata.menu_def_pool"))) = "いいえ";
const char gMenuStr_12C[8] __attribute__((section(".rodata.menu_def_pool"))) = "はい";
const char gMenuStr_134[8] __attribute__((section(".rodata.menu_def_pool"))) = "捨てる";
const char gMenuStr_13C[8] __attribute__((section(".rodata.menu_def_pool"))) = "交換";
const char gMenuStr_144[8] __attribute__((section(".rodata.menu_def_pool"))) = "装備";
const char gMenuStr_14C[8] __attribute__((section(".rodata.menu_def_pool"))) = "使う";
const char gMenuStr_154[8] __attribute__((section(".rodata.menu_def_pool"))) = "　待機";
const char gMenuStr_15C[12] __attribute__((section(".rodata.menu_def_pool"))) = "　輸送隊";
const char gMenuStr_168[8] __attribute__((section(".rodata.menu_def_pool"))) = "　交換";
const char gMenuStr_170[12] __attribute__((section(".rodata.menu_def_pool"))) = "　持ち物";
const char gMenuStr_17C[12] __attribute__((section(".rodata.menu_def_pool"))) = "　引渡し";
const char gMenuStr_188[12] __attribute__((section(".rodata.menu_def_pool"))) = "　引受け";
const char gMenuStr_194[12] __attribute__((section(".rodata.menu_def_pool"))) = "　降ろす";
const char gMenuStr_1A0[8] __attribute__((section(".rodata.menu_def_pool"))) = "　救出";
const char gMenuStr_1A8[12] __attribute__((section(".rodata.menu_def_pool"))) = "　闘技場";
const char gMenuStr_1B4[12] __attribute__((section(".rodata.menu_def_pool"))) = "　秘密店";
const char gMenuStr_1C0[12] __attribute__((section(".rodata.menu_def_pool"))) = "　道具屋";
const char gMenuStr_1CC[12] __attribute__((section(".rodata.menu_def_pool"))) = "　武器屋";
const char gMenuStr_1D8[8] __attribute__((section(".rodata.menu_def_pool"))) = "　扉";
const char gMenuStr_1E0[8] __attribute__((section(".rodata.menu_def_pool"))) = "　宝箱";
const char gMenuStr_1E8[8] __attribute__((section(".rodata.menu_def_pool"))) = "　訪問";
const char gMenuStr_1F0[8] __attribute__((section(".rodata.menu_def_pool"))) = "　支援";
const char gMenuStr_1F8[8] __attribute__((section(".rodata.menu_def_pool"))) = "　話す";
const char gMenuStr_200[12] __attribute__((section(".rodata.menu_def_pool"))) = "　かぎ開";
const char gMenuStr_20C[8] __attribute__((section(".rodata.menu_def_pool"))) = "　呼魔";
const char gMenuStr_214[8] __attribute__((section(".rodata.menu_def_pool"))) = "　召喚";
const char gMenuStr_21C[8] __attribute__((section(".rodata.menu_def_pool"))) = "　盗む";
const char gMenuStr_224[8] __attribute__((section(".rodata.menu_def_pool"))) = "　踊る";
const char gMenuStr_22C[12] __attribute__((section(".rodata.menu_def_pool"))) = "　奏でる";
const char gMenuStr_238[12] __attribute__((section(".rodata.menu_def_pool"))) = "　降りる";
const char gMenuStr_244[8] __attribute__((section(".rodata.menu_def_pool"))) = "　乗る";
const char gMenuStr_24C[8] __attribute__((section(".rodata.menu_def_pool"))) = "　杖";
const char gMenuStr_254[8] __attribute__((section(".rodata.menu_def_pool"))) = "　攻撃";
const char gMenuStr_25C[8] __attribute__((section(".rodata.menu_def_pool"))) = "　制圧";
const char gMenuStr_264[8] __attribute__((section(".rodata.menu_def_pool"))) = "　終了";
const char gMenuStr_26C[8] __attribute__((section(".rodata.menu_def_pool"))) = "　中断";
const char gMenuStr_274[8] __attribute__((section(".rodata.menu_def_pool"))) = "　退却";
const char gMenuStr_27C[8] __attribute__((section(".rodata.menu_def_pool"))) = "　設定";
const char gMenuStr_284[8] __attribute__((section(".rodata.menu_def_pool"))) = "　戦績";
const char gMenuStr_28C[8] __attribute__((section(".rodata.menu_def_pool"))) = "　辞書";
const char gMenuStr_294[8] __attribute__((section(".rodata.menu_def_pool"))) = "　状況";
const char gMenuStr_29C[8] __attribute__((section(".rodata.menu_def_pool"))) = "　部隊";
const u8 gMenuDefPoolMaptask[] __attribute__((section(".rodata.menu_def_pool"))) = {
    0x4D, 0x41, 0x50, 0x54, 0x41, 0x53, 0x4B, 0x00, 0xB0, 0x00, 0xC0, 0x00,
    0x00, 0x00, 0xB0, 0x00, 0xD0, 0x00, 0x00, 0x00, 0xB0, 0x00, 0xE0, 0x00,
    0x00, 0x00, 0xB0, 0x00, 0xF0, 0x00, 0x00, 0x00, 0xB0, 0x00, 0x00, 0x01,
    0x00, 0x00, 0xB0, 0x00, 0x10, 0x01, 0x00, 0x00, 0xF0, 0x00, 0x40, 0x01,
    0x01, 0x00, 0xF0, 0x00, 0x50, 0x01, 0x01, 0x00, 0xF0, 0x00, 0x60, 0x01,
    0x01, 0x00, 0xF0, 0x00, 0x70, 0x01, 0x01, 0x00, 0xF0, 0x00, 0x80, 0x01,
    0x01, 0x00, 0xF0, 0x00, 0x90, 0x01, 0x01, 0x00, 0xF0, 0x00, 0xA0, 0x01,
    0x01, 0x00, 0x00, 0x01, 0x00, 0x02, 0x02, 0x00, 0xF0, 0x00, 0x20, 0x02,
    0x02, 0x00, 0xE0, 0x00, 0x40, 0x02, 0x02, 0x00, 0x29, 0x00, 0x00, 0x00,
    0x09, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, 0x00, 0x08, 0x04, 0x01, 0x00,
};

const struct MenuItemDef gDebugClearMenuItems[] SECTION(".rodata.menu_def.gDebugClearMenuItems") = {
    {gMenuStr_060, 0x63A, 0x0, 0, 0x3, (void *)MenuAlwaysEnabled, NULL, NULL, NULL, NULL, NULL},
    {gMenuStr_054, 0x63B, 0x0, 0, 0x4, (void *)MenuAlwaysEnabled, NULL, NULL, NULL, NULL, NULL},
    {gMenuStr_03C, 0x63C, 0x0, 0, 0x5, (void *)MenuAlwaysEnabled, NULL, NULL, NULL, NULL, NULL},
    {gMenuStr_024, 0x63D, 0x0, 0, 0x6, (void *)MenuAlwaysEnabled, NULL, NULL, NULL, NULL, NULL},
    {gMenuStr_00C, 0x63E, 0x0, 4, 0x7, (void *)MenuAlwaysEnabled, NULL, (void *)DebugClearMenu_ClearFile, NULL, NULL, NULL},
    MenuItemsEnd,
};

const struct MenuItemDef gDebugChuudanMenuItems[] SECTION(".rodata.menu_def.gDebugChuudanMenuItems") = {
    {(const char *)(frontier_df4_misc_lo_001_0DC974 + 0x78), 0x0, 0x0, 0, 0x8, (void *)MenuAlwaysEnabled, (void *)DebugChargeMenu_Draw, NULL, (void *)DebugChargeMenu_Idle, NULL, NULL},
    {(const char *)(frontier_df4_misc_lo_001_0DC974 + 0x78), 0x0, 0x0, 0, 0x9, (void *)MenuAlwaysEnabled, (void *)DebugChargeMenu_Draw, NULL, (void *)DebugChargeMenu_Idle, NULL, NULL},
};

const struct MenuItemDef gDebugContinueMenuItems[] SECTION(".rodata.menu_def.gDebugContinueMenuItems") = {
    {gMenuStr_0AC, 0x2, 0x0, 0, 0xA, (void *)MenuAlwaysEnabled, NULL, (void *)DebugContinueMenu_ReleaseEntry, NULL, NULL, NULL},
    {gMenuStr_09C, 0x3, 0x0, 0, 0xB, (void *)DebugContinueMenu_IsContinueChapterAvailable, NULL, (void *)DebugContinueMenu_ContinueChapter, NULL, NULL, NULL},
    {gMenuStr_090, 0x631, 0x0, 0, 0xC, (void *)DebugContinueMenu_IsManualContinueAvailable, NULL, (void *)DebugContinueMenu_ManualContinue, NULL, NULL, NULL},
    {gMenuStr_07C, 0x5, 0x0, 0, 0xD, (void *)MenuAlwaysEnabled, NULL, (void *)DebugContinueMenu_InitializeFile, NULL, NULL, NULL},
    MenuItemsEnd,
};

const struct MenuItemDef gItemUseMenuItems[] SECTION(".rodata.menu_def.gItemUseMenuItems") = {
    {(const char *)(frontier_df4_misc_lo_001_0DC974 + 0x78), 0x0, 0x0, 0, 0x1A, (void *)RepairMenuItemIsAvailable, (void *)RepairMenuItemDraw, (void *)RepairMenuItemSelect, NULL, (void *)RepairMenuItemOnChange, (void *)nullsub_41},
    {(const char *)(frontier_df4_misc_lo_001_0DC974 + 0x78), 0x0, 0x0, 0, 0x1B, (void *)RepairMenuItemIsAvailable, (void *)RepairMenuItemDraw, (void *)RepairMenuItemSelect, NULL, (void *)RepairMenuItemOnChange, (void *)nullsub_41},
    {(const char *)(frontier_df4_misc_lo_001_0DC974 + 0x78), 0x0, 0x0, 0, 0x1C, (void *)RepairMenuItemIsAvailable, (void *)RepairMenuItemDraw, (void *)RepairMenuItemSelect, NULL, (void *)RepairMenuItemOnChange, (void *)nullsub_41},
    {(const char *)(frontier_df4_misc_lo_001_0DC974 + 0x78), 0x0, 0x0, 0, 0x1D, (void *)RepairMenuItemIsAvailable, (void *)RepairMenuItemDraw, (void *)RepairMenuItemSelect, NULL, (void *)RepairMenuItemOnChange, (void *)nullsub_41},
    {(const char *)(frontier_df4_misc_lo_001_0DC974 + 0x78), 0x0, 0x0, 0, 0x1E, (void *)RepairMenuItemIsAvailable, (void *)RepairMenuItemDraw, (void *)RepairMenuItemSelect, NULL, (void *)RepairMenuItemOnChange, (void *)nullsub_41},
    MenuItemsEnd,
};

const struct MenuItemDef gStealItemMenuItems[] SECTION(".rodata.menu_def.gStealItemMenuItems") = {
    {(const char *)(frontier_df4_misc_lo_001_0DC974 + 0x78), 0x0, 0x0, 0, 0x1F, (void *)StealItemMenuCommand_Usability, (void *)StealItemMenuCommand_Draw, (void *)StealItemMenuCommand_Effect, NULL, NULL, NULL},
    {(const char *)(frontier_df4_misc_lo_001_0DC974 + 0x78), 0x0, 0x0, 0, 0x20, (void *)StealItemMenuCommand_Usability, (void *)StealItemMenuCommand_Draw, (void *)StealItemMenuCommand_Effect, NULL, NULL, NULL},
    {(const char *)(frontier_df4_misc_lo_001_0DC974 + 0x78), 0x0, 0x0, 0, 0x21, (void *)StealItemMenuCommand_Usability, (void *)StealItemMenuCommand_Draw, (void *)StealItemMenuCommand_Effect, NULL, NULL, NULL},
    {(const char *)(frontier_df4_misc_lo_001_0DC974 + 0x78), 0x0, 0x0, 0, 0x22, (void *)StealItemMenuCommand_Usability, (void *)StealItemMenuCommand_Draw, (void *)StealItemMenuCommand_Effect, NULL, NULL, NULL},
    {(const char *)(frontier_df4_misc_lo_001_0DC974 + 0x78), 0x0, 0x0, 0, 0x23, (void *)StealItemMenuCommand_Usability, (void *)StealItemMenuCommand_Draw, (void *)StealItemMenuCommand_Effect, NULL, NULL, NULL},
    MenuItemsEnd,
};

const struct MenuItemDef gYesNoSelectionMenuItems[] SECTION(".rodata.menu_def.gYesNoSelectionMenuItems") = {
    {gMenuStr_12C, 0x7BB, 0x0, 0, 0x32, (void *)MenuAlwaysEnabled, NULL, (void *)MenuCommand_SelectYes, NULL, NULL, NULL},
    {gMenuStr_124, 0x7BC, 0x0, 0, 0x33, (void *)MenuAlwaysEnabled, NULL, (void *)MenuCommand_SelectNo, NULL, NULL, NULL},
    MenuItemsEnd,
};

const struct MenuItemDef gUnitActionMenuItems[] SECTION(".rodata.menu_def.gUnitActionMenuItems") = {
    {gMenuStr_25C, 0x60B, 0x64D, 0, 0x4E, (void *)UnitActionMenu_CanSeize, NULL, (void *)UnitActionMenu_Seize, NULL, NULL, NULL},
    {gMenuStr_254, 0x60C, 0x641, 0, 0x4F, (void *)AttackCommandUsability, NULL, (void *)UnitActionMenu_Attack, NULL, (void *)DisplayUnitStandingAttackRange, (void *)HideMoveRangeGraphicsWrapper},
    {gMenuStr_254, 0x60C, 0x641, 0, 0x50, (void *)AttackBallistaCommandUsability, NULL, (void *)UnitActionMenu_Attack, NULL, (void *)DisplayUnitStandingAttackRange, (void *)HideMoveRangeGraphicsWrapper},
    {gMenuStr_24C, 0x60D, 0x642, 0, 0x51, (void *)StaffCommandUsability, NULL, (void *)StaffCommandEffect, NULL, (void *)StaffCommandRange, (void *)HideMoveRangeGraphicsWrapper2},
    {gMenuStr_244, 0x0, 0x658, 4, 0x52, (void *)RideCommandUsability, NULL, (void *)RideCommandEffect, NULL, NULL, NULL},
    {gMenuStr_238, 0x0, 0x659, 4, 0x53, (void *)ExitCommandUsability, NULL, (void *)ExitCommandEffect, NULL, NULL, NULL},
    {gMenuStr_22C, 0x60E, 0x644, 0, 0x54, (void *)PlayCommandUsability, NULL, (void *)PlayCommandEffect, NULL, NULL, NULL},
    {gMenuStr_224, 0x60F, 0x643, 0, 0x55, (void *)DanceCommandUsability, NULL, (void *)PlayCommandEffect, NULL, NULL, NULL},
    {gMenuStr_21C, 0x610, 0x645, 0, 0x56, (void *)StealCommandUsability, NULL, (void *)StealCommandEffect, NULL, NULL, NULL},
    {gMenuStr_214, 0x61E, 0x65F, 0, 0x57, (void *)SummonCommandUsability, NULL, (void *)SummonCommandEffect, NULL, NULL, NULL},
    {gMenuStr_20C, 0x61E, 0x65F, 0, 0x58, (void *)YobimaCommandUsability, NULL, (void *)YobimaCommandEffect, NULL, NULL, NULL},
    {gMenuStr_200, 0x61E, 0x660, 0, 0x59, (void *)PickCommandUsability, NULL, (void *)PickCommandEffect, NULL, NULL, NULL},
    {gMenuStr_1F8, 0x611, 0x64B, 0, 0x5A, (void *)TalkCommandUsability, NULL, (void *)TalkCommandEffect, NULL, NULL, NULL},
    {gMenuStr_1F0, 0x612, 0x6E8, 0, 0x5B, (void *)SupportCommandUsability, NULL, (void *)SupportCommandEffect, NULL, NULL, NULL},
    {gMenuStr_1E8, 0x613, 0x64C, 0, 0x5C, (void *)VisitCommandUsability, NULL, (void *)VisitCommandEffect, NULL, NULL, NULL},
    {gMenuStr_1E0, 0x614, 0x650, 0, 0x5D, (void *)ChestCommandUsability, NULL, (void *)ChestCommandEffect, NULL, NULL, NULL},
    {gMenuStr_1D8, 0x615, 0x64E, 0, 0x5E, (void *)DoorCommandUsability, NULL, (void *)DoorCommandEffect, NULL, NULL, NULL},
    {gMenuStr_1CC, 0x616, 0x651, 0, 0x5F, (void *)ArmoryCommandUsability, NULL, (void *)ArmoryCommandEffect, NULL, NULL, NULL},
    {gMenuStr_1C0, 0x617, 0x652, 0, 0x60, (void *)VendorCommandUsability, NULL, (void *)VendorCommandEffect, NULL, NULL, NULL},
    {gMenuStr_1B4, 0x618, 0x653, 0, 0x61, (void *)SecretShopCommandUsability, NULL, (void *)SecretShopCommandEffect, NULL, NULL, NULL},
    {gMenuStr_1A8, 0x619, 0x654, 0, 0x62, (void *)ArenaCommandUsability, NULL, (void *)ArenaCommandEffect, NULL, NULL, NULL},
    {gMenuStr_1A0, 0x61A, 0x646, 0, 0x63, (void *)RescueUsability, NULL, (void *)RescueEffect, NULL, NULL, NULL},
    {gMenuStr_194, 0x61B, 0x647, 0, 0x64, (void *)DropUsability, NULL, (void *)DropEffect, NULL, NULL, NULL},
    {gMenuStr_188, 0x61C, 0x649, 4, 0x65, (void *)TakeUsability, NULL, (void *)TakeEffect, NULL, NULL, NULL},
    {gMenuStr_17C, 0x61D, 0x648, 4, 0x66, (void *)GiveUsability, NULL, (void *)GiveEffect, NULL, NULL, NULL},
    {gMenuStr_170, 0x61E, 0x655, 0, 0x67, (void *)ItemCommandUsability, NULL, (void *)ItemCommandEffect, NULL, NULL, NULL},
    {gMenuStr_168, 0x61F, 0x656, 4, 0x68, (void *)ItemSubMenu_IsTradeAvailable, NULL, (void *)TradeCommandEffect, NULL, NULL, NULL},
    {gMenuStr_15C, 0x620, 0x657, 4, 0x69, (void *)SupplyUsability, NULL, (void *)SupplyCommandEffect, NULL, NULL, NULL},
    {gMenuStr_154, 0x622, 0x640, 0, 0x6B, (void *)MenuAlwaysEnabled, NULL, (void *)EffectWait, NULL, NULL, NULL},
    MenuItemsEnd,
};

const struct MenuItemDef MenuItems_SioMenudef_0[] SECTION(".rodata.menu_def.MenuItems_SioMenudef_0") = {
    {(const char *)(data_080DF228 + 0xA8), 0x0, 0x0, 0, 0x1, (void *)MenuAlwaysEnabled, NULL, (void *)SioAttackTypeMenu_OnSelect, NULL, NULL, NULL},
    {(const char *)(data_080DF228 + 0x9C), 0x0, 0x0, 0, 0x2, (void *)MenuAlwaysEnabled, NULL, (void *)SioAttackTypeMenu_OnSelect, NULL, NULL, NULL},
    MenuItemsEnd,
};

const struct MenuItemDef MenuItems_SioMenudef_1[] SECTION(".rodata.menu_def.MenuItems_SioMenudef_1") = {
    {(const char *)(data_080DF228 + 0xB4), 0x0, 0x0, 0, 0x3, (void *)SioWeaponSelectMenu_Usability, (void *)SioWeaponSelectMenu_Draw, (void *)SioWeaponSelectMenu_OnSelect, NULL, NULL, NULL},
    {(const char *)(data_080DF228 + 0xB4), 0x0, 0x0, 0, 0x4, (void *)SioWeaponSelectMenu_Usability, (void *)SioWeaponSelectMenu_Draw, (void *)SioWeaponSelectMenu_OnSelect, NULL, NULL, NULL},
    {(const char *)(data_080DF228 + 0xB4), 0x0, 0x0, 0, 0x5, (void *)SioWeaponSelectMenu_Usability, (void *)SioWeaponSelectMenu_Draw, (void *)SioWeaponSelectMenu_OnSelect, NULL, NULL, NULL},
    {(const char *)(data_080DF228 + 0xB4), 0x0, 0x0, 0, 0x6, (void *)SioWeaponSelectMenu_Usability, (void *)SioWeaponSelectMenu_Draw, (void *)SioWeaponSelectMenu_OnSelect, NULL, NULL, NULL},
    {(const char *)(data_080DF228 + 0xB4), 0x0, 0x0, 0, 0x7, (void *)SioWeaponSelectMenu_Usability, (void *)SioWeaponSelectMenu_Draw, (void *)SioWeaponSelectMenu_OnSelect, NULL, NULL, NULL},
    MenuItemsEnd,
};
