	.syntax unified
	.set CheckTalkFlag, 0x080069E0 + 1
	.set SetTalkFaceNoMouthMove, 0x080088C0 + 1
	.set __modsi3, 0x080D6690 + 1
	.set m4aSongNumStart, 0x080D4EF4 + 1
	.set sub_8000CD8, 0x08000CD8 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_80040B8, 0x080040B8 + 1
	.set sub_8006CA4, 0x08006CA4 + 1
	.set sub_8006D90, 0x08006D90 + 1
	.set sub_8006ED4, 0x08006ED4 + 1
	.set sub_8007940, 0x08007940 + 1
	.set sub_8030BE4, 0x08030BE4 + 1
	.section .text.sub_8006B38, "ax", %progbits
@ sub_8006B38 @ JP 0x08006B38 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8006B38
	.thumb_func
sub_8006B38:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	bl sub_8007940
	lsls r0, r0, #0x18
	asrs r3, r0, #0x18
	cmp r3, #0
	beq _08006B4E
	b _08006C98
_08006B4E:
	ldr r2, _08006B98 @ =0x085B90D4
	ldr r1, [r2]
	movs r0, #0x12
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bne _08006B72
	ldrb r0, [r1, #0x14]
	adds r0, #1
	strb r0, [r1, #0x14]
	ldr r0, [r2]
	movs r1, #0x14
	ldrsb r1, [r0, r1]
	ldrb r0, [r0, #0x13]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r1, r0
	bge _08006B72
	b _08006C98
_08006B72:
	ldr r0, [r2]
	strb r3, [r0, #0x14]
_08006B76:
	ldr r7, _08006B98 @ =0x085B90D4
	ldr r0, _08006B9C @ =0x0202BD2D
	mov r8, r0
_08006B7C:
	ldr r0, [r7]
	ldrb r0, [r0, #0x11]
	bl SetTalkFaceNoMouthMove
	adds r0, r6, #0
	bl sub_8006ED4
	cmp r0, #1
	beq _08006BD4
	cmp r0, #1
	bgt _08006BA0
	cmp r0, #0
	beq _08006BAA
	b _08006BD4
	.align 2, 0
_08006B98: .4byte 0x085B90D4
_08006B9C: .4byte 0x0202BD2D
_08006BA0:
	cmp r0, #2
	beq _08006BB2
	cmp r0, #3
	beq _08006BC6
	b _08006BD4
_08006BAA:
	adds r0, r6, #0
	bl sub_8002DE4
	b _08006C98
_08006BB2:
	ldr r1, [r7]
	movs r0, #0x12
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bne _08006B76
	movs r0, #0x13
	ldrsb r0, [r1, r0]
	cmp r0, #0
	ble _08006C82
	b _08006C98
_08006BC6:
	ldr r0, [r7]
	ldrb r1, [r0, #0x13]
	movs r2, #0
	strb r1, [r0, #0x14]
	ldr r0, [r7]
	strb r2, [r0, #0x12]
	b _08006C98
_08006BD4:
	movs r0, #0x20
	bl CheckTalkFlag
	cmp r0, #0
	bne _08006BE6
	adds r0, r6, #0
	bl sub_8006CA4
	b _08006BEC
_08006BE6:
	adds r0, r6, #0
	bl sub_8006D90
_08006BEC:
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _08006C98
	ldr r5, _08006C3C @ =0x085B90D4
	ldr r4, [r5]
	ldrb r0, [r4, #9]
	ldrb r1, [r4, #0xb]
	adds r0, r0, r1
	ldrb r1, [r4, #0xa]
	bl __modsi3
	lsls r0, r0, #3
	ldr r1, _08006C40 @ =0x030000C8
	adds r0, r0, r1
	ldr r1, [r4]
	bl sub_80040B8
	ldr r1, [r5]
	str r0, [r1]
	movs r0, #0x40
	bl CheckTalkFlag
	cmp r0, #0
	bne _08006C82
	movs r0, #0x80
	bl CheckTalkFlag
	cmp r0, #0
	beq _08006C44
	mov r1, r8
	ldrb r0, [r1]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08006C82
	movs r0, #0x7a
	bl m4aSongNumStart
	b _08006C82
	.align 2, 0
_08006C3C: .4byte 0x085B90D4
_08006C40: .4byte 0x030000C8
_08006C44:
	bl sub_8030BE4
	adds r4, r0, #0
	cmp r4, #1
	bne _08006C58
	bl sub_8000CD8
	ands r0, r4
	cmp r0, #0
	beq _08006C82
_08006C58:
	ldr r1, [r5]
	movs r0, #0x12
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq _08006C6C
	adds r0, r1, #0
	adds r0, #0x82
	ldrb r0, [r0]
	cmp r0, #0
	bne _08006C82
_08006C6C:
	adds r1, #0x82
	movs r0, #1
	strb r0, [r1]
	mov r1, r8
	ldrb r0, [r1]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08006C82
	movs r0, #0x6e
	bl m4aSongNumStart
_08006C82:
	ldr r1, [r7]
	movs r0, #0x12
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq _08006C8E
	b _08006B7C
_08006C8E:
	movs r0, #0x13
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bgt _08006C98
	b _08006B7C
_08006C98:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

