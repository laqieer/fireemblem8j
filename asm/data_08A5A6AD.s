@ byte-neutral SPLIT_PARTIAL of gPadding_08A5A6AD (115B) into a 3B LEAVE +
@ 7 named Prologue event lists. This mirror is in DATA_INCBIN_ASM_EXCLUDE
@ (NOT linked); scanned only by the named-symbols metric. Real bytes come
@ from the src object; make compare is the oracle. (.bin is absent, as for
@ the other excluded residue mirrors -- never assembled.)

	.section .data.residue.08A5A6AD, "a", %progbits
	.global gPadding_08A5A6AD
gPadding_08A5A6AD:
	.incbin "data/residual/data_08A5A6AD.bin", 0x0, 0x3
	.section .data.residue.08A5A6B0, "a", %progbits
	.global EventListScr_Prologue_Turn
EventListScr_Prologue_Turn:
	.incbin "data/residual/data_08A5A6AD.bin", 0x3, 0x34
	.section .data.residue.08A5A6E4, "a", %progbits
	.global EventListScr_Prologue_Character
EventListScr_Prologue_Character:
	.incbin "data/residual/data_08A5A6AD.bin", 0x37, 0x4
	.section .data.residue.08A5A6E8, "a", %progbits
	.global EventListScr_Prologue_Location
EventListScr_Prologue_Location:
	.incbin "data/residual/data_08A5A6AD.bin", 0x3B, 0x4
	.section .data.residue.08A5A6EC, "a", %progbits
	.global EventListScr_Prologue_Misc
EventListScr_Prologue_Misc:
	.incbin "data/residual/data_08A5A6AD.bin", 0x3F, 0x28
	.section .data.residue.08A5A714, "a", %progbits
	.global EventListScr_Prologue_SelectUnit
EventListScr_Prologue_SelectUnit:
	.incbin "data/residual/data_08A5A6AD.bin", 0x67, 0x4
	.section .data.residue.08A5A718, "a", %progbits
	.global EventListScr_Prologue_SelectDestination
EventListScr_Prologue_SelectDestination:
	.incbin "data/residual/data_08A5A6AD.bin", 0x6B, 0x4
	.section .data.residue.08A5A71C, "a", %progbits
	.global EventListScr_Prologue_UnitMove
EventListScr_Prologue_UnitMove:
	.incbin "data/residual/data_08A5A6AD.bin", 0x6F, 0x4
