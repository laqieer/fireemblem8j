	.syntax unified
	.set sub_808B128, 0x0808B128 + 1
	.set sub_80D65C0, 0x080D65C0 + 1
	.section .text.sub_808B2EC, "ax", %progbits
@ sub_808B2EC @ JP 0x0808B2EC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_808B2EC
	.thumb_func
sub_808B2EC:
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x50
	movs r1, #0
	strh r1, [r0]
	ldr r0, [r4, #0x2c]
	ldr r1, [r0, #0x14]
	cmp r1, #0
	beq _0808B304
	adds r0, r4, #0
	bl sub_80D65C0
_0808B304:
	ldr r0, [r4, #0x2c]
	movs r1, #0
	bl sub_808B128
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

