	.syntax unified
	.set GetUnit, 0x08019108 + 1
	.section .text.sub_8080B04, "ax", %progbits
@ sub_8080B04 @ JP 0x08080B04 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8080B04
	.thumb_func
sub_8080B04:
	push {lr}
	ldr r0, _08080B1C @ =0x0203A954
	ldrb r0, [r0, #0xc]
	bl GetUnit
	ldr r1, [r0, #0xc]
	movs r2, #2
	rsbs r2, r2, #0
	ands r1, r2
	str r1, [r0, #0xc]
	pop {r0}
	bx r0
	.align 2, 0
_08080B1C: .4byte 0x0203A954

