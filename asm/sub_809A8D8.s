	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set j_TmFillRect, 0x080DC0E4 + 1
	.set sub_809A7C4, 0x0809A7C4 + 1
	.section .text.sub_809A8D8, "ax", %progbits
@ sub_809A8D8 @ JP 0x0809A8D8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_809A8D8
	.thumb_func
sub_809A8D8:
	push {lr}
	ldr r0, _0809A8F4 @ =0x0202310E
	movs r1, #0xa
	movs r2, #1
	movs r3, #0
	bl j_TmFillRect
	bl sub_809A7C4
	movs r0, #1
	bl BG_EnableSyncByMask
	pop {r0}
	bx r0
	.align 2, 0
_0809A8F4: .4byte 0x0202310E

