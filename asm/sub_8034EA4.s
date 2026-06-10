	.syntax unified
	.set InitTextDb, 0x08003CB4 + 1
	.set sub_80346B0, 0x080346B0 + 1
	.section .text.sub_8034EA4, "ax", %progbits
@ sub_8034EA4 @ JP 0x08034EA4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8034EA4
	.thumb_func
sub_8034EA4:
	push {lr}
	bl sub_80346B0
	adds r0, #0x38
	movs r1, #8
	bl InitTextDb
	pop {r0}
	bx r0
	.align 2, 0

