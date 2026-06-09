	.syntax unified
	.set PutSpriteExt, 0x08005330 + 1
	.set sub_8026ED0, 0x08026ED0 + 1
	.set sub_8027BDC, 0x08027BDC + 1
	.section .text.sub_80A5968, "ax", %progbits
@ sub_80A5968 @ JP 0x080A5968 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A5968
	.thumb_func
sub_80A5968:
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r6, r0, #0
	ldr r1, [r6, #0x30]
	adds r1, #0x80
	ldr r4, _080A5A44 @ =0x000001FF
	ands r1, r4
	ldr r3, _080A5A48 @ =0x08A95C50
	movs r0, #0x8f
	lsls r0, r0, #6
	str r0, [sp]
	movs r0, #4
	movs r2, #8
	bl PutSpriteExt
	ldr r1, [r6, #0x30]
	adds r1, #0x20
	ands r1, r4
	ldr r3, _080A5A4C @ =0x08A95C64
	ldr r5, _080A5A50 @ =0x0000E280
	str r5, [sp]
	movs r0, #4
	movs r2, #0x50
	bl PutSpriteExt
	ldr r1, [r6, #0x30]
	adds r1, #5
	ands r1, r4
	ldr r3, _080A5A54 @ =0x08A95B14
	ldr r0, _080A5A58 @ =0x0000ABC0
	str r0, [sp]
	movs r0, #4
	movs r2, #0x67
	bl PutSpriteExt
	ldr r1, [r6, #0x30]
	adds r1, #0x14
	ands r1, r4
	ldr r3, _080A5A5C @ =0x08A95C72
	str r5, [sp]
	movs r0, #4
	movs r2, #0x6f
	bl PutSpriteExt
	ldr r1, [r6, #0x30]
	adds r1, #0xc
	ands r1, r4
	ldr r3, _080A5A60 @ =0x08A95C86
	movs r0, #0xaf
	lsls r0, r0, #6
	str r0, [sp]
	movs r0, #4
	movs r2, #0x90
	bl PutSpriteExt
	ldr r0, [r6, #0x30]
	adds r7, r0, #0
	adds r7, #0x70
	ands r7, r4
	ldr r0, [r6, #0x34]
	adds r2, r0, #0
	adds r2, #0x16
	movs r4, #0
	adds r0, r6, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	cmp r4, r0
	bge _080A5A38
	adds r5, r2, #0
_080A59F2:
	movs r3, #0xc0
	lsls r3, r3, #8
	adds r0, r6, #0
	adds r0, #0x3f
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0
	bne _080A5A06
	movs r3, #0xd0
	lsls r3, r3, #8
_080A5A06:
	cmp r0, #2
	bne _080A5A0E
	movs r3, #0xf0
	lsls r3, r3, #8
_080A5A0E:
	movs r1, #0xc0
	lsls r1, r1, #4
	adds r0, r1, #0
	orrs r3, r0
	adds r0, r6, #0
	adds r0, #0x4d
	adds r0, r0, r4
	ldrb r0, [r0]
	str r0, [sp]
	movs r0, #0
	adds r1, r7, #0
	adds r2, r5, #0
	bl sub_8027BDC
	adds r5, #0x10
	adds r4, #1
	adds r0, r6, #0
	adds r0, #0x3c
	ldrb r0, [r0]
	cmp r4, r0
	blt _080A59F2
_080A5A38:
	bl sub_8026ED0
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A5A44: .4byte 0x000001FF
_080A5A48: .4byte 0x08A95C50
_080A5A4C: .4byte 0x08A95C64
_080A5A50: .4byte 0x0000E280
_080A5A54: .4byte 0x08A95B14
_080A5A58: .4byte 0x0000ABC0
_080A5A5C: .4byte 0x08A95C72
_080A5A60: .4byte 0x08A95C86

