	.syntax unified
	.set GetUnit, 0x08019108 + 1
	.set sub_8033168, 0x08033168 + 1
	.section .text.sub_801263C, "ax", %progbits
@ sub_801263C @ JP 0x0801263C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_801263C
	.thumb_func
sub_801263C:
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	cmp r6, #0x3f
	bgt _0801267A
_08012644:
	adds r0, r6, #0
	bl GetUnit
	adds r5, r0, #0
	cmp r5, #0
	beq _08012674
	ldr r0, [r5]
	cmp r0, #0
	beq _08012674
	ldrb r4, [r0, #4]
	bl sub_8033168
	cmp r4, r0
	beq _08012674
	ldr r0, [r5, #0xc]
	ldr r1, _08012670 @ =0x0001000C
	ands r0, r1
	cmp r0, #0
	bne _08012674
	adds r0, r6, #0
	b _0801267C
	.align 2, 0
_08012670: .4byte 0x0001000C
_08012674:
	adds r6, #1
	cmp r6, #0x3f
	ble _08012644
_0801267A:
	movs r0, #0
_0801267C:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

