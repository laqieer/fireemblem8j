	.syntax unified
	.set ChangeBgm, 0x08002938 + 1
	.section .text.sub_80B3760, "ax", %progbits
@ sub_80B3760 @ JP 0x080B3760 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B3760
	.thumb_func
sub_80B3760:
	push {lr}
	sub sp, #4
	adds r3, r0, #0
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0
	str r0, [sp]
	movs r2, #0
	bl ChangeBgm
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0

