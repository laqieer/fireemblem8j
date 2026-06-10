	.syntax unified
	.set StartBgm, 0x08002424 + 1
	.section .text.sub_803835C, "ax", %progbits
@ sub_803835C @ JP 0x0803835C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_803835C
	.thumb_func
sub_803835C:
	push {lr}
	movs r0, #0x40
	movs r1, #0
	bl StartBgm
	pop {r0}
	bx r0
	.align 2, 0

