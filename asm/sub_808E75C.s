	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set CallARM_PushToSecondaryOAM, 0x08002B08 + 1
	.set ClearUnitMapUiStatus, 0x0808E660 + 1
	.set StoreNumberStringOrDashesToSmallBuffer, 0x08003868 + 1
	.set sub_8018E64, 0x08018E64 + 1
	.set sub_8018EA4, 0x08018EA4 + 1
	.set sub_808E688, 0x0808E688 + 1
	.section .text.sub_808E75C, "ax", %progbits
@ sub_808E75C @ JP 0x0808E75C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_808E75C
	.thumb_func
sub_808E75C:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	adds r5, r1, #0
	adds r0, #0x44
	movs r1, #0
	ldrsh r6, [r0, r1]
	adds r0, r5, #0
	adds r0, #0x30
	ldrb r1, [r0]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0xa
	bne _0808E77C
	movs r6, #0
_0808E77C:
	movs r0, #0x3f
	ands r0, r6
	cmp r0, #0
	bne _0808E814
	movs r0, #0x40
	ands r0, r6
	cmp r0, #0
	beq _0808E79C
	ldr r0, [r4, #0x40]
	adds r1, r5, #0
	bl sub_808E688
	movs r0, #1
	bl BG_EnableSyncByMask
	b _0808E814
_0808E79C:
	adds r0, r5, #0
	bl sub_8018E64
	cmp r0, #0x63
	ble _0808E7AE
	movs r0, #0xff
	bl StoreNumberStringOrDashesToSmallBuffer
	b _0808E7B8
_0808E7AE:
	adds r0, r5, #0
	bl sub_8018E64
	bl StoreNumberStringOrDashesToSmallBuffer
_0808E7B8:
	ldr r1, _0808E7E0 @ =0x02028E44
	ldrb r0, [r1, #6]
	subs r0, #0x30
	adds r2, r4, #0
	adds r2, #0x51
	strb r0, [r2]
	ldrb r0, [r1, #7]
	subs r0, #0x30
	adds r1, r4, #0
	adds r1, #0x52
	strb r0, [r1]
	adds r0, r5, #0
	bl sub_8018EA4
	cmp r0, #0x63
	ble _0808E7E4
	movs r0, #0xff
	bl StoreNumberStringOrDashesToSmallBuffer
	b _0808E7EE
	.align 2, 0
_0808E7E0: .4byte 0x02028E44
_0808E7E4:
	adds r0, r5, #0
	bl sub_8018EA4
	bl StoreNumberStringOrDashesToSmallBuffer
_0808E7EE:
	ldr r1, _0808E8C0 @ =0x02028E44
	ldrb r0, [r1, #6]
	subs r0, #0x30
	adds r2, r4, #0
	adds r2, #0x53
	strb r0, [r2]
	ldrb r0, [r1, #7]
	subs r0, #0x30
	adds r1, r4, #0
	adds r1, #0x54
	strb r0, [r1]
	ldr r1, [r4, #0x40]
	adds r0, r4, #0
	adds r2, r5, #0
	bl ClearUnitMapUiStatus
	movs r0, #1
	bl BG_EnableSyncByMask
_0808E814:
	adds r0, r4, #0
	adds r0, #0x55
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0808E8B4
	movs r0, #0x40
	ands r6, r0
	cmp r6, #0
	beq _0808E838
	adds r0, r5, #0
	adds r0, #0x30
	ldrb r1, [r0]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	bne _0808E8B4
_0808E838:
	adds r0, r4, #0
	adds r0, #0x46
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r5, r0, #3
	adds r7, r5, #0
	adds r7, #0x11
	adds r0, r4, #0
	adds r0, #0x48
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r6, r0, #3
	adds r1, r4, #0
	adds r1, #0x51
	ldrb r0, [r1]
	cmp r0, #0xf0
	beq _0808E86A
	ldr r2, _0808E8C4 @ =0x085B8CDC
	adds r3, r0, #0
	ldr r0, _0808E8C8 @ =0x000082E0
	adds r3, r3, r0
	adds r0, r7, #0
	adds r1, r6, #0
	bl CallARM_PushToSecondaryOAM
_0808E86A:
	adds r0, r5, #0
	adds r0, #0x18
	ldr r7, _0808E8C4 @ =0x085B8CDC
	adds r1, r4, #0
	adds r1, #0x52
	ldrb r3, [r1]
	ldr r1, _0808E8C8 @ =0x000082E0
	mov r8, r1
	add r3, r8
	adds r1, r6, #0
	adds r2, r7, #0
	bl CallARM_PushToSecondaryOAM
	adds r1, r4, #0
	adds r1, #0x53
	ldrb r0, [r1]
	cmp r0, #0xf0
	beq _0808E8A0
	adds r0, r5, #0
	adds r0, #0x29
	ldrb r3, [r1]
	ldr r1, _0808E8C8 @ =0x000082E0
	adds r3, r3, r1
	adds r1, r6, #0
	adds r2, r7, #0
	bl CallARM_PushToSecondaryOAM
_0808E8A0:
	adds r0, r5, #0
	adds r0, #0x30
	adds r1, r4, #0
	adds r1, #0x54
	ldrb r3, [r1]
	add r3, r8
	adds r1, r6, #0
	adds r2, r7, #0
	bl CallARM_PushToSecondaryOAM
_0808E8B4:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808E8C0: .4byte 0x02028E44
_0808E8C4: .4byte 0x085B8CDC
_0808E8C8: .4byte 0x000082E0

