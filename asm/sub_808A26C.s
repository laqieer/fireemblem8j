	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_808A144, 0x0808A144 + 1
	.section .text.sub_808A26C, "ax", %progbits
@ sub_808A26C @ JP 0x0808A26C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_808A26C
	.thumb_func
sub_808A26C:
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r4, #0
	adds r5, #0x36
	ldrb r0, [r5]
	bl sub_808A144
	ldr r1, _0808A290 @ =0x02003BFC
	ldrh r0, [r1, #2]
	cmp r0, #0
	beq _0808A294
	movs r0, #5
	strh r0, [r4, #0x38]
	adds r0, r4, #0
	bl sub_8002DE4
	b _0808A298
	.align 2, 0
_0808A290: .4byte 0x02003BFC
_0808A294:
	ldrb r0, [r1]
	strb r0, [r5]
_0808A298:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

