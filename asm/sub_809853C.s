	.syntax unified
	.set GetUnit, 0x08019108 + 1
	.section .text.sub_809853C, "ax", %progbits
@ sub_809853C @ JP 0x0809853C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_809853C
	.thumb_func
sub_809853C:
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r4, #1
_08098542:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _0809855C
	ldr r0, [r2]
	cmp r0, #0
	beq _0809855C
	ldr r0, [r2, #0xc]
	ldr r1, _08098570 @ =0xFDFFFFFF
	ands r0, r1
	str r0, [r2, #0xc]
_0809855C:
	adds r4, #1
	cmp r4, #0x3f
	ble _08098542
	adds r1, r5, #0
	adds r1, #0x36
	movs r0, #1
	strb r0, [r1]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08098570: .4byte 0xFDFFFFFF

