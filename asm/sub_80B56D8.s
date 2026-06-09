	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set sub_804F0EC, 0x0804F0EC + 1
	.section .text.sub_80B56D8, "ax", %progbits
@ sub_80B56D8 @ JP 0x080B56D8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B56D8
	.thumb_func
sub_80B56D8:
	push {lr}
	sub sp, #4
	movs r0, #0
	str r0, [sp]
	movs r0, #3
	movs r1, #6
	movs r2, #0x18
	movs r3, #0xc
	bl sub_804F0EC
	movs r0, #3
	bl BG_EnableSyncByMask
	add sp, #4
	pop {r0}
	bx r0

