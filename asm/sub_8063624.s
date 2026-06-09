	.syntax unified
	.set BG_SetPosition, 0x08001448 + 1
	.set GetAnimPosition, 0x0805AF10 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_8056158, 0x08056158 + 1
	.set sub_80567B8, 0x080567B8 + 1
	.set sub_80567E0, 0x080567E0 + 1
	.section .text.sub_8063624, "ax", %progbits
@ sub_8063624 @ JP 0x08063624 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8063624
	.thumb_func
sub_8063624:
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, _08063684 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08063688 @ =0x08600DD0
	movs r1, #3
	bl sub_8002BCC
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	str r0, [r5, #0x44]
	ldr r0, _0806368C @ =0x080E2D5A
	str r0, [r5, #0x48]
	ldr r0, _08063690 @ =0x08600DE8
	str r0, [r5, #0x4c]
	str r0, [r5, #0x50]
	ldr r0, _08063694 @ =0x086AD998
	movs r1, #0x20
	bl sub_80567E0
	ldr r0, _08063698 @ =0x086ABA8C
	movs r1, #0x80
	lsls r1, r1, #6
	bl sub_80567B8
	bl sub_8056158
	ldr r0, _0806369C @ =0x0203E11C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _080636AA
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _080636A0
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl BG_SetPosition
	b _080636AA
	.align 2, 0
_08063684: .4byte 0x0201774C
_08063688: .4byte 0x08600DD0
_0806368C: .4byte 0x080E2D5A
_08063690: .4byte 0x08600DE8
_08063694: .4byte 0x086AD998
_08063698: .4byte 0x086ABA8C
_0806369C: .4byte 0x0203E11C
_080636A0:
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl BG_SetPosition
_080636AA:
	pop {r4, r5}
	pop {r0}
	bx r0

