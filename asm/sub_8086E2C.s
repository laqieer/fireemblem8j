	.syntax unified
	.set sub_080D63AC, 0x080D63AC + 1
	.section .text.sub_8086E2C, "ax", %progbits
@ sub_8086E2C @ JP 0x08086E2C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8086E2C
	.thumb_func
sub_8086E2C:
	push {lr}
	movs r0, #0xfe
	bl sub_080D63AC
	pop {r0}
	bx r0

