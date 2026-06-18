	.syntax unified
	.set MapUnitC_GetPosition, 0x080BFD74 + 1
	.section .text.sub_80C23C4, "ax", %progbits
@ GmMuPrim_TrackMovementDelta @ JP 0x080C23C4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global GmMuPrim_TrackMovementDelta
	.thumb_func
GmMuPrim_TrackMovementDelta:
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r0, [r5, #0x14]
	ldr r0, [r0, #0x4c]
	adds r1, r5, #0
	adds r1, #0x2b
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	mov r4, sp
	adds r4, #2
	mov r2, sp
	adds r3, r4, #0
	bl MapUnitC_GetPosition
	mov r0, sp
	adds r1, r5, #0
	adds r1, #0x44
	ldrh r0, [r0]
	ldrh r1, [r1]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	adds r3, r0, #0
	adds r1, r5, #0
	adds r1, #0x46
	ldrh r0, [r4]
	ldrh r1, [r1]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	adds r6, r0, #0
	cmp r3, #0
	bne _080C240E
	cmp r0, #0
	beq _080C2462
_080C240E:
	adds r1, r5, #0
	adds r1, #0x40
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #2
	ble _080C2440
	movs r2, #0
	adds r4, r5, #0
	adds r4, #0x3c
	movs r0, #0x3d
	adds r0, r0, r5
	mov ip, r0
	subs r1, #0xc
_080C2428:
	ldrb r0, [r1, #4]
	strb r0, [r1]
	ldrb r0, [r1, #5]
	strb r0, [r1, #1]
	adds r1, #4
	adds r2, #1
	cmp r2, #1
	ble _080C2428
	strb r3, [r4]
	mov r2, ip
	strb r6, [r2]
	b _080C245E
_080C2440:
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #2
	adds r0, r5, r0
	adds r0, #0x34
	strb r3, [r0]
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #2
	adds r0, r5, r0
	adds r0, #0x35
	strb r6, [r0]
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
_080C245E:
	movs r0, #1
	b _080C2464
_080C2462:
	movs r0, #0
_080C2464:
	add sp, #4
	pop {r4, r5, r6}
	pop {r1}
	bx r1

