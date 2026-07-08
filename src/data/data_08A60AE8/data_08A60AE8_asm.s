@ Descriptive assembly extracted from inline __asm__ in data_08A60AE8.c (#152).
@ Byte-identical to the compiled inline-asm form; make compare is the oracle.

	.section .data.residue.08A60AE8, "aw", %progbits
	.global data_08A60AE8
data_08A60AE8:
	.4byte Img_UnkData_0
	.4byte Img_99E1A4
	.4byte Img_99ED44
	.4byte Img_99F7D4
	.4byte Img_9A0154
	.4byte Img_9A0864
	.4byte TileSet_9A0E84
	.4byte TileSet_9A1050
	.4byte TileSet_9A1228
	.4byte TileSet_9A13EC
	.4byte TileSet_9A15B4
	.4byte TileSet_9A174C
	.section .data.residue.08A60B60, "aw", %progbits
data_08A60B60:
	.4byte 0x00000002
	.4byte EventMapAnimBanner_Init + 0x1
	.4byte 0x00000003
	.4byte EventMapAnimBanner_SlideInLoop + 0x1
	.4byte 0x00000003
	.4byte EventMapAnimBanner_FlashInLoop + 0x1
	.4byte 0x00000003
	.4byte EventMapAnimBanner_FlashOutLoop + 0x1
	.4byte 0x00000003
	.4byte EventMapAnimBanner_HoldLoop + 0x1
	.4byte 0x00000000
	.4byte 0x00000000
