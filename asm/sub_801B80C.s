	.syntax unified
	.set sub_801C2C4, 0x0801C2C4 + 1
	.section .text.sub_801B80C, "ax", %progbits
@ sub_801B80C @ JP 0x0801B80C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_801B80C
	.thumb_func
sub_801B80C:
	push {lr}
	adds r0, r1, #0
	movs r1, #7
	movs r2, #2
	bl sub_801C2C4
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0

