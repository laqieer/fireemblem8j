	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set GetCgTextFlags, 0x08090D10 + 1
	.set j_TmFillRect, 0x080DC0E4 + 1
	.set sub_8001BC0, 0x08001BC0 + 1
	.section .text.sub_8091358, "ax", %progbits
@ sub_8091358 @ JP 0x08091358 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8091358
	.thumb_func
sub_8091358:
	push {r4, lr}
	adds r4, r0, #0
	bl GetCgTextFlags
	adds r1, r0, #0
	movs r0, #0xc0
	lsls r0, r0, #8
	ands r0, r1
	lsrs r0, r0, #0xe
	bl sub_8001BC0
	adds r1, r4, #0
	adds r1, #0x58
	ldrb r1, [r1]
	subs r1, #1
	lsls r1, r1, #6
	adds r0, r0, r1
	adds r4, #0x5c
	movs r2, #0
	ldrsb r2, [r4, r2]
	adds r2, #1
	movs r1, #0x1f
	movs r3, #0
	bl j_TmFillRect
	movs r0, #0xf
	bl BG_EnableSyncByMask
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

