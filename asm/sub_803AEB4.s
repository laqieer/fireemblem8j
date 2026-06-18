	.syntax unified
	.set AiIsInByteList, 0x0803AD38 + 1
	.set AreUnitsAllied, 0x08024D3C + 1
	.set sub_803B434, 0x0803B434 + 1
	.set sub_803B720, 0x0803B720 + 1
	.section .text.sub_803AEB4, "ax", %progbits
@ AiFindClosestTerrainAdjacentPosition @ JP 0x0803AEB4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global AiFindClosestTerrainAdjacentPosition
	.thumb_func
AiFindClosestTerrainAdjacentPosition:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	str r0, [sp, #4]
	mov sl, r1
	mov sb, r2
	movs r0, #0xff
	str r0, [sp, #8]
	ldr r0, _0803AFD0 @ =0x0202E4D0
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r6, r0, #1
	cmp r6, #0
	blt _0803AFC4
	mov r8, sp
_0803AED8:
	ldr r0, _0803AFD0 @ =0x0202E4D0
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r5, r0, #1
	subs r3, r6, #1
	str r3, [sp, #0xc]
	cmp r5, #0
	blt _0803AFBE
	lsls r7, r6, #2
	str r7, [sp, #0x10]
_0803AEEC:
	ldr r0, _0803AFD4 @ =0x0202E4E0
	ldr r0, [r0]
	ldr r1, [sp, #0x10]
	adds r0, r1, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0803AFB8
	ldr r0, _0803AFD8 @ =0x0202E4D8
	ldr r0, [r0]
	adds r0, r1, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r1, [r0]
	ldr r0, [sp, #4]
	bl AiIsInByteList
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803AFB8
	movs r0, #1
	mov r2, sl
	ands r0, r2
	cmp r0, #0
	beq _0803AF48
	ldr r0, _0803AFDC @ =0x0202E4D4
	ldr r0, [r0]
	ldr r3, [sp, #0x10]
	adds r0, r3, r0
	ldr r0, [r0]
	adds r1, r0, r5
	ldrb r0, [r1]
	cmp r0, #0
	beq _0803AF48
	ldr r0, _0803AFE0 @ =0x03004DF0
	ldr r0, [r0]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldrb r1, [r1]
	bl AreUnitsAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803AFB8
_0803AF48:
	movs r0, #2
	mov r7, sl
	ands r0, r7
	cmp r0, #0
	beq _0803AF62
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	lsls r1, r6, #0x10
	asrs r1, r1, #0x10
	bl sub_803B434
	cmp r0, #0
	bne _0803AFB8
_0803AF62:
	mov r4, sp
	adds r0, r5, #0
	adds r1, r6, #0
	ldr r2, _0803AFE4 @ =sub_803AE5C
	mov r3, sp
	bl sub_803B720
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803AFB8
	movs r1, #2
	ldrsh r0, [r4, r1]
	ldr r1, _0803AFD4 @ =0x0202E4E0
	ldr r2, [r1]
	lsls r0, r0, #2
	adds r0, r0, r2
	mov r3, r8
	movs r7, #0
	ldrsh r1, [r3, r7]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldr r1, [sp, #8]
	cmp r1, r0
	ble _0803AFB8
	ldrh r0, [r3]
	mov r3, sb
	strh r0, [r3]
	ldrh r0, [r4, #2]
	strh r0, [r3, #2]
	movs r7, #2
	ldrsh r0, [r4, r7]
	lsls r0, r0, #2
	adds r0, r0, r2
	mov r2, r8
	movs r3, #0
	ldrsh r1, [r2, r3]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	str r0, [sp, #8]
_0803AFB8:
	subs r5, #1
	cmp r5, #0
	bge _0803AEEC
_0803AFBE:
	ldr r6, [sp, #0xc]
	cmp r6, #0
	bge _0803AED8
_0803AFC4:
	ldr r7, [sp, #8]
	cmp r7, #0xff
	bne _0803AFE8
	movs r0, #0
	b _0803AFEA
	.align 2, 0
_0803AFD0: .4byte 0x0202E4D0
_0803AFD4: .4byte 0x0202E4E0
_0803AFD8: .4byte 0x0202E4D8
_0803AFDC: .4byte 0x0202E4D4
_0803AFE0: .4byte 0x03004DF0
_0803AFE4: .4byte 0x0803AE5D  @ sub_803AE5C
_0803AFE8:
	movs r0, #1
_0803AFEA:
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

