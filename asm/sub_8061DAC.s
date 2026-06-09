	.syntax unified
	.set BG_SetPosition, 0x08001448 + 1
	.set GetAnimPosition, 0x0805AF10 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_8056158, 0x08056158 + 1
	.set sub_80567E0, 0x080567E0 + 1
	.section .text.sub_8061DAC, "ax", %progbits
@ sub_8061DAC @ JP 0x08061DAC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8061DAC
	.thumb_func
sub_8061DAC:
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, _08061E10 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08061E14 @ =0x08600954
	movs r1, #3
	bl sub_8002BCC
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r1, #0
	strh r1, [r5, #0x2c]
	str r1, [r5, #0x44]
	ldr r0, _08061E18 @ =0x080E27DE
	str r0, [r5, #0x48]
	ldr r0, _08061E1C @ =0x08600A38
	str r0, [r5, #0x4c]
	str r0, [r5, #0x50]
	ldr r0, _08061E20 @ =0x0860096C
	str r0, [r5, #0x54]
	str r1, [r5, #0x58]
	ldr r0, _08061E24 @ =0x086834CC
	movs r1, #0x20
	bl sub_80567E0
	bl sub_8056158
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	ldr r0, _08061E28 @ =0x0203E11C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _08061E36
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _08061E2C
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl BG_SetPosition
	b _08061E36
	.align 2, 0
_08061E10: .4byte 0x0201774C
_08061E14: .4byte 0x08600954
_08061E18: .4byte 0x080E27DE
_08061E1C: .4byte 0x08600A38
_08061E20: .4byte 0x0860096C
_08061E24: .4byte 0x086834CC
_08061E28: .4byte 0x0203E11C
_08061E2C:
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl BG_SetPosition
_08061E36:
	pop {r4, r5}
	pop {r0}
	bx r0

