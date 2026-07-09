#include "global.h"
#include "bmunit.h"

/* Typed from data/residual/data_0890A320.bin (fe8u events_udefs.c parity:
 * UnitDef_Ch5xUnits is a 1-entry {0} UnitDefinition terminator array).
 * sizeof(struct UnitDefinition) == 20, so the all-zero terminator is
 * byte-identical to the former residual INCBIN. Kept in section
 * .data.residue.0890A320 for identical placement; gated by `make compare`.
 */

struct UnitDefinition UnitDef_Ch5xUnits[] __attribute__((section(".data.residue.0890A320"))) = {{0}};
