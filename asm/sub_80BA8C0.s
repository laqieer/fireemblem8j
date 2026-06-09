	.syntax unified
	.set CallSuspendPromptEvent, 0x0800D640 + 1
	.section .text.sub_80BA8C0, "ax", %progbits
@ sub_80BA8C0 @ JP 0x080BA8C0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80BA8C0
	.thumb_func
sub_80BA8C0:
	push {lr}
	bl CallSuspendPromptEvent
	pop {r0}
	bx r0
	.align 2, 0

