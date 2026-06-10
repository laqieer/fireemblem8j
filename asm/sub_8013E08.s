	.syntax unified
	.set Proc_StartBlocking, 0x08002C30 + 1
	.section .text.sub_8013E08, "ax", %progbits
@ sub_8013E08 @ JP 0x08013E08 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8013E08
	.thumb_func
sub_8013E08:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _08013E1C @ =0x085C2508
	bl Proc_StartBlocking
	adds r0, #0x64
	strh r4, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08013E1C: .4byte 0x085C2508

