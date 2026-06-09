	.syntax unified
	.set PutSpriteExt, 0x08005330 + 1
	.set __divsi3, 0x080D65F8 + 1
	.set __modsi3, 0x080D6690 + 1
	.section .text.sub_8098A94, "ax", %progbits
@ sub_8098A94 @ JP 0x08098A94 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8098A94
	.thumb_func
sub_8098A94:
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r6, r0, #0
	mov sb, r1
	adds r4, r2, #0
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	mov r8, r3
	movs r0, #1
	ands r0, r4
	cmp r0, #0
	beq _08098AC8
	subs r6, #4
	adds r1, r6, #0
	adds r1, #0x40
	ldr r0, _08098AF4 @ =0x08A94358
	ldr r3, [r0, #0x28]
	mov r0, r8
	str r0, [sp]
	movs r0, #4
	mov r2, sb
	bl PutSpriteExt
_08098AC8:
	ldr r3, _08098AF8 @ =0x08A942D4
	mov r0, r8
	str r0, [sp]
	movs r0, #4
	adds r1, r6, #0
	mov r2, sb
	bl PutSpriteExt
	asrs r7, r4, #1
	cmp r7, #9
	bgt _08098AFC
	adds r1, r6, #0
	adds r1, #0x30
	ldr r0, _08098AF4 @ =0x08A94358
	ldr r3, [r0, #0x2c]
	mov r0, r8
	str r0, [sp]
	movs r0, #4
	mov r2, sb
	bl PutSpriteExt
	b _08098B1E
	.align 2, 0
_08098AF4: .4byte 0x08A94358
_08098AF8: .4byte 0x08A942D4
_08098AFC:
	adds r5, r6, #0
	adds r5, #0x30
	ldr r4, _08098B50 @ =0x08A94358
	adds r0, r7, #0
	movs r1, #0xa
	bl __divsi3
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r3, [r0]
	mov r0, r8
	str r0, [sp]
	movs r0, #4
	adds r1, r5, #0
	mov r2, sb
	bl PutSpriteExt
_08098B1E:
	adds r5, r6, #0
	adds r5, #0x38
	ldr r4, _08098B50 @ =0x08A94358
	adds r0, r7, #0
	movs r1, #0xa
	bl __modsi3
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r3, [r0]
	mov r0, r8
	str r0, [sp]
	movs r0, #4
	adds r1, r5, #0
	mov r2, sb
	bl PutSpriteExt
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08098B50: .4byte 0x08A94358

