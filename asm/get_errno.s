	.syntax unified
	.section .text.get_errno, "ax", %progbits
@ get_errno @ JP 0x080DA4A4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global get_errno
	.thumb_func
get_errno:
	push {r4, lr}
	movs r3, #0x13
	movs r4, #0
	adds r0, r3, #0
	adds r1, r4, #0
	svc #0xab
	adds r2, r0, #0
	adds r0, r2, #0
	pop {r4, pc}
	.align 2, 0

