	.syntax unified
	.set Proc_StartBlocking, 0x08002C30 + 1
	.section .text.sub_80B62A8, "ax", %progbits
@ sub_80B62A8 @ JP 0x080B62A8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B62A8
	.thumb_func
sub_80B62A8:
	push {lr}
	adds r1, r0, #0
	ldr r0, _080B62B8 @ =0x08A9E510
	bl Proc_StartBlocking
	pop {r0}
	bx r0
	.align 2, 0
_080B62B8: .4byte 0x08A9E510

