	.syntax unified
	.set GetUnit, 0x08019108 + 1
	.set sub_8085544, 0x08085544 + 1
	.section .text.sub_8080ADC, "ax", %progbits
@ sub_8080ADC @ JP 0x08080ADC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8080ADC
	.thumb_func
sub_8080ADC:
	push {r4, lr}
	ldr r4, _08080B00 @ =0x0203A954
	ldrb r0, [r4, #0xc]
	bl GetUnit
	ldr r1, [r0, #0xc]
	movs r2, #1
	orrs r1, r2
	str r1, [r0, #0xc]
	movs r0, #0x13
	ldrsb r0, [r4, r0]
	movs r1, #0x14
	ldrsb r1, [r4, r1]
	bl sub_8085544
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08080B00: .4byte 0x0203A954

