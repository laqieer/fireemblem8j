	.syntax unified
	.set BG_SetPosition, 0x08001448 + 1
	.section .text.sub_808ABAC, "ax", %progbits
@ sub_808ABAC @ JP 0x0808ABAC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_808ABAC
	.thumb_func
sub_808ABAC:
	push {r4, lr}
	ldr r0, _0808ABD4 @ =0x02003BFC
	movs r1, #6
	ldrsh r4, [r0, r1]
	rsbs r4, r4, #0
	movs r0, #0xff
	ands r4, r0
	movs r0, #0
	movs r1, #0
	adds r2, r4, #0
	bl BG_SetPosition
	movs r0, #2
	movs r1, #0
	adds r2, r4, #0
	bl BG_SetPosition
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808ABD4: .4byte 0x02003BFC

