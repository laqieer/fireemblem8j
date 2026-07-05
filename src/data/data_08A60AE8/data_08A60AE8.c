#include "global.h"
#include "proc.h"

/* #148 proc-script decomp-completeness: data_08A60AE8.
 *
 * 1 opaque proc script(s) decoded from the .data.residue.08A60AE8
 * blob into typed struct ProcCmd NAME[] at their exact JP addresses:
 *   - ProcScr_EventMapAnim (9 ProcCmd) @0x08A60B18
 * Residue regions stay byte-identical (relocated pointers copied verbatim).
 * Redundant jp_syms .set aliases dropped. FUNC targets bare (ld ORs the
 * Thumb bit); gap_/OBJECT targets carry an explicit +1. The ONLY correctness
 * oracle is `make compare` (sha1).
 */

extern void EventMapAnim_DrawMaskfxLoop();
extern void EventMapAnim_End();
extern void EventMapAnim_Init();
extern void EventMapAnim_SlideSquaresInLoop();
extern void EventMapAnim_SlideSquaresOutLoop();
extern void nullsub_72();

struct ProcCmd ProcScr_EventMapAnim[] __attribute__((section(".rodata.dat_ProcScr_EventMapAnim_ref"))) = {
    PROC_SLEEP(1),
    PROC_CALL(EventMapAnim_Init),
    PROC_REPEAT(EventMapAnim_SlideSquaresInLoop),
    PROC_REPEAT(nullsub_72),
    PROC_REPEAT(EventMapAnim_SlideSquaresOutLoop),
    PROC_REPEAT(EventMapAnim_DrawMaskfxLoop),
    PROC_CALL(EventMapAnim_End),
    PROC_SLEEP(8),
    PROC_END,
};

/* residue [08A60AE8,08A60B18) (48 B): byte-identical. */
__asm__(
"\t.section .data.residue.08A60AE8, \"aw\", %progbits\n"
"\t.global data_08A60AE8\n"
"data_08A60AE8:\n"
"\t.4byte Img_UnkData_0\n"
"\t.4byte Img_99E1A4\n"
"\t.4byte Img_99ED44\n"
"\t.4byte Img_99F7D4\n"
"\t.4byte Img_9A0154\n"
"\t.4byte Img_9A0864\n"
"\t.4byte TileSet_9A0E84\n"
"\t.4byte TileSet_9A1050\n"
"\t.4byte TileSet_9A1228\n"
"\t.4byte TileSet_9A13EC\n"
"\t.4byte TileSet_9A15B4\n"
"\t.4byte TileSet_9A174C\n"
);

/* residue [08A60B60,08A60B90) (48 B): byte-identical. */
__asm__(
"\t.section .data.residue.08A60B60, \"aw\", %progbits\n"
"data_08A60B60:\n"
"\t.4byte 0x00000002\n"
"\t.4byte EventMapAnimBanner_Init + 0x1\n"
"\t.4byte 0x00000003\n"
"\t.4byte EventMapAnimBanner_SlideInLoop + 0x1\n"
"\t.4byte 0x00000003\n"
"\t.4byte EventMapAnimBanner_FlashInLoop + 0x1\n"
"\t.4byte 0x00000003\n"
"\t.4byte EventMapAnimBanner_FlashOutLoop + 0x1\n"
"\t.4byte 0x00000003\n"
"\t.4byte EventMapAnimBanner_HoldLoop + 0x1\n"
"\t.4byte 0x00000000\n"
"\t.4byte 0x00000000\n"
);
