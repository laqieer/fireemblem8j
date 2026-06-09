	.syntax unified
	.section .text.GetItemHit, "ax", %progbits
@ GetItemHit @ JP 0x0801739C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global GetItemHit
	.thumb_func
GetItemHit:
	movs r1, #0xff
	ands r0, r1
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _080173B0 @ =0x0885E068
	adds r1, r1, r0
	ldrb r0, [r1, #0x16]
	bx lr
	.align 2, 0
_080173B0: .4byte 0x0885E068

