	.syntax unified
	.set MapUnitC_GetPosition, 0x080BFD74 + 1
	.set MapUnitC_SetPosition, 0x080BFD64 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_800ACA8, 0x0800ACA8 + 1
	.set sub_80BFDB4, 0x080BFDB4 + 1
	.set sub_80BFF10, 0x080BFF10 + 1
	.set sub_80C252C, 0x080C252C + 1
	.set sub_80C5628, 0x080C5628 + 1
	.section .text.sub_80C261C, "ax", %progbits
@ sub_80C261C @ JP 0x080C261C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C261C
	.thumb_func
sub_80C261C:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x10
	adds r6, r0, #0
	adds r0, #0x29
	ldrb r3, [r0]
	movs r0, #2
	ands r0, r3
	cmp r0, #0
	beq _080C2634
	b _080C27B0
_080C2634:
	adds r1, r6, #0
	adds r1, #0x42
	ldrh r2, [r1]
	movs r4, #0
	ldrsh r0, [r1, r4]
	cmp r0, #0
	ble _080C2648
	subs r0, r2, #1
	strh r0, [r1]
	b _080C27B0
_080C2648:
	movs r0, #4
	ands r0, r3
	cmp r0, #0
	beq _080C2664
	ldr r0, _080C26B0 @ =0x085775CC
	ldr r0, [r0]
	ldrh r1, [r0, #4]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080C2664
	ldr r0, [r6, #0x54]
	adds r0, #2
	str r0, [r6, #0x54]
_080C2664:
	ldr r0, [r6, #0x54]
	adds r2, r0, #1
	str r2, [r6, #0x54]
	ldr r0, [r6, #0x50]
	cmp r2, r0
	bge _080C26B8
	adds r0, r6, #0
	adds r0, #0x2a
	movs r1, #0
	ldrsb r1, [r0, r1]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _080C26B4 @ =0x0201B3A4
	adds r0, r0, r1
	lsls r1, r2, #0xc
	add r4, sp, #8
	adds r2, r4, #0
	bl sub_800ACA8
	ldr r0, [r6, #0x14]
	ldr r0, [r0, #0x4c]
	adds r1, r6, #0
	adds r1, #0x2b
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	ldr r2, [sp, #8]
	asrs r2, r2, #4
	ldr r3, [r4, #4]
	asrs r3, r3, #4
	adds r3, #6
	bl MapUnitC_SetPosition
	adds r0, r6, #0
	bl sub_80C252C
	b _080C27B0
	.align 2, 0
_080C26B0: .4byte 0x085775CC
_080C26B4: .4byte 0x0201B3A4
_080C26B8:
	adds r0, r6, #0
	adds r0, #0x2d
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #5
	ldr r2, _080C27BC @ =0x081F5D7C
	adds r0, r0, r2
	ldrb r1, [r0, #0x1e]
	movs r3, #1
	adds r0, r3, #0
	ands r0, r1
	adds r4, r6, #0
	adds r4, #0x2b
	adds r5, r6, #0
	adds r5, #0x2e
	cmp r0, #0
	beq _080C26FC
	movs r0, #0
	ldrsb r0, [r5, r0]
	lsls r0, r0, #5
	adds r0, r0, r2
	ldrb r1, [r0, #0x1e]
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _080C26FC
	ldr r0, [r6, #0x14]
	ldr r0, [r0, #0x4c]
	movs r1, #0
	ldrsb r1, [r4, r1]
	movs r2, #0
	bl sub_80BFF10
_080C26FC:
	ldr r0, [r6, #0x14]
	ldr r0, [r0, #0x4c]
	movs r1, #0
	ldrsb r1, [r4, r1]
	movs r3, #0
	ldrsb r3, [r5, r3]
	lsls r3, r3, #5
	ldr r2, _080C27BC @ =0x081F5D7C
	adds r3, r3, r2
	movs r7, #0x18
	ldrsh r2, [r3, r7]
	movs r7, #0x1a
	ldrsh r3, [r3, r7]
	adds r3, #6
	bl MapUnitC_SetPosition
	adds r2, r6, #0
	adds r2, #0x29
	ldrb r1, [r2]
	movs r0, #0x10
	ands r0, r1
	adds r7, r2, #0
	cmp r0, #0
	beq _080C2748
	adds r2, #9
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r0, #0
	blt _080C2748
	ldr r0, [r6, #0x14]
	ldr r0, [r0, #0x4c]
	movs r1, #0
	ldrsb r1, [r4, r1]
	ldrb r2, [r2]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	bl sub_80BFDB4
_080C2748:
	ldr r0, _080C27C0 @ =0x03005270
	mov r8, r0
	adds r0, r6, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #2
	add r0, r8
	ldrb r1, [r5]
	strb r1, [r0, #0x11]
	ldrb r1, [r7]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _080C27A0
	ldr r0, [r6, #0x14]
	ldr r0, [r0, #0x4c]
	movs r1, #0
	ldrsb r1, [r4, r1]
	mov r4, sp
	adds r4, #2
	mov r2, sp
	adds r3, r4, #0
	bl MapUnitC_GetPosition
	mov r0, sp
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #0
	ldrsh r1, [r4, r2]
	subs r1, #0xe
	add r4, sp, #4
	mov r5, sp
	adds r5, #6
	adds r2, r4, #0
	adds r3, r5, #0
	bl sub_80C5628
	ldrh r0, [r4]
	mov r4, r8
	strh r0, [r4, #2]
	ldrh r0, [r5]
	strh r0, [r4, #4]
_080C27A0:
	adds r0, r6, #0
	bl sub_8002DE4
	ldrb r1, [r7]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r7]
_080C27B0:
	add sp, #0x10
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C27BC: .4byte 0x081F5D7C
_080C27C0: .4byte 0x03005270

