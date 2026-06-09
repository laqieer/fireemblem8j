	.syntax unified
	.set BG_SetPosition, 0x08001448 + 1
	.set GetAnimPosition, 0x0805AF10 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_8056158, 0x08056158 + 1
	.set sub_80567B8, 0x080567B8 + 1
	.section .text.sub_8062750, "ax", %progbits
@ sub_8062750 @ JP 0x08062750 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8062750
	.thumb_func
sub_8062750:
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r6, r1, #0
	ldr r1, _08062798 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0806279C @ =0x08600BB4
	movs r1, #3
	bl sub_8002BCC
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r1, #0
	movs r0, #0
	strh r0, [r5, #0x2c]
	str r0, [r5, #0x44]
	adds r0, r5, #0
	adds r0, #0x29
	strb r1, [r0]
	cmp r6, #0
	beq _080627B0
	cmp r6, #2
	bhi _080627FA
	ldr r0, _080627A0 @ =0x080E294C
	str r0, [r5, #0x48]
	ldr r0, _080627A4 @ =0x0869D918
	str r0, [r5, #0x4c]
	ldr r0, _080627A8 @ =0x0869E278
	str r0, [r5, #0x50]
	ldr r0, _080627AC @ =0x0869D120
	movs r1, #0xa8
	lsls r1, r1, #5
	bl sub_80567B8
	b _080627FA
	.align 2, 0
_08062798: .4byte 0x0201774C
_0806279C: .4byte 0x08600BB4
_080627A0: .4byte 0x080E294C
_080627A4: .4byte 0x0869D918
_080627A8: .4byte 0x0869E278
_080627AC: .4byte 0x0869D120
_080627B0:
	ldr r0, _080627E0 @ =0x080E2940
	str r0, [r5, #0x48]
	ldr r0, _080627E4 @ =0x0869C34C
	str r0, [r5, #0x4c]
	str r0, [r5, #0x50]
	ldr r0, _080627E8 @ =0x0869C1BC
	movs r1, #0x80
	lsls r1, r1, #3
	bl sub_80567B8
	ldr r0, _080627EC @ =0x0203E11C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _080627FA
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _080627F0
	movs r0, #1
	movs r1, #0xe8
	b _080627F4
	.align 2, 0
_080627E0: .4byte 0x080E2940
_080627E4: .4byte 0x0869C34C
_080627E8: .4byte 0x0869C1BC
_080627EC: .4byte 0x0203E11C
_080627F0:
	movs r0, #1
	movs r1, #0x18
_080627F4:
	movs r2, #0
	bl BG_SetPosition
_080627FA:
	bl sub_8056158
	pop {r4, r5, r6}
	pop {r0}
	bx r0

