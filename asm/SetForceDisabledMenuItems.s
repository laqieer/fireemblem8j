	.syntax unified
	.set AddMenuOverride, 0x080504F0 + 1
	.section .text.SetForceDisabledMenuItems, "ax", %progbits
@ SetForceDisabledMenuItems @ JP 0x080504C8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global SetForceDisabledMenuItems
	.thumb_func
SetForceDisabledMenuItems:
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r4, #0
_080504CE:
	adds r1, r5, r4
	ldrb r0, [r1]
	cmp r0, #0
	beq _080504DE
	movs r1, #1
	ldr r2, _080504EC @ =sub_80501C4
	bl AddMenuOverride
_080504DE:
	adds r4, #1
	cmp r4, #0xf
	ble _080504CE
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080504EC: .4byte 0x080501C5  @ sub_80501C4

