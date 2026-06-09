	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set IsItemDisplayUsable, 0x08016C8C + 1
	.set memcpy, 0x080D6908 + 1
	.set sub_8003CF8, 0x08003CF8 + 1
	.set sub_80165F0, 0x080165F0 + 1
	.set sub_80D636C, 0x080D636C + 1
	.section .text.sub_802D3E0, "ax", %progbits
@ sub_802D3E0 @ JP 0x0802D3E0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_802D3E0
	.thumb_func
sub_802D3E0:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	adds r5, r0, #0
	ldr r1, _0802D4AC @ =0x080DC974
	mov r0, sp
	movs r2, #2
	bl memcpy
	add r4, sp, #4
	ldr r1, _0802D4B0 @ =0x080DC976
	adds r0, r4, #0
	movs r2, #2
	bl memcpy
	movs r0, #0
	str r0, [sp, #8]
	add r0, sp, #8
	ldr r1, _0802D4B4 @ =0x02022EE8
	ldr r2, _0802D4B8 @ =0x010000B0
	bl sub_80D636C
	movs r0, #0
	mov r8, r0
	adds r5, #0x2c
	str r5, [sp, #0xc]
_0802D41A:
	movs r7, #0
	mov r1, r8
	lsls r0, r1, #2
	adds r1, #1
	str r1, [sp, #0x10]
	ldr r1, [sp, #0xc]
	adds r1, r1, r0
	mov sb, r1
	add r0, r8
	lsls r0, r0, #3
	mov sl, r0
_0802D430:
	mov r1, sb
	ldr r0, [r1]
	lsls r4, r7, #1
	adds r0, #0x1e
	adds r0, r0, r4
	ldrh r5, [r0]
	lsls r0, r7, #3
	ldr r1, _0802D4BC @ =0x0200278C
	adds r0, r0, r1
	mov r1, sl
	adds r6, r1, r0
	adds r0, r6, #0
	bl sub_8003CF8
	cmp r5, #0
	beq _0802D486
	mov r1, sb
	ldr r0, [r1]
	adds r1, r5, #0
	bl IsItemDisplayUsable
	adds r2, r0, #0
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	mov r0, sp
	add r0, r8
	adds r0, #4
	ldrb r3, [r0]
	adds r3, r3, r4
	adds r3, #1
	lsls r3, r3, #5
	adds r3, #1
	mov r0, sp
	add r0, r8
	ldrb r0, [r0]
	adds r3, r3, r0
	lsls r3, r3, #1
	ldr r0, _0802D4C0 @ =0x02022CA8
	adds r3, r3, r0
	adds r0, r6, #0
	adds r1, r5, #0
	bl sub_80165F0
_0802D486:
	adds r7, #1
	cmp r7, #4
	ble _0802D430
	ldr r0, [sp, #0x10]
	mov r8, r0
	cmp r0, #1
	ble _0802D41A
	movs r0, #1
	bl BG_EnableSyncByMask
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802D4AC: .4byte 0x080DC974
_0802D4B0: .4byte 0x080DC976
_0802D4B4: .4byte 0x02022EE8
_0802D4B8: .4byte 0x010000B0
_0802D4BC: .4byte 0x0200278C
_0802D4C0: .4byte 0x02022CA8

