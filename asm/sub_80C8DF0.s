	.syntax unified
	.set Proc_EndEach, 0x08002FC8 + 1
	.section .text.sub_80C8DF0, "ax", %progbits
@ sub_80C8DF0 @ JP 0x080C8DF0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C8DF0
	.thumb_func
sub_80C8DF0:
	push {lr}
	ldr r0, _080C8DFC @ =0x08AC28B0
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_080C8DFC: .4byte 0x08AC28B0

