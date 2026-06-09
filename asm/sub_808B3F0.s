	.syntax unified
	.set Proc_StartBlocking, 0x08002C30 + 1
	.section .text.sub_808B3F0, "ax", %progbits
@ sub_808B3F0 @ JP 0x0808B3F0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_808B3F0
	.thumb_func
sub_808B3F0:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0808B40C @ =0x08A72B88
	bl Proc_StartBlocking
	ldr r2, _0808B410 @ =0x0203E784
	movs r1, #0
	strh r1, [r2]
	strh r1, [r2, #2]
	str r4, [r0, #0x2c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0808B40C: .4byte 0x08A72B88
_0808B410: .4byte 0x0203E784

