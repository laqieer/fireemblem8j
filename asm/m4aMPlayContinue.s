	.syntax unified
	.set MPlayContinue, 0x080D4E34 + 1
	.section .text.m4aMPlayContinue, "ax", %progbits
@ m4aMPlayContinue @ JP 0x080D5054 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global m4aMPlayContinue
	.thumb_func
m4aMPlayContinue:
	push {lr}
	bl MPlayContinue
	pop {r0}
	bx r0
	.align 2, 0

