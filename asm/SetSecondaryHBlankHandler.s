	.syntax unified
	.set sub_8001C78, 0x08001C78 + 1
	.section .text.SetSecondaryHBlankHandler, "ax", %progbits
@ SetSecondaryHBlankHandler @ JP 0x08001D3C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global SetSecondaryHBlankHandler
	.thumb_func
SetSecondaryHBlankHandler:
	push {lr}
	ldr r1, _08001D4C @ =0x030036E8
	str r0, [r1]
	bl sub_8001C78
	pop {r0}
	bx r0
	.align 2, 0
_08001D4C: .4byte 0x030036E8

