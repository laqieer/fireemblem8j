	.syntax unified
	.set ChangeBgm, 0x08002938 + 1
	.section .text.sub_80B377C, "ax", %progbits
@ FadeOutPrepBgm @ JP 0x080B377C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global FadeOutPrepBgm
	.thumb_func
FadeOutPrepBgm:
	push {lr}
	sub sp, #4
	movs r2, #0x80
	lsls r2, r2, #1
	movs r1, #0
	str r1, [sp]
	adds r1, r2, #0
	movs r3, #0x20
	bl ChangeBgm
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0

