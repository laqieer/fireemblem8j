#include "global.h"

/* D311: data_08576124 straddled 1 song boundary(ies); the song-covered head(s) are
 * now provided by song .o(s). Only the non-song remnant interval(s) stay here,
 * as committed INCBIN(s) (self-contained). The original symbol data_08576124 is bound to
 * its JP absolute address via a baseline alias so external +off refs resolve. */
/* remnant [576150,57618C) */
u8 data_08576124_576150[] __attribute__((section(".data.residue.08576124"))) = INCBIN_U8("graphics/data/data_08576124_576150.bin");
