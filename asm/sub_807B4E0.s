	.syntax unified
	.set nullsub_67, 0x0807ACB8 + 1
	.section .text.sub_807B4E0, "ax", %progbits
@ sub_807B4E0 @ JP 0x0807B4E0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_807B4E0
	.thumb_func
sub_807B4E0:
	push {r4, lr}
	adds r4, r0, #0
	bl nullsub_67
	adds r4, #0x3f
	movs r0, #1
	strb r0, [r4]
	pop {r4}
	pop {r0}
	bx r0

