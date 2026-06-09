	.syntax unified
	.set sub_8030A50, 0x08030A50 + 1
	.section .text.WfxUpdate, "ax", %progbits
@ WfxUpdate @ JP 0x08030B5C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global WfxUpdate
	.thumb_func
WfxUpdate:
	push {lr}
	ldr r0, _08030B70 @ =0x0202BCEC
	ldrb r0, [r0, #0x15]
	cmp r0, #7
	bne _08030B6A
	bl sub_8030A50
_08030B6A:
	pop {r0}
	bx r0
	.align 2, 0
_08030B70: .4byte 0x0202BCEC

