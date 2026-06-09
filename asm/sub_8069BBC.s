	.syntax unified
	.set BG_SetPosition, 0x08001448 + 1
	.set GetAnimAnotherSide, 0x0805B058 + 1
	.set GetAnimPosition, 0x0805AF10 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_8056158, 0x08056158 + 1
	.section .text.sub_8069BBC, "ax", %progbits
@ sub_8069BBC @ JP 0x08069BBC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8069BBC
	.thumb_func
sub_8069BBC:
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, _08069C18 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08069C1C @ =0x08602568
	movs r1, #3
	bl sub_8002BCC
	adds r5, r0, #0
	adds r0, r4, #0
	bl GetAnimAnotherSide
	str r0, [r5, #0x5c]
	movs r0, #0
	strh r0, [r5, #0x2c]
	str r0, [r5, #0x44]
	ldr r0, _08069C20 @ =0x080E3CE6
	str r0, [r5, #0x48]
	ldr r0, _08069C24 @ =0x086025D0
	str r0, [r5, #0x4c]
	str r0, [r5, #0x50]
	ldr r0, _08069C28 @ =0x08602580
	str r0, [r5, #0x54]
	ldr r0, _08069C2C @ =0x08602620
	str r0, [r5, #0x58]
	bl sub_8056158
	ldr r0, _08069C30 @ =0x0203E11C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _08069C3E
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _08069C34
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl BG_SetPosition
	b _08069C3E
	.align 2, 0
_08069C18: .4byte 0x0201774C
_08069C1C: .4byte 0x08602568
_08069C20: .4byte 0x080E3CE6
_08069C24: .4byte 0x086025D0
_08069C28: .4byte 0x08602580
_08069C2C: .4byte 0x08602620
_08069C30: .4byte 0x0203E11C
_08069C34:
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl BG_SetPosition
_08069C3E:
	pop {r4, r5}
	pop {r0}
	bx r0

