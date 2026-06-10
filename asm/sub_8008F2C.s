	.syntax unified
	.set ArchiveCurrentPalettes, 0x0801358C + 1
	.section .text.sub_8008F2C, "ax", %progbits
@ sub_8008F2C @ JP 0x08008F2C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8008F2C
	.thumb_func
sub_8008F2C:
	push {lr}
	movs r1, #0
	str r1, [r0, #0x3c]
	bl ArchiveCurrentPalettes
	pop {r0}
	bx r0
	.align 2, 0

