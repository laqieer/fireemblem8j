	.syntax unified
	.set GetSomeFacingDirection, 0x0801D838 + 1
	.set GetUnit, 0x08019108 + 1
	.set sub_801D934, 0x0801D934 + 1
	.set sub_8035848, 0x08035848 + 1
	.section .text.sub_8022A24, "ax", %progbits
@ sub_8022A24 @ JP 0x08022A24 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8022A24
	.thumb_func
sub_8022A24:
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldrb r0, [r4, #0x1b]
	bl GetUnit
	adds r6, r0, #0
	bl sub_8035848
	movs r0, #0x10
	ldrsb r0, [r5, r0]
	movs r1, #0x11
	ldrsb r1, [r5, r1]
	movs r2, #0x10
	ldrsb r2, [r4, r2]
	movs r3, #0x11
	ldrsb r3, [r4, r3]
	bl GetSomeFacingDirection
	adds r1, r0, #0
	adds r0, r6, #0
	bl sub_801D934
	pop {r4, r5, r6}
	pop {r0}
	bx r0

