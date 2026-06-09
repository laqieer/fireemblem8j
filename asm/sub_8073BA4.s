	.syntax unified
	.set AdvanceGetLCGRNValue, 0x08000CC0 + 1
	.set sub_80D637C, 0x080D637C + 1
	.section .text.sub_8073BA4, "ax", %progbits
@ sub_8073BA4 @ JP 0x08073BA4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8073BA4
	.thumb_func
sub_8073BA4:
	push {r4, lr}
	adds r4, r0, #0
	bl AdvanceGetLCGRNValue
	adds r4, #1
	adds r1, r4, #0
	bl sub_80D637C
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

