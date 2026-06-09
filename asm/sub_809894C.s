	.syntax unified
	.set ChangeBgm, 0x08002938 + 1
	.section .text.sub_809894C, "ax", %progbits
@ sub_809894C @ JP 0x0809894C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_809894C
	.thumb_func
sub_809894C:
	push {lr}
	sub sp, #4
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0
	str r0, [sp]
	movs r2, #0
	movs r3, #0x20
	bl ChangeBgm
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0

