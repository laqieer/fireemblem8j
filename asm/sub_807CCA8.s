	.syntax unified
	.set MapAnim_GetRoundProcScript, 0x080835A0 + 1
	.set Proc_StartBlocking, 0x08002C30 + 1
	.section .text.sub_807CCA8, "ax", %progbits
@ sub_807CCA8 @ JP 0x0807CCA8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_807CCA8
	.thumb_func
sub_807CCA8:
	push {r4, lr}
	adds r4, r0, #0
	bl MapAnim_GetRoundProcScript
	adds r1, r4, #0
	bl Proc_StartBlocking
	pop {r4}
	pop {r0}
	bx r0

