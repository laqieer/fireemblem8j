	.syntax unified
	.set GetUnit, 0x08019108 + 1
	.section .text.sub_8086F78, "ax", %progbits
@ sub_8086F78 @ JP 0x08086F78 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8086F78
	.thumb_func
sub_8086F78:
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	movs r4, #1
_08086F80:
	adds r0, r4, #0
	bl GetUnit
	cmp r0, #0
	beq _08086FA4
	ldr r2, [r0]
	cmp r2, #0
	beq _08086FA4
	ldr r0, [r0, #0xc]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	bne _08086FA4
	ldrb r0, [r2, #4]
	cmp r0, r5
	bne _08086FA4
	movs r0, #1
	b _08086FAC
_08086FA4:
	adds r4, #1
	cmp r4, #0x3f
	ble _08086F80
	movs r0, #0
_08086FAC:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

