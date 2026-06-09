	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set CheckInLinkArena, 0x08042E1C + 1
	.set GetUnitFromPrepList, 0x08097634 + 1
	.set PrepGetUnitAmount, 0x08097654 + 1
	.set __modsi3, 0x080D6690 + 1
	.set sub_8003CF8, 0x08003CF8 + 1
	.set sub_8004374, 0x08004374 + 1
	.set sub_8009FA8, 0x08009FA8 + 1
	.set sub_80976D0, 0x080976D0 + 1
	.section .text.sub_809C84C, "ax", %progbits
@ sub_809C84C @ JP 0x0809C84C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_809C84C
	.thumb_func
sub_809C84C:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r0, r1, #0
	movs r7, #0
	lsls r1, r0, #1
	mov r8, r1
	movs r1, #7
	bl __modsi3
	mov sl, r0
	movs r2, #0
	mov sb, r2
_0809C86C:
	mov r0, r8
	adds r4, r0, r7
	bl PrepGetUnitAmount
	cmp r4, r0
	bge _0809C8E6
	adds r0, r4, #0
	bl GetUnitFromPrepList
	adds r5, r0, #0
	movs r6, #0
	bl CheckInLinkArena
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0809C89E
	ldr r0, [r5]
	ldrb r0, [r0, #4]
	bl sub_80976D0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809C89E
	movs r6, #4
	b _0809C8AA
_0809C89E:
	ldr r0, [r5, #0xc]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	beq _0809C8AA
	movs r6, #1
_0809C8AA:
	mov r1, sl
	lsls r4, r1, #1
	adds r4, r4, r7
	lsls r4, r4, #3
	ldr r0, _0809C908 @ =0x02013590
	adds r4, r4, r0
	adds r0, r4, #0
	bl sub_8003CF8
	ldr r0, [r5]
	ldrh r0, [r0]
	bl sub_8009FA8
	movs r1, #0x1f
	mov r2, r8
	ands r1, r2
	lsls r1, r1, #5
	adds r1, #0x10
	add r1, sb
	lsls r1, r1, #1
	ldr r2, _0809C90C @ =0x02023CA8
	adds r1, r1, r2
	movs r2, #0
	str r2, [sp]
	str r0, [sp, #4]
	adds r0, r4, #0
	adds r2, r6, #0
	movs r3, #0
	bl sub_8004374
_0809C8E6:
	movs r0, #7
	add sb, r0
	adds r7, #1
	cmp r7, #1
	ble _0809C86C
	movs r0, #4
	bl BG_EnableSyncByMask
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809C908: .4byte 0x02013590
_0809C90C: .4byte 0x02023CA8

