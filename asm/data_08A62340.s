@ byte-neutral SPLIT of data_08A62340 into 4 named sub-objects.
@ This mirror is in DATA_INCBIN_ASM_EXCLUDE (NOT linked); scanned only by the
@ named-symbols metric. Real bytes come from the src object; make compare is the oracle.

	.section .data.residue.08A62340, "a", %progbits
	.global EventScr_Ch1Tut_AfterSethMoveToEnemy
EventScr_Ch1Tut_AfterSethMoveToEnemy:
	.incbin "data/residual/data_08A62340.bin", 0x0, 0x34
	.section .data.residue.08A62374, "a", %progbits
	.global EventScr_Ch1Tut_GuideOnBKSEL
EventScr_Ch1Tut_GuideOnBKSEL:
	.incbin "data/residual/data_08A62340.bin", 0x34, 0x34
	.section .data.residue.08A623A8, "a", %progbits
	.global EventScr_Ch1Tut_AfterSethBattleEirikaVisit
EventScr_Ch1Tut_AfterSethBattleEirikaVisit:
	.incbin "data/residual/data_08A62340.bin", 0x68, 0x14
	.section .data.residue.08A623BC, "a", %progbits
	.global EventScr_Ch1Tut_MsgOnGuideOption
EventScr_Ch1Tut_MsgOnGuideOption:
	.incbin "data/residual/data_08A62340.bin", 0x7C, 0x1C
