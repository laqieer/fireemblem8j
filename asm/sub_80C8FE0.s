	.syntax unified
	.set Proc_EndEach, 0x08002FC8 + 1
	.section .text.sub_80C8FE0, "ax", %progbits
@ sub_80C8FE0 @ JP 0x080C8FE0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C8FE0
	.thumb_func
sub_80C8FE0:
	push {lr}
	ldr r0, _080C8FEC @ =0x08B3B3D4
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_080C8FEC: .4byte 0x08B3B3D4

