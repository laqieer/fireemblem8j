	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_806E788, "ax", %progbits
@ sub_806E788 @ JP 0x0806E788 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_806E788
	.thumb_func
sub_806E788:
	push {lr}
	ldr r0, _0806E798 @ =0x08603334
	movs r1, #0
	bl sub_8002BCC
	pop {r0}
	bx r0
	.align 2, 0
_0806E798: .4byte 0x08603334

