	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_80D36E4, "ax", %progbits
@ sub_80D36E4 @ JP 0x080D36E4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80D36E4
	.thumb_func
sub_80D36E4:
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	ldr r0, [r7, #0x38]
	cmp r0, #0
	bne _080D375C
	movs r3, #0xe0
	lsls r3, r3, #1
	movs r6, #0x98
	lsls r6, r6, #2
	movs r0, #0
	ldr r5, _080D3758 @ =0x020234A8
_080D36FA:
	movs r1, #0x20
	rsbs r1, r1, #0
	adds r1, r1, r3
	mov ip, r1
	adds r4, r0, #1
	adds r1, r3, #0
	adds r1, #0xa
	adds r0, r3, #0
	adds r0, #0x2a
	movs r3, #0x12
	lsls r0, r0, #1
	adds r2, r0, r5
	lsls r1, r1, #1
	adds r1, r1, r5
_080D3716:
	ldrh r0, [r1]
	strh r0, [r2]
	adds r1, #2
	adds r2, #2
	subs r3, #1
	cmp r3, #0
	bge _080D3716
	mov r3, ip
	adds r0, r4, #0
	cmp r0, #6
	ble _080D36FA
	ldr r0, [r7, #0x34]
	cmp r0, #0
	beq _080D3734
	subs r6, #0x20
_080D3734:
	ldr r2, _080D3758 @ =0x020234A8
	adds r1, r6, #0
	adds r1, #0xa
	adds r0, r3, #0
	adds r0, #0x2a
	movs r3, #0x12
	lsls r0, r0, #1
	adds r4, r0, r2
	lsls r1, r1, #1
	adds r1, r1, r2
_080D3748:
	ldrh r0, [r1]
	strh r0, [r4]
	adds r1, #2
	adds r4, #2
	subs r3, #1
	cmp r3, #0
	bge _080D3748
	b _080D37C2
	.align 2, 0
_080D3758: .4byte 0x020234A8
_080D375C:
	movs r3, #0x80
	lsls r3, r3, #1
	movs r6, #0x88
	lsls r6, r6, #2
	movs r0, #0
	ldr r5, _080D37D4 @ =0x020234A8
_080D3768:
	adds r4, r0, #1
	movs r0, #0x20
	adds r0, r0, r3
	mov ip, r0
	adds r1, r3, #0
	adds r1, #0x2a
	adds r0, r3, #0
	adds r0, #0xa
	movs r3, #0x12
	lsls r0, r0, #1
	adds r2, r0, r5
	lsls r1, r1, #1
	adds r1, r1, r5
_080D3782:
	ldrh r0, [r1]
	strh r0, [r2]
	adds r1, #2
	adds r2, #2
	subs r3, #1
	cmp r3, #0
	bge _080D3782
	mov r3, ip
	adds r0, r4, #0
	cmp r0, #6
	ble _080D3768
	ldr r0, [r7, #0x34]
	cmp r0, #0
	beq _080D37A0
	adds r6, #0x20
_080D37A0:
	ldr r2, _080D37D4 @ =0x020234A8
	adds r1, r6, #0
	adds r1, #0x2a
	adds r0, r3, #0
	adds r0, #0xa
	movs r3, #0x12
	lsls r0, r0, #1
	adds r4, r0, r2
	lsls r1, r1, #1
	adds r1, r1, r2
_080D37B4:
	ldrh r0, [r1]
	strh r0, [r4]
	adds r1, #2
	adds r4, #2
	subs r3, #1
	cmp r3, #0
	bge _080D37B4
_080D37C2:
	movs r0, #2
	bl BG_EnableSyncByMask
	ldr r0, [r7, #0x34]
	cmp r0, #0
	bne _080D37D8
	movs r0, #1
	str r0, [r7, #0x34]
	b _080D37DE
	.align 2, 0
_080D37D4: .4byte 0x020234A8
_080D37D8:
	adds r0, r7, #0
	bl sub_8002DE4
_080D37DE:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

