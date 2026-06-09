	.syntax unified
	.section .text.LockGame, "ax", %progbits
@ LockGame @ JP 0x08015384 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global LockGame
	.thumb_func
LockGame:
	ldr r1, _08015390 @ =0x0202BCAC
	ldrb r0, [r1, #1]
	adds r0, #1
	strb r0, [r1, #1]
	bx lr
	.align 2, 0
_08015390: .4byte 0x0202BCAC

