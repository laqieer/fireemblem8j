	.syntax unified
	.set GetUnit, 0x08019108 + 1
	.section .text.sub_80BADB0, "ax", %progbits
@ sub_80BADB0 @ JP 0x080BADB0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80BADB0
	.thumb_func
sub_80BADB0:
	push {r4, r5, lr}
	movs r5, #0
	movs r4, #1
_080BADB6:
	adds r0, r4, #0
	bl GetUnit
	adds r1, r0, #0
	cmp r1, #0
	beq _080BADD4
	ldr r0, [r1]
	cmp r0, #0
	beq _080BADD4
	ldr r0, [r1, #0xc]
	ldr r1, _080BADE4 @ =0x00010004
	ands r0, r1
	cmp r0, #4
	bne _080BADD4
	adds r5, #1
_080BADD4:
	adds r4, #1
	cmp r4, #0x3f
	ble _080BADB6
	lsls r0, r5, #0x10
	lsrs r0, r0, #0x10
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080BADE4: .4byte 0x00010004

