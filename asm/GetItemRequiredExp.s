	.syntax unified
	.section .text.GetItemRequiredExp, "ax", %progbits
@ GetItemRequiredExp @ JP 0x08017460 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global GetItemRequiredExp
	.thumb_func
GetItemRequiredExp:
	movs r1, #0xff
	ands r0, r1
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _08017474 @ =0x0885E068
	adds r1, r1, r0
	ldrb r0, [r1, #0x1c]
	bx lr
	.align 2, 0
_08017474: .4byte 0x0885E068

