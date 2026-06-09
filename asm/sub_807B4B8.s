	.syntax unified
	.set Proc_EndEach, 0x08002FC8 + 1
	.section .text.sub_807B4B8, "ax", %progbits
@ sub_807B4B8 @ JP 0x0807B4B8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_807B4B8
	.thumb_func
sub_807B4B8:
	push {lr}
	ldr r0, _0807B4C4 @ =0x08A132D0
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_0807B4C4: .4byte 0x08A132D0

