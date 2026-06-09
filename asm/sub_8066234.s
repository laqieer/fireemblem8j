	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set BG_SetPosition, 0x08001448 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_8056130, 0x08056130 + 1
	.set sub_8056158, 0x08056158 + 1
	.set sub_80567B8, 0x080567B8 + 1
	.set sub_80567E0, 0x080567E0 + 1
	.set sub_80733E8, 0x080733E8 + 1
	.set sub_80D6394, 0x080D6394 + 1
	.section .text.sub_8066234, "ax", %progbits
@ sub_8066234 @ JP 0x08066234 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8066234
	.thumb_func
sub_8066234:
	push {r4, r5, lr}
	sub sp, #8
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r1, _080662BC @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _080662C0 @ =0x08601768
	movs r1, #3
	bl sub_8002BCC
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r5, [r0, #0x2e]
	ldr r0, _080662C4 @ =0x08760384
	movs r1, #0x80
	lsls r1, r1, #6
	bl sub_80567B8
	ldr r0, _080662C8 @ =0x087611E4
	movs r1, #0x20
	bl sub_80567E0
	bl sub_8056130
	ldr r0, _080662CC @ =0x08761324
	ldr r4, _080662D0 @ =0x02019790
	adds r1, r4, #0
	bl sub_80D6394
	ldr r1, _080662D4 @ =0x020234A8
	movs r0, #1
	str r0, [sp]
	adds r0, #0xff
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r2, #0x1e
	movs r3, #0x14
	bl sub_80733E8
	movs r0, #2
	bl BG_EnableSyncByMask
	bl sub_8056158
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	ldr r2, _080662D8 @ =0x03003020
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
_080662BC: .4byte 0x0201774C
_080662C0: .4byte 0x08601768
_080662C4: .4byte 0x08760384
_080662C8: .4byte 0x087611E4
_080662CC: .4byte 0x08761324
_080662D0: .4byte 0x02019790
_080662D4: .4byte 0x020234A8
_080662D8: .4byte 0x03003020

