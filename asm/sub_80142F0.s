	.syntax unified
	.set Proc_StartBlocking, 0x08002C30 + 1
	.section .text.sub_80142F0, "ax", %progbits
@ sub_80142F0 @ JP 0x080142F0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80142F0
	.thumb_func
sub_80142F0:
	push {r4, lr}
	adds r2, r0, #0
	adds r4, r1, #0
	ldr r0, _08014308 @ =0x085C2558
	adds r1, r2, #0
	bl Proc_StartBlocking
	str r4, [r0, #0x58]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08014308: .4byte 0x085C2558

