	.include "MPlayDef.s"

	.section .rodata.dummy_song

	.align 2
	.global dummy_song
dummy_song:	@ 0x08216060
	.byte	0		@ trackCount
	.byte	0		@ blockCount
	.byte	0		@ priority
	.byte	0		@ reverb
