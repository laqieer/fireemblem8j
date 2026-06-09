	.syntax unified
	.set Proc_EndEach, 0x08002FC8 + 1
	.section .text.sub_80C55DC, "ax", %progbits
@ sub_80C55DC @ JP 0x080C55DC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C55DC
	.thumb_func
sub_80C55DC:
	push {lr}
	ldr r0, _080C55E8 @ =0x08AC20A4
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_080C55E8: .4byte 0x08AC20A4

