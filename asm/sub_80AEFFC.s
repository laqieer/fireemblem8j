	.syntax unified
	.set Proc_StartBlocking, 0x08002C30 + 1
	.section .text.sub_80AEFFC, "ax", %progbits
@ sub_80AEFFC @ JP 0x080AEFFC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80AEFFC
	.thumb_func
sub_80AEFFC:
	push {lr}
	adds r1, r0, #0
	ldr r0, _080AF00C @ =0x08A9D2D4
	bl Proc_StartBlocking
	pop {r0}
	bx r0
	.align 2, 0
_080AF00C: .4byte 0x08A9D2D4

