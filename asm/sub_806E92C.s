	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_806E92C, "ax", %progbits
@ sub_806E92C @ JP 0x0806E92C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_806E92C
	.thumb_func
sub_806E92C:
	push {lr}
	ldr r0, _0806E93C @ =0x08603364
	movs r1, #0
	bl sub_8002BCC
	pop {r0}
	bx r0
	.align 2, 0
_0806E93C: .4byte 0x08603364

