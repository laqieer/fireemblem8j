	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set j_TmApplyTsa, 0x080DC0DC + 1
	.set sub_8013008, 0x08013008 + 1
	.section .text.sub_80C9B0C, "ax", %progbits
@ sub_80C9B0C @ JP 0x080C9B0C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C9B0C
	.thumb_func
sub_80C9B0C:
	push {r4, r5, lr}
	ldr r5, _080C9B48 @ =0x081F6C94
	lsls r4, r0, #1
	adds r4, r4, r0
	lsls r4, r4, #2
	adds r0, r4, r5
	ldr r0, [r0]
	ldr r1, _080C9B4C @ =0x06005000
	bl sub_8013008
	adds r5, #4
	adds r4, r4, r5
	ldr r0, [r4]
	ldr r4, _080C9B50 @ =0x02020188
	adds r1, r4, #0
	bl sub_8013008
	ldr r0, _080C9B54 @ =0x02022CA8
	movs r2, #0xca
	lsls r2, r2, #6
	adds r1, r4, #0
	bl j_TmApplyTsa
	movs r0, #1
	bl BG_EnableSyncByMask
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C9B48: .4byte 0x081F6C94
_080C9B4C: .4byte 0x06005000
_080C9B50: .4byte 0x02020188
_080C9B54: .4byte 0x02022CA8

