	.syntax unified
	.set SetTalkPrintDelay, 0x080069F4 + 1
	.set sub_80D1780, 0x080D1780 + 1
	.section .text.sub_80D29FC, "ax", %progbits
@ sub_80D29FC @ JP 0x080D29FC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80D29FC
	.thumb_func
sub_80D29FC:
	push {lr}
	ldr r0, [r0, #0x14]
	ldr r3, [r0, #0x14]
	adds r2, r3, #0
	adds r2, #0x40
	movs r0, #1
	strb r0, [r2]
	adds r1, #0x3c
	ldrb r0, [r1]
	adds r1, r3, #0
	adds r1, #0x41
	strb r0, [r1]
	ldrb r1, [r1]
	lsls r1, r1, #1
	adds r0, r3, #0
	adds r0, #0x38
	adds r0, r0, r1
	movs r1, #0
	ldrsh r0, [r0, r1]
	bl sub_80D1780
	movs r0, #1
	rsbs r0, r0, #0
	bl SetTalkPrintDelay
	pop {r1}
	bx r1
	.align 2, 0

