	.syntax unified
	.set GetUnit, 0x08019108 + 1
	.section .text.sub_80872B0, "ax", %progbits
@ sub_80872B0 @ JP 0x080872B0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80872B0
	.thumb_func
sub_80872B0:
	push {r4, lr}
	movs r4, #0x41
_080872B4:
	adds r0, r4, #0
	bl GetUnit
	adds r1, r0, #0
	cmp r1, #0
	beq _080872D4
	ldr r0, [r1]
	cmp r0, #0
	beq _080872D4
	ldr r0, [r1, #0xc]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	bne _080872D4
	movs r0, #0
	b _080872DC
_080872D4:
	adds r4, #1
	cmp r4, #0x7f
	ble _080872B4
	movs r0, #1
_080872DC:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

