	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set DisplayCGfx, 0x080BB17C + 1
	.set GetBackgroundTileDataOffset, 0x08000F3C + 1
	.set NextRN_N, 0x08000C58 + 1
	.set j_TmApplyTsa, 0x080DC0DC + 1
	.set sub_8000D68, 0x08000D68 + 1
	.set sub_8001EE4, 0x08001EE4 + 1
	.set sub_8013008, 0x08013008 + 1
	.section .text.sub_800EF64, "ax", %progbits
@ sub_800EF64 @ JP 0x0800EF64 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_800EF64
	.thumb_func
sub_800EF64:
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	cmp r0, #5
	bhi _0800F038
	lsls r0, r0, #2
	ldr r1, _0800EF7C @ =_0800EF80
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0800EF7C: .4byte _0800EF80
_0800EF80: @ jump table
	.4byte _0800EF98 @ case 0
	.4byte _0800EF9A @ case 1
	.4byte _0800F018 @ case 2
	.4byte _0800EF98 @ case 3
	.4byte _0800EF98 @ case 4
	.4byte _0800EF98 @ case 5
_0800EF98:
	b _0800EF98
_0800EF9A:
	ldrh r0, [r6, #0x2c]
	cmp r0, #0x51
	bne _0800EFA8
	movs r0, #0x4f
	bl NextRN_N
	strh r0, [r6, #0x2c]
_0800EFA8:
	ldr r5, _0800F00C @ =0x089CD958
	ldrh r1, [r6, #0x2c]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r4, [r0]
	movs r0, #3
	bl GetBackgroundTileDataOffset
	adds r1, r0, #0
	movs r0, #0xc0
	lsls r0, r0, #0x13
	adds r1, r1, r0
	adds r0, r4, #0
	bl sub_8013008
	ldr r0, _0800F010 @ =0x020244A8
	ldrh r2, [r6, #0x2c]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #2
	adds r2, r5, #4
	adds r1, r1, r2
	ldr r1, [r1]
	movs r2, #0x80
	lsls r2, r2, #8
	bl j_TmApplyTsa
	ldrh r1, [r6, #0x2c]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r5, #8
	adds r0, r0, r5
	ldr r0, [r0]
	movs r1, #0x80
	lsls r1, r1, #1
	movs r2, #0xc0
	bl sub_8000D68
	movs r0, #8
	bl BG_EnableSyncByMask
	bl sub_8001EE4
	ldr r1, _0800F014 @ =0x020228A8
	movs r0, #0
	strh r0, [r1]
	b _0800F038
	.align 2, 0
_0800F00C: .4byte 0x089CD958
_0800F010: .4byte 0x020244A8
_0800F014: .4byte 0x020228A8
_0800F018:
	movs r0, #3
	bl GetBackgroundTileDataOffset
	adds r1, r0, #0
	ldr r0, _0800F060 @ =0x020244A8
	ldrh r2, [r6, #0x2c]
	str r2, [sp]
	movs r2, #8
	movs r3, #6
	bl DisplayCGfx
	movs r0, #8
	bl BG_EnableSyncByMask
	bl sub_8001EE4
_0800F038:
	ldr r2, _0800F064 @ =0x03003020
	ldrb r1, [r2, #1]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0800F060: .4byte 0x020244A8
_0800F064: .4byte 0x03003020

