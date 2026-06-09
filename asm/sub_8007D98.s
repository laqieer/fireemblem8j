	.syntax unified
	.set m4aSongNumStart, 0x080D4EF4 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_804F528, 0x0804F528 + 1
	.set sub_80D65BC, 0x080D65BC + 1
	.section .text.sub_8007D98, "ax", %progbits
@ sub_8007D98 @ JP 0x08007D98 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8007D98
	.thumb_func
sub_8007D98:
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _08007DC4 @ =0x085775CC
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08007DD0
	ldr r0, _08007DC8 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08007DBC
	movs r0, #0x6b
	bl m4aSongNumStart
_08007DBC:
	ldr r1, _08007DCC @ =0x030000E0
	movs r0, #0
	b _08007DF2
	.align 2, 0
_08007DC4: .4byte 0x085775CC
_08007DC8: .4byte 0x0202BCEC
_08007DCC: .4byte 0x030000E0
_08007DD0:
	movs r5, #1
	adds r0, r5, #0
	ands r0, r1
	cmp r0, #0
	beq _08007E04
	ldr r0, _08007DFC @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08007DEC
	movs r0, #0x6a
	bl m4aSongNumStart
_08007DEC:
	ldr r1, _08007E00 @ =0x030000E0
	movs r2, #0x2a
	ldrsh r0, [r4, r2]
_08007DF2:
	str r0, [r1]
	adds r0, r4, #0
	bl sub_8002DE4
	b _08007E88
	.align 2, 0
_08007DFC: .4byte 0x0202BCEC
_08007E00: .4byte 0x030000E0
_08007E04:
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08007E34
	movs r1, #0x2a
	ldrsh r0, [r4, r1]
	cmp r0, #2
	bne _08007E34
	ldr r0, _08007E90 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08007E26
	movs r0, #0x67
	bl m4aSongNumStart
_08007E26:
	strh r5, [r4, #0x2a]
	ldr r0, [r4, #0x34]
	ldr r0, [r0, #4]
	cmp r0, #0
	beq _08007E34
	bl sub_80D65BC
_08007E34:
	ldr r0, _08007E94 @ =0x085775CC
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08007E6C
	movs r2, #0x2a
	ldrsh r0, [r4, r2]
	cmp r0, #1
	bne _08007E6C
	ldr r0, _08007E90 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08007E5C
	movs r0, #0x67
	bl m4aSongNumStart
_08007E5C:
	movs r0, #2
	strh r0, [r4, #0x2a]
	ldr r0, [r4, #0x34]
	ldr r0, [r0, #0xc]
	cmp r0, #0
	beq _08007E6C
	bl sub_80D65BC
_08007E6C:
	movs r1, #0x2c
	ldrsh r0, [r4, r1]
	movs r1, #0x2a
	ldrsh r2, [r4, r1]
	subs r2, #1
	lsls r1, r2, #2
	adds r1, r1, r2
	lsls r1, r1, #3
	adds r0, r0, r1
	subs r0, #4
	movs r2, #0x2e
	ldrsh r1, [r4, r2]
	bl sub_804F528
_08007E88:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08007E90: .4byte 0x0202BCEC
_08007E94: .4byte 0x085775CC

