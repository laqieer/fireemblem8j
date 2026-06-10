	.syntax unified
	.section .text.TalkHasCorrectBubble, "ax", %progbits
@ TalkHasCorrectBubble @ JP 0x08008808 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global TalkHasCorrectBubble
	.thumb_func
TalkHasCorrectBubble:
	push {lr}
	ldr r0, _08008824 @ =0x085B90D4
	ldr r1, [r0]
	movs r0, #0xf
	ldrsb r0, [r1, r0]
	ldrb r2, [r1, #0x11]
	cmp r0, r2
	bne _08008828
	ldrb r0, [r1, #0x10]
	ldrb r1, [r1, #0xe]
	cmp r0, r1
	bne _08008828
	movs r0, #1
	b _0800882A
	.align 2, 0
_08008824: .4byte 0x085B90D4
_08008828:
	movs r0, #0
_0800882A:
	pop {r1}
	bx r1
	.align 2, 0

