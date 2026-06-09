	.syntax unified
	.set Proc_StartBlocking, 0x08002C30 + 1
	.section .text.sub_80AD1F4, "ax", %progbits
@ sub_80AD1F4 @ JP 0x080AD1F4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80AD1F4
	.thumb_func
sub_80AD1F4:
	push {lr}
	adds r1, r0, #0
	ldr r0, _080AD204 @ =0x08A9CA64
	bl Proc_StartBlocking
	pop {r0}
	bx r0
	.align 2, 0
_080AD204: .4byte 0x08A9CA64

