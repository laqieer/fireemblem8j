	.syntax unified
	.set GetUnit, 0x08019108 + 1
	.section .text.sub_8086D14, "ax", %progbits
@ sub_8086D14 @ JP 0x08086D14 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8086D14
	.thumb_func
sub_8086D14:
	push {r4, lr}
	movs r4, #1
_08086D18:
	adds r0, r4, #0
	bl GetUnit
	adds r4, #1
	cmp r4, #0x3f
	ble _08086D18
	movs r0, #0
	cmp r0, #2
	bne _08086D2C
	movs r0, #1
_08086D2C:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

