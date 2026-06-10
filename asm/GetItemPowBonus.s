	.syntax unified
	.section .text.GetItemPowBonus, "ax", %progbits
@ GetItemPowBonus @ JP 0x080161C8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global GetItemPowBonus
	.thumb_func
GetItemPowBonus:
	push {lr}
	adds r1, r0, #0
	cmp r1, #0
	beq _080161E4
	movs r0, #0xff
	ands r0, r1
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _080161E8 @ =0x0885E068
	adds r1, r1, r0
	ldr r0, [r1, #0xc]
	cmp r0, #0
	bne _080161EC
_080161E4:
	movs r0, #0
	b _080161F2
	.align 2, 0
_080161E8: .4byte 0x0885E068
_080161EC:
	ldrb r0, [r0, #1]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
_080161F2:
	pop {r1}
	bx r1
	.align 2, 0

