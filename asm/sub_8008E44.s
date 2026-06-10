	.syntax unified
	.set Proc_EndEach, 0x08002FC8 + 1
	.section .text.sub_8008E44, "ax", %progbits
@ sub_8008E44 @ JP 0x08008E44 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8008E44
	.thumb_func
sub_8008E44:
	push {lr}
	ldr r0, _08008E50 @ =0x085B93BC
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_08008E50: .4byte 0x085B93BC

