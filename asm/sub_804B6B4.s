	.syntax unified
	.set GetUnit, 0x08019108 + 1
	.set Sio_IsPlayerConnected, 0x08042114 + 1
	.set sub_804AA88, 0x0804AA88 + 1
	.section .text.sub_804B6B4, "ax", %progbits
@ sub_804B6B4 @ JP 0x0804B6B4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_804B6B4
	.thumb_func
sub_804B6B4:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	movs r3, #0
_0804B6BE:
	lsls r0, r3, #0x18
	lsrs r0, r0, #0x18
	str r3, [sp]
	bl Sio_IsPlayerConnected
	lsls r0, r0, #0x18
	ldr r3, [sp]
	adds r1, r3, #1
	mov r8, r1
	cmp r0, #0
	beq _0804B724
	movs r6, #0
	movs r7, #0
	ldr r0, _0804B738 @ =0x03001810
	adds r4, r3, r0
	movs r5, #4
_0804B6DE:
	ldrb r0, [r4]
	cmp r0, #0
	beq _0804B70C
	adds r7, #1
	str r3, [sp]
	bl GetUnit
	adds r2, r0, #0
	ldr r0, [r2, #0xc]
	ldr r1, _0804B73C @ =0x00010004
	ands r0, r1
	ldr r3, [sp]
	cmp r0, #0
	bne _0804B70C
	adds r0, r2, #0
	bl sub_804AA88
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldr r3, [sp]
	cmp r0, #1
	bne _0804B70C
	adds r6, #1
_0804B70C:
	adds r4, #5
	subs r5, #1
	cmp r5, #0
	bge _0804B6DE
	cmp r6, #0
	bne _0804B724
	cmp r7, #0
	beq _0804B724
	ldr r0, _0804B740 @ =0x0203DD8C
	adds r0, #0xa
	adds r0, r3, r0
	strb r6, [r0]
_0804B724:
	mov r3, r8
	cmp r3, #3
	ble _0804B6BE
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804B738: .4byte 0x03001810
_0804B73C: .4byte 0x00010004
_0804B740: .4byte 0x0203DD8C

