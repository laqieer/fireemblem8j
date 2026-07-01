#include "global.h"
#include "proc.h"
#define PROC_WORDS(op, pa, p) { (op), (pa), (void *)(p) }

/* Migrated from asm/frontier_df4_uistuff.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */

u8 frontier_df4_uistuff_000_57A504[] __attribute__((section(".data.frontier_df4_uistuff.gap0"))) = INCBIN_U8("graphics/frontier_df4_uistuff/frontier_df4_uistuff_000_57A504.bin");
u8 frontier_df4_uistuff_001_57B23C[] __attribute__((section(".data.frontier_df4_uistuff.gap1"))) = INCBIN_U8("graphics/frontier_df4_uistuff/frontier_df4_uistuff_001_57B23C.bin");
u8 frontier_df4_uistuff_002_57BF74[] __attribute__((section(".data.frontier_df4_uistuff.gap2"))) = INCBIN_U8("graphics/frontier_df4_uistuff/frontier_df4_uistuff_002_57BF74.bin");
u8 frontier_df4_uistuff_003_57CC64[] __attribute__((section(".data.frontier_df4_uistuff.gap3"))) = INCBIN_U8("graphics/frontier_df4_uistuff/frontier_df4_uistuff_003_57CC64.bin");
u8 frontier_df4_uistuff_004_57CF7C[] __attribute__((section(".data.frontier_df4_uistuff.gap4"))) = INCBIN_U8("graphics/frontier_df4_uistuff/frontier_df4_uistuff_004_57CF7C.bin");
u8 frontier_df4_uistuff_005_57DFCC[] __attribute__((section(".data.frontier_df4_uistuff.gap5"))) = INCBIN_U8("graphics/frontier_df4_uistuff/frontier_df4_uistuff_005_57DFCC.bin");
u8 frontier_df4_uistuff_006_57E4DC[] __attribute__((section(".data.frontier_df4_uistuff.gap6"))) = INCBIN_U8("graphics/frontier_df4_uistuff/frontier_df4_uistuff_006_57E4DC.bin");
u8 frontier_df4_uistuff_007_59140C[] __attribute__((section(".data.frontier_df4_uistuff.gap7"))) = INCBIN_U8("graphics/frontier_df4_uistuff/frontier_df4_uistuff_007_59140C.bin");
u8 frontier_df4_uistuff_008_5946F4[] __attribute__((section(".data.frontier_df4_uistuff.gap8"))) = INCBIN_U8("graphics/frontier_df4_uistuff/frontier_df4_uistuff_008_5946F4.bin");
u8 frontier_df4_uistuff_009_594B2C[] __attribute__((section(".data.frontier_df4_uistuff.gap9"))) = INCBIN_U8("graphics/frontier_df4_uistuff/frontier_df4_uistuff_009_594B2C.bin");
u8 frontier_df4_uistuff_010_595B34[] __attribute__((section(".data.frontier_df4_uistuff.gap10"))) = INCBIN_U8("graphics/frontier_df4_uistuff/frontier_df4_uistuff_010_595B34.bin");
u8 frontier_df4_uistuff_011_59662C[] __attribute__((section(".data.frontier_df4_uistuff.gap11"))) = INCBIN_U8("graphics/frontier_df4_uistuff/frontier_df4_uistuff_011_59662C.bin");
u8 frontier_df4_uistuff_012_596F74[] __attribute__((section(".data.frontier_df4_uistuff.gap12"))) = INCBIN_U8("graphics/frontier_df4_uistuff/frontier_df4_uistuff_012_596F74.bin");
u8 frontier_df4_uistuff_013_5987EC[] __attribute__((section(".data.frontier_df4_uistuff.gap13"))) = INCBIN_U8("graphics/frontier_df4_uistuff/frontier_df4_uistuff_013_5987EC.bin");
u8 frontier_df4_uistuff_014_598E64[] __attribute__((section(".data.frontier_df4_uistuff.gap14"))) = INCBIN_U8("graphics/frontier_df4_uistuff/frontier_df4_uistuff_014_598E64.bin");
u8 frontier_df4_uistuff_015_599BE4[] __attribute__((section(".data.frontier_df4_uistuff.gap15"))) = INCBIN_U8("graphics/frontier_df4_uistuff/frontier_df4_uistuff_015_599BE4.bin");
u8 frontier_df4_uistuff_016_59A2EC[] __attribute__((section(".data.frontier_df4_uistuff.gap16"))) = INCBIN_U8("graphics/frontier_df4_uistuff/frontier_df4_uistuff_016_59A2EC.bin");
u8 frontier_df4_uistuff_017_59A574[] __attribute__((section(".data.frontier_df4_uistuff.gap17"))) = INCBIN_U8("graphics/frontier_df4_uistuff/frontier_df4_uistuff_017_59A574.bin");
u8 frontier_df4_uistuff_018_59B0FC[] __attribute__((section(".data.frontier_df4_uistuff.gap18"))) = INCBIN_U8("graphics/frontier_df4_uistuff/frontier_df4_uistuff_018_59B0FC.bin");
u8 frontier_df4_uistuff_019_59BA8C[] __attribute__((section(".data.frontier_df4_uistuff.gap19"))) = INCBIN_U8("graphics/frontier_df4_uistuff/frontier_df4_uistuff_019_59BA8C.bin");
u8 frontier_df4_uistuff_020_59BFE4[] __attribute__((section(".data.frontier_df4_uistuff.gap20"))) = INCBIN_U8("graphics/frontier_df4_uistuff/frontier_df4_uistuff_020_59BFE4.bin");
u8 frontier_df4_uistuff_021_59D034[] __attribute__((section(".data.frontier_df4_uistuff.gap21"))) = INCBIN_U8("graphics/frontier_df4_uistuff/frontier_df4_uistuff_021_59D034.bin");
u8 frontier_df4_uistuff_022_5B90D8[] __attribute__((section(".data.frontier_df4_uistuff.gap22"))) = INCBIN_U8("graphics/frontier_df4_uistuff/frontier_df4_uistuff_022_5B90D8.bin");
u8 frontier_df4_uistuff_023_5B9454[] __attribute__((section(".data.frontier_df4_uistuff.gap23"))) = INCBIN_U8("graphics/frontier_df4_uistuff/frontier_df4_uistuff_023_5B9454.bin", 0x0, 0x768);
u8 data_085B9BBC[] __attribute__((section(".data.frontier_df4_uistuff.gap23"))) = INCBIN_U8("graphics/frontier_df4_uistuff/frontier_df4_uistuff_023_5B9454.bin", 0x768, 0x218);
u8 frontier_df4_uistuff_024_5C1D30[] __attribute__((section(".data.frontier_df4_uistuff.gap24"))) = INCBIN_U8("graphics/frontier_df4_uistuff/frontier_df4_uistuff_024_5C1D30.bin", 0, 1800);
u8 frontier_df4_uistuff_024b_5C2458[] __attribute__((section(".data.frontier_df4_uistuff.gap24b"))) = INCBIN_U8("graphics/frontier_df4_uistuff/frontier_df4_uistuff_024_5C1D30.bin", 1832, 1120);
u8 frontier_df4_uistuff_025_5C2E50[] __attribute__((section(".data.frontier_df4_uistuff.gap25"))) = INCBIN_U8("graphics/frontier_df4_uistuff/frontier_df4_uistuff_025_5C2E50.bin");
struct ProcCmd frontier_df4_uistuff_026_5C3618[] __attribute__((section(".data.frontier_df4_uistuff.gap26"))) = {
    PROC_CALL((ProcFunc)0x08020AB5),
    PROC_REPEAT((ProcFunc)0x08020AE1),
    PROC_END,
    PROC_CALL((ProcFunc)0x080300D5),
    PROC_CALL((ProcFunc)0x0801FDE9),
    PROC_SLEEP(0x3C),
    PROC_START_CHILD((const struct ProcCmd*)0x085C3570),
    PROC_CALL_ARG((ProcFunc)0x08020D79, 0x1),
    PROC_CALL((ProcFunc)0x0801FFB5),
    PROC_REPEAT((ProcFunc)0x0801FFF1),
    PROC_CALL((ProcFunc)0x080205F1),
    PROC_START_CHILD((const struct ProcCmd*)0x085C3600),
    PROC_CALL((ProcFunc)0x08020471),
    PROC_SLEEP(0x1),
    PROC_CALL((ProcFunc)0x080201A5),
    PROC_REPEAT((ProcFunc)0x08020271),
    PROC_CALL((ProcFunc)0x0801FD95),
    PROC_START_CHILD((const struct ProcCmd*)0x085C3560),
    PROC_START_CHILD((const struct ProcCmd*)0x085C35E0),
    PROC_CALL((ProcFunc)0x0802063D),
    PROC_REPEAT((ProcFunc)0x080206D1),
    PROC_CALL_ARG((ProcFunc)0x08020D81, 0xA0),
    PROC_REPEAT((ProcFunc)0x08020D89),
    PROC_CALL((ProcFunc)0x08020739),
    PROC_REPEAT((ProcFunc)0x08020785),
    PROC_END_EACH((const struct ProcCmd*)0x085C3560),
    PROC_END_EACH((const struct ProcCmd*)0x085C3588),
    PROC_END_EACH((const struct ProcCmd*)0x085C35E0),
    PROC_CALL_ARG((ProcFunc)0x08020D79, 0x0),
    PROC_CALL((ProcFunc)0x08020819),
    PROC_CALL((ProcFunc)0x08030109),
    PROC_CALL((ProcFunc)0x08020829),
    PROC_CALL((ProcFunc)0x08020925),
    PROC_REPEAT((ProcFunc)0x0802099D),
    PROC_SLEEP(0x1E),
    PROC_GOTO(0x63),
    PROC_LABEL(0x1),
    PROC_CALL((ProcFunc)0x08020B41),
    PROC_REPEAT((ProcFunc)0x08020BA5),
    PROC_SLEEP(0x3C),
    PROC_CALL((ProcFunc)0x08020819),
    PROC_CALL((ProcFunc)0x08030109),
    PROC_CALL((ProcFunc)0x08020829),
    PROC_CALL((ProcFunc)0x08020BF9),
    PROC_REPEAT((ProcFunc)0x08020CF1),
    PROC_LABEL(0x63),
    PROC_CALL((ProcFunc)0x08020DC1),
    PROC_END,
    PROC_CALL((ProcFunc)0x080207F1),
    PROC_CALL((ProcFunc)0x08020829),
    PROC_CALL((ProcFunc)0x08020925),
    PROC_REPEAT((ProcFunc)0x08020E81),
    PROC_END,
    PROC_CALL((ProcFunc)0x08020EC1),
    PROC_REPEAT((ProcFunc)0x08020F01),
    PROC_END,
};
struct ProcCmd data_085C37D8[] __attribute__((section(".data.frontier_df4_uistuff.gap26"))) = {
    PROC_SET_END_CB((ProcFunc)0x080211CD),
    PROC_CALL((ProcFunc)0x08020FB9),
    PROC_CALL((ProcFunc)0x0807B4B9),
    PROC_START_CHILD((const struct ProcCmd*)0x085C37C0),
    PROC_REPEAT((ProcFunc)0x080210ED),
    PROC_CALL((ProcFunc)0x08021121),
    PROC_REPEAT((ProcFunc)0x0802112D),
    PROC_LABEL(0x63),
    PROC_CALL((ProcFunc)0x08021169),
    PROC_REPEAT((ProcFunc)0x080211A1),
    PROC_END,
};
/* frontier_df4_uistuff_027_5C3C9C: atomic relocation carve (was INCBIN); every embedded ROM
   pointer expressed as .4byte Sym(+addend), byte-exact. make compare is the oracle. */
