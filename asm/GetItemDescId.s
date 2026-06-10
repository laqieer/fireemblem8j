	.syntax unified
	.section .text.GetItemDescId, "ax", %progbits
@ GetItemDescId @ JP 0x080172C0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global GetItemDescId
	.thumb_func
GetItemDescId:
	movs r1, #0xff
	ands r0, r1
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _080172D4 @ =0x0885E068
	adds r1, r1, r0
	ldrh r0, [r1, #2]
	bx lr
	.align 2, 0
_080172D4: .4byte 0x0885E068

