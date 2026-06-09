	.syntax unified
	.set BG_SetPosition, 0x08001448 + 1
	.set GetAnimPosition, 0x0805AF10 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_8056158, 0x08056158 + 1
	.set sub_80567B8, 0x080567B8 + 1
	.set sub_80567E0, 0x080567E0 + 1
	.section .text.sub_80666B8, "ax", %progbits
@ sub_80666B8 @ JP 0x080666B8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80666B8
	.thumb_func
sub_80666B8:
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, _0806671C @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08066720 @ =0x08601820
	movs r1, #3
	bl sub_8002BCC
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	str r0, [r5, #0x44]
	ldr r0, _08066724 @ =0x080E345A
	str r0, [r5, #0x48]
	ldr r0, _08066728 @ =0x08601838
	str r0, [r5, #0x4c]
	str r0, [r5, #0x50]
	ldr r0, _0806672C @ =0x08763B10
	movs r1, #0x80
	lsls r1, r1, #6
	bl sub_80567B8
	ldr r0, _08066730 @ =0x08764488
	movs r1, #0x20
	bl sub_80567E0
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	ldr r0, _08066734 @ =0x0203E11C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _08066742
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _08066738
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl BG_SetPosition
	b _08066742
	.align 2, 0
_0806671C: .4byte 0x0201774C
_08066720: .4byte 0x08601820
_08066724: .4byte 0x080E345A
_08066728: .4byte 0x08601838
_0806672C: .4byte 0x08763B10
_08066730: .4byte 0x08764488
_08066734: .4byte 0x0203E11C
_08066738:
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl BG_SetPosition
_08066742:
	bl sub_8056158
	pop {r4, r5}
	pop {r0}
	bx r0

