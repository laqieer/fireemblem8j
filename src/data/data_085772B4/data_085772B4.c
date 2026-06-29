#include "global.h"

/* D311: data_085772B4 straddled a song boundary; its head [5772B4,5772CC) is now
 * provided by the song .o. Only the non-song remnant [5772CC,5773B4) stays here,
 * as a committed INCBIN (self-contained). The original symbol data_085772B4 is bound to
 * its JP absolute address via a baseline alias so external +off refs resolve. */
u8 data_085772B4_5772CC[] __attribute__((section(".data.residue.085772B4"))) = INCBIN_U8("graphics/data_085772B4/data_085772B4_5772CC.bin");
