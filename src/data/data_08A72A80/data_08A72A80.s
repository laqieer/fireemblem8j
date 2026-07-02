/* Migrated from asm/data_08A72A80.s (region-same graphics, single section).
 * Each symbol kept in the original section/order; byte-identical via INCBIN_U*.
 */
	.section .data.residue.08A72A80, "aw", %progbits
	.global gProcScr_SSBgOffsetCtrl
gProcScr_SSBgOffsetCtrl:
	.4byte 0x00000003
	.4byte BgOffCtrl_OnLoop + 0x1
	.4byte 0x00000000
	.4byte 0x00000000
/* de-pointered slice gProcScr_SSBgOffsetCtrl: ptr=1 data=3 skip=0 */
	.section .data.residue.08A72A90, "aw", %progbits
	.global gProcScr_StatScreen
gProcScr_StatScreen:
	.4byte 0x00000002
	.4byte StatScreen_BlackenScreen + 0x1
	.4byte 0x00000002
	.4byte BMapDispSuspend + 0x1
	.4byte 0x0002000E
	.4byte 0x00000000
	.4byte 0x00000002
	.4byte StatScreen_InitDisplay + 0x1
	.4byte 0x00000002
	.4byte StartGreenText + 0x1
	.4byte 0x00000002
	.4byte StatScreen_Display + 0x1
	.4byte 0x00000005
	.4byte gProcScr_SSGlowyBlendCtrl
	.4byte 0x00000005
	.4byte gProcScr_SSPageNameCtrl
	.4byte 0x00000005
	.4byte gProcScr_SSPageNumCtrl
	.4byte 0x00000005
	.4byte gProcScr_SSBgOffsetCtrl
	.4byte 0x0001000C
	.4byte 0x00000000
	.4byte 0x0000000B
	.4byte 0x00000000
	.4byte 0x00000002
	.4byte StatScreen_ResumeFromHelp + 0x1
	.4byte 0x0001000B
	.4byte 0x00000000
	.4byte 0x0002000E
	.4byte 0x00000000
	.4byte 0x00000003
	.4byte StatScreen_OnIdle + 0x1
	.4byte 0x000A000B
	.4byte 0x00000000
	.4byte 0x0002000E
	.4byte 0x00000000
	.4byte 0x00000009
	.4byte gProcScr_SSGlowyBlendCtrl
	.4byte 0x00000002
	.4byte StatScreen_OnClose + 0x1
	.4byte 0x00000002
	.4byte BMapDispResume + 0x1
	.4byte 0x00000002
	.4byte EndAllMus + 0x1
	.4byte 0x00000002
	.4byte EndGreenText + 0x1
	.4byte 0x00000000
	.4byte 0x00000000
/* de-pointered slice gProcScr_StatScreen: ptr=16 data=32 skip=0 */
	.section .data.residue.08A72B50, "aw", %progbits
	.global gProcScr_HelpBox
gProcScr_HelpBox:
	.4byte 0x0000000E
	.4byte 0x00000000
	.4byte 0x00000002
	.4byte HelpBox_OnOpen + 0x1
	.4byte 0x00000003
	.4byte HelpBox_OnLoop + 0x1
	.4byte 0x0063000B
	.4byte 0x00000000
	.4byte 0x00000002
	.4byte HelpBox_OnClose + 0x1
	.4byte 0x00000003
	.4byte HelpBox_WaitClose + 0x1
	.4byte 0x00000000
	.4byte 0x00000000
/* de-pointered slice gProcScr_HelpBox: ptr=4 data=10 skip=0 */
	.section .data.residue.08A72B88, "aw", %progbits
	.global gProcScr_HelpBoxMoveCtrl
gProcScr_HelpBoxMoveCtrl:
	.4byte 0x0001000E
	.4byte 0x00000000
	.4byte 0x0000000B
	.4byte 0x00000000
	.4byte 0x00000002
	.4byte HbMoveCtrl_OnInitBox + 0x1
	.4byte 0x00000003
	.4byte HbMoveCtrl_OnIdle + 0x1
	.4byte 0x00000002
	.4byte CloseHelpBox + 0x1
	.4byte 0x00000000
	.4byte 0x00000000
/* de-pointered slice gProcScr_HelpBoxMoveCtrl: ptr=3 data=9 skip=0 */
