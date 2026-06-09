	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_80CA374, "ax", %progbits
@ sub_80CA374 @ JP 0x080CA374 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80CA374
	.thumb_func
sub_80CA374:
	push {lr}
	adds r1, r0, #0
	ldr r0, _080CA384 @ =0x08B3EDE8
	bl sub_8002BCC
	pop {r0}
	bx r0
	.align 2, 0
_080CA384: .4byte 0x08B3EDE8

