	.syntax unified
	.section .text.GetItemCostPerUse, "ax", %progbits
@ GetItemCostPerUse @ JP 0x080174FC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global GetItemCostPerUse
	.thumb_func
GetItemCostPerUse:
	movs r1, #0xff
	ands r0, r1
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _08017510 @ =0x0885E068
	adds r1, r1, r0
	ldrh r0, [r1, #0x1a]
	bx lr
	.align 2, 0
_08017510: .4byte 0x0885E068

