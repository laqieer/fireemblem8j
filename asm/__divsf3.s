	.syntax unified
	.set __pack_f, 0x080DB73C + 1
	.set __unpack_f, 0x080DB7F4 + 1
	.section .text.__divsf3, "ax", %progbits
@ __divsf3 @ JP 0x080DBBB0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global __divsf3
	.thumb_func
__divsf3:
	push {r4, r5, r6, lr}
	sub sp, #0x28
	str r0, [sp, #0x20]
	str r1, [sp, #0x24]
	add r0, sp, #0x20
	mov r1, sp
	bl __unpack_f
	add r0, sp, #0x24
	add r5, sp, #0x10
	adds r1, r5, #0
	bl __unpack_f
	mov r4, sp
	movs r0, #0
	ldr r3, [sp]
	cmp r3, #1
	bhi _080DBBD6
	movs r0, #1
_080DBBD6:
	cmp r0, #0
	beq _080DBBDE
	mov r1, sp
	b _080DBC90
_080DBBDE:
	movs r0, #0
	ldr r2, [sp, #0x10]
	adds r6, r2, #0
	cmp r2, #1
	bhi _080DBBEA
	movs r0, #1
_080DBBEA:
	cmp r0, #0
	beq _080DBBF2
	adds r1, r5, #0
	b _080DBC90
_080DBBF2:
	ldr r0, [sp, #4]
	ldr r1, [sp, #0x14]
	eors r0, r1
	str r0, [sp, #4]
	movs r0, #0
	cmp r3, #4
	bne _080DBC02
	movs r0, #1
_080DBC02:
	cmp r0, #0
	bne _080DBC12
	movs r0, #0
	cmp r3, #2
	bne _080DBC0E
	movs r0, #1
_080DBC0E:
	cmp r0, #0
	beq _080DBC24
_080DBC12:
	ldr r0, [r4]
	adds r1, r4, #0
	cmp r0, r6
	bne _080DBC90
	ldr r1, _080DBC20 @ =0x03002BF8
	b _080DBC90
	.align 2, 0
_080DBC20: .4byte 0x03002BF8
_080DBC24:
	movs r1, #0
	cmp r2, #4
	bne _080DBC2C
	movs r1, #1
_080DBC2C:
	cmp r1, #0
	beq _080DBC38
	str r0, [sp, #0xc]
	str r0, [sp, #8]
	mov r1, sp
	b _080DBC90
_080DBC38:
	movs r0, #0
	cmp r2, #2
	bne _080DBC40
	movs r0, #1
_080DBC40:
	cmp r0, #0
	beq _080DBC4A
	movs r0, #4
	str r0, [r4]
	b _080DBC8E
_080DBC4A:
	ldr r1, [r4, #8]
	ldr r0, [sp, #0x18]
	subs r0, r1, r0
	str r0, [r4, #8]
	ldr r2, [r4, #0xc]
	ldr r3, [sp, #0x1c]
	cmp r2, r3
	bhs _080DBC60
	lsls r2, r2, #1
	subs r0, #1
	str r0, [r4, #8]
_080DBC60:
	movs r0, #0x80
	lsls r0, r0, #0x17
	movs r1, #0
_080DBC66:
	cmp r2, r3
	blo _080DBC6E
	orrs r1, r0
	subs r2, r2, r3
_080DBC6E:
	lsrs r0, r0, #1
	lsls r2, r2, #1
	cmp r0, #0
	bne _080DBC66
	movs r0, #0x7f
	ands r0, r1
	cmp r0, #0x40
	bne _080DBC8C
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _080DBC8A
	cmp r2, #0
	beq _080DBC8C
_080DBC8A:
	adds r1, #0x40
_080DBC8C:
	str r1, [r4, #0xc]
_080DBC8E:
	adds r1, r4, #0
_080DBC90:
	adds r0, r1, #0
	bl __pack_f
	add sp, #0x28
	pop {r4, r5, r6, pc}
	.align 2, 0

