	.syntax unified
	.set GetPartyGoldAmount, 0x08024D98 + 1
	.set sub_8017124, 0x08017124 + 1
	.set sub_8017178, 0x08017178 + 1
	.section .text.sub_80171F8, "ax", %progbits
@ sub_80171F8 @ JP 0x080171F8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80171F8
	.thumb_func
sub_80171F8:
	push {r4, lr}
	bl sub_8017124
	adds r4, r0, #0
	bl sub_8017178
	adds r4, r4, r0
	bl GetPartyGoldAmount
	adds r4, r4, r0
	ldr r0, _0801721C @ =0x0098967F
	cmp r4, r0
	ble _08017214
	adds r4, r0, #0
_08017214:
	adds r0, r4, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0801721C: .4byte 0x0098967F

