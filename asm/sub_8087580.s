	.syntax unified
	.set GetPartyGoldAmount, 0x08024D98 + 1
	.section .text.sub_8087580, "ax", %progbits
@ sub_8087580 @ JP 0x08087580 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8087580
	.thumb_func
sub_8087580:
	push {lr}
	bl GetPartyGoldAmount
	movs r2, #0
	ldr r1, _08087598 @ =0x0000270F
	cmp r0, r1
	ble _08087590
	movs r2, #1
_08087590:
	adds r0, r2, #0
	pop {r1}
	bx r1
	.align 2, 0
_08087598: .4byte 0x0000270F

