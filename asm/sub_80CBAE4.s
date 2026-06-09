	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_80CBAE4, "ax", %progbits
@ sub_80CBAE4 @ JP 0x080CBAE4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80CBAE4
	.thumb_func
sub_80CBAE4:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080CBAF8 @ =0x08B3F2B0
	bl sub_8002BCC
	adds r0, #0x64
	strh r4, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080CBAF8: .4byte 0x08B3F2B0

