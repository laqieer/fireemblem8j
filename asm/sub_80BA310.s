	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_80BA310, "ax", %progbits
@ sub_80BA310 @ JP 0x080BA310 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80BA310
	.thumb_func
sub_80BA310:
	push {lr}
	ldr r0, _080BA320 @ =0x08ABCC34
	movs r1, #3
	bl sub_8002BCC
	pop {r0}
	bx r0
	.align 2, 0
_080BA320: .4byte 0x08ABCC34

