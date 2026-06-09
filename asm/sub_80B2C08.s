	.syntax unified
	.set ArchiveCurrentPalettes, 0x0801358C + 1
	.section .text.sub_80B2C08, "ax", %progbits
@ sub_80B2C08 @ JP 0x080B2C08 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B2C08
	.thumb_func
sub_80B2C08:
	push {r4, lr}
	adds r4, r0, #0
	bl ArchiveCurrentPalettes
	movs r0, #0
	str r0, [r4, #0x2c]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

