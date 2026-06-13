	.syntax unified
	.set PutSpecialChar, 0x08004A14 + 1
	.set __divsi3, 0x080D65F8 + 1
	.set __modsi3, 0x080D6690 + 1
	.section .text.PutNumberExt, "ax", %progbits
@ PutNumberExt @ JP 0x08004A50 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global PutNumberExt
	.thumb_func
PutNumberExt:
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r7, r1, #0
	adds r4, r2, #0
	adds r6, r3, #0
	cmp r4, #0
	bne _08004A66
	adds r2, r6, #0
	bl PutSpecialChar
	b _08004A8A
_08004A66:
	adds r0, r4, #0
	movs r1, #0xa
	bl __modsi3
	adds r2, r0, #0
	adds r2, r2, r6
	adds r0, r5, #0
	adds r1, r7, #0
	bl PutSpecialChar
	adds r0, r4, #0
	movs r1, #0xa
	bl __divsi3
	adds r4, r0, #0
	subs r5, #2
	cmp r4, #0
	bne _08004A66
_08004A8A:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

