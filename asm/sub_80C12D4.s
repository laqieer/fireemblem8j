	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.section .text.sub_80C12D4, "ax", %progbits
@ sub_80C12D4 @ JP 0x080C12D4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C12D4
	.thumb_func
sub_80C12D4:
	push {lr}
	movs r0, #1
	bl BG_EnableSyncByMask
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0

