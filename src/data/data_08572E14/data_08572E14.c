#include "global.h"

/* D311: data_08572E14 straddled a song boundary; its head [572E14,572E24) is now
 * provided by the song .o. Only the non-song remnant [572E24,572F3C) stays here,
 * as a committed INCBIN (self-contained). The original symbol data_08572E14 is bound to
 * its JP absolute address via a baseline alias so external +off refs resolve. */
u8 data_08572E14_572E24[] __attribute__((section(".data.residue.08572E14"))) = INCBIN_U8("graphics/data_08572E14/data_08572E14_572E24.bin");
