	.syntax unified
	.set Proc_EndEach, 0x08002FC8 + 1
	.section .text.sub_80C7218, "ax", %progbits
@ sub_80C7218 @ JP 0x080C7218 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C7218
	.thumb_func
sub_80C7218:
	push {lr}
	ldr r0, _080C7224 @ =0x08AC2510
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_080C7224: .4byte 0x08AC2510

