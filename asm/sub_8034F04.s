	.syntax unified
	.set InitTextDb, 0x08003CB4 + 1
	.set sub_80346B0, 0x080346B0 + 1
	.section .text.sub_8034F04, "ax", %progbits
@ sub_8034F04 @ JP 0x08034F04 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8034F04
	.thumb_func
sub_8034F04:
	push {r4, lr}
	bl sub_80346B0
	adds r4, r0, #0
	adds r0, #0x38
	movs r1, #8
	bl InitTextDb
	adds r4, #0x40
	adds r0, r4, #0
	movs r1, #8
	bl InitTextDb
	pop {r4}
	pop {r0}
	bx r0

