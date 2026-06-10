	.syntax unified
	.set sub_8031F58, 0x08031F58 + 1
	.section .text.sub_803A408, "ax", %progbits
@ sub_803A408 @ JP 0x0803A408 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_803A408
	.thumb_func
sub_803A408:
	push {r4, lr}
	ldr r4, _0803A434 @ =0x03004DF0
	ldr r2, [r4]
	ldr r3, _0803A438 @ =0x0203AA90
	ldrb r1, [r3, #2]
	strb r1, [r2, #0x10]
	ldr r2, [r4]
	ldrb r1, [r3, #3]
	strb r1, [r2, #0x11]
	ldr r2, _0803A43C @ =0x0203A954
	ldrb r1, [r3, #8]
	strb r1, [r2, #0x13]
	ldrb r1, [r3, #9]
	strb r1, [r2, #0x14]
	movs r1, #0x15
	strb r1, [r2, #0x11]
	bl sub_8031F58
	movs r0, #1
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0803A434: .4byte 0x03004DF0
_0803A438: .4byte 0x0203AA90
_0803A43C: .4byte 0x0203A954

