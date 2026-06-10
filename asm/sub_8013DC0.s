	.syntax unified
	.set Proc_StartBlocking, 0x08002C30 + 1
	.section .text.sub_8013DC0, "ax", %progbits
@ sub_8013DC0 @ JP 0x08013DC0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8013DC0
	.thumb_func
sub_8013DC0:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08013DD4 @ =0x085C24A8
	bl Proc_StartBlocking
	adds r0, #0x64
	strh r4, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08013DD4: .4byte 0x085C24A8

