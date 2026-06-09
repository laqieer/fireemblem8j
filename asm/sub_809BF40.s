	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set sub_809AEC0, 0x0809AEC0 + 1
	.section .text.sub_809BF40, "ax", %progbits
@ sub_809BF40 @ JP 0x0809BF40 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_809BF40
	.thumb_func
sub_809BF40:
	push {lr}
	bl sub_809AEC0
	movs r0, #1
	bl BG_EnableSyncByMask
	pop {r0}
	bx r0

