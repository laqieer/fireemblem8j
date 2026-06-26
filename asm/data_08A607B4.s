@ data_08A607B4: region-different residue split into 3 named US
@ objects (D38). Each label sits at its proven JP VMA (addr_map conflicts=0,
@ per-boundary confirmed); incbins slice the committed residual .bin (NOT
@ baserom.gba) so self-containment is kept and the ROM is byte-identical.
@ make compare is the oracle.

	.section .data.residue.08A607B4, "a", %progbits
	.global EventScr_ChangeAIinQueue
EventScr_ChangeAIinQueue:
	.incbin "data/residual/data_08A607B4.bin", 0x0, 0x24

	.section .data.residue.08A607D8, "a", %progbits
	.global EventScr_9EE6A0
EventScr_9EE6A0:
	.incbin "data/residual/data_08A607B4.bin", 0x24, 0x28

	.section .data.residue.08A60800, "a", %progbits
	.global EventScr_9EE6C8
EventScr_9EE6C8:
	.incbin "data/residual/data_08A607B4.bin", 0x4C, 0x2C

