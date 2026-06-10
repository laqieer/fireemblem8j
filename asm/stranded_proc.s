	.section .text.s_08002CBC, "ax", %progbits
@ Proc_End region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x08002CBC..0x08002CD4
	.thumb
	.align 2, 0
	.global Proc_End
	.thumb_func
Proc_End:
	.incbin "data/residual/Proc_End.bin"

	.section .text.s_08002E74, "ax", %progbits
@ Proc_Goto region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x08002E74..0x08002EAC
	.thumb
	.align 2, 0
	.global Proc_Goto
	.thumb_func
Proc_Goto:
	.incbin "data/residual/Proc_Goto.bin"

	.section .text.s_08002EAC, "ax", %progbits
@ Proc_GotoScript region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x08002EAC..0x08002EB4
	.thumb
	.align 2, 0
	.global Proc_GotoScript
	.thumb_func
Proc_GotoScript:
	.incbin "data/residual/Proc_GotoScript.bin"

