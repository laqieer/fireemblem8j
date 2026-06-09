	.syntax unified
	.set Proc_StartBlocking, 0x08002C30 + 1
	.section .text.sub_80BD040, "ax", %progbits
@ sub_80BD040 @ JP 0x080BD040 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80BD040
	.thumb_func
sub_80BD040:
	push {lr}
	adds r1, r0, #0
	ldr r0, _080BD050 @ =0x08AC1038
	bl Proc_StartBlocking
	pop {r0}
	bx r0
	.align 2, 0
_080BD050: .4byte 0x08AC1038

