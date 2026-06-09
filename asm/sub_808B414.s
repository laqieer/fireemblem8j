	.syntax unified
	.set Proc_StartBlocking, 0x08002C30 + 1
	.section .text.sub_808B414, "ax", %progbits
@ sub_808B414 @ JP 0x0808B414 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_808B414
	.thumb_func
sub_808B414:
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r4, r2, #0
	adds r5, r3, #0
	ldr r0, _0808B430 @ =0x08A72B88
	bl Proc_StartBlocking
	ldr r1, _0808B434 @ =0x0203E784
	strh r4, [r1]
	strh r5, [r1, #2]
	str r6, [r0, #0x2c]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0808B430: .4byte 0x08A72B88
_0808B434: .4byte 0x0203E784

