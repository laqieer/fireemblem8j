@ Descriptive assembly extracted from inline __asm__ in data_08A61C70.c (#152).
@ Byte-identical to the compiled inline-asm form; make compare is the oracle.

	.section .data.residue.08A61CB0, "aw", %progbits
	.global EventScr_Ch1_Loca_Visit1
EventScr_Ch1_Loca_Visit1:
	.4byte 0x00001120
	.4byte 0x00001520
	.4byte 0x00020540
	.4byte 0x00000000
	.4byte 0x00030540
	.4byte 0x000008FB
	.4byte 0x00000A40
	.4byte data_08A60354 + 0xF4
	.4byte 0x00001521
	.4byte 0x00070228
	.4byte 0x00000120
	.section .data.residue.08A61CDC, "aw", %progbits
	.global EventScr_Ch1_Loca_Visit2
EventScr_Ch1_Loca_Visit2:
	.4byte 0x00001520
	.4byte 0x00020540
	.4byte 0x00000000
	.4byte 0x00030540
	.4byte 0x000008FC
	.4byte 0x00000A40
	.4byte data_08A60354 + 0xF4
	.4byte 0x00001521
	.4byte 0x00070228
	.4byte 0x00000120
	.section .data.residue.08A61D04, "aw", %progbits
	.global EventScr_Ch1_Misc_Area
EventScr_Ch1_Misc_Area:
	.4byte 0x00020540
	.4byte 0x00000001
	.4byte 0x00000A40
	.4byte EventScr_UnTriggerIfNotUnit
	.4byte 0x000B0221
	.4byte 0x00070228
	.4byte 0x00000120
	.section .data.residue.08A61D20, "aw", %progbits
	.global EventScr_Ch1_Turn_EnemyReinforceArrive
EventScr_Ch1_Turn_EnemyReinforceArrive:
	.4byte 0x00001520
	.4byte 0x00020540
	.4byte UnitDef_Event_Ch1EnemyReinforce
	.4byte 0x00000A40
	.4byte data_08A60354 + 0x58
	.4byte 0x00833B21
	.4byte 0x003C0E20
	.4byte 0x00003B22
	.4byte 0x00001A20
	.4byte 0x08F41B20
	.4byte 0x00001D20
	.4byte 0x00001B22
	.4byte 0x00001521
	.4byte 0x00070228
	.4byte 0x00000120
