	.syntax unified
	.set BG_SetPosition, 0x08001448 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_8056158, 0x08056158 + 1
	.section .text.sub_8068DAC, "ax", %progbits
@ sub_8068DAC @ JP 0x08068DAC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8068DAC
	.thumb_func
sub_8068DAC:
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _08068DE8 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08068DEC @ =0x086022A8
	movs r1, #3
	bl sub_8002BCC
	adds r1, r0, #0
	str r4, [r1, #0x5c]
	movs r0, #0
	strh r0, [r1, #0x2c]
	str r0, [r1, #0x44]
	ldr r0, _08068DF0 @ =0x080E3A44
	str r0, [r1, #0x48]
	ldr r0, _08068DF4 @ =0x0203E11C
	movs r2, #0
	ldrsh r0, [r0, r2]
	cmp r0, #0
	beq _08068E04
	ldr r0, _08068DF8 @ =0x08602320
	str r0, [r1, #0x4c]
	str r0, [r1, #0x50]
	ldr r0, _08068DFC @ =0x08602340
	str r0, [r1, #0x54]
	ldr r0, _08068E00 @ =0x08602360
	b _08068E10
	.align 2, 0
_08068DE8: .4byte 0x0201774C
_08068DEC: .4byte 0x086022A8
_08068DF0: .4byte 0x080E3A44
_08068DF4: .4byte 0x0203E11C
_08068DF8: .4byte 0x08602320
_08068DFC: .4byte 0x08602340
_08068E00: .4byte 0x08602360
_08068E04:
	ldr r0, _08068E28 @ =0x086022C0
	str r0, [r1, #0x4c]
	str r0, [r1, #0x50]
	ldr r0, _08068E2C @ =0x086022E0
	str r0, [r1, #0x54]
	ldr r0, _08068E30 @ =0x08602300
_08068E10:
	str r0, [r1, #0x58]
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	bl sub_8056158
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08068E28: .4byte 0x086022C0
_08068E2C: .4byte 0x086022E0
_08068E30: .4byte 0x08602300

