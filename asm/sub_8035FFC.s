	.syntax unified
	.set GetTarget, 0x08050AA8 + 1
	.set GetUnit, 0x08019108 + 1
	.set sub_80280A0, 0x080280A0 + 1
	.set sub_8035904, 0x08035904 + 1
	.set sub_8035EDC, 0x08035EDC + 1
	.section .text.sub_8035FFC, "ax", %progbits
@ sub_8035FFC @ JP 0x08035FFC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8035FFC
	.thumb_func
sub_8035FFC:
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r0, #0x4c
	movs r1, #0
	ldrsh r0, [r0, r1]
	bl GetTarget
	adds r5, r0, #0
	movs r0, #2
	ldrsb r0, [r5, r0]
	bl GetUnit
	adds r4, r0, #0
	movs r0, #3
	ldrsb r0, [r5, r0]
	cmp r0, #0
	bge _08036028
	adds r0, r4, #0
	adds r1, r6, #0
	bl sub_8035EDC
	b _08036038
_08036028:
	adds r0, r4, #0
	bl sub_80280A0
	movs r1, #3
	ldrsb r1, [r5, r1]
	adds r0, r4, #0
	bl sub_8035904
_08036038:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

