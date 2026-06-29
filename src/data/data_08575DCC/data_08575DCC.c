#include "global.h"

/* D311: data_08575DCC straddled a song boundary; its head [575DCC,575DDC) is now
 * provided by the song .o. Only the non-song remnant [575DDC,575E34) stays here,
 * as a committed INCBIN (self-contained). The original symbol data_08575DCC is bound to
 * its JP absolute address via a baseline alias so external +off refs resolve. */
u8 data_08575DCC_575DDC[] __attribute__((section(".data.residue.08575DCC"))) = INCBIN_U8("graphics/data_08575DCC/data_08575DCC_575DDC.bin");
