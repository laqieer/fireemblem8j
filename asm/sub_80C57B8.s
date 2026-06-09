	.syntax unified
	.set sub_808B3F0, 0x0808B3F0 + 1
	.set sub_808BB14, 0x0808BB14 + 1
	.section .text.sub_80C57B8, "ax", %progbits
@ sub_80C57B8 @ JP 0x080C57B8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C57B8
	.thumb_func
sub_80C57B8:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080C57D4 @ =0x06013000
	movs r1, #9
	bl sub_808BB14
	ldr r0, _080C57D8 @ =0x08AC214C
	adds r1, r4, #0
	bl sub_808B3F0
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080C57D4: .4byte 0x06013000
_080C57D8: .4byte 0x08AC214C

