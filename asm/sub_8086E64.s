	.syntax unified
	.set GetPartyGoldAmount, 0x08024D98 + 1
	.set SetPartyGoldAmount, 0x08024DB4 + 1
	.section .text.sub_8086E64, "ax", %progbits
@ sub_8086E64 @ JP 0x08086E64 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8086E64
	.thumb_func
sub_8086E64:
	push {lr}
	bl GetPartyGoldAmount
	ldr r1, _08086E78 @ =0x00001388
	adds r0, r0, r1
	bl SetPartyGoldAmount
	pop {r0}
	bx r0
	.align 2, 0
_08086E78: .4byte 0x00001388

