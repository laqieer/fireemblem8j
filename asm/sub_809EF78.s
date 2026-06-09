	.syntax unified
	.set ChangeBgm, 0x08002938 + 1
	.section .text.sub_809EF78, "ax", %progbits
@ sub_809EF78 @ JP 0x0809EF78 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_809EF78
	.thumb_func
sub_809EF78:
	push {lr}
	sub sp, #4
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0
	str r0, [sp]
	movs r2, #0
	movs r3, #0x10
	bl ChangeBgm
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0

