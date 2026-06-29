#include "global.h"

/* D311: data_08576124 straddled a song boundary; its head [576124,576134) is now
 * provided by the song .o. Only the non-song remnant [576134,57618C) stays here,
 * as a committed INCBIN (self-contained). The original symbol data_08576124 is bound to
 * its JP absolute address via a baseline alias so external +off refs resolve. */
u8 data_08576124_576134[] __attribute__((section(".data.residue.08576124"))) = INCBIN_U8("graphics/data/data_08576124_576134.bin");
