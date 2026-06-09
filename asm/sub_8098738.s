	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_8098738, "ax", %progbits
@ sub_8098738 @ JP 0x08098738 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8098738
	.thumb_func
sub_8098738:
	push {lr}
	ldr r0, _08098748 @ =0x08A93FE8
	movs r1, #3
	bl sub_8002BCC
	pop {r0}
	bx r0
	.align 2, 0
_08098748: .4byte 0x08A93FE8

