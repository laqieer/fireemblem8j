	.syntax unified
	.section .text.UnlockGame, "ax", %progbits
@ UnlockGame @ JP 0x08015394 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global UnlockGame
	.thumb_func
UnlockGame:
	ldr r1, _080153A0 @ =0x0202BCAC
	ldrb r0, [r1, #1]
	subs r0, #1
	strb r0, [r1, #1]
	bx lr
	.align 2, 0
_080153A0: .4byte 0x0202BCAC

