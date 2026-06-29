#include "global.h"

/* D311: data_08575ACC straddled a song boundary; its head [575ACC,575AE4) is now
 * provided by the song .o. Only the non-song remnant [575AE4,575B00) stays here,
 * as a committed INCBIN (self-contained). The original symbol data_08575ACC is bound to
 * its JP absolute address via a baseline alias so external +off refs resolve. */
u8 data_08575ACC_575AE4[] __attribute__((section(".data.residue.08575ACC"))) = INCBIN_U8("graphics/data_08575ACC/data_08575ACC_575AE4.bin");
