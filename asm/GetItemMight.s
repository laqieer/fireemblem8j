	.syntax unified
	.section .text.GetItemMight, "ax", %progbits
@ GetItemMight @ JP 0x08017384 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global GetItemMight
	.thumb_func
GetItemMight:
	movs r1, #0xff
	ands r0, r1
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _08017398 @ =0x0885E068
	adds r1, r1, r0
	ldrb r0, [r1, #0x15]
	bx lr
	.align 2, 0
_08017398: .4byte 0x0885E068

