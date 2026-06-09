	.syntax unified
	.set EquipUnitItemSlot, 0x08016968 + 1
	.set sub_8028E0C, 0x08028E0C + 1
	.set sub_804F610, 0x0804F610 + 1
	.section .text.sub_8023B8C, "ax", %progbits
@ sub_8023B8C @ JP 0x08023B8C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8023B8C
	.thumb_func
sub_8023B8C:
	push {r4, r5, lr}
	ldr r5, _08023BC4 @ =0x03004DF0
	ldr r0, [r5]
	adds r1, #0x3c
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl EquipUnitItemSlot
	ldr r4, _08023BC8 @ =0x0203A954
	movs r0, #0
	strb r0, [r4, #0x12]
	bl sub_804F610
	ldr r0, [r5]
	ldrb r2, [r4, #0x12]
	lsls r2, r2, #1
	adds r1, r0, #0
	adds r1, #0x1e
	adds r1, r1, r2
	ldrh r1, [r1]
	bl sub_8028E0C
	movs r0, #7
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08023BC4: .4byte 0x03004DF0
_08023BC8: .4byte 0x0203A954

