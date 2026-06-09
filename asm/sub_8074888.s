	.syntax unified
	.set GetAnimPosition, 0x0805AF10 + 1
	.set sub_8074DE8, 0x08074DE8 + 1
	.section .text.sub_8074888, "ax", %progbits
@ sub_8074888 @ JP 0x08074888 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8074888
	.thumb_func
sub_8074888:
	push {r4, r5, lr}
	adds r4, r0, #0
	bl sub_8074DE8
	movs r2, #2
	ldrsh r1, [r4, r2]
	adds r5, r0, r1
	adds r0, r4, #0
	bl GetAnimPosition
	cmp r0, #0
	bne _080748A6
	cmp r5, #0x58
	bgt _080748AE
	b _080748AA
_080748A6:
	cmp r5, #0x97
	ble _080748AE
_080748AA:
	movs r0, #1
	b _080748B0
_080748AE:
	movs r0, #0
_080748B0:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

