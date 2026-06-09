	.syntax unified
	.set sub_8001C78, 0x08001C78 + 1
	.section .text.SetPrimaryHBlankHandler, "ax", %progbits
@ SetPrimaryHBlankHandler @ JP 0x08001D28 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global SetPrimaryHBlankHandler
	.thumb_func
SetPrimaryHBlankHandler:
	push {lr}
	ldr r1, _08001D38 @ =0x030030D4
	str r0, [r1]
	bl sub_8001C78
	pop {r0}
	bx r0
	.align 2, 0
_08001D38: .4byte 0x030030D4

