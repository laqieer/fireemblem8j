	.syntax unified
	.set sub_800904C, 0x0800904C + 1
	.section .text.sub_808781C, "ax", %progbits
@ sub_808781C @ JP 0x0808781C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_808781C
	.thumb_func
sub_808781C:
	push {lr}
	sub sp, #0x10
	movs r2, #1
	rsbs r2, r2, #0
	movs r1, #0xc0
	lsls r1, r1, #1
	str r1, [sp]
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
	.align 2, 0

