	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_80567E0, 0x080567E0 + 1
	.section .text.sub_8065778, "ax", %progbits
@ sub_8065778 @ JP 0x08065778 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8065778
	.thumb_func
sub_8065778:
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _080657AC @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _080657B0 @ =0x086014D8
	movs r1, #3
	bl sub_8002BCC
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r1, [r0, #0x2e]
	str r1, [r0, #0x44]
	ldr r1, _080657B4 @ =0x080E3242
	str r1, [r0, #0x48]
	ldr r1, _080657B8 @ =0x0875B224
	str r1, [r0, #0x4c]
	adds r0, r1, #0
	movs r1, #0x20
	bl sub_80567E0
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080657AC: .4byte 0x0201774C
_080657B0: .4byte 0x086014D8
_080657B4: .4byte 0x080E3242
_080657B8: .4byte 0x0875B224

