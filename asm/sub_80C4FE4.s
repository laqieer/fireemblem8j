	.syntax unified
	.set Proc_EndEach, 0x08002FC8 + 1
	.section .text.sub_80C4FE4, "ax", %progbits
@ sub_80C4FE4 @ JP 0x080C4FE4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C4FE4
	.thumb_func
sub_80C4FE4:
	push {lr}
	ldr r0, _080C4FF0 @ =0x08AC1FE4
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_080C4FF0: .4byte 0x08AC1FE4

