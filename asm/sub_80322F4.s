	.syntax unified
	.set GetUnit, 0x08019108 + 1
	.set sub_8086288, 0x08086288 + 1
	.section .text.sub_80322F4, "ax", %progbits
@ sub_80322F4 @ JP 0x080322F4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80322F4
	.thumb_func
sub_80322F4:
	push {r4, r5, lr}
	ldr r4, _0803231C @ =0x0203A954
	ldrb r0, [r4, #0xc]
	bl GetUnit
	ldr r0, [r0]
	ldrb r5, [r0, #4]
	ldrb r0, [r4, #0xd]
	bl GetUnit
	ldr r0, [r0]
	ldrb r1, [r0, #4]
	adds r0, r5, #0
	bl sub_8086288
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0803231C: .4byte 0x0203A954

