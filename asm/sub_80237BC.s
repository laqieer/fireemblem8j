	.syntax unified
	.set EquipUnitItemSlot, 0x08016968 + 1
	.set sub_8023514, 0x08023514 + 1
	.set sub_80502F4, 0x080502F4 + 1
	.section .text.sub_80237BC, "ax", %progbits
@ sub_80237BC @ JP 0x080237BC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80237BC
	.thumb_func
sub_80237BC:
	push {r4, lr}
	adds r4, r0, #0
	adds r1, #0x3d
	ldrb r0, [r1]
	cmp r0, #2
	beq _080237E8
	ldr r0, _080237E0 @ =0x03004DF0
	ldr r0, [r0]
	ldr r1, _080237E4 @ =0x0203A954
	ldrb r1, [r1, #0x12]
	bl EquipUnitItemSlot
	adds r0, r4, #0
	bl sub_8023514
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	b _080237F2
	.align 2, 0
_080237E0: .4byte 0x03004DF0
_080237E4: .4byte 0x0203A954
_080237E8:
	ldr r1, _080237F8 @ =0x000007CB
	adds r0, r4, #0
	bl sub_80502F4
	movs r0, #8
_080237F2:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_080237F8: .4byte 0x000007CB

