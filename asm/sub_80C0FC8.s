	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set BG_GetPriority, 0x08001DDC + 1
	.set BG_SetPriority, 0x08001DBC + 1
	.section .text.sub_80C0FC8, "ax", %progbits
@ sub_80C0FC8 @ JP 0x080C0FC8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C0FC8
	.thumb_func
sub_80C0FC8:
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r6, r4, #0
	adds r6, #0x35
	ldrb r5, [r6]
	movs r0, #3
	bl BG_GetPriority
	adds r1, r0, #0
	adds r0, r5, #0
	bl BG_SetPriority
	movs r1, #1
	adds r0, r1, #0
	ldrb r6, [r6]
	lsls r0, r6
	adds r4, #0x34
	ldrb r4, [r4]
	lsls r1, r4
	orrs r0, r1
	bl BG_EnableSyncByMask
	movs r0, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1

