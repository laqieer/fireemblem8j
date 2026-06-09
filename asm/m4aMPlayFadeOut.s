	.syntax unified
	.set MPlayFadeOut, 0x080D4E50 + 1
	.section .text.m4aMPlayFadeOut, "ax", %progbits
@ m4aMPlayFadeOut @ JP 0x080D508C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global m4aMPlayFadeOut
	.thumb_func
m4aMPlayFadeOut:
	push {lr}
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl MPlayFadeOut
	pop {r0}
	bx r0
	.align 2, 0

