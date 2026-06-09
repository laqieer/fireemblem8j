	.syntax unified
	.section .text.GetItemData, "ax", %progbits
@ GetItemData @ JP 0x08017558 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global GetItemData
	.thumb_func
GetItemData:
	adds r1, r0, #0
	lsls r0, r1, #3
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, _08017568 @ =0x0885E068
	adds r0, r0, r1
	bx lr
	.align 2, 0
_08017568: .4byte 0x0885E068

