#include "global.h"
#include "bmunit.h"

/* Typed from data/residual/data_0890BD24.bin (fe8u events_udefs.c parity:
 * UnitDef_Ch8Units_1 is a 2-entry {0} UnitDefinition terminator array).
 * sizeof(struct UnitDefinition) == 20, so the two all-zero terminators are
 * byte-identical to the former 40-byte residual INCBIN. Kept in section
 * .data.residue.0890BD24 for identical placement; gated by `make compare`.
 */

struct UnitDefinition UnitDef_Ch8Units_1[] __attribute__((section(".data.residue.0890BD24"))) = {{0}, {0}};
