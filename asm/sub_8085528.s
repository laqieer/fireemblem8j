	.syntax unified
	.set sub_8086350, 0x08086350 + 1
	.section .text.sub_8085528, "ax", %progbits
@ sub_8085528 @ JP 0x08085528 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8085528
	.thumb_func
sub_8085528:
	push {lr}
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl sub_8086350
	cmp r0, #0x12
	beq _0808553E
	movs r0, #0
	b _08085540
_0808553E:
	movs r0, #1
_08085540:
	pop {r1}
	bx r1

