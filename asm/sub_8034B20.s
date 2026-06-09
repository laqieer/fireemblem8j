	.syntax unified
	.set InitTextDb, 0x08003CB4 + 1
	.set sub_80346B0, 0x080346B0 + 1
	.section .text.sub_8034B20, "ax", %progbits
@ sub_8034B20 @ JP 0x08034B20 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8034B20
	.thumb_func
sub_8034B20:
	push {r4, r5, lr}
	bl sub_80346B0
	adds r4, r0, #0
	adds r4, #0x38
	movs r5, #4
_08034B2C:
	adds r0, r4, #0
	movs r1, #7
	bl InitTextDb
	adds r4, #8
	subs r5, #1
	cmp r5, #0
	bge _08034B2C
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

