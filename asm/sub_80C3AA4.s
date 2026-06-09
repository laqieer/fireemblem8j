	.syntax unified
	.set GetNodeAtPosition, 0x080C0458 + 1
	.set GetWMCursorScreenQuadrant, 0x080C5668 + 1
	.set RedrawGMapPIForNode, 0x080C3D0C + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_80C3448, 0x080C3448 + 1
	.set sub_80C3618, 0x080C3618 + 1
	.section .text.sub_80C3AA4, "ax", %progbits
@ sub_80C3AA4 @ JP 0x080C3AA4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C3AA4
	.thumb_func
sub_80C3AA4:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r4, r0, #0
	adds r3, r4, #0
	adds r3, #0x4e
	ldrb r0, [r3]
	adds r2, r4, #0
	adds r2, #0x4c
	strb r0, [r2]
	movs r0, #0x4f
	adds r0, r0, r4
	mov ip, r0
	ldrb r0, [r0]
	adds r1, r4, #0
	adds r1, #0x4d
	strb r0, [r1]
	ldr r1, _080C3B04 @ =0x03005270
	ldr r0, [r1, #8]
	asrs r5, r0, #8
	strb r5, [r3]
	ldr r0, [r1, #0xc]
	asrs r1, r0, #8
	mov r0, ip
	strb r1, [r0]
	ldrh r0, [r3]
	ldrh r2, [r2]
	cmp r0, r2
	beq _080C3BA2
	adds r7, r1, #0
	ldr r0, [r4, #0x14]
	ldr r0, [r0, #0x48]
	movs r1, #0
	str r1, [sp]
	adds r1, r5, #0
	adds r2, r7, #0
	movs r3, #0
	bl GetNodeAtPosition
	adds r5, r0, #0
	cmp r5, #0
	bge _080C3B08
	adds r0, r4, #0
	bl sub_8002DE4
	b _080C3BA2
	.align 2, 0
_080C3B04: .4byte 0x03005270
_080C3B08:
	adds r0, r4, #0
	adds r0, #0x5c
	ldrh r1, [r0]
	mov r8, r0
	adds r6, r4, #0
	adds r6, #0x50
	cmp r1, r5
	beq _080C3B66
	movs r0, #0
	ldrsb r0, [r6, r0]
	bl sub_80C3618
	adds r0, r4, #0
	adds r1, r5, #0
	bl RedrawGMapPIForNode
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl GetWMCursorScreenQuadrant
	strb r0, [r6]
	adds r0, r4, #0
	adds r0, #0x5e
	ldrb r1, [r0]
	adds r2, r0, #0
	cmp r1, #0
	beq _080C3B48
	cmp r1, #1
	beq _080C3B50
	b _080C3B56
_080C3B48:
	ldr r0, _080C3B4C @ =0x08AC1E18
	b _080C3B52
	.align 2, 0
_080C3B4C: .4byte 0x08AC1E18
_080C3B50:
	ldr r0, _080C3BB0 @ =0x08AC1E1E
_080C3B52:
	movs r7, #2
	ldrsb r7, [r0, r7]
_080C3B56:
	movs r0, #0
	ldrsb r0, [r6, r0]
	ldrb r2, [r2]
	adds r1, r7, #0
	bl sub_80C3448
	mov r1, r8
	strh r5, [r1]
_080C3B66:
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl GetWMCursorScreenQuadrant
	movs r2, #0
	ldrsb r2, [r6, r2]
	cmp r0, r2
	beq _080C3BA2
	ldr r1, _080C3BB4 @ =0x08AC1E08
	lsls r0, r0, #2
	adds r3, r0, r1
	lsls r0, r2, #2
	adds r2, r0, r1
	movs r1, #2
	ldrsb r1, [r3, r1]
	movs r0, #2
	ldrsb r0, [r2, r0]
	cmp r1, r0
	bne _080C3B9C
	movs r1, #3
	ldrsb r1, [r3, r1]
	movs r0, #3
	ldrsb r0, [r2, r0]
	cmp r1, r0
	beq _080C3BA2
_080C3B9C:
	adds r0, r4, #0
	bl sub_8002DE4
_080C3BA2:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C3BB0: .4byte 0x08AC1E1E
_080C3BB4: .4byte 0x08AC1E08

