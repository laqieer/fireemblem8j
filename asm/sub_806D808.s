	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_806D808, "ax", %progbits
@ sub_806D808 @ JP 0x0806D808 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_806D808
	.thumb_func
sub_806D808:
	push {lr}
	ldr r0, _0806D818 @ =0x0860313C
	movs r1, #0
	bl sub_8002BCC
	pop {r0}
	bx r0
	.align 2, 0
_0806D818: .4byte 0x0860313C

