	.syntax unified
	.set GetUnit, 0x08019108 + 1
	.section .text.sub_80871B4, "ax", %progbits
@ sub_80871B4 @ JP 0x080871B4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80871B4
	.thumb_func
sub_80871B4:
	push {r4, lr}
	movs r4, #0x81
_080871B8:
	adds r0, r4, #0
	bl GetUnit
	adds r1, r0, #0
	cmp r1, #0
	beq _080871D8
	ldr r0, [r1]
	cmp r0, #0
	beq _080871D8
	ldr r0, [r1, #0xc]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	bne _080871D8
	movs r0, #1
	b _080871E0
_080871D8:
	adds r4, #1
	cmp r4, #0xbf
	ble _080871B8
	movs r0, #0
_080871E0:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

