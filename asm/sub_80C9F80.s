	.syntax unified
	.set BG_SetPosition, 0x08001448 + 1
	.set SetBackgroundMapDataOffset, 0x08000FB4 + 1
	.set SetBackgroundScreenSize, 0x08000FFC + 1
	.set SetBackgroundTileDataOffset, 0x08000F8C + 1
	.section .text.sub_80C9F80, "ax", %progbits
@ sub_80C9F80 @ JP 0x080C9F80 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C9F80
	.thumb_func
sub_80C9F80:
	push {r4, r5, lr}
	ldr r1, _080C9FC8 @ =0x0300302C
	movs r0, #0
	strh r0, [r1]
	strh r0, [r1, #4]
	strh r0, [r1, #8]
	strh r0, [r1, #0xc]
	ldr r4, _080C9FCC @ =0x08B3B534
	movs r5, #0
_080C9F92:
	ldrh r1, [r4]
	adds r4, #2
	adds r0, r5, #0
	bl SetBackgroundTileDataOffset
	ldrh r1, [r4]
	adds r4, #2
	adds r0, r5, #0
	bl SetBackgroundMapDataOffset
	ldrh r1, [r4]
	adds r4, #2
	adds r0, r5, #0
	bl SetBackgroundScreenSize
	lsls r0, r5, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	adds r5, #1
	cmp r5, #3
	ble _080C9F92
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C9FC8: .4byte 0x0300302C
_080C9FCC: .4byte 0x08B3B534

