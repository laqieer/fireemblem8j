	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set j_TmFillRect, 0x080DC0E4 + 1
	.section .text.sub_809EC7C, "ax", %progbits
@ sub_809EC7C @ JP 0x0809EC7C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_809EC7C
	.thumb_func
sub_809EC7C:
	push {lr}
	ldr r0, _0809EC94 @ =0x0202400C
	movs r1, #0xc
	movs r2, #4
	movs r3, #0
	bl j_TmFillRect
	movs r0, #4
	bl BG_EnableSyncByMask
	pop {r0}
	bx r0
	.align 2, 0
_0809EC94: .4byte 0x0202400C

