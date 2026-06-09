	.syntax unified
	.set BG_SetPosition, 0x08001448 + 1
	.set GetAnimAnotherSide, 0x0805B058 + 1
	.set GetAnimPosition, 0x0805AF10 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_8056158, 0x08056158 + 1
	.set sub_80567E0, 0x080567E0 + 1
	.section .text.sub_8069CB4, "ax", %progbits
@ sub_8069CB4 @ JP 0x08069CB4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8069CB4
	.thumb_func
sub_8069CB4:
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, _08069CEC @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08069CF0 @ =0x08602670
	movs r1, #3
	bl sub_8002BCC
	adds r5, r0, #0
	adds r0, r4, #0
	bl GetAnimAnotherSide
	str r0, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	str r0, [r5, #0x44]
	ldr r0, _08069CF4 @ =0x080E3D46
	str r0, [r5, #0x48]
	ldr r0, _08069CF8 @ =0x0203E11C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _08069D00
	ldr r0, _08069CFC @ =0x086026B8
	b _08069D02
	.align 2, 0
_08069CEC: .4byte 0x0201774C
_08069CF0: .4byte 0x08602670
_08069CF4: .4byte 0x080E3D46
_08069CF8: .4byte 0x0203E11C
_08069CFC: .4byte 0x086026B8
_08069D00:
	ldr r0, _08069D3C @ =0x086026A0
_08069D02:
	str r0, [r5, #0x4c]
	str r0, [r5, #0x50]
	ldr r0, _08069D40 @ =0x08602688
	str r0, [r5, #0x54]
	ldr r0, _08069D44 @ =0x086026D0
	str r0, [r5, #0x58]
	ldr r0, _08069D48 @ =0x0870566C
	movs r1, #0x20
	bl sub_80567E0
	bl sub_8056158
	ldr r0, _08069D4C @ =0x0203E11C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _08069D5A
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _08069D50
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl BG_SetPosition
	b _08069D5A
	.align 2, 0
_08069D3C: .4byte 0x086026A0
_08069D40: .4byte 0x08602688
_08069D44: .4byte 0x086026D0
_08069D48: .4byte 0x0870566C
_08069D4C: .4byte 0x0203E11C
_08069D50:
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl BG_SetPosition
_08069D5A:
	pop {r4, r5}
	pop {r0}
	bx r0

