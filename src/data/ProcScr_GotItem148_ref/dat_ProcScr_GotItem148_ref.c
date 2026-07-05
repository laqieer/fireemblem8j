#include "global.h"
#include "proc.h"
#include "popup.h"

/* ProcScr_GotItem @0x085BA094 (6 ProcCmd, 48 bytes). Region-same: byte-identical
 * to fe8u src/popup.c ProcScr_GotItem[]. Previously this table was split across
 * the PopupScr_ItemWasPilfered_ref over-span (a raw {14, 0} word @0x085BA094) and
 * the de-pointered data_085BA09C residue (@0x085BA09C); it is now a single typed
 * table. ItemGot_DisplayLePopup / ItemGot_GotLeItem are Thumb functions (declared
 * in popup.h), so bare PROC_CALL() gets the Thumb bit from the R_ARM_ABS32 reloc. */

struct ProcCmd ProcScr_GotItem[] __attribute__((section(".rodata.dat_ProcScr_GotItem148_ref"))) = {
    PROC_YIELD,
    PROC_CALL(ItemGot_DisplayLePopup),
    PROC_YIELD,
    PROC_CALL(ItemGot_GotLeItem),
    PROC_YIELD,
    PROC_END,
};
