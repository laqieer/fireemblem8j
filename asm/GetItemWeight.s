	.syntax unified
	.section .text.GetItemWeight, "ax", %progbits
@ GetItemWeight @ JP 0x080173B4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global GetItemWeight
	.thumb_func
GetItemWeight:
	movs r1, #0xff
	ands r0, r1
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _080173C8 @ =0x0885E068
	adds r1, r1, r0
	ldrb r0, [r1, #0x17]
	bx lr
	.align 2, 0
_080173C8: .4byte 0x0885E068

