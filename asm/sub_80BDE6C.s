	.syntax unified
	.set GetUnit, 0x08019108 + 1
	.section .text.sub_80BDE6C, "ax", %progbits
@ sub_80BDE6C @ JP 0x080BDE6C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80BDE6C
	.thumb_func
sub_80BDE6C:
	push {r4, lr}
	movs r4, #1
_080BDE70:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _080BDE8C
	ldr r0, [r2]
	cmp r0, #0
	beq _080BDE8C
	ldr r0, [r2, #0xc]
	movs r1, #9
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r2, #0xc]
_080BDE8C:
	adds r4, #1
	cmp r4, #0x3f
	ble _080BDE70
	pop {r4}
	pop {r0}
	bx r0

