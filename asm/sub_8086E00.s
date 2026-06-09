	.syntax unified
	.set sub_080D63AC, 0x080D63AC + 1
	.section .text.sub_8086E00, "ax", %progbits
@ sub_8086E00 @ JP 0x08086E00 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8086E00
	.thumb_func
sub_8086E00:
	push {lr}
	movs r0, #0xfe
	bl sub_080D63AC
	pop {r0}
	bx r0

