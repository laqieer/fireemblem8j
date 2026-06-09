	.syntax unified
	.set sub_80A1610, 0x080A1610 + 1
	.set sub_80B1FBC, 0x080B1FBC + 1
	.section .text.sub_80A1894, "ax", %progbits
@ sub_80A1894 @ JP 0x080A1894 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A1894
	.thumb_func
sub_80A1894:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov ip, r0
	adds r0, #0x33
	ldrb r1, [r0]
	lsls r1, r1, #1
	adds r0, #5
	adds r4, r0, r1
	ldrh r3, [r4]
	lsls r2, r3, #4
	adds r0, #0x12
	adds r0, r0, r1
	ldrh r0, [r0]
	subs r0, #0x28
	subs r2, r2, r0
	cmp r2, #0x37
	bgt _080A18C0
	cmp r3, #0
	beq _080A18C0
	adds r0, r3, #1
	strh r0, [r4]
_080A18C0:
	mov r4, ip
	adds r4, #0x33
	ldrb r0, [r4]
	lsls r0, r0, #1
	mov r3, ip
	adds r3, #0x38
	adds r6, r3, r0
	ldrh r5, [r6]
	lsls r1, r5, #4
	mov r2, ip
	adds r2, #0x4a
	adds r0, r2, r0
	ldrh r0, [r0]
	subs r0, #0x28
	subs r1, r1, r0
	adds r7, r3, #0
	mov r8, r2
	cmp r1, #0x78
	ble _080A18F4
	ldr r0, _080A1924 @ =0x02012F56
	ldrh r0, [r0]
	subs r0, #1
	cmp r5, r0
	beq _080A18F4
	subs r0, r5, #1
	strh r0, [r6]
_080A18F4:
	mov r0, ip
	bl sub_80A1610
	ldrb r0, [r4]
	lsls r0, r0, #1
	adds r1, r7, r0
	ldrh r1, [r1]
	lsls r1, r1, #4
	add r0, r8
	ldrh r0, [r0]
	subs r0, #0x28
	subs r1, r1, r0
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x80
	movs r2, #0xb
	bl sub_80B1FBC
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A1924: .4byte 0x02012F56

