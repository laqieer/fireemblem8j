	.syntax unified
	.set Proc_EndEach, 0x08002FC8 + 1
	.section .text.sub_80752A4, "ax", %progbits
@ sub_80752A4 @ JP 0x080752A4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80752A4
	.thumb_func
sub_80752A4:
	push {lr}
	ldr r0, _080752B0 @ =0x085E3C14
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_080752B0: .4byte 0x085E3C14

