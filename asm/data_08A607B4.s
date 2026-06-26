@ data_08A607B4: region-different residue split into 3 named US
@ objects (D38). Each label sits at its proven JP VMA (addr_map conflicts=0,
@ per-boundary confirmed); incbins slice the committed residual .bin (NOT
@ baserom.gba) so self-containment is kept and the ROM is byte-identical.
@ make compare is the oracle.

	.section .data.residue.08A607B4, "a", %progbits
	.global EventScr_ChangeAIinQueue
EventScr_ChangeAIinQueue:
	@ de-pointered (scripts/repoint_table.py): ptr=2 data=28 skip=0
	.4byte 0x00000820
	.4byte 0x00010C44
	.4byte 0x0000000D
	.4byte 0x00210620
	.4byte 0x000B0722
	.4byte 0xFFFF3921
	.4byte 0x00000920
	.4byte 0x00010820
	.4byte 0x00000120
	.4byte 0x00000C41
	.4byte 0x0003000C
	.4byte 0x00000A40
	.4byte EventScr_ChangeAIinQueue
	.4byte 0x00010920
	.4byte 0x00000820
	.4byte 0x00420620
	.4byte 0xFFFF0221
	.4byte 0x00010820
	.4byte 0x00000120
	.4byte 0x00002E21
	.4byte 0x00000C41
	.4byte 0x0003000C
	.4byte 0x00000A40
	.4byte EventScr_ChangeAIinQueue
	.4byte 0x00010920
	.4byte 0x00000820
	.4byte 0x00420620
	.4byte 0xFFFF0221
	.4byte 0x00010820
	.4byte 0x00000120

	.section .data.residue.08A607D8, "a", %progbits
	.global EventScr_9EE6A0
EventScr_9EE6A0:
	.incbin "data/residual/data_08A607B4.bin", 0x24, 0x28

	.section .data.residue.08A60800, "a", %progbits
	.global EventScr_9EE6C8
EventScr_9EE6C8:
	.incbin "data/residual/data_08A607B4.bin", 0x4C, 0x2C

