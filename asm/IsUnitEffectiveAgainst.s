	.syntax unified
	.section .text.IsUnitEffectiveAgainst, "ax", %progbits
@ IsUnitEffectiveAgainst @ JP 0x08016A30 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global IsUnitEffectiveAgainst
	.thumb_func
IsUnitEffectiveAgainst:
	push {lr}
	ldr r0, [r0, #4]
	ldrb r2, [r0, #4]
	ldr r0, [r1, #4]
	ldrb r3, [r0, #4]
	movs r1, #0
	cmp r2, #0x2c
	bgt _08016A46
	cmp r2, #0x2b
	blt _08016A46
	ldr r1, _08016A4C @ =0x089024C5
_08016A46:
	cmp r1, #0
	beq _08016A5E
	b _08016A58
	.align 2, 0
_08016A4C: .4byte 0x089024C5
_08016A50:
	ldrb r0, [r1]
	cmp r0, r3
	beq _08016A62
	adds r1, #1
_08016A58:
	ldrb r0, [r1]
	cmp r0, #0
	bne _08016A50
_08016A5E:
	movs r0, #0
	b _08016A64
_08016A62:
	movs r0, #1
_08016A64:
	pop {r1}
	bx r1

