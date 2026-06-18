	.syntax unified
	.set GetLoadUnitsAmount, 0x0800F704 + 1
	.set sub_800F86C, 0x0800F86C + 1
	.set sub_800FAD0, 0x0800FAD0 + 1
	.set sub_80194BC, 0x080194BC + 1
	.set sub_80856E8, 0x080856E8 + 1
	.set sub_80D65C0, 0x080D65C0 + 1
	.section .text.sub_800FD04, "ax", %progbits
@ Event2C_LoadUnits @ JP 0x0800FD04 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global Event2C_LoadUnits
	.thumb_func
Event2C_LoadUnits:
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r6, r0, #0
	ldr r0, [r6, #0x38]
	ldrb r1, [r0]
	movs r4, #0xf
	ands r4, r1
	ldrb r1, [r0, #2]
	mov r8, r1
	ldr r5, [r0, #4]
	adds r0, r6, #0
	adds r0, #0x4c
	movs r1, #0
	ldrsh r7, [r0, r1]
	cmp r4, #1
	beq _0800FD3E
	cmp r4, #1
	bgt _0800FD34
	cmp r4, #0
	beq _0800FD42
	b _0800FD56
_0800FD34:
	cmp r4, #2
	beq _0800FD42
	cmp r4, #3
	beq _0800FD50
	b _0800FD56
_0800FD3E:
	movs r0, #2
	mov r8, r0
_0800FD42:
	cmp r5, #0
	bge _0800FD56
	ldr r0, _0800FD4C @ =0x030004B0
	ldr r5, [r0, #8]
	b _0800FD56
	.align 2, 0
_0800FD4C: .4byte 0x030004B0
_0800FD50:
	bl sub_80856E8
	adds r5, r0, #0
_0800FD56:
	cmp r7, #0
	bne _0800FD64
	adds r0, r5, #0
	bl GetLoadUnitsAmount
	lsls r0, r0, #0x10
	asrs r7, r0, #0x10
_0800FD64:
	movs r1, #0x4e
	adds r1, r1, r6
	mov sb, r1
	ldrb r2, [r1]
	movs r3, #0
	cmp r4, #2
	bne _0800FD74
	movs r3, #1
_0800FD74:
	adds r4, r6, #0
	adds r4, #0x4f
	ldrb r0, [r4]
	lsrs r0, r0, #7
	str r0, [sp]
	adds r0, r5, #0
	adds r1, r7, #0
	bl sub_800FAD0
	adds r5, r0, #0
	ldr r0, _0800FDC4 @ =0x0202E4EC
	ldr r0, [r0]
	movs r1, #0
	bl sub_80194BC
	ldrh r2, [r6, #0x3c]
	lsrs r0, r2, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _0800FDA8
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r2
	cmp r0, #0
	beq _0800FDC8
_0800FDA8:
	adds r0, r5, #0
	adds r1, r7, #0
	mov r2, r8
	bl sub_800F86C
	adds r0, r6, #0
	adds r0, #0x4c
	movs r2, #0
	movs r1, #0
	strh r1, [r0]
	mov r0, sb
	strb r2, [r0]
	b _0800FDEE
	.align 2, 0
_0800FDC4: .4byte 0x0202E4EC
_0800FDC8:
	str r5, [r6, #0x48]
	adds r0, r6, #0
	adds r0, #0x4c
	strh r7, [r0]
	movs r0, #0x7f
	mov r1, r8
	ands r1, r0
	mov r8, r1
	ldrb r1, [r4]
	subs r0, #0xff
	ands r0, r1
	mov r1, r8
	orrs r0, r1
	strb r0, [r4]
	ldr r1, _0800FE08 @ =sub_800F7B0
	str r1, [r6, #0x2c]
	adds r0, r6, #0
	bl sub_80D65C0
_0800FDEE:
	ldrb r1, [r4]
	movs r0, #0x7f
	ands r0, r1
	strb r0, [r4]
	movs r0, #2
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0800FE08: .4byte 0x0800F7B1  @ sub_800F7B0

