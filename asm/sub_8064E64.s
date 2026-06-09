	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set BG_SetPosition, 0x08001448 + 1
	.set EfxTmCpyBG, 0x080733B8 + 1
	.set GetAnimPosition, 0x0805AF10 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_8056130, 0x08056130 + 1
	.set sub_8056158, 0x08056158 + 1
	.set sub_80567B8, 0x080567B8 + 1
	.set sub_80567E0, 0x080567E0 + 1
	.set sub_80733E8, 0x080733E8 + 1
	.set sub_80D6394, 0x080D6394 + 1
	.section .text.sub_8064E64, "ax", %progbits
@ sub_8064E64 @ JP 0x08064E64 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8064E64
	.thumb_func
sub_8064E64:
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, _08064EC8 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08064ECC @ =0x08601388
	movs r1, #3
	bl sub_8002BCC
	adds r6, r0, #0
	str r4, [r6, #0x5c]
	movs r0, #0
	strh r0, [r6, #0x2c]
	strh r5, [r6, #0x2e]
	ldr r0, _08064ED0 @ =0x08756454
	movs r1, #0x80
	lsls r1, r1, #6
	bl sub_80567B8
	ldr r0, _08064ED4 @ =0x08756BB4
	movs r1, #0x20
	bl sub_80567E0
	bl sub_8056130
	ldr r0, _08064ED8 @ =0x08756D94
	ldr r4, _08064EDC @ =0x02019790
	adds r1, r4, #0
	bl sub_80D6394
	ldr r0, [r6, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _08064EE4
	ldr r1, _08064EE0 @ =0x020234A8
	movs r0, #1
	str r0, [sp]
	adds r0, #0xff
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r2, #0x1e
	movs r3, #0x20
	bl sub_80733E8
	b _08064EF8
	.align 2, 0
_08064EC8: .4byte 0x0201774C
_08064ECC: .4byte 0x08601388
_08064ED0: .4byte 0x08756454
_08064ED4: .4byte 0x08756BB4
_08064ED8: .4byte 0x08756D94
_08064EDC: .4byte 0x02019790
_08064EE0: .4byte 0x020234A8
_08064EE4:
	ldr r1, _08064F24 @ =0x020234A8
	movs r0, #1
	str r0, [sp]
	adds r0, #0xff
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r2, #0x1e
	movs r3, #0x20
	bl EfxTmCpyBG
_08064EF8:
	movs r0, #2
	bl BG_EnableSyncByMask
	bl sub_8056158
	ldr r0, _08064F28 @ =0x0203E11C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _08064F36
	ldr r0, [r6, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _08064F2C
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl BG_SetPosition
	b _08064F36
	.align 2, 0
_08064F24: .4byte 0x020234A8
_08064F28: .4byte 0x0203E11C
_08064F2C:
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl BG_SetPosition
_08064F36:
	ldr r2, _08064F54 @ =0x03003020
	ldrb r1, [r2, #1]
	movs r0, #0x21
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r2, #1]
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08064F54: .4byte 0x03003020

