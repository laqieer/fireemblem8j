	.syntax unified
	.set sub_80890A0, 0x080890A0 + 1
	.set sub_808ABD8, 0x0808ABD8 + 1
	.section .text.sub_804C150, "ax", %progbits
@ sub_804C150 @ JP 0x0804C150 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_804C150
	.thumb_func
sub_804C150:
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x1f
	bl sub_80890A0
	ldr r0, _0804C16C @ =0x03004DF0
	ldr r0, [r0]
	adds r1, r4, #0
	bl sub_808ABD8
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804C16C: .4byte 0x03004DF0

