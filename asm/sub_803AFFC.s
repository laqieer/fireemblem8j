	.syntax unified
	.set AreUnitsAllied, 0x08024D3C + 1
	.set sub_803B434, 0x0803B434 + 1
	.set sub_803B720, 0x0803B720 + 1
	.section .text.AiFindClosestUnlockPosition, "ax", %progbits
@ AiFindClosestUnlockPosition @ JP 0x0803AFFC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global AiFindClosestUnlockPosition
	.thumb_func
AiFindClosestUnlockPosition:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	str r0, [sp, #4]
	mov sb, r1
	mov r8, r2
	movs r0, #0xff
	str r0, [sp, #8]
	movs r1, #0
	str r1, [sp, #0xc]
	ldr r0, _0803B070 @ =0x0202E4D0
	movs r2, #2
	ldrsh r0, [r0, r2]
	subs r7, r0, #1
	cmp r7, #0
	bge _0803B024
	b _0803B1FA
_0803B024:
	movs r4, #1
	ldr r0, [sp, #4]
	ands r0, r4
	str r0, [sp, #0x10]
_0803B02C:
	ldr r0, _0803B070 @ =0x0202E4D0
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r6, r0, #1
	cmp r6, #0
	bge _0803B03A
	b _0803B1F2
_0803B03A:
	lsls r2, r7, #2
	mov sl, r2
	mov r5, sp
	movs r4, #2
	ldr r0, [sp, #4]
	ands r0, r4
	str r0, [sp, #0x14]
_0803B048:
	ldr r0, _0803B074 @ =0x0202E4E0
	ldr r0, [r0]
	add r0, sl
	ldr r0, [r0]
	adds r0, r0, r6
	ldrb r0, [r0]
	cmp r0, #0x78
	bls _0803B05A
	b _0803B1EA
_0803B05A:
	ldr r0, _0803B078 @ =0x0202E4D8
	ldr r0, [r0]
	add r0, sl
	ldr r0, [r0]
	adds r0, r0, r6
	ldrb r0, [r0]
	cmp r0, #0x1e
	beq _0803B07C
	cmp r0, #0x21
	beq _0803B0AC
	b _0803B1EA
	.align 2, 0
_0803B070: .4byte 0x0202E4D0
_0803B074: .4byte 0x0202E4E0
_0803B078: .4byte 0x0202E4D8
_0803B07C:
	ldr r0, [sp, #0xc]
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0xc]
	movs r0, #8
	ldr r1, [sp, #4]
	ands r0, r1
	cmp r0, #0
	beq _0803B092
	b _0803B1EA
_0803B092:
	adds r0, r6, #0
	adds r1, r7, #0
	ldr r2, _0803B0A8 @ =sub_803AE5C
	mov r3, sp
	bl sub_803B720
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0803B0A6
	b _0803B1EA
_0803B0A6:
	b _0803B154
	.align 2, 0
_0803B0A8: .4byte 0x0803AE5D  @ sub_803AE5C
_0803B0AC:
	ldr r0, [sp, #0xc]
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0xc]
	movs r0, #4
	ldr r2, [sp, #4]
	ands r0, r2
	cmp r0, #0
	beq _0803B0C2
	b _0803B1EA
_0803B0C2:
	strh r6, [r5]
	mov r4, sp
	strh r7, [r4, #2]
	ldr r0, _0803B148 @ =0x0202E4DC
	ldr r0, [r0]
	add r0, sl
	ldr r0, [r0]
	adds r0, r0, r6
	ldrb r2, [r0]
	ldr r0, _0803B14C @ =0x03004DF0
	ldr r3, [r0]
	movs r1, #0x1d
	ldrsb r1, [r3, r1]
	ldr r0, [r3, #4]
	ldrb r0, [r0, #0x12]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, r1, r0
	cmp r2, r1
	bgt _0803B154
	ldr r0, [sp, #0x10]
	cmp r0, #0
	beq _0803B11A
	movs r1, #2
	ldrsh r0, [r4, r1]
	ldr r1, _0803B150 @ =0x0202E4D4
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r2, #0
	ldrsh r1, [r5, r2]
	ldr r0, [r0]
	adds r1, r0, r1
	ldrb r0, [r1]
	cmp r0, #0
	beq _0803B11A
	movs r0, #0xb
	ldrsb r0, [r3, r0]
	ldrb r1, [r1]
	bl AreUnitsAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803B1EA
_0803B11A:
	ldr r4, [sp, #0x14]
	cmp r4, #0
	beq _0803B130
	movs r1, #0
	ldrsh r0, [r5, r1]
	movs r2, #2
	ldrsh r1, [r5, r2]
	bl sub_803B434
	cmp r0, #0
	bne _0803B1EA
_0803B130:
	ldrh r0, [r5]
	mov r4, sb
	strh r0, [r4]
	ldrh r0, [r5, #2]
	strh r0, [r4, #2]
	mov r0, r8
	cmp r0, #0
	beq _0803B230
	strh r6, [r0]
	strh r7, [r0, #2]
	b _0803B230
	.align 2, 0
_0803B148: .4byte 0x0202E4DC
_0803B14C: .4byte 0x03004DF0
_0803B150: .4byte 0x0202E4D4
_0803B154:
	ldr r1, [sp, #0x10]
	cmp r1, #0
	beq _0803B18A
	movs r2, #2
	ldrsh r0, [r5, r2]
	ldr r1, _0803B220 @ =0x0202E4D4
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r4, #0
	ldrsh r1, [r5, r4]
	ldr r0, [r0]
	adds r1, r0, r1
	ldrb r0, [r1]
	cmp r0, #0
	beq _0803B18A
	ldr r0, _0803B224 @ =0x03004DF0
	ldr r0, [r0]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldrb r1, [r1]
	bl AreUnitsAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803B1EA
_0803B18A:
	ldr r0, [sp, #0x14]
	cmp r0, #0
	beq _0803B1A0
	movs r1, #0
	ldrsh r0, [r5, r1]
	movs r2, #2
	ldrsh r1, [r5, r2]
	bl sub_803B434
	cmp r0, #0
	bne _0803B1EA
_0803B1A0:
	mov r2, sp
	movs r4, #2
	ldrsh r0, [r2, r4]
	ldr r1, _0803B228 @ =0x0202E4E0
	ldr r3, [r1]
	lsls r0, r0, #2
	adds r0, r0, r3
	movs r4, #0
	ldrsh r1, [r5, r4]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldr r1, [sp, #8]
	cmp r1, r0
	ble _0803B1EA
	ldrh r0, [r5]
	mov r4, sb
	strh r0, [r4]
	ldrh r0, [r2, #2]
	strh r0, [r4, #2]
	movs r1, #2
	ldrsh r0, [r2, r1]
	lsls r0, r0, #2
	adds r0, r0, r3
	movs r2, #0
	ldrsh r1, [r5, r2]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	str r0, [sp, #8]
	mov r4, r8
	cmp r4, #0
	beq _0803B1EA
	strh r6, [r4]
	strh r7, [r4, #2]
_0803B1EA:
	subs r6, #1
	cmp r6, #0
	blt _0803B1F2
	b _0803B048
_0803B1F2:
	subs r7, #1
	cmp r7, #0
	blt _0803B1FA
	b _0803B02C
_0803B1FA:
	movs r0, #0
	cmp r0, #0
	bne _0803B208
	ldr r0, _0803B22C @ =0x0203AA00
	adds r0, #0x87
	movs r1, #1
	strb r1, [r0]
_0803B208:
	ldr r0, [sp, #0xc]
	cmp r0, #0
	bne _0803B216
	ldr r0, _0803B22C @ =0x0203AA00
	adds r0, #0x86
	movs r1, #5
	strb r1, [r0]
_0803B216:
	ldr r1, [sp, #8]
	cmp r1, #0xff
	bne _0803B230
	movs r0, #0
	b _0803B232
	.align 2, 0
_0803B220: .4byte 0x0202E4D4
_0803B224: .4byte 0x03004DF0
_0803B228: .4byte 0x0202E4E0
_0803B22C: .4byte 0x0203AA00
_0803B230:
	movs r0, #1
_0803B232:
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

