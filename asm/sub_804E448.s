	.syntax unified
	.set Proc_EndEach, 0x08002FC8 + 1
	.section .text.sub_804E448, "ax", %progbits
@ sub_804E448 @ JP 0x0804E448 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_804E448
	.thumb_func
sub_804E448:
	push {lr}
	ldr r0, _0804E454 @ =0x085D4C6C
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_0804E454: .4byte 0x085D4C6C

