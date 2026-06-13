	.syntax unified
	.set PutSpecialChar, 0x08004A14 + 1
	.set __divsi3, 0x080D65F8 + 1
	.set __modsi3, 0x080D6690 + 1
	.section .text.PutNumber2DigitSmall, "ax", %progbits
@ PutNumber2DigitSmall @ JP 0x08004CC0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global PutNumber2DigitSmall
	.thumb_func
PutNumber2DigitSmall:
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	adds r5, r2, #0
	adds r0, r5, #0
	movs r1, #0xa
	bl __modsi3
	adds r2, r0, #0
	adds r2, #0xa
	adds r0, r4, #0
	adds r1, r6, #0
	bl PutSpecialChar
	subs r4, #2
	adds r0, r5, #0
	movs r1, #0xa
	bl __divsi3
	movs r1, #0xa
	bl __modsi3
	adds r2, r0, #0
	adds r2, #0xa
	adds r0, r4, #0
	adds r1, r6, #0
	bl PutSpecialChar
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

