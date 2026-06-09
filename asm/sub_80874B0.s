	.syntax unified
	.set GetUnit, 0x08019108 + 1
	.section .text.sub_80874B0, "ax", %progbits
@ sub_80874B0 @ JP 0x080874B0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80874B0
	.thumb_func
sub_80874B0:
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r6, #0
	adds r4, r5, #1
	b _080874DC
_080874BA:
	adds r0, r4, #0
	bl GetUnit
	adds r1, r0, #0
	cmp r1, #0
	beq _080874D8
	ldr r0, [r1]
	cmp r0, #0
	beq _080874D8
	ldr r0, [r1, #0xc]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	bne _080874D8
	adds r6, #1
_080874D8:
	adds r4, #1
	adds r0, r5, #0
_080874DC:
	adds r0, #0x40
	cmp r4, r0
	blt _080874BA
	adds r0, r6, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

