	.syntax unified
	.section .text.GetUnit, "ax", %progbits
@ GetUnit @ JP 0x08019108 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global GetUnit
	.thumb_func
GetUnit:
	ldr r2, _08019118 @ =0x085C2A50
	movs r1, #0xff
	ands r1, r0
	lsls r1, r1, #2
	adds r1, r1, r2
	ldr r0, [r1]
	bx lr
	.align 2, 0
_08019118: .4byte 0x085C2A50

