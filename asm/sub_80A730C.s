	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set __modsi3, 0x080D6690 + 1
	.set sub_8003CF8, 0x08003CF8 + 1
	.set sub_8004320, 0x08004320 + 1
	.set sub_8004374, 0x08004374 + 1
	.section .text.sub_80A730C, "ax", %progbits
@ sub_80A730C @ JP 0x080A730C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A730C
	.thumb_func
sub_80A730C:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	str r0, [sp, #0xc]
	mov r8, r1
	add r1, sp, #8
	movs r0, #0
	strb r0, [r1, #2]
	movs r0, #4
	bl BG_EnableSyncByMask
	movs r0, #0
	str r0, [sp, #0x10]
	add r7, sp, #8
	movs r1, #0xe0
	lsls r1, r1, #1
	mov sl, r1
	mov sb, r0
	movs r6, #0
_080A7338:
	ldr r1, [sp, #0xc]
	adds r0, r1, r6
	bl sub_8003CF8
	movs r5, #2
	bl sub_8004320
	movs r4, #0
_080A7348:
	mov r0, sb
	adds r2, r0, r4
	ldr r0, _080A73C4 @ =0x02014FC8
	ldrh r1, [r0, #6]
	ldr r0, _080A73C8 @ =0x02014EF4
	ldr r0, [r0]
	adds r1, r1, r0
	cmp r2, r1
	beq _080A73B4
	ldr r1, _080A73CC @ =0x02014F28
	adds r1, r2, r1
	ldrb r0, [r1]
	lsls r0, r0, #1
	add r0, r8
	ldrb r0, [r0]
	strb r0, [r7]
	ldrb r0, [r1]
	lsls r0, r0, #1
	add r0, r8
	ldrb r0, [r0, #1]
	strb r0, [r7, #1]
	movs r1, #0
	str r1, [sp]
	add r0, sp, #8
	str r0, [sp, #4]
	ldr r1, [sp, #0xc]
	adds r0, r1, r6
	ldr r1, _080A73D0 @ =0x02023CB0
	add r1, sl
	movs r2, #1
	adds r3, r5, #0
	bl sub_8004374
	adds r5, #0xb
	adds r4, #1
	adds r0, r4, #0
	movs r1, #5
	bl __modsi3
	cmp r0, #0
	bne _080A739C
	adds r5, #0xb
_080A739C:
	cmp r4, #0xd
	ble _080A7348
	movs r0, #0xc0
	add sl, r0
	movs r1, #0xe
	add sb, r1
	adds r6, #8
	ldr r0, [sp, #0x10]
	adds r0, #1
	str r0, [sp, #0x10]
	cmp r0, #2
	ble _080A7338
_080A73B4:
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A73C4: .4byte 0x02014FC8
_080A73C8: .4byte 0x02014EF4
_080A73CC: .4byte 0x02014F28
_080A73D0: .4byte 0x02023CB0

