	.syntax unified
	.set Proc_EndEach, 0x08002FC8 + 1
	.section .text.sub_804D298, "ax", %progbits
@ sub_804D298 @ JP 0x0804D298 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_804D298
	.thumb_func
sub_804D298:
	push {lr}
	ldr r0, _0804D2A4 @ =0x085D4A24
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_0804D2A4: .4byte 0x085D4A24

