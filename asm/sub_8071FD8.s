	.syntax unified
	.set GetAnimPosition, 0x0805AF10 + 1
	.section .text.sub_8071FD8, "ax", %progbits
@ sub_8071FD8 @ JP 0x08071FD8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8071FD8
	.thumb_func
sub_8071FD8:
	push {lr}
	bl GetAnimPosition
	cmp r0, #0
	beq _08071FEC
	ldr r0, _08071FE8 @ =0x02020058
	b _08071FEE
	.align 2, 0
_08071FE8: .4byte 0x02020058
_08071FEC:
	ldr r0, _08071FF4 @ =0x02020048
_08071FEE:
	pop {r1}
	bx r1
	.align 2, 0
_08071FF4: .4byte 0x02020048

