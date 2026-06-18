	.syntax unified
	.set CharStoreAI, 0x0803C1E8 + 1
	.set MakeNewItem, 0x080162E8 + 1
	.set UnitAddItem, 0x080176F0 + 1
	.set sub_807C44C, 0x0807C44C + 1
	.section .text.sub_8017A5C, "ax", %progbits
@ UnitInitFromDefinition @ JP 0x08017A5C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global UnitInitFromDefinition
	.thumb_func
UnitInitFromDefinition:
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	ldrb r1, [r6]
	cmp r1, #0
	bgt _08017A6C
	movs r1, #0
	b _08017A74
_08017A6C:
	movs r0, #0x34
	muls r1, r0, r1
	ldr r0, _08017A84 @ =0x08858288
	adds r1, r1, r0
_08017A74:
	str r1, [r5]
	ldrb r0, [r6, #1]
	cmp r0, #0
	beq _08017A88
	adds r1, r0, #0
	cmp r1, #0
	ble _08017A8E
	b _08017A92
	.align 2, 0
_08017A84: .4byte 0x08858288
_08017A88:
	ldrb r1, [r1, #5]
	cmp r1, #0
	bgt _08017A92
_08017A8E:
	movs r1, #0
	b _08017A9A
_08017A92:
	movs r0, #0x54
	muls r1, r0, r1
	ldr r0, _08017ADC @ =0x0885B668
	adds r1, r1, r0
_08017A9A:
	str r1, [r5, #4]
	ldrb r0, [r6, #3]
	lsrs r0, r0, #3
	strb r0, [r5, #8]
	adds r1, r5, #0
	adds r1, #0x10
	adds r2, r5, #0
	adds r2, #0x11
	adds r0, r6, #0
	movs r3, #0
	bl sub_807C44C
	ldr r0, [r5, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x62
	beq _08017ABE
	cmp r0, #0x34
	bne _08017AE0
_08017ABE:
	movs r0, #0
	strh r0, [r5, #0x1e]
	movs r1, #0
	adds r3, r6, #0
	adds r3, #0xc
	adds r2, r5, #0
	adds r2, #0x20
_08017ACC:
	adds r0, r3, r1
	ldrb r0, [r0]
	strh r0, [r2]
	adds r2, #2
	adds r1, #1
	cmp r1, #3
	ble _08017ACC
	b _08017B0A
	.align 2, 0
_08017ADC: .4byte 0x0885B668
_08017AE0:
	adds r1, r6, #0
	adds r1, #0xc
	ldrb r0, [r6, #0xc]
	cmp r0, #0
	beq _08017B0A
	adds r4, r1, #0
	adds r7, r4, #0
_08017AEE:
	ldrb r0, [r4]
	bl MakeNewItem
	adds r1, r0, #0
	adds r0, r5, #0
	bl UnitAddItem
	adds r4, #1
	adds r0, r7, #3
	cmp r4, r0
	bgt _08017B0A
	ldrb r0, [r4]
	cmp r0, #0
	bne _08017AEE
_08017B0A:
	adds r0, r5, #0
	adds r1, r6, #0
	bl CharStoreAI
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

