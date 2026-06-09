	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set j_TmApplyTsa, 0x080DC0DC + 1
	.set sub_8000D68, 0x08000D68 + 1
	.set sub_8001EE4, 0x08001EE4 + 1
	.set sub_8013008, 0x08013008 + 1
	.section .text.sub_80C94F0, "ax", %progbits
@ sub_80C94F0 @ JP 0x080C94F0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C94F0
	.thumb_func
sub_80C94F0:
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r0, _080C9550 @ =0x081F6C64
	ldr r5, [r0]
	ldr r0, [r5]
	ldr r1, _080C9554 @ =0x081F6C8C
	ldr r4, [r1]
	movs r2, #0xc0
	lsls r2, r2, #0x13
	adds r1, r4, r2
	bl sub_8013008
	ldr r0, [r5, #4]
	ldr r5, _080C9558 @ =0x02020188
	adds r1, r5, #0
	bl sub_8013008
	ldr r0, _080C955C @ =0x02022CA8
	lsrs r4, r4, #5
	movs r1, #0xe0
	lsls r1, r1, #7
	adds r4, r4, r1
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	adds r1, r5, #0
	adds r2, r4, #0
	bl j_TmApplyTsa
	movs r0, #1
	bl BG_EnableSyncByMask
	ldr r1, _080C9560 @ =0x020228A8
	movs r0, #0
	strh r0, [r1]
	ldr r0, _080C9564 @ =0x08AC73E8
	movs r1, #0xe0
	movs r2, #0x20
	bl sub_8000D68
	bl sub_8001EE4
	adds r6, #0x4a
	movs r0, #0xf0
	strh r0, [r6]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080C9550: .4byte 0x081F6C64
_080C9554: .4byte 0x081F6C8C
_080C9558: .4byte 0x02020188
_080C955C: .4byte 0x02022CA8
_080C9560: .4byte 0x020228A8
_080C9564: .4byte 0x08AC73E8

