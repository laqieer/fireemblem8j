	.syntax unified
	.section .text.GetItemMinRange, "ax", %progbits
@ GetItemMinRange @ JP 0x08017414 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global GetItemMinRange
	.thumb_func
GetItemMinRange:
	movs r1, #0xff
	ands r0, r1
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _08017428 @ =0x0885E068
	adds r1, r1, r0
	ldrb r0, [r1, #0x19]
	lsrs r0, r0, #4
	bx lr
	.align 2, 0
_08017428: .4byte 0x0885E068

