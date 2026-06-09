	.syntax unified
	.set Proc_BreakEach, 0x08002FE4 + 1
	.section .text.sub_8003190, "ax", %progbits
@ sub_8003190 @ JP 0x08003190 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8003190
	.thumb_func
sub_8003190:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #4]
	ldr r0, [r0, #4]
	bl Proc_BreakEach
	ldr r0, [r4, #4]
	adds r0, #8
	str r0, [r4, #4]
	movs r0, #1
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

