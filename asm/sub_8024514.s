	.syntax unified
	.set GetUnit, 0x08019108 + 1
	.section .text.sub_8024514, "ax", %progbits
@ sub_8024514 @ JP 0x08024514 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8024514
	.thumb_func
sub_8024514:
	push {r4, r5, lr}
	adds r5, r1, #0
	ldr r4, _08024534 @ =0x0203A954
	ldrb r0, [r4, #0xc]
	bl GetUnit
	movs r0, #8
	strb r0, [r4, #0x11]
	ldrb r0, [r5]
	strb r0, [r4, #0x13]
	ldrb r0, [r5, #1]
	strb r0, [r4, #0x14]
	movs r0, #0x17
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08024534: .4byte 0x0203A954

