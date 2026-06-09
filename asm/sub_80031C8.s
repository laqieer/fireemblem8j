	.syntax unified
	.set Proc_Goto, 0x08002E74 + 1
	.section .text.sub_80031C8, "ax", %progbits
@ sub_80031C8 @ JP 0x080031C8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80031C8
	.thumb_func
sub_80031C8:
	push {lr}
	ldr r1, [r0, #4]
	movs r2, #2
	ldrsh r1, [r1, r2]
	bl Proc_Goto
	movs r0, #1
	pop {r1}
	bx r1
	.align 2, 0

