	.syntax unified
	.set EquipUnitItemSlot, 0x08016968 + 1
	.set sub_8031F58, 0x08031F58 + 1
	.section .text.sub_803A380, "ax", %progbits
@ sub_803A380 @ JP 0x0803A380 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_803A380
	.thumb_func
sub_803A380:
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r4, _0803A3C0 @ =0x0203A954
	ldr r0, _0803A3C4 @ =0x0202BE40
	ldrb r0, [r0]
	movs r5, #0
	strb r0, [r4, #0xc]
	movs r0, #2
	strb r0, [r4, #0x11]
	ldr r3, _0803A3C8 @ =0x0203AA90
	ldrb r0, [r3, #6]
	strb r0, [r4, #0xd]
	ldr r1, _0803A3CC @ =0x03004DF0
	ldr r2, [r1]
	ldrb r0, [r3, #2]
	strb r0, [r2, #0x10]
	ldr r2, [r1]
	ldrb r0, [r3, #3]
	strb r0, [r2, #0x11]
	ldr r0, [r1]
	ldrb r1, [r3, #7]
	bl EquipUnitItemSlot
	strb r5, [r4, #0x12]
	adds r0, r6, #0
	bl sub_8031F58
	movs r0, #1
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0803A3C0: .4byte 0x0203A954
_0803A3C4: .4byte 0x0202BE40
_0803A3C8: .4byte 0x0203AA90
_0803A3CC: .4byte 0x03004DF0

