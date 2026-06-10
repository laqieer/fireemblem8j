	.syntax unified
	.section .text.GetItemAttributes, "ax", %progbits
@ GetItemAttributes @ JP 0x08017314 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global GetItemAttributes
	.thumb_func
GetItemAttributes:
	movs r1, #0xff
	ands r0, r1
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _08017328 @ =0x0885E068
	adds r1, r1, r0
	ldr r0, [r1, #8]
	bx lr
	.align 2, 0
_08017328: .4byte 0x0885E068

