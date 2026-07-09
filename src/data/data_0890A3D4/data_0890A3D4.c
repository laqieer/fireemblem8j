#include "global.h"

/* Byte-neutral SPLIT of the former UnitDef_Ch5xUnits_1 residue (72 B) into
 * 5 named sub-objects. Each keeps its exact word stream and its own
 * .data.residue.<ADDR> section for contiguous address-order placement
 * (make compare is the oracle). Consumers repoint from UnitDef_Ch5xUnits_1+0xNN. */

u32 UnitDef_Ch5xUnits_1[] __attribute__((section(".data.residue.0890A3D4"))) = {
    0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000,
    0x00000000, 0x00000000, 0x00000000, 0x00000000,
};
u32 REDA_Ch5xAlly_2_EPHRAIM[] __attribute__((section(".data.residue.0890A3FC"))) = {
    0x00000209, 0x0000FFFF,
};
u32 REDA_Ch5xAlly_2_FORDE[] __attribute__((section(".data.residue.0890A404"))) = {
    0x00000249, 0x0008FFFF,
};
u32 REDA_Ch5xAlly_2_KYLE[] __attribute__((section(".data.residue.0890A40C"))) = {
    0x00000248, 0x0008FFFF,
};
u32 REDA_Ch5xAlly_2_ORSON_CH5X[] __attribute__((section(".data.residue.0890A414"))) = {
    0x00000288, 0x0008FFFF,
};
