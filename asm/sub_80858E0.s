	.syntax unified
	.set sub_80858A8, 0x080858A8 + 1
	.set sub_80869B0, 0x080869B0 + 1
	.section .text.sub_80858E0, "ax", %progbits
@ sub_80858E0 @ JP 0x080858E0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80858E0
	.thumb_func
sub_80858E0:
	push {r4, lr}
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	adds r0, r4, #0
	bl sub_80869B0
	adds r1, r0, #0
	cmp r1, #0
	beq _0808590C
	ldrh r0, [r1, #6]
	cmp r0, #0
	bne _08085908
	ldr r0, [r1, #8]
	cmp r0, #0
	bne _08085908
	ldrh r1, [r1, #4]
	adds r0, r4, #0
	bl sub_80858A8
	b _0808590C
_08085908:
	movs r0, #1
	b _0808590E
_0808590C:
	movs r0, #0
_0808590E:
	pop {r4}
	pop {r1}
	bx r1

