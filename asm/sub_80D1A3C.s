	.syntax unified
	.set Proc_StartBlocking, 0x08002C30 + 1
	.section .text.sub_80D1A3C, "ax", %progbits
@ sub_80D1A3C @ JP 0x080D1A3C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80D1A3C
	.thumb_func
sub_80D1A3C:
	push {lr}
	adds r1, r0, #0
	ldr r0, _080D1A4C @ =0x08BAB76C
	bl Proc_StartBlocking
	pop {r1}
	bx r1
	.align 2, 0
_080D1A4C: .4byte 0x08BAB76C

