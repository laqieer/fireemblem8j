	.syntax unified
	.section .text.GetItemMaxRange, "ax", %progbits
@ GetItemMaxRange @ JP 0x0801742C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global GetItemMaxRange
	.thumb_func
GetItemMaxRange:
	movs r1, #0xff
	ands r0, r1
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _08017444 @ =0x0885E068
	adds r1, r1, r0
	ldrb r1, [r1, #0x19]
	movs r0, #0xf
	ands r0, r1
	bx lr
	.align 2, 0
_08017444: .4byte 0x0885E068

