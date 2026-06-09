	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set BG_SetPosition, 0x08001448 + 1
	.set DisplayCGfx, 0x080BB17C + 1
	.set GetBackgroundTileDataOffset, 0x08000F3C + 1
	.set NextRN_N, 0x08000C58 + 1
	.set j_TmApplyTsa, 0x080DC0DC + 1
	.set sub_8000D68, 0x08000D68 + 1
	.set sub_8001EE4, 0x08001EE4 + 1
	.set sub_8013008, 0x08013008 + 1
	.section .text.sub_800E9E0, "ax", %progbits
@ sub_800E9E0 @ JP 0x0800E9E0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_800E9E0
	.thumb_func
sub_800E9E0:
	push {r4, r5, r6, lr}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	lsls r1, r1, #0x10
	lsrs r6, r1, #0x10
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	cmp r4, #5
	bhi _0800EACE
	lsls r0, r4, #2
	ldr r1, _0800EA24 @ =_0800EA28
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0800EA24: .4byte _0800EA28
_0800EA28: @ jump table
	.4byte _0800EA40 @ case 0
	.4byte _0800EA44 @ case 1
	.4byte _0800EAB0 @ case 2
	.4byte _0800EA40 @ case 3
	.4byte _0800EA40 @ case 4
	.4byte _0800EA40 @ case 5
_0800EA40:
	movs r0, #6
	b _0800EAD0
_0800EA44:
	cmp r6, #0x51
	bne _0800EA52
	movs r0, #0x4f
	bl NextRN_N
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
_0800EA52:
	ldr r5, _0800EAA4 @ =0x089CD958
	lsls r4, r6, #1
	adds r4, r4, r6
	lsls r4, r4, #2
	adds r0, r4, r5
	ldr r6, [r0]
	movs r0, #3
	bl GetBackgroundTileDataOffset
	adds r1, r0, #0
	movs r0, #0xc0
	lsls r0, r0, #0x13
	adds r1, r1, r0
	adds r0, r6, #0
	bl sub_8013008
	ldr r0, _0800EAA8 @ =0x020244A8
	adds r1, r5, #4
	adds r1, r4, r1
	ldr r1, [r1]
	movs r2, #0x80
	lsls r2, r2, #8
	bl j_TmApplyTsa
	adds r5, #8
	adds r4, r4, r5
	ldr r0, [r4]
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r2, #0
	bl sub_8000D68
	movs r0, #8
	bl BG_EnableSyncByMask
	bl sub_8001EE4
	ldr r1, _0800EAAC @ =0x020228A8
	movs r0, #0
	strh r0, [r1]
	b _0800EACE
	.align 2, 0
_0800EAA4: .4byte 0x089CD958
_0800EAA8: .4byte 0x020244A8
_0800EAAC: .4byte 0x020228A8
_0800EAB0:
	movs r0, #3
	bl GetBackgroundTileDataOffset
	adds r1, r0, #0
	ldr r0, _0800EAD8 @ =0x020244A8
	str r6, [sp]
	movs r2, #8
	movs r3, #8
	bl DisplayCGfx
	movs r0, #8
	bl BG_EnableSyncByMask
	bl sub_8001EE4
_0800EACE:
	movs r0, #2
_0800EAD0:
	add sp, #4
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0800EAD8: .4byte 0x020244A8

