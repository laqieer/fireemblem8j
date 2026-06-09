	.syntax unified
	.set BG_SetPosition, 0x08001448 + 1
	.set GetAnimPosition, 0x0805AF10 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_8056158, 0x08056158 + 1
	.set sub_80567B8, 0x080567B8 + 1
	.set sub_80567E0, 0x080567E0 + 1
	.section .text.sub_80638B4, "ax", %progbits
@ sub_80638B4 @ JP 0x080638B4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80638B4
	.thumb_func
sub_80638B4:
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, _08063914 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08063918 @ =0x08600E68
	movs r1, #3
	bl sub_8002BCC
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	str r0, [r5, #0x44]
	ldr r0, _0806391C @ =0x080E2DCC
	str r0, [r5, #0x48]
	ldr r0, _08063920 @ =0x08600E80
	str r0, [r5, #0x4c]
	str r0, [r5, #0x50]
	ldr r0, _08063924 @ =0x086B2D7C
	movs r1, #0x20
	bl sub_80567E0
	ldr r0, _08063928 @ =0x086B1EB0
	movs r1, #0x80
	lsls r1, r1, #6
	bl sub_80567B8
	bl sub_8056158
	ldr r0, _0806392C @ =0x0203E11C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _0806393A
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _08063930
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl BG_SetPosition
	b _0806393A
	.align 2, 0
_08063914: .4byte 0x0201774C
_08063918: .4byte 0x08600E68
_0806391C: .4byte 0x080E2DCC
_08063920: .4byte 0x08600E80
_08063924: .4byte 0x086B2D7C
_08063928: .4byte 0x086B1EB0
_0806392C: .4byte 0x0203E11C
_08063930:
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl BG_SetPosition
_0806393A:
	pop {r4, r5}
	pop {r0}
	bx r0

