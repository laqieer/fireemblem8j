	.syntax unified
	.set CheckInLinkArena, 0x08042E1C + 1
	.set RefreshEntityBmMaps, 0x08019ECC + 1
	.set ResetUnitSprites, 0x0802662C + 1
	.set sub_80124DC, 0x080124DC + 1
	.set sub_8027144, 0x08027144 + 1
	.set sub_8034180, 0x08034180 + 1
	.set sub_8042E2C, 0x08042E2C + 1
	.set sub_80979B8, 0x080979B8 + 1
	.section .text.sub_80985C4, "ax", %progbits
@ sub_80985C4 @ JP 0x080985C4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80985C4
	.thumb_func
sub_80985C4:
	push {r4, lr}
	adds r4, r0, #0
	bl sub_80979B8
	adds r4, #0x36
	ldrb r0, [r4]
	cmp r0, #0
	beq _080985DA
	bl sub_8034180
	b _080985E8
_080985DA:
	bl CheckInLinkArena
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080985E8
	bl sub_8042E2C
_080985E8:
	bl sub_80124DC
	bl ResetUnitSprites
	bl RefreshEntityBmMaps
	bl sub_8027144
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

