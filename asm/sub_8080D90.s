	.syntax unified
	.set Proc_EndEach, 0x08002FC8 + 1
	.section .text.sub_8080D90, "ax", %progbits
@ sub_8080D90 @ JP 0x08080D90 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8080D90
	.thumb_func
sub_8080D90:
	push {lr}
	ldr r0, _08080D9C @ =0x08A1454C
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_08080D9C: .4byte 0x08A1454C

