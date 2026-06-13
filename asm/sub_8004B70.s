	.syntax unified
	.set FormatTime, 0x08000D14 + 1
	.set PutNumber, 0x08004A90 + 1
	.set PutSpecialChar, 0x08004A14 + 1
	.set __divsi3, 0x080D65F8 + 1
	.set __modsi3, 0x080D6690 + 1
	.section .text.PutTime, "ax", %progbits
@ PutTime @ JP 0x08004B70 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global PutTime
	.thumb_func
PutTime:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	adds r7, r0, #0
	adds r6, r1, #0
	adds r0, r2, #0
	lsls r3, r3, #0x18
	asrs r3, r3, #0x18
	mov sl, r3
	mov r4, sp
	adds r4, #2
	add r1, sp, #4
	mov r8, r1
	mov r1, sp
	adds r2, r4, #0
	mov r3, r8
	bl FormatTime
	mov r1, sp
	strb r0, [r1, #8]
	lsls r0, r0, #0x18
	str r0, [sp, #0xc]
	asrs r0, r0, #0x18
	mov sb, r0
	adds r0, r7, #4
	ldrh r2, [r1]
	adds r1, r6, #0
	bl PutNumber
	ldrh r5, [r4]
	adds r4, r7, #0
	adds r4, #0xa
	adds r0, r5, #0
	movs r1, #0xa
	bl __modsi3
	adds r2, r0, #0
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
	adds r0, r4, #0
	adds r1, r6, #0
	bl PutSpecialChar
	mov r1, r8
	ldrh r5, [r1]
	adds r4, #8
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
	mov r0, sb
	cmp r0, #0
	beq _08004C24
	mov r1, sl
	cmp r1, #0
	beq _08004C3C
_08004C24:
	adds r0, r7, #6
	adds r1, r6, #0
	movs r2, #0x20
	bl PutSpecialChar
	adds r0, r7, #0
	adds r0, #0xc
	adds r1, r6, #0
	movs r2, #0x20
	bl PutSpecialChar
	b _08004C52
_08004C3C:
	adds r0, r7, #6
	adds r1, r6, #0
	movs r2, #0xff
	bl PutSpecialChar
	adds r0, r7, #0
	adds r0, #0xc
	adds r1, r6, #0
	movs r2, #0xff
	bl PutSpecialChar
_08004C52:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

