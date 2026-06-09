	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set j_TmApplyTsa, 0x080DC0DC + 1
	.set sub_8013008, 0x08013008 + 1
	.section .text.sub_80C9A88, "ax", %progbits
@ sub_80C9A88 @ JP 0x080C9A88 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C9A88
	.thumb_func
sub_80C9A88:
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r4, _080C9AF0 @ =0x081F6C94
	adds r6, r5, #0
	adds r6, #0x29
	movs r1, #0
	ldrsb r1, [r6, r1]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r0, [r0]
	ldr r1, _080C9AF4 @ =0x06001000
	bl sub_8013008
	movs r1, #0
	ldrsb r1, [r6, r1]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r4, #4
	adds r0, r0, r4
	ldr r0, [r0]
	ldr r4, _080C9AF8 @ =0x02020188
	adds r1, r4, #0
	bl sub_8013008
	ldr r0, _080C9AFC @ =0x02022CA8
	movs r2, #0xc2
	lsls r2, r2, #6
	adds r1, r4, #0
	bl j_TmApplyTsa
	ldr r0, _080C9B00 @ =0x020234A8
	ldr r2, _080C9B04 @ =0x0000E080
	adds r1, r4, #0
	bl j_TmApplyTsa
	ldr r2, _080C9B08 @ =0x03003020
	ldrb r0, [r2, #1]
	movs r1, #1
	orrs r0, r1
	strb r0, [r2, #1]
	movs r0, #3
	bl BG_EnableSyncByMask
	movs r0, #0
	strh r0, [r5, #0x2c]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080C9AF0: .4byte 0x081F6C94
_080C9AF4: .4byte 0x06001000
_080C9AF8: .4byte 0x02020188
_080C9AFC: .4byte 0x02022CA8
_080C9B00: .4byte 0x020234A8
_080C9B04: .4byte 0x0000E080
_080C9B08: .4byte 0x03003020

