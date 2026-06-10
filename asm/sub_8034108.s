	.syntax unified
	.set BMapDispResume, 0x08030108 + 1
	.set ForceScreenToBlack, 0x08014268 + 1
	.set UnlockGame, 0x08015394 + 1
	.section .text.sub_8034108, "ax", %progbits
@ sub_8034108 @ JP 0x08034108 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8034108
	.thumb_func
sub_8034108:
	push {lr}
	bl UnlockGame
	bl BMapDispResume
	bl ForceScreenToBlack
	pop {r0}
	bx r0
	.align 2, 0

