	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set EfxTmCpyBG, 0x080733B8 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_8056130, 0x08056130 + 1
	.set sub_8056158, 0x08056158 + 1
	.set sub_80567B8, 0x080567B8 + 1
	.set sub_80D6394, 0x080D6394 + 1
	.section .text.sub_8061B9C, "ax", %progbits
@ sub_8061B9C @ JP 0x08061B9C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8061B9C
	.thumb_func
sub_8061B9C:
	push {r4, r5, lr}
	sub sp, #8
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, _08061C10 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08061C14 @ =0x086008F4
	movs r1, #3
	bl sub_8002BCC
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r5, [r0, #0x2e]
	ldr r0, _08061C18 @ =0x0867E9CC
	movs r1, #0x80
	lsls r1, r1, #6
	bl sub_80567B8
	bl sub_8056130
	ldr r0, _08061C1C @ =0x0867F30C
	ldr r4, _08061C20 @ =0x02019790
	adds r1, r4, #0
	bl sub_80D6394
	ldr r1, _08061C24 @ =0x020234A8
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
	ldr r2, _08061C28 @ =0x03003020
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
_08061C10: .4byte 0x0201774C
_08061C14: .4byte 0x086008F4
_08061C18: .4byte 0x0867E9CC
_08061C1C: .4byte 0x0867F30C
_08061C20: .4byte 0x02019790
_08061C24: .4byte 0x020234A8
_08061C28: .4byte 0x03003020

