	.syntax unified
	.section .text.GetItemUseEffect, "ax", %progbits
@ GetItemUseEffect @ JP 0x080174E4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global GetItemUseEffect
	.thumb_func
GetItemUseEffect:
	movs r1, #0xff
	ands r0, r1
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _080174F8 @ =0x0885E068
	adds r1, r1, r0
	ldrb r0, [r1, #0x1e]
	bx lr
	.align 2, 0
_080174F8: .4byte 0x0885E068

