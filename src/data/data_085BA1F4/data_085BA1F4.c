#include "global.h"
#include "proc.h"

/* #148 proc-script decomp-completeness: data_085BA1F4 (popup / event-fx scripts).
 *
 * Four opaque proc scripts inside the `.data.residue.085BA1F4` blob are decoded
 * (structure ported from fe8u src/popup.c + eventfx-*.c, pointers resolved
 * against the JP ELF) into typed `struct ProcCmd NAME[]` in their OWN 4-aligned
 * `.rodata.dat_NAME_ref` sections at their exact JP addresses:
 *   - ProcScr_BrownTextBox    (4 ProcCmd)  @0x085BA254
 *   - ProcScr_Popup_0         (7 ProcCmd)  @0x085BA2AC
 *   - ProcScr_EventFadefx     (3 ProcCmd)  @0x085BA2E4
 *   - ProcScr_ShinningStonefx (10 ProcCmd) @0x085BA2FC
 * Their redundant baseline `.set NAME,0xADDR` aliases are dropped so the typed
 * symbols win. Two residue regions stay byte-identical: the 96-byte lead
 * [0x085BA1F4,0x085BA254) is non-pointer popup layout data (raw `.4byte` under
 * data_085BA1F4); the 56-byte gap [0x085BA274,0x085BA2AC) holds two un-named
 * (non-worklist) fade scripts whose ROM func pointers are kept *relocated*
 * (`.4byte SYM + 0x1`, verbatim) so they are not left un-relocated (= shiftcheck
 * HIGH). The external alias data_085BA2FC (cw_8002DEC'd by sub_8012BDC.c) is
 * preserved byte-neutrally onto ProcScr_ShinningStonefx. fe8j names nullsub_28
 * where fe8u names Nop_Popup_0. FUNC targets in typed tables are bare (ld ORs
 * the Thumb bit). REGION_SAME; the ONLY correctness oracle is `make compare`.
 */

extern void nullsub_28();
extern void BrownTextBox_Loop();
extern void BrownTextBox_FadeInInit();
extern void BrownTextBox_FadeInLoop();
extern void BrownTextBox_FadeOutInit();
extern void BrownTextBox_FadeOutLoop();
extern void BrownTextBox_FadeOutEnd();
extern void EventFadefx_Loop();
extern void ShinningStonefx_InitGfx();
extern void ShinningStonefx_CreateSpriteAnim();
extern void ShinningStonefx_Delay();
extern void HideUnitUnlockDoor();
extern void UnhideUnit();

/* Lead [0x085BA1F4,0x085BA254) (96 B): non-pointer popup layout data. */
u32 data_085BA1F4[] __attribute__((section(".data.residue.085BA1F4"))) = {
    0x0000000A,
    0x0000005A,
    0x00000004,
    0x00000800,
    0x00000008,
    0x00000000,
    0x00000004,
    0x00000801,
    0x00000000,
    0x00000000,
    0x0000000A,
    0x0000005A,
    0x00000006,
    0x00000002,
    0x00000003,
    0x00000000,
    0x00000001,
    0x00000003,
    0x00000006,
    0x00000000,
    0x00000004,
    0x0000080B,
    0x00000000,
    0x00000000,
};

struct ProcCmd ProcScr_BrownTextBox[] __attribute__((section(".rodata.dat_ProcScr_BrownTextBox_ref"))) = {
    PROC_YIELD,
    PROC_SET_END_CB(nullsub_28),
    PROC_REPEAT(BrownTextBox_Loop),
    PROC_END,
};

/* Gap [0x085BA274,0x085BA2AC) (56 B): two un-named fade scripts, relocated. */
u32 data_085BA274[] __attribute__((section(".data.residue.085BA274"))) = {
    0x00000002,
    (u32)&BrownTextBox_FadeInInit + 0x1,
    0x00000003,
    (u32)&BrownTextBox_FadeInLoop + 0x1,
    0x00000000,
    0x00000000,
    0x00000002,
    (u32)&BrownTextBox_FadeOutInit + 0x1,
    0x00000003,
    (u32)&BrownTextBox_FadeOutLoop + 0x1,
    0x00000002,
    (u32)&BrownTextBox_FadeOutEnd + 0x1,
    0x00000000,
    0x00000000,
};

struct ProcCmd ProcScr_Popup_0[] __attribute__((section(".rodata.dat_ProcScr_Popup_0_ref"))) = {
    PROC_CALL(BrownTextBox_FadeInInit),
    PROC_REPEAT(BrownTextBox_FadeInLoop),
    PROC_SLEEP(100),
    PROC_CALL(BrownTextBox_FadeOutInit),
    PROC_REPEAT(BrownTextBox_FadeOutLoop),
    PROC_CALL(BrownTextBox_FadeOutEnd),
    PROC_END,
};

struct ProcCmd ProcScr_EventFadefx[] __attribute__((section(".rodata.dat_ProcScr_EventFadefx_ref"))) = {
    PROC_YIELD,
    PROC_REPEAT(EventFadefx_Loop),
    PROC_END,
};

struct ProcCmd ProcScr_ShinningStonefx[] __attribute__((section(".rodata.dat_ProcScr_ShinningStonefx_ref"))) = {
    PROC_SLEEP(1),
    PROC_CALL(ShinningStonefx_InitGfx),
    PROC_REPEAT(ShinningStonefx_CreateSpriteAnim),
    PROC_SLEEP(80),
    PROC_REPEAT(ShinningStonefx_Delay),
    PROC_SLEEP(1),
    PROC_CALL(HideUnitUnlockDoor),
    PROC_SLEEP(4),
    PROC_CALL(UnhideUnit),
    PROC_END,
};

/* Byte-neutral external alias: data_085BA2FC == ProcScr_ShinningStonefx. */
extern const u32 data_085BA2FC __attribute__((alias("ProcScr_ShinningStonefx")));
