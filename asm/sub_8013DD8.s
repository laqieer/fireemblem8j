	.syntax unified
	.set Proc_StartBlocking, 0x08002C30 + 1
	.section .text.sub_8013DD8, "ax", %progbits
@ sub_8013DD8 @ JP 0x08013DD8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8013DD8
	.thumb_func
sub_8013DD8:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08013DEC @ =0x085C24C8
	bl Proc_StartBlocking
	adds r0, #0x64
	strh r4, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08013DEC: .4byte 0x085C24C8

