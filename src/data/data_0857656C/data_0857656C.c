#include "global.h"

/* D311: data_0857656C straddled a song boundary; its head [57656C,576580) is now
 * provided by the song .o. Only the non-song remnant [576580,576658) stays here,
 * as a committed INCBIN (self-contained). The original symbol data_0857656C is bound to
 * its JP absolute address via a baseline alias so external +off refs resolve. */
u8 data_0857656C_576580[] __attribute__((section(".data.residue.0857656C"))) = INCBIN_U8("graphics/data_0857656C/data_0857656C_576580.bin");
