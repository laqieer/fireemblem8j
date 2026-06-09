	.syntax unified
	.set sub_8037B04, 0x08037B04 + 1
	.section .text.sub_803A358, "ax", %progbits
@ sub_803A358 @ JP 0x0803A358 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_803A358
	.thumb_func
sub_803A358:
	push {lr}
	ldr r1, _0803A378 @ =0x03004DF0
	ldr r2, [r1]
	ldr r3, _0803A37C @ =0x0203AA90
	ldrb r0, [r3, #2]
	strb r0, [r2, #0x10]
	ldr r2, [r1]
	ldrb r0, [r3, #3]
	strb r0, [r2, #0x11]
	ldr r0, [r1]
	bl sub_8037B04
	movs r0, #1
	pop {r1}
	bx r1
	.align 2, 0
_0803A378: .4byte 0x03004DF0
_0803A37C: .4byte 0x0203AA90

