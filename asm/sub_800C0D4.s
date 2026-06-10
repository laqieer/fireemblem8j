	.syntax unified
	.set StartSlowLockingFadeToBlack, 0x08013E78 + 1
	.section .text.sub_800C0D4, "ax", %progbits
@ sub_800C0D4 @ JP 0x0800C0D4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_800C0D4
	.thumb_func
sub_800C0D4:
	push {lr}
	adds r2, r0, #0
	ldrh r0, [r2, #0x3c]
	lsrs r0, r0, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _0800C0EE
	adds r0, r2, #0
	bl StartSlowLockingFadeToBlack
	movs r0, #2
	b _0800C10E
_0800C0EE:
	ldr r2, _0800C114 @ =0x03003020
	ldrb r1, [r2, #1]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #2
	ands r0, r1
	subs r1, #4
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r2, #1]
	movs r0, #0
_0800C10E:
	pop {r1}
	bx r1
	.align 2, 0
_0800C114: .4byte 0x03003020

