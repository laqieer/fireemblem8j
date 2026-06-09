	.syntax unified
	.set Proc_End, 0x08002CBC + 1
	.section .text.sub_805C124, "ax", %progbits
@ sub_805C124 @ JP 0x0805C124 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_805C124
	.thumb_func
sub_805C124:
	push {lr}
	ldr r0, _0805C134 @ =0x0201FB24
	ldr r0, [r0]
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
_0805C134: .4byte 0x0201FB24

