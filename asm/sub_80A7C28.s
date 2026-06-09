	.syntax unified
	.set WriteAndVerifySramFast, 0x080D6548 + 1
	.set sub_803144C, 0x0803144C + 1
	.section .text.sub_80A7C28, "ax", %progbits
@ sub_80A7C28 @ JP 0x080A7C28 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A7C28
	.thumb_func
sub_80A7C28:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0xb0
	mov r8, r0
	bl sub_803144C
	adds r6, r0, #0
	add r5, sp, #0x64
	movs r0, #0
	mov ip, r0
	movs r7, #0
_080A7C40:
	mov r0, sp
	adds r1, r0, r7
	ldrh r0, [r6]
	strb r0, [r1]
	ldrh r0, [r6]
	lsrs r4, r0, #8
	movs r0, #0x3f
	ands r4, r0
	movs r3, #7
	mov r0, ip
	ands r3, r0
	ldr r0, _080A7CA8 @ =0x081F56AC
	adds r0, r3, r0
	ldrb r2, [r5]
	ldrb r1, [r0]
	ands r1, r2
	adds r0, r4, #0
	lsls r0, r3
	orrs r1, r0
	strb r1, [r5]
	cmp r3, #1
	ble _080A7C86
	adds r5, #1
	cmp r3, #2
	ble _080A7C86
	ldr r0, _080A7CAC @ =0x081F56B4
	adds r0, r3, r0
	ldrb r2, [r5]
	ldrb r1, [r0]
	ands r1, r2
	movs r0, #8
	subs r0, r0, r3
	asrs r4, r0
	orrs r1, r4
	strb r1, [r5]
_080A7C86:
	movs r0, #6
	add ip, r0
	adds r6, #2
	adds r7, #1
	cmp r7, #0x63
	ble _080A7C40
	mov r0, sp
	mov r1, r8
	movs r2, #0xb0
	bl WriteAndVerifySramFast
	add sp, #0xb0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A7CA8: .4byte 0x081F56AC
_080A7CAC: .4byte 0x081F56B4

