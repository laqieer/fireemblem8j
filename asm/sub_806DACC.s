	.syntax unified
	.set BG_SetPosition, 0x08001448 + 1
	.set GetAnimPosition, 0x0805AF10 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_8056158, 0x08056158 + 1
	.section .text.sub_806DACC, "ax", %progbits
@ sub_806DACC @ JP 0x0806DACC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_806DACC
	.thumb_func
sub_806DACC:
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _0806DB14 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _0806DB18 @ =0x08603220
	movs r1, #3
	bl sub_8002BCC
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, _0806DB1C @ =0x080E433E
	str r1, [r0, #0x48]
	ldr r1, _0806DB20 @ =0x0860319C
	str r1, [r0, #0x4c]
	ldr r1, _0806DB24 @ =0x086031C8
	str r1, [r0, #0x54]
	ldr r1, _0806DB28 @ =0x086031F4
	str r1, [r0, #0x58]
	ldr r0, _0806DB2C @ =0x0203E11C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #1
	bne _0806DB40
	adds r0, r4, #0
	bl GetAnimPosition
	cmp r0, #0
	bne _0806DB30
	movs r0, #1
	movs r1, #0x18
	b _0806DB34
	.align 2, 0
_0806DB14: .4byte 0x0201774C
_0806DB18: .4byte 0x08603220
_0806DB1C: .4byte 0x080E433E
_0806DB20: .4byte 0x0860319C
_0806DB24: .4byte 0x086031C8
_0806DB28: .4byte 0x086031F4
_0806DB2C: .4byte 0x0203E11C
_0806DB30:
	ldr r1, _0806DB3C @ =0x0000FFE8
	movs r0, #1
_0806DB34:
	movs r2, #0
	bl BG_SetPosition
	b _0806DB4A
	.align 2, 0
_0806DB3C: .4byte 0x0000FFE8
_0806DB40:
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
_0806DB4A:
	bl sub_8056158
	pop {r4}
	pop {r0}
	bx r0

