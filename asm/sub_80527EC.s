	.syntax unified
	.set Proc_End, 0x08002CBC + 1
	.section .text.sub_80527EC, "ax", %progbits
@ sub_80527EC @ JP 0x080527EC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80527EC
	.thumb_func
sub_80527EC:
	push {lr}
	ldr r0, _080527FC @ =0x0200006C
	ldr r0, [r0]
	bl Proc_End
	pop {r0}
	bx r0
	.align 2, 0
_080527FC: .4byte 0x0200006C

