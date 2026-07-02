#include "global.h"

/* D311: data_085772B4 straddled 1 song boundary(ies); the song-covered head(s) are
 * now provided by song .o(s). Only the non-song remnant interval(s) stay here,
 * as committed INCBIN(s) (self-contained). The original symbol data_085772B4 is bound to
 * its JP absolute address via a baseline alias so external +off refs resolve. */
/* remnant [577378,5773B4) */
__asm__(
    ".section .data.residue.085772B4, \"aw\", %progbits\n"
    ".global data_085772B4_577378\n"
    "data_085772B4_577378:\n"
    ".4byte 0x4d415253\n"
    ".4byte 0x565f465f\n"
    ".4byte 0x00333031\n"
    ".4byte ReadSramFast_Core\n"
    ".4byte 0x03002ab0\n"
    ".4byte WriteSramFast\n"
    ".4byte 0x03006790\n"
    ".4byte 0x03002ab1\n"
    ".4byte VerifySramFast_Core\n"
    ".4byte 0x03002a10\n"
    ".4byte SetSramFastFunc\n"
    ".4byte 0x03006794\n"
    ".4byte 0x03002a11\n"
    ".4byte 0x03006794\n"
    ".4byte 0x00000043\n"
);
