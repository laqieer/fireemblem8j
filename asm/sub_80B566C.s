	.syntax unified
	.set GetUnit, 0x08019108 + 1
	.set ResetUnitSprites, 0x0802662C + 1
	.set sub_80176AC, 0x080176AC + 1
	.set sub_80265CC, 0x080265CC + 1
	.set sub_80267A0, 0x080267A0 + 1
	.set sub_8026F38, 0x08026F38 + 1
	.section .text.sub_80B566C, "ax", %progbits
@ sub_80B566C @ JP 0x080B566C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B566C
	.thumb_func
sub_80B566C:
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r5, #0
	bl ResetUnitSprites
	movs r4, #1
_080B5678:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _080B56B4
	ldr r3, [r2]
	cmp r3, #0
	beq _080B56B4
	ldr r0, [r2, #0xc]
	ldr r1, _080B56D0 @ =0x00010004
	ands r0, r1
	cmp r0, #0
	bne _080B56B4
	ldrb r0, [r3, #4]
	cmp r0, #1
	beq _080B569E
	cmp r0, #0xf
	bne _080B56B4
_080B569E:
	ldr r0, _080B56D4 @ =0x08A9E50C
	ldr r1, [r0]
	lsls r0, r5, #3
	adds r0, r0, r1
	str r2, [r0, #4]
	adds r5, #1
	adds r0, r2, #0
	bl sub_80176AC
	bl sub_80267A0
_080B56B4:
	adds r4, #1
	cmp r4, #0x3f
	ble _080B5678
	adds r1, r5, #1
	adds r0, r6, #0
	adds r0, #0x2b
	strb r1, [r0]
	bl sub_80265CC
	bl sub_8026F38
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B56D0: .4byte 0x00010004
_080B56D4: .4byte 0x08A9E50C

