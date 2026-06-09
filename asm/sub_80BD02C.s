	.syntax unified
	.set Proc_StartBlocking, 0x08002C30 + 1
	.section .text.sub_80BD02C, "ax", %progbits
@ sub_80BD02C @ JP 0x080BD02C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80BD02C
	.thumb_func
sub_80BD02C:
	push {lr}
	adds r1, r0, #0
	ldr r0, _080BD03C @ =0x08AC0F10
	bl Proc_StartBlocking
	pop {r0}
	bx r0
	.align 2, 0
_080BD03C: .4byte 0x08AC0F10

