	.syntax unified
	.set Proc_EndEach, 0x08002FC8 + 1
	.section .text.sub_80C4908, "ax", %progbits
@ sub_80C4908 @ JP 0x080C4908 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C4908
	.thumb_func
sub_80C4908:
	push {lr}
	ldr r0, _080C4914 @ =0x08AC1F54
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_080C4914: .4byte 0x08AC1F54

