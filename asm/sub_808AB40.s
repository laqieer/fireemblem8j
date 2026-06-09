	.syntax unified
	.set sub_800125C, 0x0800125C + 1
	.section .text.sub_808AB40, "ax", %progbits
@ sub_808AB40 @ JP 0x0808AB40 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_808AB40
	.thumb_func
sub_808AB40:
	push {r4, lr}
	ldr r4, _0808AB88 @ =0x0202BCEC
	ldrb r0, [r4, #0x14]
	movs r1, #0xfc
	ands r1, r0
	ldr r3, _0808AB8C @ =0x02003BFC
	ldrb r2, [r3]
	movs r0, #3
	ands r0, r2
	orrs r1, r0
	strb r1, [r4, #0x14]
	ldr r1, _0808AB90 @ =0x0203E760
	ldr r0, [r3, #0xc]
	ldrb r0, [r0, #0xb]
	strb r0, [r1, #1]
	movs r0, #0
	bl sub_800125C
	ldr r2, _0808AB94 @ =0x03003020
	ldrb r1, [r2, #1]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #2
	ands r0, r1
	subs r1, #4
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r2, #1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808AB88: .4byte 0x0202BCEC
_0808AB8C: .4byte 0x02003BFC
_0808AB90: .4byte 0x0203E760
_0808AB94: .4byte 0x03003020

