@ data_08908CA0: region-different residue split into 6 named US
@ objects (D38). Each label sits at its proven JP VMA (addr_map conflicts=0,
@ per-boundary confirmed); incbins slice the committed residual .bin (NOT
@ baserom.gba) so self-containment is kept and the ROM is byte-identical.
@ make compare is the oracle.

	.section .data.residue.08908CA0, "a", %progbits
	.global UnitDef_Ch3NPC
UnitDef_Ch3NPC:
	@ de-pointered (scripts/repoint_table.py): ptr=1 data=50 skip=0
	.4byte 0x12000D09
	.4byte 0x01000140
	.4byte data_08908958 + 0x19C
	.4byte 0x006C6B01
	.4byte 0x00080506
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x0001014E
	.4byte 0x0000FFFF
	.4byte 0x0001014F
	.4byte 0x0000FFFF
	.4byte 0x0001014D
	.4byte 0x0000FFFF
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x0D6B0B6B
	.4byte 0x0000008E
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x0D6B4F40
	.4byte 0x000000CF
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x0D00351D
	.4byte 0x0000014E
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x0D002169
	.4byte 0x0000014D
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x0D6B2A44
	.4byte 0x0000014F
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000
	.4byte 0x00000000

	.section .data.residue.08908CC8, "a", %progbits
	.global REDA_Ch3Enemy_2_RIEV
REDA_Ch3Enemy_2_RIEV:
	.incbin "data/residual/data_08908CA0.bin", 0x28, 0x8

	.section .data.residue.08908CD0, "a", %progbits
	.global REDA_Ch3Enemy_2_CAELLACH
REDA_Ch3Enemy_2_CAELLACH:
	.incbin "data/residual/data_08908CA0.bin", 0x30, 0x8

	.section .data.residue.08908CD8, "a", %progbits
	.global REDA_Ch3Enemy_2_VALTER
REDA_Ch3Enemy_2_VALTER:
	.incbin "data/residual/data_08908CA0.bin", 0x38, 0x8

	.section .data.residue.08908CE0, "a", %progbits
	.global UnitDef_Ch3Units
UnitDef_Ch3Units:
	.incbin "data/residual/data_08908CA0.bin", 0x40, 0x14

	.section .data.residue.08908CF4, "a", %progbits
	.global UnitDef_Ch3Enemy_1
UnitDef_Ch3Enemy_1:
	.incbin "data/residual/data_08908CA0.bin", 0x54, 0x78

