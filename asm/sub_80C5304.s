	.syntax unified
	.set Proc_EndEach, 0x08002FC8 + 1
	.section .text.sub_80C5304, "ax", %progbits
@ sub_80C5304 @ JP 0x080C5304 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C5304
	.thumb_func
sub_80C5304:
	push {lr}
	ldr r0, _080C5310 @ =0x08AC206C
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_080C5310: .4byte 0x08AC206C

