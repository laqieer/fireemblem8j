	.syntax unified
	.set Proc_StartBlocking, 0x08002C30 + 1
	.section .text.sub_8032290, "ax", %progbits
@ sub_8032290 @ JP 0x08032290 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8032290
	.thumb_func
sub_8032290:
	push {lr}
	adds r1, r0, #0
	ldr r0, _080322A0 @ =0x085C6004
	bl Proc_StartBlocking
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
_080322A0: .4byte 0x085C6004

