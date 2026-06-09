	.syntax unified
	.set EndMenuScrollBar, 0x08099968 + 1
	.set GetUnitFromPrepList, 0x08097634 + 1
	.set SetPrimaryHBlankHandler, 0x08001D28 + 1
	.set sub_808B7E0, 0x0808B7E0 + 1
	.set sub_80976A0, 0x080976A0 + 1
	.set sub_8097D18, 0x08097D18 + 1
	.set sub_809A7D8, 0x0809A7D8 + 1
	.set sub_809A87C, 0x0809A87C + 1
	.set sub_809C224, 0x0809C224 + 1
	.set sub_80B15A0, 0x080B15A0 + 1
	.set sub_80B1DBC, 0x080B1DBC + 1
	.set sub_80B2020, 0x080B2020 + 1
	.section .text.sub_809AC94, "ax", %progbits
@ sub_809AC94 @ JP 0x0809AC94 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_809AC94
	.thumb_func
sub_809AC94:
	push {lr}
	adds r0, #0x2a
	ldrb r0, [r0]
	bl GetUnitFromPrepList
	ldr r0, [r0]
	ldrb r0, [r0, #4]
	bl sub_80976A0
	bl sub_80B1DBC
	bl sub_80B2020
	bl sub_80B15A0
	movs r0, #0
	bl sub_809C224
	movs r0, #1
	bl sub_809C224
	bl sub_8097D18
	bl sub_808B7E0
	bl EndMenuScrollBar
	bl sub_809A7D8
	bl sub_809A87C
	movs r0, #0
	bl SetPrimaryHBlankHandler
	pop {r0}
	bx r0

