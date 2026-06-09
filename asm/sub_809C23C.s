	.syntax unified
	.set Proc_StartBlocking, 0x08002C30 + 1
	.section .text.sub_809C23C, "ax", %progbits
@ sub_809C23C @ JP 0x0809C23C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_809C23C
	.thumb_func
sub_809C23C:
	push {lr}
	adds r1, r0, #0
	ldr r0, _0809C24C @ =0x08A946E8
	bl Proc_StartBlocking
	pop {r1}
	bx r1
	.align 2, 0
_0809C24C: .4byte 0x08A946E8

