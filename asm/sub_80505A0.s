	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.section .text.sub_80505A0, "ax", %progbits
@ sub_80505A0 @ JP 0x080505A0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80505A0
	.thumb_func
sub_80505A0:
	push {lr}
	adds r0, #0x64
	ldrb r3, [r0]
	lsls r1, r3, #0x1e
	lsrs r1, r1, #0x1e
	movs r2, #1
	adds r0, r2, #0
	lsls r0, r1
	lsls r3, r3, #0x1c
	lsrs r3, r3, #0x1e
	lsls r2, r3
	adds r0, r0, r2
	bl BG_EnableSyncByMask
	pop {r0}
	bx r0

