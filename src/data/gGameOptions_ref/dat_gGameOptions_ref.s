/* De-pointered from data/residual/gGameOptions.bin by scripts/repoint_table.py.
 * Pointer words are relocatable symbol references (.4byte sym) so the ROM is
 * SHIFTABLE; byte-identical to baserom (gated by `make compare`). Emitted as a
 * pure asm block so no typed header decl of the referenced symbols can conflict. */
	.section .rodata.dat_gGameOptions_ref, "a", %progbits
	.global gGameOptions
gGameOptions:
	.4byte 0x00000009
	.4byte 0x0038001A
	.4byte 0x00000170
	.4byte 0x0039001B
	.4byte 0x0000017F
	.4byte 0x0037001C
	.4byte 0x0000028E
	.4byte 0x0040001D
	.4byte 0x000002A5
	.4byte 0x00000000
	.4byte GenericOptionChangeHandler + 0x1
	.4byte 0x0000000A
	.4byte 0x00360024
	.4byte 0x00000270
	.4byte 0x00370024
	.4byte 0x00000287
	.4byte 0x00000000
	.4byte 0x000000BE
	.4byte 0x00000000
	.4byte 0x000000BD
	.4byte 0x00000002
	.4byte GenericOptionChangeHandler + 0x1
	.4byte 0x0000000B
	.4byte 0x00430025
	.4byte 0x00000370
	.4byte 0x00440026
	.4byte 0x0000048F
	.4byte 0x00370027
	.4byte 0x000002B6
	.4byte 0x00000000
	.4byte 0x000000BD
	.4byte 0x00000004
	.4byte GenericOptionChangeHandler + 0x1
	.4byte 0x0000000E
	.4byte 0x0036002C
	.4byte 0x00000270
	.4byte 0x0037002C
	.4byte 0x00000287
	.4byte 0x00000000
	.4byte 0x000000BE
	.4byte 0x00000000
	.4byte 0x000000BD
	.4byte 0x00000006
	.4byte GenericOptionChangeHandler + 0x1
	.4byte 0x0000000F
	.4byte 0x003C0020
	.4byte 0x00000370
	.4byte 0x003D0021
	.4byte 0x0000038F
	.4byte 0x003E0022
	.4byte 0x000003AE
	.4byte 0x003F0023
	.4byte 0x000002CD
	.4byte 0x00000008
	.4byte GenericOptionChangeHandler + 0x1
	.4byte 0x00000010
	.4byte 0x003D001E
	.4byte 0x00000370
	.4byte 0x003E001F
	.4byte 0x0000038F
	.4byte 0x00000000
	.4byte 0x000000BE
	.4byte 0x00000000
	.4byte 0x000000BD
	.4byte 0x0000000A
	.4byte GenericOptionChangeHandler + 0x1
	.4byte 0x00000011
	.4byte 0x0036002E
	.4byte 0x00000270
	.4byte 0x0037002E
	.4byte 0x00000287
	.4byte 0x00000000
	.4byte 0x000000BE
	.4byte 0x00000000
	.4byte 0x000000BD
	.4byte 0x0000000C
	.4byte MusicOptionChangeHandler + 0x1
	.4byte 0x00000012
	.4byte 0x0036002F
	.4byte 0x00000270
	.4byte 0x0037002F
	.4byte 0x00000287
	.4byte 0x00000000
	.4byte 0x000000BE
	.4byte 0x00000000
	.4byte 0x000000BD
	.4byte 0x0000000E
	.4byte GenericOptionChangeHandler + 0x1
	.4byte 0x00000013
	.4byte 0x00380030
	.4byte 0x00000170
	.4byte 0x00390030
	.4byte 0x0000017F
	.4byte 0x003A0030
	.4byte 0x0000018E
	.4byte 0x003B0030
	.4byte 0x0000019D
	.4byte 0x00000010
	.4byte WindowColorOptionChangeHandler + 0x1
	.4byte 0x00000014
	.4byte 0x00380031
	.4byte 0x00000170
	.4byte 0x00390031
	.4byte 0x0000017F
	.4byte 0x003A0031
	.4byte 0x0000018E
	.4byte 0x00000000
	.4byte 0x000000BD
	.4byte 0x00000012
	.4byte GenericOptionChangeHandler + 0x1
	.4byte 0x0000000C
	.4byte 0x00410028
	.4byte 0x00000370
	.4byte 0x00420029
	.4byte 0x00000387
	.4byte 0x0037002A
	.4byte 0x0000029E
	.4byte 0x00000000
	.4byte 0x000000BD
	.4byte 0x00000014
	.4byte GenericOptionChangeHandler + 0x1
	.4byte 0x0000000D
	.4byte 0x0036002B
	.4byte 0x00000270
	.4byte 0x0037002B
	.4byte 0x00000287
	.4byte 0x00000000
	.4byte 0x000000BE
	.4byte 0x00000000
	.4byte 0x000000BD
	.4byte 0x00000016
	.4byte GenericOptionChangeHandler + 0x1
	.4byte 0x00000015
	.4byte 0x0036002D
	.4byte 0x00000270
	.4byte 0x0037002D
	.4byte 0x00000287
	.4byte 0x00000000
	.4byte 0x000000BE
	.4byte 0x00000000
	.4byte 0x000000BD
	.4byte 0x00000018
	.4byte GenericOptionChangeHandler + 0x1
	.4byte 0x00000016
	.4byte 0x00360032
	.4byte 0x00000270
	.4byte 0x00370032
	.4byte 0x00000287
	.4byte 0x00000000
	.4byte 0x000000BE
	.4byte 0x00000000
	.4byte 0x000000BD
	.4byte 0x0000001A
	.4byte GenericOptionChangeHandler + 0x1
	.4byte 0x00000017
	.4byte 0x00360033
	.4byte 0x00000270
	.4byte 0x00370033
	.4byte 0x00000287
	.4byte 0x00000000
	.4byte 0x000000BE
	.4byte 0x00000000
	.4byte 0x000000BD
	.4byte 0x0000001C
	.4byte GenericOptionChangeHandler + 0x1
	.4byte 0x00000018
	.4byte 0x00360034
	.4byte 0x00000270
	.4byte 0x00370034
	.4byte 0x00000287
	.4byte 0x00000000
	.4byte 0x000000BE
	.4byte 0x00000000
	.4byte 0x000000BD
	.4byte 0x0000001E
	.4byte GenericOptionChangeHandler + 0x1
	.4byte 0x00000019
	.4byte 0x00360035
	.4byte 0x00000270
	.4byte 0x00370035
	.4byte 0x00000287
	.4byte 0x00000000
	.4byte 0x000000BE
	.4byte 0x00000000
	.4byte 0x000000BD
	.4byte 0x00000020
	.4byte GenericOptionChangeHandler + 0x1
