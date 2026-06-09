	.syntax unified
	.set Proc_EndEach, 0x08002FC8 + 1
	.section .text.sub_80C619C, "ax", %progbits
@ sub_80C619C @ JP 0x080C619C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C619C
	.thumb_func
sub_80C619C:
	push {lr}
	ldr r0, _080C61A8 @ =0x08AC23F8
	bl Proc_EndEach
	pop {r0}
	bx r0
	.align 2, 0
_080C61A8: .4byte 0x08AC23F8

