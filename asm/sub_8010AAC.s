	.syntax unified
	.set ClearFlag, 0x080860BC + 1
	.set Proc_StartBlocking, 0x08002C30 + 1
	.set sub_800BF08, 0x0800BF08 + 1
	.section .text.sub_8010AAC, "ax", %progbits
@ sub_8010AAC @ JP 0x08010AAC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8010AAC
	.thumb_func
sub_8010AAC:
	push {r4, lr}
	adds r4, r0, #0
	bl sub_800BF08
	movs r0, #0x84
	bl ClearFlag
	ldr r0, _08010ACC @ =0x085C609C
	adds r1, r4, #0
	bl Proc_StartBlocking
	movs r0, #2
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08010ACC: .4byte 0x085C609C

