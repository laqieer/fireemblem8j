	.syntax unified
	.set Proc_EndEach, 0x08002FC8 + 1
	.section .text.sub_80048D8, "ax", %progbits
@ sub_80048D8 @ JP 0x080048D8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80048D8
	.thumb_func
sub_80048D8:
	push {lr}
	ldr r0, _080048E4 @ =0x08577F34
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_080048E4: .4byte 0x08577F34

