	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_8056158, 0x08056158 + 1
	.set sub_80567E0, 0x080567E0 + 1
	.section .text.sub_8065D34, "ax", %progbits
@ sub_8065D34 @ JP 0x08065D34 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8065D34
	.thumb_func
sub_8065D34:
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _08065D74 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08065D78 @ =0x086016C8
	movs r1, #3
	bl sub_8002BCC
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	strh r1, [r0, #0x32]
	ldr r1, _08065D7C @ =0x080E332C
	str r1, [r0, #0x48]
	ldr r1, _08065D80 @ =0x086016E4
	str r1, [r0, #0x4c]
	str r1, [r0, #0x50]
	ldr r1, _08065D84 @ =0x086016E0
	str r1, [r0, #0x54]
	ldr r0, _08065D88 @ =0x08750FFC
	movs r1, #0x20
	bl sub_80567E0
	bl sub_8056158
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08065D74: .4byte 0x0201774C
_08065D78: .4byte 0x086016C8
_08065D7C: .4byte 0x080E332C
_08065D80: .4byte 0x086016E4
_08065D84: .4byte 0x086016E0
_08065D88: .4byte 0x08750FFC

