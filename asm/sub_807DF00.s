	.syntax unified
	.set Proc_EndEach, 0x08002FC8 + 1
	.section .text.sub_807DF00, "ax", %progbits
@ sub_807DF00 @ JP 0x0807DF00 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_807DF00
	.thumb_func
sub_807DF00:
	push {lr}
	ldr r0, _0807DF0C @ =0x08A13D10
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_0807DF0C: .4byte 0x08A13D10

