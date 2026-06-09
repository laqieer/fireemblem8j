	.syntax unified
	.set GetUnit, 0x08019108 + 1
	.set RefreshEntityBmMaps, 0x08019ECC + 1
	.set SetUnitStatus, 0x08017680 + 1
	.set sub_8018EA4, 0x08018EA4 + 1
	.set sub_8019040, 0x08019040 + 1
	.set sub_807B4B8, 0x0807B4B8 + 1
	.section .text.sub_8087750, "ax", %progbits
@ sub_8087750 @ JP 0x08087750 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8087750
	.thumb_func
sub_8087750:
	push {r4, r5, r6, lr}
	movs r5, #1
	movs r6, #0
_08087756:
	adds r0, r5, #0
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	beq _08087796
	ldr r0, [r4]
	cmp r0, #0
	beq _08087796
	adds r0, r4, #0
	bl sub_8018EA4
	adds r1, r0, #0
	adds r0, r4, #0
	bl sub_8019040
	adds r0, r4, #0
	movs r1, #0
	bl SetUnitStatus
	adds r0, r4, #0
	adds r0, #0x31
	strb r6, [r0]
	ldr r1, [r4, #0xc]
	ldr r0, _080877AC @ =0x0671E00C
	ands r1, r0
	movs r0, #0xff
	strb r0, [r4, #0x10]
	movs r0, #1
	orrs r1, r0
	str r1, [r4, #0xc]
	strb r6, [r4, #0x1b]
_08087796:
	adds r5, #1
	cmp r5, #0x3f
	ble _08087756
	bl RefreshEntityBmMaps
	bl sub_807B4B8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080877AC: .4byte 0x0671E00C

