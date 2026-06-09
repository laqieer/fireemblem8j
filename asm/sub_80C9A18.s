	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set j_TmApplyTsa, 0x080DC0DC + 1
	.set sub_8013008, 0x08013008 + 1
	.section .text.sub_80C9A18, "ax", %progbits
@ sub_80C9A18 @ JP 0x080C9A18 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C9A18
	.thumb_func
sub_80C9A18:
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r4, _080C9A74 @ =0x081F6C94
	adds r6, r5, #0
	adds r6, #0x29
	movs r1, #0
	ldrsb r1, [r6, r1]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r0, [r0]
	ldr r1, _080C9A78 @ =0x06001000
	bl sub_8013008
	movs r1, #0
	ldrsb r1, [r6, r1]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r4, #4
	adds r0, r0, r4
	ldr r0, [r0]
	ldr r4, _080C9A7C @ =0x02020188
	adds r1, r4, #0
	bl sub_8013008
	ldr r0, _080C9A80 @ =0x02022CA8
	movs r2, #0xc2
	lsls r2, r2, #6
	adds r1, r4, #0
	bl j_TmApplyTsa
	ldr r2, _080C9A84 @ =0x03003020
	ldrb r0, [r2, #1]
	movs r1, #1
	orrs r0, r1
	strb r0, [r2, #1]
	movs r0, #1
	bl BG_EnableSyncByMask
	movs r0, #0
	strh r0, [r5, #0x2c]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080C9A74: .4byte 0x081F6C94
_080C9A78: .4byte 0x06001000
_080C9A7C: .4byte 0x02020188
_080C9A80: .4byte 0x02022CA8
_080C9A84: .4byte 0x03003020

