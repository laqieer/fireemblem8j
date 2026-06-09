	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set BG_SetPosition, 0x08001448 + 1
	.set EfxTmCpyBG, 0x080733B8 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_8056130, 0x08056130 + 1
	.set sub_8056158, 0x08056158 + 1
	.set sub_80567B8, 0x080567B8 + 1
	.set sub_80567E0, 0x080567E0 + 1
	.set sub_80D6394, 0x080D6394 + 1
	.section .text.sub_8066D7C, "ax", %progbits
@ sub_8066D7C @ JP 0x08066D7C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8066D7C
	.thumb_func
sub_8066D7C:
	push {r4, r5, lr}
	sub sp, #8
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, _08066E04 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08066E08 @ =0x086019C0
	movs r1, #3
	bl sub_8002BCC
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r5, [r0, #0x2e]
	ldr r0, _08066E0C @ =0x08776A34
	movs r1, #0x80
	lsls r1, r1, #6
	bl sub_80567B8
	ldr r0, _08066E10 @ =0x08776F94
	movs r1, #0x20
	bl sub_80567E0
	bl sub_8056130
	ldr r0, _08066E14 @ =0x08776FB4
	ldr r4, _08066E18 @ =0x02019790
	adds r1, r4, #0
	bl sub_80D6394
	ldr r1, _08066E1C @ =0x020234A8
	movs r0, #1
	str r0, [sp]
	adds r0, #0xff
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r2, #0x20
	movs r3, #0x20
	bl EfxTmCpyBG
	movs r0, #2
	bl BG_EnableSyncByMask
	bl sub_8056158
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	ldr r2, _08066E20 @ =0x03003020
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
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08066E04: .4byte 0x0201774C
_08066E08: .4byte 0x086019C0
_08066E0C: .4byte 0x08776A34
_08066E10: .4byte 0x08776F94
_08066E14: .4byte 0x08776FB4
_08066E18: .4byte 0x02019790
_08066E1C: .4byte 0x020234A8
_08066E20: .4byte 0x03003020

