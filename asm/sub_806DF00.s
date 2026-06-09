	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_806DF00, "ax", %progbits
@ sub_806DF00 @ JP 0x0806DF00 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_806DF00
	.thumb_func
sub_806DF00:
	push {lr}
	ldr r0, _0806DF10 @ =0x08603274
	movs r1, #0
	bl sub_8002BCC
	pop {r0}
	bx r0
	.align 2, 0
_0806DF10: .4byte 0x08603274

