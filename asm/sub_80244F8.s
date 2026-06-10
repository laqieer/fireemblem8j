	.syntax unified
	.set GetUnit, 0x08019108 + 1
	.section .text.sub_80244F8, "ax", %progbits
@ sub_80244F8 @ JP 0x080244F8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80244F8
	.thumb_func
sub_80244F8:
	push {r4, lr}
	ldr r4, _08024510 @ =0x0203A954
	ldrb r0, [r4, #0xc]
	bl GetUnit
	movs r0, #8
	strb r0, [r4, #0x11]
	movs r0, #0x17
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08024510: .4byte 0x0203A954

