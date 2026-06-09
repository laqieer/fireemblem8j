	.syntax unified
	.set BG_SetPosition, 0x08001448 + 1
	.set GetBackgroundTileDataOffset, 0x08000F3C + 1
	.set InitBmBgLayers, 0x08015624 + 1
	.set InitOam, 0x0800204C + 1
	.set SetBackgroundMapDataOffset, 0x08000FB4 + 1
	.set SetBackgroundScreenSize, 0x08000FFC + 1
	.set SetBackgroundTileDataOffset, 0x08000F8C + 1
	.set memcpy, 0x080D6908 + 1
	.set sub_80011D0, 0x080011D0 + 1
	.set sub_8001BC0, 0x08001BC0 + 1
	.set sub_80D636C, 0x080D636C + 1
	.section .text.sub_8001ACC, "ax", %progbits
@ sub_8001ACC @ JP 0x08001ACC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8001ACC
	.thumb_func
sub_8001ACC:
	push {r4, r5, r6, r7, lr}
	sub sp, #0x1c
	adds r4, r0, #0
	ldr r1, _08001BA4 @ =0x080DC144
	mov r0, sp
	movs r2, #0x18
	bl memcpy
	cmp r4, #0
	bne _08001AE2
	mov r4, sp
_08001AE2:
	ldr r1, _08001BA8 @ =0x0300302C
	movs r0, #0
	strh r0, [r1]
	strh r0, [r1, #4]
	strh r0, [r1, #8]
	strh r0, [r1, #0xc]
	movs r5, #0
	add r7, sp, #0x18
_08001AF2:
	ldrh r1, [r4]
	adds r4, #2
	adds r0, r5, #0
	bl SetBackgroundTileDataOffset
	ldrh r1, [r4]
	adds r4, #2
	adds r0, r5, #0
	bl SetBackgroundMapDataOffset
	ldrh r1, [r4]
	adds r4, #2
	adds r0, r5, #0
	bl SetBackgroundScreenSize
	lsls r0, r5, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	adds r0, r5, #0
	bl sub_8001BC0
	movs r1, #0
	bl sub_80011D0
	movs r6, #0
	str r6, [sp, #0x18]
	adds r0, r5, #0
	bl GetBackgroundTileDataOffset
	adds r1, r0, #0
	movs r0, #0xc0
	lsls r0, r0, #0x13
	adds r1, r1, r0
	adds r0, r7, #0
	ldr r2, _08001BAC @ =0x01000010
	bl sub_80D636C
	adds r5, #1
	cmp r5, #3
	ble _08001AF2
	bl InitBmBgLayers
	ldr r2, _08001BB0 @ =0x0300000C
	ldrb r0, [r2]
	movs r1, #0xf
	orrs r0, r1
	strb r0, [r2]
	movs r0, #0
	bl InitOam
	ldr r0, _08001BB4 @ =0x020228A8
	strh r6, [r0]
	ldr r0, _08001BB8 @ =0x0300000D
	movs r4, #1
	strb r4, [r0]
	ldr r2, _08001BBC @ =0x03003020
	ldrb r1, [r2]
	movs r3, #0x7f
	adds r0, r3, #0
	ands r0, r1
	movs r1, #8
	rsbs r1, r1, #0
	ands r0, r1
	strb r0, [r2]
	ldrb r1, [r2, #1]
	movs r0, #0x21
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	ands r0, r3
	orrs r0, r4
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
	add sp, #0x1c
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08001BA4: .4byte 0x080DC144
_08001BA8: .4byte 0x0300302C
_08001BAC: .4byte 0x01000010
_08001BB0: .4byte 0x0300000C
_08001BB4: .4byte 0x020228A8
_08001BB8: .4byte 0x0300000D
_08001BBC: .4byte 0x03003020

