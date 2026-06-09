	.syntax unified
	.set sub_80A98B4, 0x080A98B4 + 1
	.section .text.sub_80ADC68, "ax", %progbits
@ sub_80ADC68 @ JP 0x080ADC68 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80ADC68
	.thumb_func
sub_80ADC68:
	push {lr}
	adds r2, r0, #0
	adds r2, #0x2a
	ldrb r2, [r2]
	cmp r2, #1
	beq _080ADC8A
	cmp r2, #1
	bgt _080ADC7E
	cmp r2, #0
	beq _080ADC84
	b _080ADC94
_080ADC7E:
	cmp r2, #2
	beq _080ADC90
	b _080ADC94
_080ADC84:
	movs r3, #0
	movs r1, #0
	b _080ADC94
_080ADC8A:
	movs r3, #1
	movs r1, #0
	b _080ADC94
_080ADC90:
	movs r3, #1
	movs r1, #1
_080ADC94:
	adds r0, #0x2c
	ldrb r0, [r0]
	movs r2, #1
	bl sub_80A98B4
	pop {r0}
	bx r0
	.align 2, 0

