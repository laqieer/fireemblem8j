	.syntax unified
	.set sub_80A8168, 0x080A8168 + 1
	.section .text.sub_8087F04, "ax", %progbits
@ sub_8087F04 @ JP 0x08087F04 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8087F04
	.thumb_func
sub_8087F04:
	push {lr}
	movs r1, #0x80
	lsls r1, r1, #1
	adds r0, r1, #0
	movs r2, #3
	bl sub_80A8168
	pop {r0}
	bx r0
	.align 2, 0

