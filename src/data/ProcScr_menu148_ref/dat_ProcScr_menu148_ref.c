#include "global.h"
#include "proc.h"

/* #148 proc-script decomp-completeness (frontier_df4_menu.c residual-INCBIN blobs).
 *
 * These proc scripts previously existed ONLY as baseline `.set` aliases pointing
 * into opaque `.incbin`+`.4byte` inline-asm blob sections inside frontier_df4_menu.c
 * (e.g. data_08A600B0 in `.data.frontier_df4_menu.gap5`) -- i.e. not decompiled,
 * and their opcode/imm words were raw INCBIN bytes (invisible to `make shiftcheck`).
 *
 * The `.data.frontier_df4_menu.gapN` sections are placed at NON-4-aligned VMAs, so a
 * typed `struct ProcCmd[]` cannot live in them (agbcc `.align 2` would insert padding
 * and shift the ROM). Instead each table is decoded (from JP bytes, symbols resolved
 * against the freshly-built ELF) into its OWN 4-aligned `.rodata.dat_NAME_ref` section,
 * which the carved_rom layout places at its exact JP address; the surrounding blob is
 * truncated/split so its remaining bytes stay in frontier_df4_menu.c. Every pointer
 * word thus becomes an R_ARM_ABS32 relocation. The ONLY correctness oracle is
 * `make compare` (sha1). FUNC targets are bare (NO addend -- ld ORs the Thumb bit).
 *
 * The `.set` aliases for every carved name are dropped in
 * layout/baseline_syms_drop.d/procscr_menu_148.tsv so the real typed symbol wins.
 */

/* ---- quakefx cluster (gap5, blob data_08A600B0 tail, base 0x08A60138) -------- */
extern void EventQuakefxHorizon_ViolentLoop();
extern void EventQuakefxHorizon_SlightLoop();
extern void EventQuakefxVeritical_Loop();
extern void EventQuakefx_Init();
extern void EventQuakefx_Loop();
extern void UnitTornOut_Init();
extern void UnitTornOut_Loop();
extern void WorldFlushCallBack();
extern void WorldFlushInit();
extern void WorldFlushOut();
extern void WorldFlushReload();
extern void WorldFlushIn();

struct ProcCmd ProcScr_EventHorizontalQuakefx[] __attribute__((section(".rodata.dat_ProcScr_EventHorizontalQuakefx_ref"))) = {
    PROC_SLEEP(0x0),
    PROC_LABEL(0x0),
    PROC_REPEAT(EventQuakefxHorizon_ViolentLoop),
    PROC_LABEL(0x1),
    PROC_REPEAT(EventQuakefxHorizon_SlightLoop),
    PROC_END,
};
struct ProcCmd ProcScr_EventVerticalQuakefx[] __attribute__((section(".rodata.dat_ProcScr_EventVerticalQuakefx_ref"))) = {
    PROC_SLEEP(0x0),
    PROC_REPEAT(EventQuakefxVeritical_Loop),
    PROC_END,
};
struct ProcCmd ProcScr_EventQuakefx[] __attribute__((section(".rodata.dat_ProcScr_EventQuakefx_ref"))) = {
    PROC_SLEEP(0x0),
    PROC_CALL(EventQuakefx_Init),
    PROC_REPEAT(EventQuakefx_Loop),
    PROC_END,
};
struct ProcCmd ProcScr_UnitTornOut[] __attribute__((section(".rodata.dat_ProcScr_UnitTornOut_ref"))) = {
    PROC_SLEEP(0x0),
    PROC_CALL(UnitTornOut_Init),
    PROC_REPEAT(UnitTornOut_Loop),
    PROC_END,
};
struct ProcCmd ProcScr_WorldFlush[] __attribute__((section(".rodata.dat_ProcScr_WorldFlush_ref"))) = {
    PROC_SLEEP(0x0),
    PROC_SET_END_CB(WorldFlushCallBack),
    PROC_CALL(WorldFlushInit),
    PROC_REPEAT(WorldFlushOut),
    PROC_CALL(WorldFlushReload),
    PROC_REPEAT(WorldFlushIn),
    PROC_END,
};
