	.syntax unified
	.section .text.GetItemLckBonus, "ax", %progbits
@ GetItemLckBonus @ JP 0x080162B8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global GetItemLckBonus
	.thumb_func
GetItemLckBonus:
	push {lr}
	adds r1, r0, #0
	cmp r1, #0
	beq _080162D4
	movs r0, #0xff
	ands r0, r1
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _080162D8 @ =0x0885E068
	adds r1, r1, r0
	ldr r0, [r1, #0xc]
	cmp r0, #0
	bne _080162DC
_080162D4:
	movs r0, #0
	b _080162E2
	.align 2, 0
_080162D8: .4byte 0x0885E068
_080162DC:
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
_080162E2:
	pop {r1}
	bx r1
	.align 2, 0

