	.syntax unified
	.set SoundMain, 0x080D41C0 + 1
	.section .text.m4aSoundMain, "ax", %progbits
@ m4aSoundMain @ JP 0x080D4EE8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global m4aSoundMain
	.thumb_func
m4aSoundMain:
	push {lr}
	bl SoundMain
	pop {r0}
	bx r0
	.align 2, 0

