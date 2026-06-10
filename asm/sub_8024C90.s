	.syntax unified
	.set CallRetreatPromptEvent, 0x0800D618 + 1
	.section .text.sub_8024C90, "ax", %progbits
@ sub_8024C90 @ JP 0x08024C90 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8024C90
	.thumb_func
sub_8024C90:
	push {lr}
	bl CallRetreatPromptEvent
	movs r0, #0x17
	pop {r1}
	bx r1

