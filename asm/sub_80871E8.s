	.syntax unified
	.set GetUnit, 0x08019108 + 1
	.section .text.sub_80871E8, "ax", %progbits
@ sub_80871E8 @ JP 0x080871E8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80871E8
	.thumb_func
sub_80871E8:
	push {r4, r5, lr}
	movs r5, #0
	movs r4, #0x81
_080871EE:
	adds r0, r4, #0
	bl GetUnit
	adds r1, r0, #0
	cmp r1, #0
	beq _08087210
	ldr r0, [r1]
	cmp r0, #0
	beq _08087210
	ldr r0, [r1, #0xc]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	bne _08087210
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
_08087210:
	adds r4, #1
	cmp r4, #0xbf
	ble _080871EE
	adds r0, r5, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

