/* D311: data_085772B4 straddled 1 song boundary(ies); the song-covered head(s) are
 * now provided by song .o(s). Only the non-song remnant interval(s) stay here,
 * as committed INCBIN(s) (self-contained). The original symbol data_085772B4 is bound to
 * its JP absolute address via a baseline alias so external +off refs resolve. */
/* remnant [577378,5773B4) */
.section .data.residue.085772B4, "aw", %progbits
.global data_085772B4_577378
data_085772B4_577378:
.4byte 0x4d415253
.4byte 0x565f465f
.4byte 0x00333031
.4byte ReadSramFast_Core
.4byte 0x03002ab0
.4byte WriteSramFast
.4byte 0x03006790
.4byte 0x03002ab1
.4byte VerifySramFast_Core
.4byte 0x03002a10
.4byte SetSramFastFunc
.4byte 0x03006794
.4byte 0x03002a11
.4byte 0x03006794
.4byte 0x00000043
