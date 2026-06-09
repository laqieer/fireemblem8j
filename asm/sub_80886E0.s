	.syntax unified
	.set GetUnit, 0x08019108 + 1
	.section .text.sub_80886E0, "ax", %progbits
@ sub_80886E0 @ JP 0x080886E0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80886E0
	.thumb_func
sub_80886E0:
	push {r4, lr}
	movs r4, #1
_080886E4:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _08088720
	ldr r0, [r2]
	cmp r0, #0
	beq _08088720
	ldrb r0, [r0, #4]
	cmp r0, #0xf
	blt _08088704
	cmp r0, #0x11
	ble _08088720
	cmp r0, #0x42
	beq _08088720
_08088704:
	ldr r1, [r2, #0xc]
	movs r0, #0x80
	lsls r0, r0, #9
	ands r0, r1
	cmp r0, #0
	beq _08088718
	movs r0, #0x80
	lsls r0, r0, #0x13
	orrs r1, r0
	str r1, [r2, #0xc]
_08088718:
	ldr r0, [r2, #0xc]
	ldr r1, _0808872C @ =0x00010001
	orrs r0, r1
	str r0, [r2, #0xc]
_08088720:
	adds r4, #1
	cmp r4, #0x3f
	ble _080886E4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808872C: .4byte 0x00010001