__asm__(
"	.section .data.frontier_df4_uistuff.gap27, \"aw\", %progbits\n"
"	.global frontier_df4_uistuff_027_5C3C9C\n"
"frontier_df4_uistuff_027_5C3C9C:\n"
"	.4byte 0x00000001, 0x18640000, 0x00FF0001, 0x18640000, 0x00FE0001, 0x186401FF\n"
"	.4byte 0x00FD0001, 0x184A41FF, 0x00FC0001, 0x184A41FE, 0x00FB0001, 0x184A41FE\n"
"	.4byte 0x00FA0001, 0x184A41FD, frontier_df4_uistuff_027_5C3C9C, frontier_df4_uistuff_027_5C3C9C + 0x8, frontier_df4_uistuff_027_5C3C9C + 0x10, frontier_df4_uistuff_027_5C3C9C + 0x18\n"
"	.4byte frontier_df4_uistuff_027_5C3C9C + 0x20, frontier_df4_uistuff_027_5C3C9C + 0x28, frontier_df4_uistuff_027_5C3C9C + 0x30, 0x40000001, 0x18420000, 0x40010001\n"
"	.4byte 0x18620001, 0x40010001, 0x18440000, 0x40000001, 0x18420001, 0x40000001\n"
"	.4byte 0x18620002, 0x40010001, 0x18440000, 0x40000001, 0x184201FF, 0x40010001\n"
"	.4byte 0x18620001, 0x40010001, 0x18440002, sSleepIconSprites + 0x1C, sSleepIconSprites + 0x24, sSleepIconSprites + 0x2C\n"
"	.4byte sSleepIconSprites + 0x34, sSleepIconSprites + 0x3C, sSleepIconSprites + 0x44, sSleepIconSprites + 0x4C, sSleepIconSprites + 0x54, sSleepIconSprites + 0x5C\n"
"	.4byte 0x00010000, 0x00004000, 0x00011866, 0x000040FF, 0x00011846, 0x400000FE\n"
"	.4byte 0x00001848, sBerserkIconSprites + 0x26, sBerserkIconSprites + 0x2E, sBerserkIconSprites + 0x36, sBerserkIconSprites + 0x36, sBerserkIconSprites + 0x36\n"
"	.4byte sBerserkIconSprites + 0x36, sBerserkIconSprites + 0x36, sBerserkIconSprites + 0x36, sBerserkIconSprites + 0x36, sBerserkIconSprites + 0x36, sBerserkIconSprites + 0x36\n"
"	.4byte sBerserkIconSprites + 0x2E, sBerserkIconSprites + 0x26, sBerserkIconSprites + 0x24, sBerserkIconSprites + 0x24, sBerserkIconSprites + 0x24, sBerserkIconSprites + 0x24\n"
"	.4byte sBerserkIconSprites + 0x24, 0x80000002, 0x18400002, 0x000A8003, 0x00021841, 0x100280FF\n"
"	.4byte 0x80021840, 0x18411008, 0x80FE0002, 0x18400002, 0x000A8001, 0x00021841\n"
"	.4byte 0x100280FD, 0x80001840, 0x18411008, 0x80FC0001, 0x18400004, 0x80FB0001\n"
"	.4byte 0x18410004, 0x80FA0001, 0x18400004, 0x80F90001, 0x18411004, sSilenceIconSprites + 0x48\n"
"	.4byte sSilenceIconSprites + 0x56, sSilenceIconSprites + 0x64, sSilenceIconSprites + 0x72, sSilenceIconSprites + 0x80, sSilenceIconSprites + 0x88, sSilenceIconSprites + 0x90\n"
"	.4byte sSilenceIconSprites + 0x98, sSilenceIconSprites + 0x98, sBerserkIconSprites + 0x24, sBerserkIconSprites + 0x24, sBerserkIconSprites + 0x24, 0x40000002\n"
"	.4byte 0x18300000, 0x00000008, 0x00011850, 0x40000400, 0x00010000, 0x80008400\n"
"	.4byte 0x00010000, 0x80000400, 0x00010000, 0x40000800, 0x00010000, 0x80008800\n"
"	.4byte 0x00010000, 0x80000800, 0x00000000, 0x00000050, 0x000000A0, 0x000000F0\n"
"	.4byte 0x000000F1, 0x00000004, 0x080297E1, 0x00000002, 0x08015385, 0x00000008\n"
"	.4byte ProcScr_CamMove, 0x00000002, 0x08029591, 0x00000008, ProcScr_CamMove, 0x00000003\n"
"	.4byte 0x08029645, 0x00000002, 0x08029771, 0x0000000E, 0x00000000, 0x00000002\n"
"	.4byte 0x08015395, 0x0064000C, 0x00000000, 0x0063000B, 0x00000000, 0x00000002\n"
"	.4byte 0x080297AD, 0x0000000E, 0x00000000, 0x00000002, 0x08015395, 0x0064000B\n"
"	.4byte 0x00000000, 0x00000000, 0x00000000, 0x00000002, 0x08015385, 0x00000002\n"
"	.4byte 0x08029D25, 0x00000008, ProcScr_CamMove, 0x00000003, 0x08029D7D, 0x00000002\n"
"	.4byte 0x08029771, 0x0064000C, 0x00000000, 0x0063000B, 0x00000000, 0x00000002\n"
"	.4byte 0x080297AD, 0x0064000B, 0x00000000, 0x00000002, 0x08015395, 0x00000000\n"
"	.4byte 0x00000000, 0xFFF10100, 0x010F0200, 0xFFF10201, 0x010F0001, 0xFFF10002\n"
"	.4byte 0x010F0102, 0xFFF10705, 0x010F0605, 0xFFF10506, 0x010F0706, 0xFFF10607\n"
"	.4byte 0x010F0507, 0x000000FF, 0x0001000E, 0x00000000, 0x00000002, 0x0802CB55\n"
"	.4byte 0x00000000, 0x00000000, 0x00090002, 0x000B0002, 0x000D0002, 0x000F0002\n"
"	.4byte 0x00110002, 0x00090010, 0x000B0010, 0x000D0010, 0x000F0010, 0x00110010\n"
"	.4byte 0x00000002, 0x0802D2F1, 0x00000003, 0x0802D2F9, 0x00000000, 0x00000000\n"
"	.4byte 0x00000002, 0x08015385, 0x0000000E, 0x00000000, 0x00000008, ProcScr_CamMove\n"
"	.4byte 0x00000002, 0x0802D6CD, 0x00000002, 0x0802D219, 0x00000005, gTradeItemDisplayTileLocation + 0x28\n"
"	.4byte 0x0065000B, 0x00000000, 0x00000002, 0x0802E079, 0x00000016, 0x0802DA35\n"
"	.4byte 0x0000000E, 0x00000000, 0x0000000B, 0x00000000, 0x00000002, 0x0802D759\n"
"	.4byte 0x00000003, 0x0802D76D, 0x0001000B, 0x00000000, 0x00000002, 0x0802D851\n"
"	.4byte 0x00000003, 0x0802D8B9, 0x00000002, 0x0802D9E5, 0x0000000C, 0x00000000\n"
"	.4byte 0x0002000B, 0x00000000, 0x00000002, 0x0802DA81, 0x00000002, 0x0804F611\n"
"	.4byte 0x00000002, 0x08015395, 0x00000000, 0x00000000, 0x00000002, 0x0802DA95\n"
"	.4byte 0x00000003, 0x0802DB3D, 0x00000002, 0x0802DC11, 0x00000000, 0x00000000\n"
"	.4byte 0x00000004, 0x0802DD09, 0x00000003, 0x0802DD09, 0x00000000, 0x00000000\n"
"	.4byte 0x00000004, 0x0802DD41, 0x00000003, 0x0802DD41, 0x00000000, 0x00000000\n"
);
u8 frontier_df4_uistuff_028_5C411C[] __attribute__((section(".data.frontier_df4_uistuff.gap28"))) = INCBIN_U8("graphics/frontier_df4_uistuff/frontier_df4_uistuff_028_5C411C.bin");
u8 frontier_df4_uistuff_029_5C4A94[] __attribute__((section(".data.frontier_df4_uistuff.gap29"))) = INCBIN_U8("graphics/frontier_df4_uistuff/frontier_df4_uistuff_029_5C4A94.bin");
u8 frontier_df4_uistuff_030_5C534C[] __attribute__((section(".data.frontier_df4_uistuff.gap30"))) = INCBIN_U8("graphics/frontier_df4_uistuff/frontier_df4_uistuff_030_5C534C.bin", 0x0, 0x1F8);
u8 data_085C5544[] __attribute__((section(".data.frontier_df4_uistuff.gap30"))) = INCBIN_U8("graphics/frontier_df4_uistuff/frontier_df4_uistuff_030_5C534C.bin", 0x1F8, 0x434);
u8 frontier_df4_uistuff_031_5C5DE8[] __attribute__((section(".data.frontier_df4_uistuff.gap31"))) = INCBIN_U8("graphics/frontier_df4_uistuff/frontier_df4_uistuff_031_5C5DE8.bin");
u8 frontier_df4_uistuff_032_5C6084[] __attribute__((section(".data.frontier_df4_uistuff.gap32"))) = INCBIN_U8("graphics/frontier_df4_uistuff/frontier_df4_uistuff_032_5C6084.bin");
u8 frontier_df4_uistuff_033_5C6AD4[] __attribute__((section(".data.frontier_df4_uistuff.gap33"))) = INCBIN_U8("graphics/frontier_df4_uistuff/frontier_df4_uistuff_033_5C6AD4.bin", 0x0, 0x140);
u8 data_085C6C14[] __attribute__((section(".data.frontier_df4_uistuff.gap33"))) = INCBIN_U8("graphics/frontier_df4_uistuff/frontier_df4_uistuff_033_5C6AD4.bin", 0x140, 0x174);
u8 frontier_df4_uistuff_034_5C6E08[] __attribute__((section(".data.frontier_df4_uistuff.gap34"))) = INCBIN_U8("graphics/frontier_df4_uistuff/frontier_df4_uistuff_034_5C6E08.bin.lz");
u8 frontier_df4_uistuff_035_5CDF84[] __attribute__((section(".data.frontier_df4_uistuff.gap35"))) = INCBIN_U8("graphics/frontier_df4_uistuff/frontier_df4_uistuff_035_5CDF84.bin");
u8 frontier_df4_uistuff_036_5D14D4[] __attribute__((section(".data.frontier_df4_uistuff.gap36"))) = INCBIN_U8("graphics/frontier_df4_uistuff/frontier_df4_uistuff_036_5D14D4.bin");
u8 frontier_df4_uistuff_038_5D32D8[] __attribute__((section(".data.frontier_df4_uistuff.gap38"))) = INCBIN_U8("graphics/frontier_df4_uistuff/frontier_df4_uistuff_038_5D32D8.bin");
