#include "global.h"
#include "proc.h"

/* Migrated from asm/frontier_df4_tail.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 *
 * #143 shiftability: the proc-script run [0x08BABB6C, 0x08BABCB4) inside
 * frontier_df4_tail_000_BABAF8 held raw-hex un-relocatable interior code/name
 * pointers. Carved into the 6 named struct ProcCmd[] arrays below so those
 * pointers become R_ARM_ABS32 relocations instead of raw words that bx into the
 * pre-shift gap on the +0x40000 shifted ROM. The HEAD/TAIL .short runs stay raw
 * and byte-exact; make compare (sha1) is the only oracle. */

extern u8 data_081F6D5C[];

extern void GuideSpriteDraw_Init(ProcPtr proc);
extern void GuideSpriteDraw_Loop(ProcPtr proc);
extern void ClearGuideCategoryTilemap(ProcPtr proc);
extern void GuideMenuRefresh_SyncBg1(ProcPtr proc);
extern void PutGuideCategoryList(ProcPtr proc);
extern void BuildAndPutGuideEntryList(ProcPtr proc);
extern void PutGuideBottomBarText(ProcPtr proc);
extern void GuideMenuRefresh_SyncBg0Bg1(ProcPtr proc);
extern void GuideEntry_DrawInitial(ProcPtr proc);
extern void GuideEntry_RedrawUp(ProcPtr proc);
extern void GuideEntry_RedrawDown(ProcPtr proc);
extern void GuideDetailsRedraw_Init(ProcPtr proc);
extern void GuideDetailsRedraw_Loop(ProcPtr proc);
__asm__(
"\t.section .data.frontier_df4_tail.gap0, \"aw\", %progbits\n"
"\t.global frontier_df4_tail_000_BABAF8\n"
"frontier_df4_tail_000_BABAF8:\n"
"\t.short 0x0004, 0x4000, 0x4000, 0x00C0, 0x4000, 0x4020, 0x00C4, 0x4008, 0x4000, 0x00C8, 0x4008, 0x4020\n"
"\t.short 0x00CC, 0x0002, 0x4000, 0x8000, 0x0092, 0x4000, 0x8020, 0x0098, 0x0002, 0x0000, 0x4010, 0x0096\n"
"\t.short 0x4000, 0x8020, 0x009C, 0x0000, 0x0552, 0x0000, 0x0553, 0x0000, 0x0554, 0x0000, 0x0555, 0x0000\n"
"\t.short 0x0556, 0x0000, 0x0557, 0x0000, 0x0558, 0x0000, 0x0559, 0x0000, 0x055A, 0x0000, 0x0000, 0x055B\n"
"\t.short 0x055C, 0x055D, 0x055E, 0x055F, 0x0560, 0x0561, 0x0562, 0x0563, 0x0564, 0x0565\n"
);
struct ProcCmd gProcScr_Guide_DrawSprites[] __attribute__((section(".data.frontier_df4_tail.gap0"))) = { /* @0x08BABB6C 32B */
    PROC_NAME(&data_081F6D5C[0x5C]), PROC_CALL(GuideSpriteDraw_Init), PROC_REPEAT(GuideSpriteDraw_Loop), PROC_END,
};
struct ProcCmd gProcScr_GuideCategoryRedraw[] __attribute__((section(".data.frontier_df4_tail.gap0"))) = { /* @0x08BABB8C 96B */
    PROC_NAME(&data_081F6D5C[0x68]), PROC_SLEEP(1),
    PROC_CALL(ClearGuideCategoryTilemap), PROC_CALL(GuideMenuRefresh_SyncBg1), PROC_SLEEP(1),
    PROC_CALL(PutGuideCategoryList), PROC_SLEEP(1), PROC_CALL(BuildAndPutGuideEntryList), PROC_SLEEP(1),
    PROC_CALL(PutGuideBottomBarText), PROC_CALL(GuideMenuRefresh_SyncBg0Bg1), PROC_END,
};
struct ProcCmd gProcScr_GuideEntryListRedraw_Initial[] __attribute__((section(".data.frontier_df4_tail.gap0"))) = { /* @0x08BABBEC 80B */
    PROC_NAME(&data_081F6D5C[0x7C]), PROC_SLEEP(1),
    PROC_CALL(GuideEntry_DrawInitial), PROC_CALL(GuideMenuRefresh_SyncBg1), PROC_SLEEP(1),
    PROC_CALL(BuildAndPutGuideEntryList), PROC_SLEEP(1), PROC_CALL(PutGuideBottomBarText),
    PROC_CALL(GuideMenuRefresh_SyncBg1), PROC_END,
};
struct ProcCmd gProcScr_GuideEntryListRedraw_Up[] __attribute__((section(".data.frontier_df4_tail.gap0"))) = { /* @0x08BABC3C 40B */
    PROC_NAME(&data_081F6D5C[0x94]), PROC_SLEEP(1), PROC_CALL(GuideEntry_RedrawUp), PROC_CALL(GuideMenuRefresh_SyncBg1), PROC_END,
};
struct ProcCmd gProcScr_GuideEntryListRedraw_Down[] __attribute__((section(".data.frontier_df4_tail.gap0"))) = { /* @0x08BABC64 40B */
    PROC_NAME(&data_081F6D5C[0xA8]), PROC_SLEEP(1), PROC_CALL(GuideEntry_RedrawDown), PROC_CALL(GuideMenuRefresh_SyncBg1), PROC_END,
};
struct ProcCmd gProcScr_GuideDetailsRedraw[] __attribute__((section(".data.frontier_df4_tail.gap0"))) = { /* @0x08BABC8C 40B */
    PROC_NAME(&data_081F6D5C[0xC0]), PROC_SLEEP(1), PROC_CALL(GuideDetailsRedraw_Init), PROC_REPEAT(GuideDetailsRedraw_Loop), PROC_END,
};
__asm__(
"\t.section .data.frontier_df4_tail.gap0, \"aw\", %progbits\n"
"\t.short 0x0001, 0x0000, 0x6E30, 0x081F, 0x0002, 0x0000, 0x5385, 0x0801, 0x0002, 0x0000, 0x3E39, 0x0801\n"
"\t.short 0x0003, 0x0000, 0x4121, 0x0801, 0x0002, 0x0000, 0x00D5, 0x0803, 0x000E, 0x0000, 0x0000, 0x0000\n"
"\t.short 0x0002, 0x0000, 0x39AD, 0x080D, 0x0002, 0x0000, 0x48B5, 0x0800, 0x0002, 0x0000, 0x3E5D, 0x0801\n"
"\t.short 0x0003, 0x0000, 0x4121, 0x0801, 0x0002, 0x0000, 0x3C0D, 0x080D, 0x0003, 0x0000, 0x3CD1, 0x080D\n"
"\t.short 0x0002, 0x0000, 0x3E39, 0x0801, 0x0003, 0x0000, 0x4121, 0x0801, 0x0002, 0x0000, 0x48D9, 0x0800\n"
"\t.short 0x0002, 0x0000, 0x4141, 0x080D, 0x000E, 0x0000, 0x0000, 0x0000, 0x0002, 0x0000, 0x0109, 0x0803\n"
"\t.short 0x0002, 0x0000, 0x10F5, 0x0803, 0x0002, 0x0000, 0x3E5D, 0x0801, 0x0003, 0x0000, 0x4121, 0x0801\n"
"\t.short 0x0002, 0x0000, 0x5395, 0x0801, 0x0000, 0x0000, 0x0000, 0x0000, 0x0001, 0x0000, 0x6E30, 0x081F\n"
"\t.short 0x0002, 0x0000, 0x5385, 0x0801, 0x0002, 0x0000, 0x00D5, 0x0803, 0x000E, 0x0000, 0x0000, 0x0000\n"
"\t.short 0x0002, 0x0000, 0x39AD, 0x080D, 0x0002, 0x0000, 0x48B5, 0x0800, 0x0002, 0x0000, 0x3E5D, 0x0801\n"
"\t.short 0x0003, 0x0000, 0x4121, 0x0801, 0x0002, 0x0000, 0x3C0D, 0x080D, 0x0003, 0x0000, 0x3CD1, 0x080D\n"
"\t.short 0x0002, 0x0000, 0x3E39, 0x0801, 0x0003, 0x0000, 0x4121, 0x0801, 0x0002, 0x0000, 0x48D9, 0x0800\n"
"\t.short 0x0002, 0x0000, 0x4141, 0x080D, 0x000E, 0x0000, 0x0000, 0x0000, 0x0002, 0x0000, 0x0109, 0x0803\n"
"\t.short 0x0002, 0x0000, 0x10F5, 0x0803, 0x0002, 0x0000, 0x5395, 0x0801, 0x0000, 0x0000, 0x0000, 0x0000\n"
);
u8 frontier_df4_tail_001_BB08B4[] __attribute__((section(".data.frontier_df4_tail.gap1"))) = INCBIN_U8("graphics/frontier_df4_tail/frontier_df4_tail_001a_BB08B4.4bpp.lz");
u8 data_08BB0B98[] __attribute__((section(".data.frontier_df4_tail.gap1"))) = INCBIN_U8("graphics/frontier_df4_tail/data_08BB0B98.4bpp");
/* data_08BB30F8: raw non-tile trailing remainder (20B), byte-exact. */
__asm__(
"\t.section .data.frontier_df4_tail.gap1, \"aw\", %progbits\n"
"\t.global data_08BB30F8\n"
"data_08BB30F8:\n"
"\t.byte 0xD6, 0x05, 0xEB, 0x00, 0x27, 0x01, 0x00, 0x00\n"
"\t.byte 0x0C, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00\n"
"\t.byte 0x00, 0x00, 0x00, 0x00\n"
);
