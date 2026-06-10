	.syntax unified
	.section .text.GetItemEncodedRange, "ax", %progbits
@ GetItemEncodedRange @ JP 0x08017448 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global GetItemEncodedRange
	.thumb_func
GetItemEncodedRange:
	movs r1, #0xff
	ands r0, r1
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _0801745C @ =0x0885E068
	adds r1, r1, r0
	ldrb r0, [r1, #0x19]
	bx lr
	.align 2, 0
_0801745C: .4byte 0x0885E068

