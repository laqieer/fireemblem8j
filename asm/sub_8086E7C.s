	.syntax unified
	.set GetPartyGoldAmount, 0x08024D98 + 1
	.set SetPartyGoldAmount, 0x08024DB4 + 1
	.section .text.sub_8086E7C, "ax", %progbits
@ sub_8086E7C @ JP 0x08086E7C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8086E7C
	.thumb_func
sub_8086E7C:
	push {r4, lr}
	adds r4, r0, #0
	bl GetPartyGoldAmount
	cmp r0, r4
	blt _08086E92
	bl GetPartyGoldAmount
	subs r0, r0, r4
	bl SetPartyGoldAmount
_08086E92:
	pop {r4}
	pop {r0}
	bx r0

