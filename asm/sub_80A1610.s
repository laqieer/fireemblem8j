	.syntax unified
	.set BG_SetPosition, 0x08001448 + 1
	.section .text.sub_80A1610, "ax", %progbits
@ sub_80A1610 @ JP 0x080A1610 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A1610
	.thumb_func
sub_80A1610:
	push {r4, r5, lr}
	mov ip, r0
	ldr r0, _080A1638 @ =0x02012F56
	ldrh r4, [r0]
	adds r5, r0, #0
	cmp r4, #0
	bne _080A163C
	mov r3, ip
	adds r3, #0x33
	ldrb r0, [r3]
	lsls r0, r0, #1
	mov r1, ip
	adds r1, #0x38
	adds r1, r1, r0
	mov r2, ip
	adds r2, #0x4a
	adds r0, r2, r0
	strh r4, [r0]
	strh r4, [r1]
	b _080A165A
	.align 2, 0
_080A1638: .4byte 0x02012F56
_080A163C:
	mov r2, ip
	adds r2, #0x33
	ldrb r0, [r2]
	lsls r0, r0, #1
	mov r1, ip
	adds r1, #0x38
	adds r4, r1, r0
	ldrh r1, [r4]
	ldrh r0, [r5]
	subs r0, #1
	adds r3, r2, #0
	adds r2, #0x17
	cmp r1, r0
	ble _080A165A
	strh r0, [r4]
_080A165A:
	ldrh r0, [r5]
	cmp r0, #6
	bls _080A1678
	ldrb r0, [r3]
	lsls r0, r0, #1
	adds r4, r2, r0
	ldrh r0, [r4]
	lsrs r0, r0, #4
	adds r0, #7
	ldrh r1, [r5]
	cmp r0, r1
	ble _080A1678
	subs r0, r1, #7
	lsls r0, r0, #4
	strh r0, [r4]
_080A1678:
	ldrb r0, [r3]
	lsls r0, r0, #1
	adds r0, r2, r0
	ldrh r2, [r0]
	subs r2, #0x28
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	movs r1, #0
	bl BG_SetPosition
	pop {r4, r5}
	pop {r0}
	bx r0

