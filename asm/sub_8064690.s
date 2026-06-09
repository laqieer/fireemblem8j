	.syntax unified
	.set BG_SetPosition, 0x08001448 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_8056158, 0x08056158 + 1
	.section .text.sub_8064690, "ax", %progbits
@ sub_8064690 @ JP 0x08064690 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8064690
	.thumb_func
sub_8064690:
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _080646D0 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _080646D4 @ =0x086011A4
	movs r1, #3
	bl sub_8002BCC
	str r4, [r0, #0x5c]
	movs r1, #0
	strh r1, [r0, #0x2c]
	str r1, [r0, #0x44]
	ldr r1, _080646D8 @ =0x080E30B0
	str r1, [r0, #0x48]
	ldr r1, _080646DC @ =0x086011BC
	str r1, [r0, #0x4c]
	ldr r1, _080646E0 @ =0x086011C0
	str r1, [r0, #0x50]
	ldr r1, _080646E4 @ =0x086011C4
	str r1, [r0, #0x54]
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	bl sub_8056158
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080646D0: .4byte 0x0201774C
_080646D4: .4byte 0x086011A4
_080646D8: .4byte 0x080E30B0
_080646DC: .4byte 0x086011BC
_080646E0: .4byte 0x086011C0
_080646E4: .4byte 0x086011C4

