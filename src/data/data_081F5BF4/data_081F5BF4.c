#include "global.h"

/* D121 split of data_081F5BF0: first 4 B ({4,3,2,1}) are GetChapterSurvivalRank's
 * local-array .rodata template (now @0x081F5BF0); this is the remaining 120 B. */

u8 data_081F5BF4[] __attribute__((section(".data.residue.081F5BF4"))) = INCBIN_U8("data/residual/data_081F5BF4.bin");
