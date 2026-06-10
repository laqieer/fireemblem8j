	.syntax unified
	.set EquipUnitItemSlot, 0x08016968 + 1
	.set Eventinfo_CondFalse_1, 0x08085600 + 1
	.set sub_8025164, 0x08025164 + 1
	.set sub_804F610, 0x0804F610 + 1
	.set sub_80507B0, 0x080507B0 + 1
	.section .text.sub_8022CB8, "ax", %progbits
@ sub_8022CB8 @ JP 0x08022CB8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8022CB8
	.thumb_func
sub_8022CB8:
	push {r4, lr}
	ldr r4, _08022CF0 @ =0x03004DF0
	ldr r0, [r4]
	adds r1, #0x3c
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl EquipUnitItemSlot
	ldr r1, _08022CF4 @ =0x0203A954
	movs r0, #0
	strb r0, [r1, #0x12]
	bl sub_804F610
	ldr r0, [r4]
	ldrh r1, [r0, #0x1e]
	bl sub_8025164
	ldr r0, _08022CF8 @ =0x085C58D8
	bl sub_80507B0
	bl Eventinfo_CondFalse_1
	movs r0, #0x27
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08022CF0: .4byte 0x03004DF0
_08022CF4: .4byte 0x0203A954
_08022CF8: .4byte 0x085C58D8

