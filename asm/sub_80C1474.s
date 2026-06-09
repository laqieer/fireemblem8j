	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.section .text.sub_80C1474, "ax", %progbits
@ sub_80C1474 @ JP 0x080C1474 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C1474
	.thumb_func
sub_80C1474:
	push {lr}
	movs r0, #1
	bl BG_EnableSyncByMask
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0

