	.syntax unified
	.set GetUnit, 0x08019108 + 1
	.set sub_8086288, 0x08086288 + 1
	.section .text.sub_803A2EC, "ax", %progbits
@ sub_803A2EC @ JP 0x0803A2EC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_803A2EC
	.thumb_func
sub_803A2EC:
	push {r4, r5, lr}
	ldr r2, _0803A328 @ =0x03004DF0
	ldr r1, [r2]
	ldr r5, _0803A32C @ =0x0203AA90
	ldrb r0, [r5, #2]
	strb r0, [r1, #0x10]
	ldr r1, [r2]
	ldrb r0, [r5, #3]
	strb r0, [r1, #0x11]
	ldrb r0, [r5, #6]
	cmp r0, #0
	bne _0803A31E
	ldrb r0, [r5, #7]
	bl GetUnit
	ldr r0, [r0]
	ldrb r4, [r0, #4]
	ldrb r0, [r5, #8]
	bl GetUnit
	ldr r0, [r0]
	ldrb r1, [r0, #4]
	adds r0, r4, #0
	bl sub_8086288
_0803A31E:
	movs r0, #1
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0803A328: .4byte 0x03004DF0
_0803A32C: .4byte 0x0203AA90

