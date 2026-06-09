	.syntax unified
	.set sub_800904C, 0x0800904C + 1
	.section .text.sub_8087844, "ax", %progbits
@ sub_8087844 @ JP 0x08087844 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8087844
	.thumb_func
sub_8087844:
	push {lr}
	sub sp, #0x10
	movs r2, #1
	rsbs r2, r2, #0
	movs r1, #0x80
	lsls r1, r1, #2
	str r1, [sp]
	subs r1, #0xc0
	str r1, [sp, #4]
	str r1, [sp, #8]
	str r0, [sp, #0xc]
	adds r0, r2, #0
	movs r1, #2
	movs r2, #0x20
	movs r3, #4
	bl sub_800904C
	add sp, #0x10
	pop {r0}
	bx r0

