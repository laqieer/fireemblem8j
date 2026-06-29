#include "global.h"

/* D311: data_085772B4 straddled 1 song boundary(ies); the song-covered head(s) are
 * now provided by song .o(s). Only the non-song remnant interval(s) stay here,
 * as committed INCBIN(s) (self-contained). The original symbol data_085772B4 is bound to
 * its JP absolute address via a baseline alias so external +off refs resolve. */
/* remnant [577378,5773B4) */
u8 data_085772B4_577378[] __attribute__((section(".data.residue.085772B4"))) = INCBIN_U8("graphics/data_085772B4/data_085772B4_577378.bin");
