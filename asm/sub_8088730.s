	.syntax unified
	.set GetUnit, 0x08019108 + 1
	.set sub_801759C, 0x0801759C + 1
	.section .text.sub_8088730, "ax", %progbits
@ HandleCh5xUnits_End @ JP 0x08088730 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global HandleCh5xUnits_End
	.thumb_func
HandleCh5xUnits_End:
	push {r4, lr}
	movs r4, #1
_08088734:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _08088786
	ldr r0, [r2]
	cmp r0, #0
	beq _08088786
	ldrb r0, [r0, #4]
	cmp r0, #0xf
	blt _08088774
	cmp r0, #0x11
	ble _08088756
	cmp r0, #0x42
	beq _0808876C
	b _08088774
_08088756:
	ldr r0, [r2, #0xc]
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	ldr r1, _08088768 @ =0x00010001
	orrs r0, r1
	str r0, [r2, #0xc]
	b _08088786
	.align 2, 0
_08088768: .4byte 0x00010001
_0808876C:
	adds r0, r2, #0
	bl sub_801759C
	b _08088786
_08088774:
	ldr r1, [r2, #0xc]
	movs r0, #0x80
	lsls r0, r0, #0x13
	ands r0, r1
	cmp r0, #0
	bne _08088786
	ldr r0, _08088794 @ =0xFFFEFFFE
	ands r1, r0
	str r1, [r2, #0xc]
_08088786:
	adds r4, #1
	cmp r4, #0x3f
	ble _08088734
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08088794: .4byte 0xFFFEFFFE

