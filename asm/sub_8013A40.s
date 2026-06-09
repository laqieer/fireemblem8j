	.syntax unified
	.set Proc_EndEach, 0x08002FC8 + 1
	.section .text.sub_8013A40, "ax", %progbits
@ sub_8013A40 @ JP 0x08013A40 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8013A40
	.thumb_func
sub_8013A40:
	push {lr}
	ldr r0, _08013A4C @ =0x085C2490
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_08013A4C: .4byte 0x085C2490

