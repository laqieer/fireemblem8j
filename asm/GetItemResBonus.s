	.syntax unified
	.section .text.GetItemResBonus, "ax", %progbits
@ GetItemResBonus @ JP 0x08016288 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global GetItemResBonus
	.thumb_func
GetItemResBonus:
	push {lr}
	adds r1, r0, #0
	cmp r1, #0
	beq _080162A4
	movs r0, #0xff
	ands r0, r1
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _080162A8 @ =0x0885E068
	adds r1, r1, r0
	ldr r0, [r1, #0xc]
	cmp r0, #0
	bne _080162AC
_080162A4:
	movs r0, #0
	b _080162B2
	.align 2, 0
_080162A8: .4byte 0x0885E068
_080162AC:
	ldrb r0, [r0, #5]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
_080162B2:
	pop {r1}
	bx r1
	.align 2, 0

