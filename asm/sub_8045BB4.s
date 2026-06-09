	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_8045BB4, "ax", %progbits
@ sub_8045BB4 @ JP 0x08045BB4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8045BB4
	.thumb_func
sub_8045BB4:
	push {lr}
	ldr r0, _08045BC4 @ =0x085D4760
	movs r1, #2
	bl sub_8002BCC
	pop {r0}
	bx r0
	.align 2, 0
_08045BC4: .4byte 0x085D4760

