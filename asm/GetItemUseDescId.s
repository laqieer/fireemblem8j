	.syntax unified
	.section .text.GetItemUseDescId, "ax", %progbits
@ GetItemUseDescId @ JP 0x080172D8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global GetItemUseDescId
	.thumb_func
GetItemUseDescId:
	movs r1, #0xff
	ands r0, r1
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _080172EC @ =0x0885E068
	adds r1, r1, r0
	ldrh r0, [r1, #4]
	bx lr
	.align 2, 0
_080172EC: .4byte 0x0885E068

