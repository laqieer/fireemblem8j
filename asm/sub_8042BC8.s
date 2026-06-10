	.syntax unified
	.set __divsi3, 0x080D65F8 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8042720, 0x08042720 + 1
	.set sub_80D65C0, 0x080D65C0 + 1
	.section .text.sub_8042BC8, "ax", %progbits
@ sub_8042BC8 @ JP 0x08042BC8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8042BC8
	.thumb_func
sub_8042BC8:
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r5, _08042C04 @ =0x02020188
	ldrh r1, [r4, #0x38]
	ldrh r0, [r4, #0x36]
	subs r0, #1
	cmp r1, r0
	bge _08042C08
	ldr r0, [r4, #0x30]
	mov r1, sp
	movs r2, #0
	bl sub_8042720
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _08042C52
	ldr r0, [r4, #0x30]
	adds r0, #0x7a
	str r0, [r4, #0x30]
	ldrh r1, [r4, #0x38]
	movs r0, #0x64
	muls r0, r1, r0
	ldrh r1, [r4, #0x36]
	bl __divsi3
	adds r1, r4, #0
	adds r1, #0x3b
	strb r0, [r1]
	b _08042C4C
	.align 2, 0
_08042C04: .4byte 0x02020188
_08042C08:
	adds r0, r5, #0
	mov r1, sp
	movs r2, #0
	bl sub_8042720
	lsls r0, r0, #0x10
	cmp r0, #0
	beq _08042C52
	movs r2, #0
	adds r3, r4, #0
	adds r3, #0x3a
	adds r6, r4, #0
	adds r6, #0x3b
	ldrb r0, [r3]
	cmp r2, r0
	bge _08042C3E
_08042C28:
	ldr r1, [r4, #0x30]
	adds r0, r5, r2
	ldrb r0, [r0]
	strb r0, [r1]
	ldr r0, [r4, #0x30]
	adds r0, #1
	str r0, [r4, #0x30]
	adds r2, #1
	ldrb r1, [r3]
	cmp r2, r1
	blt _08042C28
_08042C3E:
	ldrh r1, [r4, #0x38]
	movs r0, #0x64
	muls r0, r1, r0
	ldrh r1, [r4, #0x36]
	bl __divsi3
	strb r0, [r6]
_08042C4C:
	ldrh r0, [r4, #0x38]
	adds r0, #1
	strh r0, [r4, #0x38]
_08042C52:
	ldr r1, [r4, #0x2c]
	cmp r1, #0
	beq _08042C5E
	adds r0, r4, #0
	bl sub_80D65C0
_08042C5E:
	ldrh r0, [r4, #0x38]
	ldrh r1, [r4, #0x36]
	cmp r0, r1
	blo _08042C6C
	adds r0, r4, #0
	bl sub_8002DE4
_08042C6C:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0

