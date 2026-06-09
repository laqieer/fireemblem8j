	.syntax unified
	.set Proc_End, 0x08002CBC + 1
	.set Proc_Find, 0x08002DEC + 1
	.section .text.sub_80CA388, "ax", %progbits
@ sub_80CA388 @ JP 0x080CA388 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80CA388
	.thumb_func
sub_80CA388:
	push {lr}
	ldr r0, _080CA398 @ =0x08B3EDE8
	bl Proc_Find
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
_080CA398: .4byte 0x08B3EDE8

