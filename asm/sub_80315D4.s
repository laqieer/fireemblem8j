	.syntax unified
	.set GetUnit, 0x08019108 + 1
	.section .text.sub_80315D4, "ax", %progbits
@ sub_80315D4 @ JP 0x080315D4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80315D4
	.thumb_func
sub_80315D4:
	push {r4, lr}
	movs r4, #1
_080315D8:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _08031600
	ldr r1, [r2]
	cmp r1, #0
	beq _08031600
	ldr r0, [r2, #4]
	ldr r1, [r1, #0x28]
	ldr r0, [r0, #0x28]
	orrs r1, r0
	movs r0, #0x80
	lsls r0, r0, #2
	ands r1, r0
	cmp r1, #0
	beq _08031600
	adds r0, r2, #0
	b _08031608
_08031600:
	adds r4, #1
	cmp r4, #0x3f
	ble _080315D8
	movs r0, #0
_08031608:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

