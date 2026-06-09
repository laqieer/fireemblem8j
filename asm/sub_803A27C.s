	.syntax unified
	.set sub_802FB98, 0x0802FB98 + 1
	.section .text.sub_803A27C, "ax", %progbits
@ sub_803A27C @ JP 0x0803A27C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_803A27C
	.thumb_func
sub_803A27C:
	push {r4, lr}
	ldr r4, _0803A2A8 @ =0x03004DF0
	ldr r2, [r4]
	ldr r3, _0803A2AC @ =0x0203AA90
	ldrb r1, [r3, #2]
	strb r1, [r2, #0x10]
	ldr r2, [r4]
	ldrb r1, [r3, #3]
	strb r1, [r2, #0x11]
	ldr r2, _0803A2B0 @ =0x0203A954
	movs r1, #3
	strb r1, [r2, #0x11]
	ldrb r1, [r3, #6]
	strb r1, [r2, #0xd]
	ldrb r1, [r3, #7]
	strb r1, [r2, #0x12]
	bl sub_802FB98
	movs r0, #1
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0803A2A8: .4byte 0x03004DF0
_0803A2AC: .4byte 0x0203AA90
_0803A2B0: .4byte 0x0203A954

