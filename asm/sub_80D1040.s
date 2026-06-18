	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_80D0DB4, 0x080D0DB4 + 1
	.section .text.sub_80D1040, "ax", %progbits
@ GameEarlyStartDelay @ JP 0x080D1040 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global GameEarlyStartDelay
	.thumb_func
GameEarlyStartDelay:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x30]
	subs r0, #1
	str r0, [r4, #0x30]
	cmp r0, #0
	bgt _080D1058
	movs r0, #0
	str r0, [r4, #0x2c]
	adds r0, r4, #0
	bl sub_8002DE4
_080D1058:
	adds r0, r4, #0
	bl sub_80D0DB4
	pop {r4}
	pop {r0}
	bx r0

