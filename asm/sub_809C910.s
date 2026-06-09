	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set j_TmFillRect, 0x080DC0E4 + 1
	.section .text.sub_809C910, "ax", %progbits
@ sub_809C910 @ JP 0x0809C910 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_809C910
	.thumb_func
sub_809C910:
	push {lr}
	lsls r0, r0, #1
	movs r1, #0x1f
	ands r0, r1
	lsls r0, r0, #6
	ldr r1, _0809C934 @ =0x02023CC8
	adds r0, r0, r1
	movs r1, #0xd
	movs r2, #1
	movs r3, #0
	bl j_TmFillRect
	movs r0, #4
	bl BG_EnableSyncByMask
	pop {r0}
	bx r0
	.align 2, 0
_0809C934: .4byte 0x02023CC8

