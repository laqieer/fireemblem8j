	.syntax unified
	.set nullsub_27, 0x08019860 + 1
	.set sub_8000D68, 0x08000D68 + 1
	.section .text.sub_808E5CC, "ax", %progbits
@ sub_808E5CC @ JP 0x0808E5CC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_808E5CC
	.thumb_func
sub_808E5CC:
	push {r4, r5, lr}
	adds r5, r1, #0
	movs r4, #0
	cmp r0, #0x40
	beq _0808E5F8
	cmp r0, #0x40
	bgt _0808E5E0
	cmp r0, #0
	beq _0808E5E6
	b _0808E600
_0808E5E0:
	cmp r0, #0x80
	beq _0808E5F0
	b _0808E600
_0808E5E6:
	ldr r4, _0808E5EC @ =0x08A930D8
	b _0808E604
	.align 2, 0
_0808E5EC: .4byte 0x08A930D8
_0808E5F0:
	ldr r4, _0808E5F4 @ =0x08A930F8
	b _0808E604
	.align 2, 0
_0808E5F4: .4byte 0x08A930F8
_0808E5F8:
	ldr r4, _0808E5FC @ =0x08A93118
	b _0808E604
	.align 2, 0
_0808E5FC: .4byte 0x08A93118
_0808E600:
	bl nullsub_27
_0808E604:
	lsls r1, r5, #5
	adds r0, r4, #0
	movs r2, #0x20
	bl sub_8000D68
	pop {r4, r5}
	pop {r0}
	bx r0

