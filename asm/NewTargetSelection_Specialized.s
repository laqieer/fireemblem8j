	.syntax unified
	.set sub_80507B0, 0x080507B0 + 1
	.section .text.NewTargetSelection_Specialized, "ax", %progbits
@ NewTargetSelection_Specialized @ JP 0x08050818 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global NewTargetSelection_Specialized
	.thumb_func
NewTargetSelection_Specialized:
	push {r4, lr}
	adds r4, r1, #0
	bl sub_80507B0
	adds r1, r0, #0
	str r4, [r1, #0x38]
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

