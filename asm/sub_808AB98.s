	.syntax unified
	.set sub_808B818, 0x0808B818 + 1
	.section .text.sub_808AB98, "ax", %progbits
@ sub_808AB98 @ JP 0x0808AB98 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_808AB98
	.thumb_func
sub_808AB98:
	push {lr}
	bl sub_808B818
	ldr r1, _0808ABA8 @ =0x02003BFC
	str r0, [r1, #0x14]
	pop {r0}
	bx r0
	.align 2, 0
_0808ABA8: .4byte 0x02003BFC

