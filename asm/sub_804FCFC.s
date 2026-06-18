	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set DrawUiFrame, 0x0804EF40 + 1
	.set PutText, 0x08003DA0 + 1
	.set sub_8001BC0, 0x08001BC0 + 1
	.set sub_8003D90, 0x08003D90 + 1
	.set sub_8003F28, 0x08003F28 + 1
	.set sub_804F098, 0x0804F098 + 1
	.set sub_804FE54, 0x0804FE54 + 1
	.set sub_80D65C4, 0x080D65C4 + 1
	.section .text.sub_804FCFC, "ax", %progbits
@ RedrawMenu @ JP 0x0804FCFC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global RedrawMenu
	.thumb_func
RedrawMenu:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	adds r7, r0, #0
	adds r0, #0x63
	ldrb r1, [r0]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _0804FD18
	b _0804FE44
_0804FD18:
	adds r5, r7, #0
	adds r5, #0x64
	ldrb r0, [r5]
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x1e
	bl sub_8001BC0
	adds r6, r7, #0
	adds r6, #0x2c
	movs r1, #0
	ldrsb r1, [r6, r1]
	movs r2, #0x2d
	adds r2, r2, r7
	mov sl, r2
	ldrb r2, [r2]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	movs r3, #0x2e
	adds r3, r3, r7
	mov sb, r3
	ldrb r3, [r3]
	lsls r3, r3, #0x18
	asrs r3, r3, #0x18
	movs r4, #0x2f
	adds r4, r4, r7
	mov r8, r4
	ldrb r4, [r4]
	lsls r4, r4, #0x18
	asrs r4, r4, #0x18
	str r4, [sp]
	adds r4, r7, #0
	adds r4, #0x66
	ldrh r4, [r4]
	str r4, [sp, #4]
	ldr r4, [r7, #0x30]
	ldrb r4, [r4, #4]
	str r4, [sp, #8]
	bl DrawUiFrame
	ldrb r0, [r5]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1e
	bl sub_8001BC0
	movs r1, #0
	ldrsb r1, [r6, r1]
	mov r6, sl
	movs r2, #0
	ldrsb r2, [r6, r2]
	mov r4, sb
	movs r3, #0
	ldrsb r3, [r4, r3]
	mov r6, r8
	movs r4, #0
	ldrsb r4, [r6, r4]
	str r4, [sp]
	bl sub_804F098
	movs r0, #0
	mov r8, r0
	adds r0, r7, #0
	adds r0, #0x60
	mov sb, r5
	adds r5, r0, #0
	movs r1, #0x61
	adds r1, r1, r7
	mov sl, r1
	ldrb r2, [r5]
	cmp r8, r2
	bge _0804FE1E
_0804FDA4:
	mov r3, r8
	lsls r1, r3, #2
	adds r0, r7, #0
	adds r0, #0x34
	adds r0, r0, r1
	ldr r4, [r0]
	ldr r1, [r4, #0x30]
	ldr r2, [r1, #0x10]
	cmp r2, #0
	beq _0804FDC2
	adds r0, r7, #0
	adds r1, r4, #0
	bl sub_80D65C4
	b _0804FE14
_0804FDC2:
	ldrb r0, [r1, #8]
	adds r6, r4, #0
	adds r6, #0x34
	cmp r0, #0
	beq _0804FDD4
	adds r1, r0, #0
	adds r0, r6, #0
	bl sub_8003D90
_0804FDD4:
	adds r0, r4, #0
	adds r0, #0x3d
	ldrb r0, [r0]
	cmp r0, #2
	bne _0804FDE6
	adds r0, r6, #0
	movs r1, #1
	bl sub_8003D90
_0804FDE6:
	ldr r0, [r4, #0x30]
	ldr r1, [r0]
	adds r0, r6, #0
	bl sub_8003F28
	mov r1, sb
	ldrb r0, [r1]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1e
	bl sub_8001BC0
	adds r1, r0, #0
	movs r2, #0x2c
	ldrsh r0, [r4, r2]
	lsls r0, r0, #5
	movs r3, #0x2a
	ldrsh r2, [r4, r3]
	adds r0, r0, r2
	lsls r0, r0, #1
	adds r1, r1, r0
	adds r0, r6, #0
	bl PutText
_0804FE14:
	movs r4, #1
	add r8, r4
	ldrb r6, [r5]
	cmp r8, r6
	blt _0804FDA4
_0804FE1E:
	mov r0, sl
	ldrb r1, [r0]
	adds r0, r7, #0
	movs r2, #1
	bl sub_804FE54
	mov r1, sb
	ldrb r3, [r1]
	lsls r1, r3, #0x1e
	lsrs r1, r1, #0x1e
	movs r2, #1
	adds r0, r2, #0
	lsls r0, r1
	lsls r3, r3, #0x1c
	lsrs r3, r3, #0x1e
	lsls r2, r3
	adds r0, r0, r2
	bl BG_EnableSyncByMask
_0804FE44:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

