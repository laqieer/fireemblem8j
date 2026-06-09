	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_80567E0, 0x080567E0 + 1
	.section .text.sub_80669EC, "ax", %progbits
@ sub_80669EC @ JP 0x080669EC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80669EC
	.thumb_func
sub_80669EC:
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _08066A24 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08066A28 @ =0x086018C8
	movs r1, #3
	bl sub_8002BCC
	adds r1, r0, #0
	str r4, [r1, #0x5c]
	movs r0, #0
	strh r0, [r1, #0x2c]
	strh r0, [r1, #0x2e]
	str r0, [r1, #0x44]
	ldr r0, _08066A2C @ =0x080E34EE
	str r0, [r1, #0x48]
	ldr r0, _08066A30 @ =0x08753BCC
	str r0, [r1, #0x4c]
	adds r0, #0x60
	movs r1, #0x20
	bl sub_80567E0
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08066A24: .4byte 0x0201774C
_08066A28: .4byte 0x086018C8
_08066A2C: .4byte 0x080E34EE
_08066A30: .4byte 0x08753BCC

