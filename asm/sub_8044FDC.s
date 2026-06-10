	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set sub_80445A8, 0x080445A8 + 1
	.section .text.sub_8044FDC, "ax", %progbits
@ sub_8044FDC @ JP 0x08044FDC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8044FDC
	.thumb_func
sub_8044FDC:
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r2, r4, #0
	adds r2, #0x31
	ldrb r0, [r2]
	adds r0, #1
	movs r5, #0
	movs r1, #1
	ands r0, r1
	strb r0, [r2]
	adds r0, r4, #0
	bl sub_80445A8
	movs r0, #2
	bl BG_EnableSyncByMask
	adds r4, #0x3a
	strb r5, [r4]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

