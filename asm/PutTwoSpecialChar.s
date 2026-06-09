	.syntax unified
	.set PutSpecialChar, 0x08004A14 + 1
	.section .text.PutTwoSpecialChar, "ax", %progbits
@ PutTwoSpecialChar @ JP 0x08004C64 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global PutTwoSpecialChar
	.thumb_func
PutTwoSpecialChar:
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r6, r3, #0
	adds r4, #2
	bl PutSpecialChar
	adds r0, r4, #0
	adds r1, r5, #0
	adds r2, r6, #0
	bl PutSpecialChar
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

