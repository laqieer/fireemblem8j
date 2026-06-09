	.syntax unified
	.set sub_8037ACC, 0x08037ACC + 1
	.section .text.sub_803A330, "ax", %progbits
@ sub_803A330 @ JP 0x0803A330 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_803A330
	.thumb_func
sub_803A330:
	push {lr}
	ldr r1, _0803A350 @ =0x03004DF0
	ldr r2, [r1]
	ldr r3, _0803A354 @ =0x0203AA90
	ldrb r0, [r3, #2]
	strb r0, [r2, #0x10]
	ldr r2, [r1]
	ldrb r0, [r3, #3]
	strb r0, [r2, #0x11]
	ldr r0, [r1]
	bl sub_8037ACC
	movs r0, #1
	pop {r1}
	bx r1
	.align 2, 0
_0803A350: .4byte 0x03004DF0
_0803A354: .4byte 0x0203AA90

