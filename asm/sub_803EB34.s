	.syntax unified
	.set EquipUnitItemSlot, 0x08016968 + 1
	.section .text.sub_803EB34, "ax", %progbits
@ sub_803EB34 @ JP 0x0803EB34 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_803EB34
	.thumb_func
sub_803EB34:
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	movs r5, #1
	rsbs r5, r5, #0
	movs r4, #0
	movs r3, #0
	movs r7, #0xff
	lsls r7, r7, #8
_0803EB44:
	ldrh r0, [r1]
	cmp r0, #0
	beq _0803EB5E
	adds r2, r0, #0
	ands r0, r6
	cmp r0, #0
	beq _0803EB5E
	adds r0, r7, #0
	ands r0, r2
	cmp r0, r4
	bls _0803EB5E
	adds r4, r0, #0
	adds r5, r3, #0
_0803EB5E:
	adds r1, #2
	adds r3, #1
	cmp r3, #4
	ble _0803EB44
	cmp r5, #0
	ble _0803EB74
	ldr r0, _0803EB7C @ =0x03004DF0
	ldr r0, [r0]
	adds r1, r5, #0
	bl EquipUnitItemSlot
_0803EB74:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803EB7C: .4byte 0x03004DF0

