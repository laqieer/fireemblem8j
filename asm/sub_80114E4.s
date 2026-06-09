	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set j_TmFillRect, 0x080DC0E4 + 1
	.section .text.sub_80114E4, "ax", %progbits
@ sub_80114E4 @ JP 0x080114E4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80114E4
	.thumb_func
sub_80114E4:
	push {r4, r5, r6, r7, lr}
	adds r2, r0, #0
	adds r5, r2, #0
	adds r5, #0x38
	ldrb r0, [r5]
	adds r7, r2, #0
	adds r7, #0x37
	lsls r0, r0, #5
	ldrb r1, [r7]
	adds r0, r0, r1
	lsls r0, r0, #1
	ldr r1, _08011534 @ =0x02022CA8
	adds r0, r0, r1
	adds r6, r2, #0
	adds r6, #0x39
	ldrb r1, [r6]
	adds r4, r2, #0
	adds r4, #0x3a
	ldrb r2, [r4]
	movs r3, #0
	bl j_TmFillRect
	ldrb r0, [r5]
	lsls r0, r0, #5
	ldrb r7, [r7]
	adds r0, r0, r7
	lsls r0, r0, #1
	ldr r1, _08011538 @ =0x020234A8
	adds r0, r0, r1
	ldrb r1, [r6]
	ldrb r2, [r4]
	movs r3, #0
	bl j_TmFillRect
	movs r0, #3
	bl BG_EnableSyncByMask
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08011534: .4byte 0x02022CA8
_08011538: .4byte 0x020234A8

