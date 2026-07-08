/* byte-neutral SPLIT of data_08A612F4 into 5 named sub-objects.
 * Directive stream preserved verbatim; only per-part section headers
 * inserted at byte boundaries (NO .align). make compare is the oracle. */

	.section .data.residue.08A612F4, "aw", %progbits
	.global EventScr_Prologue_EirikaAttacked
EventScr_Prologue_EirikaAttacked:
	.4byte 0x60003D20
	.4byte 0x00660229
	.4byte 0x00E00229
	.4byte 0x00E10229
	.4byte 0x00040229
	.4byte 0x000D0540
	.4byte 0x00000000
	.4byte 0x00010540
	.4byte 0x00020000
	.4byte 0x00000721
	.4byte 0x00010540
	.4byte 0x00000001
	.4byte 0x00000721
	.4byte 0x00010540
	.4byte 0x00000001
	.4byte 0x00000721
	.4byte 0x00010540
	.4byte 0xFFFFFFFF
	.4byte 0x00000721
	.4byte 0x00003F42
	.4byte 0x00000000
	.4byte 0x00000120
	.section .data.residue.08A6134C, "aw", %progbits
	.global EventScr_Prologue_Turn1
EventScr_Prologue_Turn1:
	.4byte 0x00020540
	.4byte EventScr_Prologue_ONeillSpawn
	.4byte 0x00000A40
	.4byte EventScr_CallOnTutorialMode
	.4byte 0x00020540
	.4byte EventScr_Prologue_TutMessageTurn1
	.4byte 0x00000A40
	.4byte EventScr_CallOnTutorialMode
	.4byte 0x00070228
	.4byte 0x00000120
	.section .data.residue.08A61374, "aw", %progbits
	.global EventScr_Prologue_Turn2
EventScr_Prologue_Turn2:
	.4byte 0x00020540
	.4byte EventScr_Prologue_TutMessageTurn2
	.4byte 0x00000A40
	.4byte EventScr_CallOnTutorialMode
	.4byte 0x00070228
	.4byte 0x00000120
	.section .data.residue.08A6138C, "aw", %progbits
	.global EventScr_Prologue_Turn3
EventScr_Prologue_Turn3:
	.4byte 0x00020540
	.4byte EventScr_Prologue_OneillSethBattle
	.4byte 0x00000A40
	.4byte EventScr_CallOnTutorialMode
	.4byte 0x00020540
	.4byte EventScr_Prologue_TutEirikaAttack
	.4byte 0x00000A40
	.4byte EventScr_CallOnTutorialMode
	.4byte 0x00070228
	.4byte 0x00000120
	.section .data.residue.08A613B4, "aw", %progbits
	.global EventScr_Prologue_ExecTut
EventScr_Prologue_ExecTut:
	.4byte 0x00001A23
	.4byte 0x000B0540
	.4byte 0xFFFFFFFF
	.4byte 0x08D91B20
	.4byte 0x00001D20
	.4byte 0x00001B22
	.4byte 0x00013B25
	.4byte 0x003C0E20
	.4byte 0x00003B22
	.4byte 0x00020B41
	.4byte EventScr_Prologue_Tutorial0
	.4byte 0x00070228
	.4byte 0x00000121
/* de-pointered slice data_08A612F4: ptr=11 data=49 skip=1 */
