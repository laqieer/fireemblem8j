	.syntax unified
	.set GetUnit, 0x08019108 + 1
	.section .text.sub_801DC88, "ax", %progbits
@ sub_801DC88 @ JP 0x0801DC88 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_801DC88
	.thumb_func
sub_801DC88:
	push {lr}
	ldr r0, _0801DC9C @ =0x0203A954
	ldrb r0, [r0, #0xc]
	bl GetUnit
	ldr r1, _0801DCA0 @ =0x03004DF0
	str r0, [r1]
	pop {r0}
	bx r0
	.align 2, 0
_0801DC9C: .4byte 0x0203A954
_0801DCA0: .4byte 0x03004DF0

