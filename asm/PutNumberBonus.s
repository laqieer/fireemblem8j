	.syntax unified
	.set PutNumberSmall, 0x08004AEC + 1
	.set PutSpecialChar, 0x08004A14 + 1
	.section .text.PutNumberBonus, "ax", %progbits
@ PutNumberBonus @ JP 0x08004AF8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global PutNumberBonus
	.thumb_func
PutNumberBonus:
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	cmp r5, #0
	beq _08004B1C
	adds r0, r4, #0
	movs r1, #4
	movs r2, #0x15
	bl PutSpecialChar
	adds r0, r4, #2
	cmp r5, #9
	ble _08004B14
	adds r0, r4, #4
_08004B14:
	movs r1, #4
	adds r2, r5, #0
	bl PutNumberSmall
_08004B1C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

