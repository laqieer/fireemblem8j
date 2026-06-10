	.syntax unified
	.section .text.GetItemAwardedExp, "ax", %progbits
@ GetItemAwardedExp @ JP 0x08017540 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global GetItemAwardedExp
	.thumb_func
GetItemAwardedExp:
	movs r1, #0xff
	ands r0, r1
	lsls r1, r0, #3
	adds r1, r1, r0
	lsls r1, r1, #2
	ldr r0, _08017554 @ =0x0885E068
	adds r1, r1, r0
	adds r1, #0x20
	ldrb r0, [r1]
	bx lr
	.align 2, 0
_08017554: .4byte 0x0885E068

