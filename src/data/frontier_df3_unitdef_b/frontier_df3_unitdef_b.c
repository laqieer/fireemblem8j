#include "global.h"
#include "muctrl.h"

/* frontier (Tower of Valni / Lagdou Ruins) reinforcement tables: struct UnitDefinition
 * runs with embedded struct REDA (reinforcement) move data, NOT pixel graphics.
 * The REDA runs referenced by the UnitDef_*_ref tables are carved out into named,
 * typed `struct REDA REDAs_*[]` arrays (axis #6 editability + shiftability: the
 * .redas pointers become real symbol refs instead of base+offset casts). The
 * surrounding UnitDefinition bytes remain verbatim INCBIN slices, kept in the
 * original section/order. Byte-identical to baserom; `make compare` is the oracle.
 */

u8 frontier_df3_unitdef_b_000_90F678[] __attribute__((section(".data.frontier_df3_unitdef_b.gap0"))) = INCBIN_U8("graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_000_90F678.bin", 0, 2448);
struct REDA REDAs_UnitDef_Ch14AEnemy_2_0[] __attribute__((section(".data.frontier_df3_unitdef_b.gap0"))) =
{
    { .x = 3, .y = 22, .b = 0xffff },
};
struct REDA REDAs_UnitDef_Ch14AEnemy_2_1[] __attribute__((section(".data.frontier_df3_unitdef_b.gap0"))) =
{
    { .x = 2, .y = 21, .b = 0xffff },
};
struct REDA REDAs_UnitDef_Ch14AEnemy_2_2[] __attribute__((section(".data.frontier_df3_unitdef_b.gap0"))) =
{
    { .x = 1, .y = 22, .b = 0xffff },
};
struct REDA REDAs_UnitDef_Ch14AEnemy_4_0[] __attribute__((section(".data.frontier_df3_unitdef_b.gap0"))) =
{
    { .x = 22, .y = 26, .b = 0xffff },
};
struct REDA REDAs_UnitDef_Ch14AEnemy_4_1[] __attribute__((section(".data.frontier_df3_unitdef_b.gap0"))) =
{
    { .x = 23, .y = 25, .b = 0xffff },
};
struct REDA REDAs_UnitDef_Ch14AEnemy_4_2[] __attribute__((section(".data.frontier_df3_unitdef_b.gap0"))) =
{
    { .x = 24, .y = 24, .b = 0xffff },
};
static const u8 frontier_df3_unitdef_b_000_90F678_gap0[] __attribute__((section(".data.frontier_df3_unitdef_b.gap0"))) = INCBIN_U8("graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_000_90F678.bin", 2496, 32);
struct REDA REDAs_UnitDef_Ch14AEnemy_6_0[] __attribute__((section(".data.frontier_df3_unitdef_b.gap0"))) =
{
    { .x = 8, .y = 7, .b = 0xffff },
};
struct REDA REDAs_UnitDef_Ch14AEnemy_6_1[] __attribute__((section(".data.frontier_df3_unitdef_b.gap0"))) =
{
    { .x = 9, .y = 7, .b = 0xffff },
};
struct REDA REDAs_UnitDef_Ch14AEnemy_6_2[] __attribute__((section(".data.frontier_df3_unitdef_b.gap0"))) =
{
    { .x = 10, .y = 7, .b = 0xffff },
};
struct REDA REDAs_UnitDef_Ch14AEnemy_6_3[] __attribute__((section(".data.frontier_df3_unitdef_b.gap0"))) =
{
    { .x = 8, .y = 8, .a = 0x84, .b = 0xffff },
};
struct REDA REDAs_UnitDef_Ch14AEnemy_6_4[] __attribute__((section(".data.frontier_df3_unitdef_b.gap0"))) =
{
    { .x = 10, .y = 8, .a = 0x84, .b = 0xffff },
};
static const u8 frontier_df3_unitdef_b_000_90F678_tail[] __attribute__((section(".data.frontier_df3_unitdef_b.gap0"))) = INCBIN_U8("graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_000_90F678.bin", 2568, 136);
u8 frontier_df3_unitdef_b_001_91020C[] __attribute__((section(".data.frontier_df3_unitdef_b.gap1"))) = INCBIN_U8("graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_001_91020C.bin");
u8 frontier_df3_unitdef_b_002_9105E0[] __attribute__((section(".data.frontier_df3_unitdef_b.gap2"))) = INCBIN_U8("graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_002_9105E0.bin");
u8 frontier_df3_unitdef_b_003_91066C[] __attribute__((section(".data.frontier_df3_unitdef_b.gap3"))) = INCBIN_U8("graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_003_91066C.bin");
u8 frontier_df3_unitdef_b_004_91075C[] __attribute__((section(".data.frontier_df3_unitdef_b.gap4"))) = INCBIN_U8("graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_004_91075C.bin");
u8 frontier_df3_unitdef_b_005_9109A8[] __attribute__((section(".data.frontier_df3_unitdef_b.gap5"))) = INCBIN_U8("graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_005_9109A8.bin", 0, 280);
struct REDA REDAs_UnitDef_Ch15AAlly_1_0[] __attribute__((section(".data.frontier_df3_unitdef_b.gap5"))) =
{
    { .x = 1, .y = 19, .b = 0xffff },
};
struct REDA REDAs_UnitDef_Ch15AAlly_1_1[] __attribute__((section(".data.frontier_df3_unitdef_b.gap5"))) =
{
    { .x = 2, .y = 20, .b = 0xfffe },
};
struct REDA REDAs_UnitDef_Ch15AAlly_1_2[] __attribute__((section(".data.frontier_df3_unitdef_b.gap5"))) =
{
    { .x = 3, .y = 21, .b = 0xfffe },
};
static const u8 frontier_df3_unitdef_b_005_9109A8_gap0[] __attribute__((section(".data.frontier_df3_unitdef_b.gap5"))) = INCBIN_U8("graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_005_9109A8.bin", 304, 56);
struct REDA REDAs_UnitDef_Ch15AEnemy_6_0[] __attribute__((section(".data.frontier_df3_unitdef_b.gap5"))) =
{
    { .x = 1, .y = 18, .b = 0xffff },
};
struct REDA REDAs_UnitDef_Ch15AEnemy_6_1[] __attribute__((section(".data.frontier_df3_unitdef_b.gap5"))) =
{
    { .x = 2, .y = 19, .b = 0xffff },
};
struct REDA REDAs_UnitDef_Ch15AEnemy_6_2[] __attribute__((section(".data.frontier_df3_unitdef_b.gap5"))) =
{
    { .x = 2, .y = 17, .b = 0xffff },
};
struct REDA REDAs_UnitDef_Ch15AEnemy_6_3[] __attribute__((section(".data.frontier_df3_unitdef_b.gap5"))) =
{
    { .x = 3, .y = 20, .b = 0xffff },
};
struct REDA REDAs_UnitDef_Ch15AEnemy_6_4[] __attribute__((section(".data.frontier_df3_unitdef_b.gap5"))) =
{
    { .x = 3, .y = 18, .b = 0xffff },
};
struct REDA REDAs_UnitDef_Ch15AEnemy_6_5[] __attribute__((section(".data.frontier_df3_unitdef_b.gap5"))) =
{
    { .x = 4, .y = 17, .b = 0xffff },
};
struct REDA REDAs_UnitDef_Ch15AEnemy_6_6[] __attribute__((section(".data.frontier_df3_unitdef_b.gap5"))) =
{
    { .x = 1, .y = 16, .b = 0xffff },
};
static const u8 frontier_df3_unitdef_b_005_9109A8_tail[] __attribute__((section(".data.frontier_df3_unitdef_b.gap5"))) = INCBIN_U8("graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_005_9109A8.bin", 416, 1240);
u8 frontier_df3_unitdef_b_006_911070[] __attribute__((section(".data.frontier_df3_unitdef_b.gap6"))) = INCBIN_U8("graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_006_911070.bin");
u8 frontier_df3_unitdef_b_007_911200[] __attribute__((section(".data.frontier_df3_unitdef_b.gap7"))) = INCBIN_U8("graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_007_911200.bin", 0, 120);
struct REDA REDAs_UnitDef_Ch16AEnemy_2_0[] __attribute__((section(".data.frontier_df3_unitdef_b.gap7"))) =
{
    { .x = 0, .y = 22, .flags = 0x1e, .b = 0xffff },
};
struct REDA REDAs_UnitDef_Ch16AEnemy_2_1[] __attribute__((section(".data.frontier_df3_unitdef_b.gap7"))) =
{
    { .x = 1, .y = 25, .flags = 0x1e, .b = 0xffff },
};
struct REDA REDAs_UnitDef_Ch16AEnemy_2_2[] __attribute__((section(".data.frontier_df3_unitdef_b.gap7"))) =
{
    { .x = 0, .y = 20, .b = 0xffff },
};
struct REDA REDAs_UnitDef_Ch16AEnemy_3_0[] __attribute__((section(".data.frontier_df3_unitdef_b.gap7"))) =
{
    { .x = 3, .y = 27, .flags = 0x1e, .b = 0xffff },
};
struct REDA REDAs_UnitDef_Ch16AEnemy_3_1[] __attribute__((section(".data.frontier_df3_unitdef_b.gap7"))) =
{
    { .x = 5, .y = 26, .flags = 0x1e, .b = 0xffff },
};
struct REDA REDAs_UnitDef_Ch16AEnemy_3_2[] __attribute__((section(".data.frontier_df3_unitdef_b.gap7"))) =
{
    { .x = 7, .y = 27, .flags = 0x1e, .b = 0xffff },
};
struct REDA REDAs_UnitDef_Ch16AEnemy_4_0[] __attribute__((section(".data.frontier_df3_unitdef_b.gap7"))) =
{
    { .x = 14, .y = 24, .b = 0xffff },
};
struct REDA REDAs_UnitDef_Ch16AEnemy_4_1[] __attribute__((section(".data.frontier_df3_unitdef_b.gap7"))) =
{
    { .x = 14, .y = 26, .b = 0xffff },
};
struct REDA REDAs_UnitDef_Ch16AEnemy_4_2[] __attribute__((section(".data.frontier_df3_unitdef_b.gap7"))) =
{
    { .x = 16, .y = 26, .b = 0xffff },
};
static const u8 frontier_df3_unitdef_b_007_911200_gap0[] __attribute__((section(".data.frontier_df3_unitdef_b.gap7"))) = INCBIN_U8("graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_007_911200.bin", 192, 8);
struct REDA REDAs_UnitDef_Ch16AAlly_0_0[] __attribute__((section(".data.frontier_df3_unitdef_b.gap7"))) =
{
    { .x = 13, .y = 7, .b = 0xffff, .delayFrames = 8 },
};
struct REDA REDAs_UnitDef_Ch16AAlly_1_0[] __attribute__((section(".data.frontier_df3_unitdef_b.gap7"))) =
{
    { .x = 13, .y = 5, .flags = 0x8, .b = 0xffff },
    { .x = 13, .y = 3, .flags = 0x8, .b = 0xffff },
};
struct REDA REDAs_UnitDef_Ch16AAlly_1_1[] __attribute__((section(".data.frontier_df3_unitdef_b.gap7"))) =
{
    { .x = 12, .y = 5, .b = 0xffff },
    { .x = 13, .y = 5, .flags = 0x8, .a = 0xf },
    { .x = 13, .y = 3, .flags = 0x8, .b = 0xffff },
};
struct REDA REDAs_UnitDef_Ch16AAlly_1_2[] __attribute__((section(".data.frontier_df3_unitdef_b.gap7"))) =
{
    { .x = 13, .y = 7, .b = 0xffff },
    { .x = 13, .y = 3, .flags = 0x8, .a = 0x1, .b = 0x1 },
};
struct REDA REDAs_UnitDef_Ch16AAlly_3_0[] __attribute__((section(".data.frontier_df3_unitdef_b.gap7"))) =
{
    { .x = 13, .y = 5, .flags = 0x10, .b = 0xffff },
    { .x = 12, .y = 5, .flags = 0x10, .b = 0xffff },
};
struct REDA REDAs_UnitDef_Ch16AAlly_3_1[] __attribute__((section(".data.frontier_df3_unitdef_b.gap7"))) =
{
    { .x = 13, .y = 5, .flags = 0x10, .a = 0xf },
    { .x = 14, .y = 5, .flags = 0x10, .b = 0xffff },
};
struct REDA REDAs_UnitDef_Ch16AAlly_3_2[] __attribute__((section(".data.frontier_df3_unitdef_b.gap7"))) =
{
    { .x = 13, .y = 4, .flags = 0x10, .a = 0x1, .b = 0xffff },
    { .x = 11, .y = 4, .flags = 0x10, .b = 0xffff },
};
struct REDA REDAs_UnitDef_Ch16AAlly_4_0[] __attribute__((section(".data.frontier_df3_unitdef_b.gap7"))) =
{
    { .x = 12, .y = 11, .flags = 0x10, .b = 0xffff },
};
struct REDA REDAs_UnitDef_Ch16AAlly_4_1[] __attribute__((section(".data.frontier_df3_unitdef_b.gap7"))) =
{
    { .x = 14, .y = 11, .flags = 0x10, .b = 0xffff },
    { .x = 15, .y = 11, .flags = 0x10, .b = 0xffff },
};
struct REDA REDAs_UnitDef_Ch16AAlly_4_2[] __attribute__((section(".data.frontier_df3_unitdef_b.gap7"))) =
{
    { .x = 16, .y = 11, .flags = 0x10, .b = 0xffff },
};
struct REDA REDAs_UnitDef_Ch16AAlly_4_3[] __attribute__((section(".data.frontier_df3_unitdef_b.gap7"))) =
{
    { .x = 12, .y = 5, .b = 0xffff },
    { .x = 13, .y = 5, .flags = 0x8, .b = 0xffff },
    { .x = 13, .y = 11, .flags = 0x10, .a = 0x1e, .b = 0xffff, .delayFrames = 30 },
};
struct REDA REDAs_UnitDef_Ch16AAlly_4_4[] __attribute__((section(".data.frontier_df3_unitdef_b.gap7"))) =
{
    { .x = 14, .y = 5, .b = 0xffff },
    { .x = 14, .y = 11, .flags = 0x10, .a = 0x1e, .b = 0xffff, .delayFrames = 30 },
};
struct REDA REDAs_UnitDef_Ch16AAlly_4_5[] __attribute__((section(".data.frontier_df3_unitdef_b.gap7"))) =
{
    { .x = 11, .y = 4, .b = 0xffff },
    { .x = 11, .y = 11, .flags = 0x10, .a = 0x1e, .b = 0xffff, .delayFrames = 30 },
};
static const u8 frontier_df3_unitdef_b_007_911200_tail[] __attribute__((section(".data.frontier_df3_unitdef_b.gap7"))) = INCBIN_U8("graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_007_911200.bin", 400, 240);
u8 frontier_df3_unitdef_b_008_9117C8[] __attribute__((section(".data.frontier_df3_unitdef_b.gap8"))) = INCBIN_U8("graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_008_9117C8.bin");
u8 frontier_df3_unitdef_b_009_91187C[] __attribute__((section(".data.frontier_df3_unitdef_b.gap9"))) = INCBIN_U8("graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_009_91187C.bin");
u8 frontier_df3_unitdef_b_010_9119D0[] __attribute__((section(".data.frontier_df3_unitdef_b.gap10"))) = INCBIN_U8("graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_010_9119D0.bin");
struct REDA REDAs_UnitDef_Ch16AAlly_5_0[] __attribute__((section(".data.frontier_df3_unitdef_b.gap11"))) =
{
    { .x = 13, .y = 7, .flags = 0x18, .b = 0xffff },
    { .x = 12, .y = 7, .flags = 0x18, .b = 0xffff },
    { .x = 9, .y = 7, .flags = 0x18, .b = 0xffff },
    { .x = 9, .y = 5, .flags = 0x18, .b = 0xffff },
};
struct REDA REDAs_UnitDef_Ch16AAlly_5_1[] __attribute__((section(".data.frontier_df3_unitdef_b.gap11"))) =
{
    { .x = 10, .y = 7, .flags = 0x18, .a = 0xf },
    { .x = 10, .y = 5, .flags = 0x18, .b = 0xffff },
};
struct REDA REDAs_UnitDef_Ch16AAlly_5_2[] __attribute__((section(".data.frontier_df3_unitdef_b.gap11"))) =
{
    { .x = 8, .y = 7, .flags = 0x18, .a = 0xf, .b = 0x1 },
    { .x = 8, .y = 6, .flags = 0x18, .b = 0xffff },
};
struct REDA REDAs_UnitDef_Ch16AAlly_5_3[] __attribute__((section(".data.frontier_df3_unitdef_b.gap11"))) =
{
    { .x = 9, .y = 7, .flags = 0x18, .a = 0x2, .b = 0xffff },
};
struct REDA REDAs_UnitDef_Ch16AAlly_5_4[] __attribute__((section(".data.frontier_df3_unitdef_b.gap11"))) =
{
    { .x = 10, .y = 7, .flags = 0x18, .a = 0x2, .b = 0xffff, .delayFrames = 16 },
};
struct REDA REDAs_UnitDef_Ch16AAlly_5_5[] __attribute__((section(".data.frontier_df3_unitdef_b.gap11"))) =
{
    { .x = 11, .y = 7, .flags = 0x18, .a = 0x2, .b = 0xffff, .delayFrames = 32 },
};
struct REDA REDAs_UnitDef_Ch16AAlly_5_6[] __attribute__((section(".data.frontier_df3_unitdef_b.gap11"))) =
{
    { .x = 13, .y = 7, .flags = 0x18, .a = 0xb, .b = 0xffff },
};
struct REDA REDAs_UnitDef_Ch16AAlly_5_7[] __attribute__((section(".data.frontier_df3_unitdef_b.gap11"))) =
{
    { .x = 12, .y = 8, .flags = 0x18, .a = 0xb, .b = 0xffff },
};
struct REDA REDAs_UnitDef_Ch16AAlly_5_8[] __attribute__((section(".data.frontier_df3_unitdef_b.gap11"))) =
{
    { .x = 13, .y = 8, .flags = 0x18, .a = 0xb, .b = 0xffff },
};
u8 frontier_df3_unitdef_b_012_911C34[] __attribute__((section(".data.frontier_df3_unitdef_b.gap12"))) = INCBIN_U8("graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_012_911C34.bin", 0, 92);
struct REDA REDAs_UnitDef_Ch16AAlly_8_0[] __attribute__((section(".data.frontier_df3_unitdef_b.gap12"))) =
{
    { .x = 7, .y = 10, .flags = 0x10, .b = 0xffff },
};
struct REDA REDAs_UnitDef_Ch16AAlly_8_1[] __attribute__((section(".data.frontier_df3_unitdef_b.gap12"))) =
{
    { .x = 6, .y = 9, .b = 0xffff },
    { .x = 7, .y = 9, .flags = 0x10, .a = 0x40, .b = 0xffff },
};
struct REDA REDAs_UnitDef_Ch16AAlly_8_2[] __attribute__((section(".data.frontier_df3_unitdef_b.gap12"))) =
{
    { .x = 9, .y = 9, .b = 0xffff },
    { .x = 8, .y = 9, .a = 0x40, .b = 0xffff, .delayFrames = 8 },
};
static const u8 frontier_df3_unitdef_b_012_911C34_tail[] __attribute__((section(".data.frontier_df3_unitdef_b.gap12"))) = INCBIN_U8("graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_012_911C34.bin", 132, 284);
u8 frontier_df3_unitdef_b_013_911E38[] __attribute__((section(".data.frontier_df3_unitdef_b.gap13"))) = INCBIN_U8("graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_013_911E38.bin", 0, 188);
struct REDA REDAs_UnitDef_Ch16AMixed_1_0[] __attribute__((section(".data.frontier_df3_unitdef_b.gap13"))) =
{
    { .x = 6, .y = 6, .flags = 0x10, .b = 0xffff },
    { .x = 7, .y = 6, .flags = 0x10, .a = 0xf, .b = 0xffff },
    { .x = 7, .y = 4, .flags = 0x10, .b = 0xffff },
};
struct REDA REDAs_UnitDef_Ch16AMixed_1_1[] __attribute__((section(".data.frontier_df3_unitdef_b.gap13"))) =
{
    { .x = 7, .y = 3, .flags = 0x10, .a = 0x2 },
};
struct REDA REDAs_UnitDef_Ch16AMixed_1_2[] __attribute__((section(".data.frontier_df3_unitdef_b.gap13"))) =
{
    { .x = 8, .y = 3, .flags = 0x10, .a = 0x2 },
};
struct REDA REDAs_UnitDef_Ch16AMixed_1_3[] __attribute__((section(".data.frontier_df3_unitdef_b.gap13"))) =
{
    { .x = 4, .y = 3, .a = 0x2, .b = 0xffff },
    { .x = 6, .y = 3, .b = 0xffff },
};
static const u8 frontier_df3_unitdef_b_013_911E38_tail[] __attribute__((section(".data.frontier_df3_unitdef_b.gap13"))) = INCBIN_U8("graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_013_911E38.bin", 244, 60);
struct REDA REDAs_UnitDef_Ch16AAlly_13_0[] __attribute__((section(".data.frontier_df3_unitdef_b.gap14"))) =
{
    { .x = 11, .y = 5, .flags = 0x10, .a = 0x2 },
    { .x = 4, .y = 5, .flags = 0x10, .b = 0xffff },
    { .x = 4, .y = 6, .flags = 0x10, .b = 0xffff },
};
struct REDA REDAs_UnitDef_Ch16AAlly_13_1[] __attribute__((section(".data.frontier_df3_unitdef_b.gap14"))) =
{
    { .x = 11, .y = 5, .flags = 0x10, .a = 0x2, .delayFrames = 16 },
    { .x = 6, .y = 5, .flags = 0x10, .b = 0xffff },
    { .x = 6, .y = 6, .flags = 0x10, .b = 0xffff },
};
struct REDA REDAs_UnitDef_Ch16AAlly_13_2[] __attribute__((section(".data.frontier_df3_unitdef_b.gap14"))) =
{
    { .x = 11, .y = 2, .flags = 0x10, .b = 0xffff },
    { .x = 11, .y = 5, .flags = 0x10, .b = 0xffff },
    { .x = 12, .y = 5, .flags = 0x10, .b = 0xffff },
    { .x = 8, .y = 5, .flags = 0x10, .a = 0xf, .b = 0xffff },
};
u8 frontier_df3_unitdef_b_015_91206C[] __attribute__((section(".data.frontier_df3_unitdef_b.gap15"))) = INCBIN_U8("graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_015_91206C.bin", 0, 100);
struct REDA REDAs_UnitDef_Ch16AAlly_15_0[] __attribute__((section(".data.frontier_df3_unitdef_b.gap15"))) =
{
    { .x = 7, .y = 5, .flags = 0x10, .b = 0xffff },
    { .x = 7, .y = 3, .flags = 0x10, .a = 0x2, .b = 0xffff },
    { .x = 7, .y = 5, .flags = 0x10, .b = 0xffff, .delayFrames = 30 },
};
struct REDA REDAs_UnitDef_Ch16AAlly_15_1[] __attribute__((section(".data.frontier_df3_unitdef_b.gap15"))) =
{
    { .x = 7, .y = 6, .flags = 0x10, .b = 0xffff, .delayFrames = 16 },
    { .x = 8, .y = 6, .flags = 0x10, .b = 0xffff },
    { .x = 8, .y = 5, .flags = 0x10, .b = 0xffff },
};
struct REDA REDAs_UnitDef_Ch16AAlly_15_2[] __attribute__((section(".data.frontier_df3_unitdef_b.gap15"))) =
{
    { .x = 7, .y = 7, .flags = 0x10, .b = 0xffff, .delayFrames = 32 },
    { .x = 6, .y = 7, .flags = 0x10, .b = 0xffff },
    { .x = 6, .y = 6, .flags = 0x10, .b = 0xffff },
};
static const u8 frontier_df3_unitdef_b_015_91206C_tail[] __attribute__((section(".data.frontier_df3_unitdef_b.gap15"))) = INCBIN_U8("graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_015_91206C.bin", 172, 48);
u8 frontier_df3_unitdef_b_016_912198[] __attribute__((section(".data.frontier_df3_unitdef_b.gap16"))) = INCBIN_U8("graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_016_912198.bin", 0, 444);
struct REDA REDAs_UnitDef_Ch17AAlly_2_0[] __attribute__((section(".data.frontier_df3_unitdef_b.gap16"))) =
{
    { .x = 12, .y = 8, .b = 0xffff },
};
struct REDA REDAs_UnitDef_Ch17AAlly_2_1[] __attribute__((section(".data.frontier_df3_unitdef_b.gap16"))) =
{
    { .x = 13, .y = 8, .b = 0xffff, .delayFrames = 16 },
};
struct REDA REDAs_UnitDef_Ch17AAlly_2_2[] __attribute__((section(".data.frontier_df3_unitdef_b.gap16"))) =
{
    { .x = 14, .y = 7, .b = 0xffff, .delayFrames = 32 },
};
struct REDA REDAs_UnitDef_Ch17AAlly_2_3[] __attribute__((section(".data.frontier_df3_unitdef_b.gap16"))) =
{
    { .x = 12, .y = 7, .a = 0xf, .b = 0xffff },
};
struct REDA REDAs_UnitDef_Ch17AAlly_2_4[] __attribute__((section(".data.frontier_df3_unitdef_b.gap16"))) =
{
    { .x = 15, .y = 7, .a = 0xf, .b = 0xffff },
};
u8 frontier_df3_unitdef_b_017_912480[] __attribute__((section(".data.frontier_df3_unitdef_b.gap17"))) = INCBIN_U8("graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_017_912480.bin");
u8 frontier_df3_unitdef_b_018_912AD4[] __attribute__((section(".data.frontier_df3_unitdef_b.gap18"))) = INCBIN_U8("graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_018_912AD4.bin", 0, 2400);
struct REDA REDAs_UnitDef_Ch18AMixed_0[] __attribute__((section(".data.frontier_df3_unitdef_b.gap18"))) =
{
    { .x = 5, .y = 22, .flags = 0x10, .b = 0xfffe },
};
struct REDA REDAs_UnitDef_Ch18AMixed_1[] __attribute__((section(".data.frontier_df3_unitdef_b.gap18"))) =
{
    { .x = 4, .y = 22, .flags = 0x10, .b = 0xfffe, .delayFrames = 16 },
};
struct REDA REDAs_UnitDef_Ch18AMixed_2[] __attribute__((section(".data.frontier_df3_unitdef_b.gap18"))) =
{
    { .x = 4, .y = 23, .flags = 0x10, .b = 0xfffe, .delayFrames = 16 },
};
struct REDA REDAs_UnitDef_Ch18AMixed_3[] __attribute__((section(".data.frontier_df3_unitdef_b.gap18"))) =
{
    { .x = 3, .y = 22, .flags = 0x10, .b = 0xfffe, .delayFrames = 32 },
};
struct REDA REDAs_UnitDef_Ch18AMixed_4[] __attribute__((section(".data.frontier_df3_unitdef_b.gap18"))) =
{
    { .x = 2, .y = 23, .flags = 0x10, .b = 0xffff },
};
struct REDA REDAs_UnitDef_Ch18AMixed_5[] __attribute__((section(".data.frontier_df3_unitdef_b.gap18"))) =
{
    { .x = 2, .y = 24, .flags = 0x10, .b = 0xffff },
};
struct REDA REDAs_UnitDef_Ch18AMixed_6[] __attribute__((section(".data.frontier_df3_unitdef_b.gap18"))) =
{
    { .x = 1, .y = 22, .flags = 0x10, .b = 0xfffe, .delayFrames = 32 },
};
static const u8 frontier_df3_unitdef_b_018_912AD4_tail[] __attribute__((section(".data.frontier_df3_unitdef_b.gap18"))) = INCBIN_U8("graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_018_912AD4.bin", 2456, 380);
u8 frontier_df3_unitdef_b_019_913958[] __attribute__((section(".data.frontier_df3_unitdef_b.gap19"))) = INCBIN_U8("graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_019_913958.bin", 0, 3588);
struct REDA REDAs_UnitDef_Ch19ANPC_3_0[] __attribute__((section(".data.frontier_df3_unitdef_b.gap19"))) =
{
    { .x = 8, .y = 19, .flags = 0x10, .b = 0xffff },
};
struct REDA REDAs_UnitDef_Ch19ANPC_3_1[] __attribute__((section(".data.frontier_df3_unitdef_b.gap19"))) =
{
    { .x = 9, .y = 17, .flags = 0x10, .b = 0xffff },
    { .x = 10, .y = 17, .flags = 0x10, .b = 0xffff },
};
struct REDA REDAs_UnitDef_Ch19ANPC_3_2[] __attribute__((section(".data.frontier_df3_unitdef_b.gap19"))) =
{
    { .x = 8, .y = 17, .flags = 0x10, .b = 0xffff },
    { .x = 7, .y = 17, .flags = 0x10, .b = 0xffff },
};
struct REDA REDAs_UnitDef_Ch19ANPC_3_3[] __attribute__((section(".data.frontier_df3_unitdef_b.gap19"))) =
{
    { .x = 9, .y = 18, .flags = 0x10, .b = 0xffff },
};
u8 frontier_df3_unitdef_b_020_9148F4[] __attribute__((section(".data.frontier_df3_unitdef_b.gap20"))) = INCBIN_U8("graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_020_9148F4.bin");
u8 frontier_df3_unitdef_b_021_914BD8[] __attribute__((section(".data.frontier_df3_unitdef_b.gap21"))) = INCBIN_U8("graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_021_914BD8.bin");
u8 frontier_df3_unitdef_b_022_915038[] __attribute__((section(".data.frontier_df3_unitdef_b.gap22"))) = INCBIN_U8("graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_022_915038.bin", 0, 8);
struct REDA REDAs_UnitDef_Ch19AAlly_5_0[] __attribute__((section(".data.frontier_df3_unitdef_b.gap22"))) =
{
    { .x = 7, .y = 4, .flags = 0x10, .b = 0xffff },
};
struct REDA REDAs_UnitDef_Ch19AAlly_5_1[] __attribute__((section(".data.frontier_df3_unitdef_b.gap22"))) =
{
    { .x = 6, .y = 5, .flags = 0x10, .a = 0x19 },
};
struct REDA REDAs_UnitDef_Ch19AAlly_5_2[] __attribute__((section(".data.frontier_df3_unitdef_b.gap22"))) =
{
    { .x = 8, .y = 5, .flags = 0x10, .a = 0x19 },
};
struct REDA REDAs_UnitDef_Ch19AAlly_5_3[] __attribute__((section(".data.frontier_df3_unitdef_b.gap22"))) =
{
    { .x = 6, .y = 6, .flags = 0x10, .a = 0x19, .delayFrames = 16 },
};
struct REDA REDAs_UnitDef_Ch19AAlly_5_4[] __attribute__((section(".data.frontier_df3_unitdef_b.gap22"))) =
{
    { .x = 8, .y = 6, .flags = 0x10, .a = 0x19, .delayFrames = 16 },
};
static const u8 frontier_df3_unitdef_b_022_915038_tail[] __attribute__((section(".data.frontier_df3_unitdef_b.gap22"))) = INCBIN_U8("graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_022_915038.bin", 48, 76);
u8 frontier_df3_unitdef_b_023_91512C[] __attribute__((section(".data.frontier_df3_unitdef_b.gap23"))) = INCBIN_U8("graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_023_91512C.bin", 0, 2960);
struct REDA REDAs_UnitDef_Ch21AAlly_1_0[] __attribute__((section(".data.frontier_df3_unitdef_b.gap23"))) =
{
    { .x = 12, .y = 21, .flags = 0x10, .b = 0xffff },
};
struct REDA REDAs_UnitDef_Ch21AAlly_1_1[] __attribute__((section(".data.frontier_df3_unitdef_b.gap23"))) =
{
    { .x = 10, .y = 23, .flags = 0x10, .b = 0xffff },
    { .x = 10, .y = 21, .flags = 0x10, .b = 0xffff },
};
struct REDA REDAs_UnitDef_Ch21AAlly_1_2[] __attribute__((section(".data.frontier_df3_unitdef_b.gap23"))) =
{
    { .x = 12, .y = 22, .flags = 0x10, .a = 0xf },
};
struct REDA REDAs_UnitDef_Ch21AAlly_1_3[] __attribute__((section(".data.frontier_df3_unitdef_b.gap23"))) =
{
    { .x = 9, .y = 22, .flags = 0x10, .a = 0xf },
};
struct REDA REDAs_UnitDef_Ch21AAlly_1_4[] __attribute__((section(".data.frontier_df3_unitdef_b.gap23"))) =
{
    { .x = 11, .y = 23, .flags = 0x10, .a = 0xf, .b = 0xffff },
};
struct REDA REDAs_UnitDef_Ch21AMixed_0[] __attribute__((section(".data.frontier_df3_unitdef_b.gap23"))) =
{
    { .x = 11, .y = 3, .flags = 0x8, .b = 0xffff },
};
struct REDA REDAs_UnitDef_Ch21AMixed_1[] __attribute__((section(".data.frontier_df3_unitdef_b.gap23"))) =
{
    { .x = 11, .y = 5, .b = 0xffff },
    { .x = 11, .y = 4, .a = 0x1, .b = 0xffff },
};
u8 frontier_df3_unitdef_b_024_915E08[] __attribute__((section(".data.frontier_df3_unitdef_b.gap24"))) = INCBIN_U8("graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_024_915E08.bin");
u8 frontier_df3_unitdef_b_025_9163BC[] __attribute__((section(".data.frontier_df3_unitdef_b.gap25"))) = INCBIN_U8("graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_025_9163BC.bin", 0, 780);
struct REDA REDAs_UnitDef_Ch9BEnemy_3_0[] __attribute__((section(".data.frontier_df3_unitdef_b.gap25"))) =
{
    { .x = 19, .y = 20, .b = 0xffff },
};
struct REDA REDAs_UnitDef_Ch9BEnemy_3_1[] __attribute__((section(".data.frontier_df3_unitdef_b.gap25"))) =
{
    { .x = 20, .y = 20, .b = 0xffff },
};
struct REDA REDAs_UnitDef_Ch9BEnemy_3_2[] __attribute__((section(".data.frontier_df3_unitdef_b.gap25"))) =
{
    { .x = 22, .y = 20, .b = 0xffff },
};
static const u8 frontier_df3_unitdef_b_025_9163BC_tail[] __attribute__((section(".data.frontier_df3_unitdef_b.gap25"))) = INCBIN_U8("graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_025_9163BC.bin", 804, 1308);
u8 frontier_df3_unitdef_b_026_916D14[] __attribute__((section(".data.frontier_df3_unitdef_b.gap26"))) = INCBIN_U8("graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_026_916D14.bin", 0, 776);
struct REDA REDAs_UnitDef_Ch10BEnemy_7_0[] __attribute__((section(".data.frontier_df3_unitdef_b.gap26"))) =
{
    { .x = 17, .y = 3, .b = 0xffff },
};
struct REDA REDAs_UnitDef_Ch10BEnemy_7_1[] __attribute__((section(".data.frontier_df3_unitdef_b.gap26"))) =
{
    { .x = 19, .y = 3, .b = 0xffff },
};
struct REDA REDAs_UnitDef_Ch10BEnemy_7_2[] __attribute__((section(".data.frontier_df3_unitdef_b.gap26"))) =
{
    { .x = 18, .y = 4, .b = 0xffff },
};
struct REDA REDAs_UnitDef_Ch10BEnemy_7_3[] __attribute__((section(".data.frontier_df3_unitdef_b.gap26"))) =
{
    { .x = 18, .y = 2, .b = 0xffff },
};
struct REDA REDAs_UnitDef_Ch10BEnemy_7_4[] __attribute__((section(".data.frontier_df3_unitdef_b.gap26"))) =
{
    { .x = 17, .y = 1, .b = 0xffff },
};
struct REDA REDAs_UnitDef_Ch10BEnemy_7_5[] __attribute__((section(".data.frontier_df3_unitdef_b.gap26"))) =
{
    { .x = 19, .y = 1, .b = 0xffff },
};
static const u8 frontier_df3_unitdef_b_026_916D14_gap0[] __attribute__((section(".data.frontier_df3_unitdef_b.gap26"))) = INCBIN_U8("graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_026_916D14.bin", 824, 168);
struct REDA REDAs_UnitDef_Ch10BMixed_0_0[] __attribute__((section(".data.frontier_df3_unitdef_b.gap26"))) =
{
    { .x = 9, .y = 13, .flags = 0x10, .b = 0xffff },
    { .x = 5, .y = 13, .flags = 0x10, .b = 0xffff },
    { .x = 5, .y = 14, .flags = 0x10, .b = 0xffff },
};
struct REDA REDAs_UnitDef_Ch10BMixed_0_1[] __attribute__((section(".data.frontier_df3_unitdef_b.gap26"))) =
{
    { .x = 9, .y = 13, .flags = 0x10, .b = 0xffff },
    { .x = 6, .y = 13, .flags = 0x10, .b = 0xffff },
};
struct REDA REDAs_UnitDef_Ch10BMixed_0_2[] __attribute__((section(".data.frontier_df3_unitdef_b.gap26"))) =
{
    { .x = 9, .y = 13, .flags = 0x10, .b = 0xffff },
    { .x = 4, .y = 13, .flags = 0x10, .b = 0xffff },
};
static const u8 frontier_df3_unitdef_b_026_916D14_tail[] __attribute__((section(".data.frontier_df3_unitdef_b.gap26"))) = INCBIN_U8("graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_026_916D14.bin", 1048, 1096);
u8 frontier_df3_unitdef_b_027_917600[] __attribute__((section(".data.frontier_df3_unitdef_b.gap27"))) = INCBIN_U8("graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_027_917600.bin");
u8 frontier_df3_unitdef_b_028_9178F8[] __attribute__((section(".data.frontier_df3_unitdef_b.gap28"))) = INCBIN_U8("graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_028_9178F8.bin", 0, 2468);
struct REDA REDAs_UnitDef_Ch11BEnemy_4_0[] __attribute__((section(".data.frontier_df3_unitdef_b.gap28"))) =
{
    { .x = 1, .y = 8, .b = 0xffff },
};
struct REDA REDAs_UnitDef_Ch11BEnemy_4_1[] __attribute__((section(".data.frontier_df3_unitdef_b.gap28"))) =
{
    { .x = 1, .y = 10, .b = 0xffff },
};
static const u8 frontier_df3_unitdef_b_028_9178F8_tail[] __attribute__((section(".data.frontier_df3_unitdef_b.gap28"))) = INCBIN_U8("graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_028_9178F8.bin", 2484, 120);
u8 frontier_df3_unitdef_b_029_9184F0[] __attribute__((section(".data.frontier_df3_unitdef_b.gap29"))) = INCBIN_U8("graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_029_9184F0.bin");
u8 frontier_df3_unitdef_b_030_918784[] __attribute__((section(".data.frontier_df3_unitdef_b.gap30"))) = INCBIN_U8("graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_030_918784.bin", 0, 856);
struct REDA REDAs_UnitDef_Ch12BEnemy_1_0[] __attribute__((section(".data.frontier_df3_unitdef_b.gap30"))) =
{
    { .x = 17, .y = 2, .b = 0xffff },
};
struct REDA REDAs_UnitDef_Ch12BEnemy_1_1[] __attribute__((section(".data.frontier_df3_unitdef_b.gap30"))) =
{
    { .x = 18, .y = 1, .b = 0xffff },
};
struct REDA REDAs_UnitDef_Ch12BEnemy_1_2[] __attribute__((section(".data.frontier_df3_unitdef_b.gap30"))) =
{
    { .x = 12, .y = 2, .b = 0xffff },
};
struct REDA REDAs_UnitDef_Ch12BEnemy_1_3[] __attribute__((section(".data.frontier_df3_unitdef_b.gap30"))) =
{
    { .x = 15, .y = 1, .b = 0xffff },
};
struct REDA REDAs_UnitDef_Ch12BEnemy_1_4[] __attribute__((section(".data.frontier_df3_unitdef_b.gap30"))) =
{
    { .x = 19, .y = 3, .b = 0xffff },
};
struct REDA REDAs_UnitDef_Ch12BEnemy_1_5[] __attribute__((section(".data.frontier_df3_unitdef_b.gap30"))) =
{
    { .x = 20, .y = 5, .b = 0xffff },
};
struct REDA REDAs_UnitDef_Ch12BEnemy_2_0[] __attribute__((section(".data.frontier_df3_unitdef_b.gap30"))) =
{
    { .x = 9, .y = 4, .b = 0xffff },
};
struct REDA REDAs_UnitDef_Ch12BEnemy_2_1[] __attribute__((section(".data.frontier_df3_unitdef_b.gap30"))) =
{
    { .x = 3, .y = 3, .b = 0xffff },
};
struct REDA REDAs_UnitDef_Ch12BEnemy_2_2[] __attribute__((section(".data.frontier_df3_unitdef_b.gap30"))) =
{
    { .x = 6, .y = 2, .b = 0xffff },
};
static const u8 frontier_df3_unitdef_b_030_918784_gap0[] __attribute__((section(".data.frontier_df3_unitdef_b.gap30"))) = INCBIN_U8("graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_030_918784.bin", 928, 16);
struct REDA REDAs_UnitDef_Ch12BEnemy_4_0[] __attribute__((section(".data.frontier_df3_unitdef_b.gap30"))) =
{
    { .x = 1, .y = 28, .b = 0xffff },
};
struct REDA REDAs_UnitDef_Ch12BEnemy_4_1[] __attribute__((section(".data.frontier_df3_unitdef_b.gap30"))) =
{
    { .x = 3, .y = 27, .b = 0xffff },
};
struct REDA REDAs_UnitDef_Ch12BEnemy_4_2[] __attribute__((section(".data.frontier_df3_unitdef_b.gap30"))) =
{
    { .x = 4, .y = 29, .b = 0xffff },
};
static const u8 frontier_df3_unitdef_b_030_918784_tail[] __attribute__((section(".data.frontier_df3_unitdef_b.gap30"))) = INCBIN_U8("graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_030_918784.bin", 968, 64);
u8 frontier_df3_unitdef_b_031_918C90[] __attribute__((section(".data.frontier_df3_unitdef_b.gap31"))) = INCBIN_U8("graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_031_918C90.bin");
u8 frontier_df3_unitdef_b_032_91908C[] __attribute__((section(".data.frontier_df3_unitdef_b.gap32"))) = INCBIN_U8("graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_032_91908C.bin");
u8 frontier_df3_unitdef_b_033_9191E0[] __attribute__((section(".data.frontier_df3_unitdef_b.gap33"))) = INCBIN_U8("graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_033_9191E0.bin");
u8 frontier_df3_unitdef_b_034_919A90[] __attribute__((section(".data.frontier_df3_unitdef_b.gap34"))) = INCBIN_U8("graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_034_919A90.bin", 0, 2412);
struct REDA REDAs_UnitDef_Ch14BEnemy_8_0[] __attribute__((section(".data.frontier_df3_unitdef_b.gap34"))) =
{
    { .x = 10, .y = 3, .b = 0xffff },
};
struct REDA REDAs_UnitDef_Ch14BEnemy_8_1[] __attribute__((section(".data.frontier_df3_unitdef_b.gap34"))) =
{
    { .x = 10, .y = 5, .b = 0xffff },
};
struct REDA REDAs_UnitDef_Ch14BEnemy_8_2[] __attribute__((section(".data.frontier_df3_unitdef_b.gap34"))) =
{
    { .x = 11, .y = 4, .b = 0xffff },
};
struct REDA REDAs_UnitDef_Ch14BEnemy_9_0[] __attribute__((section(".data.frontier_df3_unitdef_b.gap34"))) =
{
    { .x = 18, .y = 3, .b = 0xffff },
};
struct REDA REDAs_UnitDef_Ch14BEnemy_9_1[] __attribute__((section(".data.frontier_df3_unitdef_b.gap34"))) =
{
    { .x = 17, .y = 4, .b = 0xffff },
};
struct REDA REDAs_UnitDef_Ch14BEnemy_9_2[] __attribute__((section(".data.frontier_df3_unitdef_b.gap34"))) =
{
    { .x = 18, .y = 5, .b = 0xffff },
};
static const u8 frontier_df3_unitdef_b_034_919A90_tail[] __attribute__((section(".data.frontier_df3_unitdef_b.gap34"))) = INCBIN_U8("graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_034_919A90.bin", 2460, 80);
u8 frontier_df3_unitdef_b_035_91A580[] __attribute__((section(".data.frontier_df3_unitdef_b.gap35"))) = INCBIN_U8("graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_035_91A580.bin");
u8 frontier_df3_unitdef_b_036_91AB20[] __attribute__((section(".data.frontier_df3_unitdef_b.gap36"))) = INCBIN_U8("graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_036_91AB20.bin");
u8 frontier_df3_unitdef_b_037_91AC38[] __attribute__((section(".data.frontier_df3_unitdef_b.gap37"))) = INCBIN_U8("graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_037_91AC38.bin", 0, 1548);
struct REDA REDAs_UnitDef_Ch15BEnemy_4_0[] __attribute__((section(".data.frontier_df3_unitdef_b.gap37"))) =
{
    { .x = 14, .y = 1, .b = 0xffff },
};
struct REDA REDAs_UnitDef_Ch15BEnemy_4_1[] __attribute__((section(".data.frontier_df3_unitdef_b.gap37"))) =
{
    { .x = 16, .y = 1, .b = 0xffff },
};
struct REDA REDAs_UnitDef_Ch15BEnemy_4_2[] __attribute__((section(".data.frontier_df3_unitdef_b.gap37"))) =
{
    { .x = 5, .y = 1, .b = 0xffff },
};
struct REDA REDAs_UnitDef_Ch15BEnemy_5_0[] __attribute__((section(".data.frontier_df3_unitdef_b.gap37"))) =
{
    { .x = 1, .y = 18, .b = 0xffff },
};
struct REDA REDAs_UnitDef_Ch15BEnemy_5_1[] __attribute__((section(".data.frontier_df3_unitdef_b.gap37"))) =
{
    { .x = 2, .y = 21, .b = 0xffff },
};
struct REDA REDAs_UnitDef_Ch15BEnemy_5_2[] __attribute__((section(".data.frontier_df3_unitdef_b.gap37"))) =
{
    { .x = 2, .y = 17, .b = 0xffff },
};
struct REDA REDAs_UnitDef_Ch15BEnemy_5_3[] __attribute__((section(".data.frontier_df3_unitdef_b.gap37"))) =
{
    { .x = 3, .y = 20, .b = 0xffff },
};
struct REDA REDAs_UnitDef_Ch15BEnemy_5_4[] __attribute__((section(".data.frontier_df3_unitdef_b.gap37"))) =
{
    { .x = 3, .y = 18, .b = 0xffff },
};
struct REDA REDAs_UnitDef_Ch15BEnemy_5_5[] __attribute__((section(".data.frontier_df3_unitdef_b.gap37"))) =
{
    { .x = 4, .y = 17, .b = 0xffff },
};
struct REDA REDAs_UnitDef_Ch15BEnemy_5_6[] __attribute__((section(".data.frontier_df3_unitdef_b.gap37"))) =
{
    { .x = 1, .y = 16, .b = 0xffff },
};
static const u8 frontier_df3_unitdef_b_037_91AC38_tail[] __attribute__((section(".data.frontier_df3_unitdef_b.gap37"))) = INCBIN_U8("graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_037_91AC38.bin", 1628, 1436);
u8 frontier_df3_unitdef_b_038_91B948[] __attribute__((section(".data.frontier_df3_unitdef_b.gap38"))) = INCBIN_U8("graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_038_91B948.bin", 0, 356);
struct REDA REDAs_UnitDef_Ch16BEnemy_2_0[] __attribute__((section(".data.frontier_df3_unitdef_b.gap38"))) =
{
    { .x = 3, .y = 26, .b = 0xffff },
};
struct REDA REDAs_UnitDef_Ch16BEnemy_2_1[] __attribute__((section(".data.frontier_df3_unitdef_b.gap38"))) =
{
    { .x = 3, .y = 27, .b = 0xffff },
};
struct REDA REDAs_UnitDef_Ch16BEnemy_2_2[] __attribute__((section(".data.frontier_df3_unitdef_b.gap38"))) =
{
    { .x = 5, .y = 26, .b = 0xffff },
};
struct REDA REDAs_UnitDef_Ch16BEnemy_2_3[] __attribute__((section(".data.frontier_df3_unitdef_b.gap38"))) =
{
    { .x = 5, .y = 27, .b = 0xffff },
};
struct REDA REDAs_UnitDef_Ch16BEnemy_4_0[] __attribute__((section(".data.frontier_df3_unitdef_b.gap38"))) =
{
    { .x = 14, .y = 24, .b = 0xffff },
};
struct REDA REDAs_UnitDef_Ch16BEnemy_4_1[] __attribute__((section(".data.frontier_df3_unitdef_b.gap38"))) =
{
    { .x = 16, .y = 24, .b = 0xffff },
};
struct REDA REDAs_UnitDef_Ch16BEnemy_4_2[] __attribute__((section(".data.frontier_df3_unitdef_b.gap38"))) =
{
    { .x = 14, .y = 26, .b = 0xffff },
};
struct REDA REDAs_UnitDef_Ch16BEnemy_4_3[] __attribute__((section(".data.frontier_df3_unitdef_b.gap38"))) =
{
    { .x = 16, .y = 26, .b = 0xffff },
};
u8 frontier_df3_unitdef_b_039_91BED4[] __attribute__((section(".data.frontier_df3_unitdef_b.gap39"))) = INCBIN_U8("graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_039_91BED4.bin");
u8 frontier_df3_unitdef_b_040_91BF9C[] __attribute__((section(".data.frontier_df3_unitdef_b.gap40"))) = INCBIN_U8("graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_040_91BF9C.bin");
u8 frontier_df3_unitdef_b_041_91C104[] __attribute__((section(".data.frontier_df3_unitdef_b.gap41"))) = INCBIN_U8("graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_041_91C104.bin");
u8 frontier_df3_unitdef_b_042_91C230[] __attribute__((section(".data.frontier_df3_unitdef_b.gap42"))) = INCBIN_U8("graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_042_91C230.bin");
u8 frontier_df3_unitdef_b_043_91D314[] __attribute__((section(".data.frontier_df3_unitdef_b.gap43"))) = INCBIN_U8("graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_043_91D314.bin");
u8 frontier_df3_unitdef_b_044_91D878[] __attribute__((section(".data.frontier_df3_unitdef_b.gap44"))) = INCBIN_U8("graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_044_91D878.bin");
u8 frontier_df3_unitdef_b_045_91DC24[] __attribute__((section(".data.frontier_df3_unitdef_b.gap45"))) = INCBIN_U8("graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_045_91DC24.bin");
u8 frontier_df3_unitdef_b_046_91DFD0[] __attribute__((section(".data.frontier_df3_unitdef_b.gap46"))) = INCBIN_U8("graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_046_91DFD0.bin");
u8 frontier_df3_unitdef_b_047_91E280[] __attribute__((section(".data.frontier_df3_unitdef_b.gap47"))) = INCBIN_U8("graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_047_91E280.bin");
u8 frontier_df3_unitdef_b_048_91E7A8[] __attribute__((section(".data.frontier_df3_unitdef_b.gap48"))) = INCBIN_U8("graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_048_91E7A8.bin");
u8 frontier_df3_unitdef_b_049_91E988[] __attribute__((section(".data.frontier_df3_unitdef_b.gap49"))) = INCBIN_U8("graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_049_91E988.bin", 0, 192);
struct REDA REDAs_UnitDef_Ch19BEnemy_8_0[] __attribute__((section(".data.frontier_df3_unitdef_b.gap49"))) =
{
    { .x = 25, .y = 2, .b = 0xfffe },
};
struct REDA REDAs_UnitDef_Ch19BEnemy_8_1[] __attribute__((section(".data.frontier_df3_unitdef_b.gap49"))) =
{
    { .x = 26, .y = 3, .b = 0xfffe },
};
struct REDA REDAs_UnitDef_Ch19BEnemy_8_2[] __attribute__((section(".data.frontier_df3_unitdef_b.gap49"))) =
{
    { .x = 27, .y = 4, .b = 0xfffe },
};
static const u8 frontier_df3_unitdef_b_049_91E988_tail[] __attribute__((section(".data.frontier_df3_unitdef_b.gap49"))) = INCBIN_U8("graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_049_91E988.bin", 216, 428);
u8 frontier_df3_unitdef_b_050_91EE14[] __attribute__((section(".data.frontier_df3_unitdef_b.gap50"))) = INCBIN_U8("graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_050_91EE14.bin");
u8 frontier_df3_unitdef_b_051_91F300[] __attribute__((section(".data.frontier_df3_unitdef_b.gap51"))) = INCBIN_U8("graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_051_91F300.bin", 0, 428);
struct REDA REDAs_UnitDef_Ch21BMixed_0[] __attribute__((section(".data.frontier_df3_unitdef_b.gap51"))) =
{
    { .x = 11, .y = 3, .flags = 0x8, .b = 0xffff },
};
u8 frontier_df3_unitdef_b_052_91F89C[] __attribute__((section(".data.frontier_df3_unitdef_b.gap52"))) = INCBIN_U8("graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_052_91F89C.bin");
u8 frontier_df3_unitdef_b_053_91FAF4[] __attribute__((section(".data.frontier_df3_unitdef_b.gap53"))) = INCBIN_U8("graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_053_91FAF4.bin");
u8 frontier_df3_unitdef_b_054_91FD38[] __attribute__((section(".data.frontier_df3_unitdef_b.gap54"))) = INCBIN_U8("graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_054_91FD38.bin");
u8 frontier_df3_unitdef_b_055_91FE20[] __attribute__((section(".data.frontier_df3_unitdef_b.gap55"))) = INCBIN_U8("graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_055_91FE20.bin");
u8 frontier_df3_unitdef_b_056_920140[] __attribute__((section(".data.frontier_df3_unitdef_b.gap56"))) = INCBIN_U8("graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_056_920140.bin");
u8 frontier_df3_unitdef_b_057_92042C[] __attribute__((section(".data.frontier_df3_unitdef_b.gap57"))) = INCBIN_U8("graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_057_92042C.bin");
u8 frontier_df3_unitdef_b_058_920698[] __attribute__((section(".data.frontier_df3_unitdef_b.gap58"))) = INCBIN_U8("graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_058_920698.bin");
u8 frontier_df3_unitdef_b_059_920AD0[] __attribute__((section(".data.frontier_df3_unitdef_b.gap59"))) = INCBIN_U8("graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_059_920AD0.bin");
u8 frontier_df3_unitdef_b_060_921140[] __attribute__((section(".data.frontier_df3_unitdef_b.gap60"))) = INCBIN_U8("graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_060_921140.bin");
u8 frontier_df3_unitdef_b_061_9212BC[] __attribute__((section(".data.frontier_df3_unitdef_b.gap61"))) = INCBIN_U8("graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_061_9212BC.bin");
u8 frontier_df3_unitdef_b_062_9218FC[] __attribute__((section(".data.frontier_df3_unitdef_b.gap62"))) = INCBIN_U8("graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_062_9218FC.bin");
u8 frontier_df3_unitdef_b_063_921E38[] __attribute__((section(".data.frontier_df3_unitdef_b.gap63"))) = INCBIN_U8("graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_063_921E38.bin");
u8 frontier_df3_unitdef_b_064_921F00[] __attribute__((section(".data.frontier_df3_unitdef_b.gap64"))) = INCBIN_U8("graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_064_921F00.bin");
u8 frontier_df3_unitdef_b_065_922388[] __attribute__((section(".data.frontier_df3_unitdef_b.gap65"))) = INCBIN_U8("graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_065_922388.bin");
u8 frontier_df3_unitdef_b_066_92275C[] __attribute__((section(".data.frontier_df3_unitdef_b.gap66"))) = INCBIN_U8("graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_066_92275C.bin");
u8 frontier_df3_unitdef_b_067_922B08[] __attribute__((section(".data.frontier_df3_unitdef_b.gap67"))) = INCBIN_U8("graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_067_922B08.bin");
u8 frontier_df3_unitdef_b_068_922FCC[] __attribute__((section(".data.frontier_df3_unitdef_b.gap68"))) = INCBIN_U8("graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_068_922FCC.bin");
u8 frontier_df3_unitdef_b_069_9233F8[] __attribute__((section(".data.frontier_df3_unitdef_b.gap69"))) = INCBIN_U8("graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_069_9233F8.bin");
u8 frontier_df3_unitdef_b_070_923510[] __attribute__((section(".data.frontier_df3_unitdef_b.gap70"))) = INCBIN_U8("graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_070_923510.bin");
u8 frontier_df3_unitdef_b_071_92395C[] __attribute__((section(".data.frontier_df3_unitdef_b.gap71"))) = INCBIN_U8("graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_071_92395C.bin");
u8 frontier_df3_unitdef_b_072_923AD8[] __attribute__((section(".data.frontier_df3_unitdef_b.gap72"))) = INCBIN_U8("graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_072_923AD8.bin");
u8 frontier_df3_unitdef_b_073_923F38[] __attribute__((section(".data.frontier_df3_unitdef_b.gap73"))) = INCBIN_U8("graphics/frontier_df3_unitdef_b/frontier_df3_unitdef_b_073_923F38.bin");
