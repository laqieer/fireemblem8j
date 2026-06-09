	.syntax unified
	.set PutSpecialChar, 0x08004A14 + 1
	.set __divsi3, 0x080D65F8 + 1
	.set __modsi3, 0x080D6690 + 1
	.section .text.sub_8004D00, "ax", %progbits
@ sub_8004D00 @ JP 0x08004D00 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8004D00
	.thumb_func
sub_8004D00:
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r4, r0, #0
	mov r8, r1
	adds r5, r2, #0
	adds r6, r3, #0
	adds r0, r5, #0
	movs r1, #0xa
	bl __modsi3
	adds r2, r0, #0
	adds r2, r2, r6
	adds r0, r4, #0
	mov r1, r8
	bl PutSpecialChar
	subs r4, #2
	adds r0, r5, #0
	movs r1, #0xa
	bl __divsi3
	movs r1, #0xa
	bl __modsi3
	adds r2, r0, #0
	adds r2, r2, r6
	adds r0, r4, #0
	mov r1, r8
	bl PutSpecialChar
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0

