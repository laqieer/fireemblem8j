	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_808C40C, "ax", %progbits
@ sub_808C40C @ JP 0x0808C40C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_808C40C
	.thumb_func
sub_808C40C:
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _0808C424 @ =0x08A73708
	movs r1, #3
	bl sub_8002BCC
	str r4, [r0, #0x58]
	str r5, [r0, #0x5c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0808C424: .4byte 0x08A73708

