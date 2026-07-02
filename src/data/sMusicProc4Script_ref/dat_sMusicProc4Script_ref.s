/* De-pointered from data/residual/sMusicProc4Script.bin by scripts/repoint_table.py.
 * Pointer words are relocatable symbol references (.4byte sym) so the ROM is
 * SHIFTABLE; byte-identical to baserom (gated by `make compare`). Emitted as a
 * pure asm block so no typed header decl of the referenced symbols can conflict. */
	.section .rodata.dat_sMusicProc4Script_ref, "a", %progbits
	.global sMusicProc4Script
sMusicProc4Script:
	.4byte 0x0001000E
	.4byte 0x00000000
	.4byte 0x00000002
	.4byte ChangeBgm_FadeVolume + 0x1
	.4byte 0x0001000E
	.4byte 0x00000000
	.4byte 0x00000002
	.4byte ChangeBgm_StartNewSong + 0x1
	.4byte 0x0008000E
	.4byte 0x00000000
	.4byte 0x0000000B
	.4byte 0x00000000
	.4byte 0x0000000E
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
