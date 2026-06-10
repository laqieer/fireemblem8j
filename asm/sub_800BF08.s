	.syntax unified
	.set GetUnit, 0x08019108 + 1
	.section .text.sub_800BF08, "ax", %progbits
@ sub_800BF08 @ JP 0x0800BF08 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_800BF08
	.thumb_func
sub_800BF08:
	push {r4, lr}
	movs r4, #1
_0800BF0C:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _0800BF2E
	ldr r0, [r2]
	cmp r0, #0
	beq _0800BF2E
	ldr r1, [r2, #0xc]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _0800BF2E
	movs r0, #1
	orrs r1, r0
	str r1, [r2, #0xc]
_0800BF2E:
	adds r4, #1
	cmp r4, #0x3f
	ble _0800BF0C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

