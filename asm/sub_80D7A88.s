	.syntax unified
	.set __eqdf2, 0x080DB3F0 + 1
	.set __nedf2, 0x080DB43C + 1
	.set __negdf2, 0x080DB6A8 + 1
	.set sub_080D7DF4, 0x080D7DF4 + 1
	.section .text.sub_80D7A88, "ax", %progbits
@ cvt @ JP 0x080D7A88 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global cvt
	.thumb_func
cvt:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	str r0, [sp, #0x18]
	adds r5, r2, #0
	adds r4, r1, #0
	mov r8, r3
	ldr r6, [sp, #0x3c]
	ldr r0, [sp, #0x44]
	mov sl, r0
	ldr r1, [sp, #0x48]
	mov sb, r1
	cmp r1, #0x66
	bne _080D7AAE
	movs r7, #3
	b _080D7ABE
_080D7AAE:
	mov r0, sb
	cmp r0, #0x65
	beq _080D7AB8
	cmp r0, #0x45
	bne _080D7ABC
_080D7AB8:
	movs r1, #1
	add r8, r1
_080D7ABC:
	movs r7, #2
_080D7ABE:
	lsls r0, r4, #0x1f
	lsrs r0, r0, #0x1f
	cmp r0, #0
	beq _080D7AD4
	adds r1, r5, #0
	adds r0, r4, #0
	bl __negdf2
	adds r5, r1, #0
	adds r4, r0, #0
	movs r0, #0x2d
_080D7AD4:
	ldr r1, [sp, #0x40]
	strb r0, [r1]
	mov r0, r8
	str r0, [sp]
	mov r1, sl
	str r1, [sp, #4]
	add r0, sp, #0x10
	str r0, [sp, #8]
	add r0, sp, #0x14
	str r0, [sp, #0xc]
	ldr r0, [sp, #0x18]
	adds r2, r5, #0
	adds r1, r4, #0
	adds r3, r7, #0
	bl sub_080D7DF4
	adds r7, r0, #0
	mov r1, sb
	cmp r1, #0x67
	beq _080D7B00
	cmp r1, #0x47
	bne _080D7B08
_080D7B00:
	movs r0, #1
	ands r6, r0
	cmp r6, #0
	beq _080D7B5C
_080D7B08:
	mov r0, r8
	adds r6, r7, r0
	mov r1, sb
	cmp r1, #0x66
	bne _080D7B38
	ldrb r0, [r7]
	cmp r0, #0x30
	bne _080D7B32
	ldr r3, _080D7B78 @ =0x00000000
	ldr r2, _080D7B74 @ =0x00000000
	adds r1, r5, #0
	adds r0, r4, #0
	bl __nedf2
	cmp r0, #0
	beq _080D7B32
	mov r1, r8
	rsbs r0, r1, #0
	adds r0, #1
	mov r1, sl
	str r0, [r1]
_080D7B32:
	mov r1, sl
	ldr r0, [r1]
	adds r6, r6, r0
_080D7B38:
	ldr r3, _080D7B78 @ =0x00000000
	ldr r2, _080D7B74 @ =0x00000000
	adds r1, r5, #0
	adds r0, r4, #0
	bl __eqdf2
	cmp r0, #0
	bne _080D7B4A
	str r6, [sp, #0x14]
_080D7B4A:
	ldr r0, [sp, #0x14]
	cmp r0, r6
	bhs _080D7B5C
	movs r1, #0x30
_080D7B52:
	strb r1, [r0]
	adds r0, #1
	str r0, [sp, #0x14]
	cmp r0, r6
	blo _080D7B52
_080D7B5C:
	ldr r0, [sp, #0x14]
	subs r0, r0, r7
	ldr r1, [sp, #0x4c]
	str r0, [r1]
	adds r0, r7, #0
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_080D7B74: .4byte 0x00000000
_080D7B78: .4byte 0x00000000

