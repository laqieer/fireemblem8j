	.syntax unified
	.set BG_SetPosition, 0x08001448 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_8056158, 0x08056158 + 1
	.set sub_80567B8, 0x080567B8 + 1
	.set sub_80567E0, 0x080567E0 + 1
	.section .text.sub_8067FE4, "ax", %progbits
@ sub_8067FE4 @ JP 0x08067FE4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8067FE4
	.thumb_func
sub_8067FE4:
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _08068034 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08068038 @ =0x08601E00
	movs r1, #3
	bl sub_8002BCC
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x34]
	strh r1, [r0, #0x3c]
	str r1, [r0, #0x44]
	ldr r1, _0806803C @ =0x080E388A
	str r1, [r0, #0x48]
	ldr r1, _08068040 @ =0x08601E18
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r0, _08068044 @ =0x086CD280
	movs r1, #0x80
	lsls r1, r1, #6
	bl sub_80567B8
	ldr r0, _08068048 @ =0x086CE8B8
	movs r1, #0x20
	bl sub_80567E0
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	bl sub_8056158
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08068034: .4byte 0x0201774C
_08068038: .4byte 0x08601E00
_0806803C: .4byte 0x080E388A
_08068040: .4byte 0x08601E18
_08068044: .4byte 0x086CD280
_08068048: .4byte 0x086CE8B8

