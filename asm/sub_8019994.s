	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set BG_SetPosition, 0x08001448 + 1
	.set DisplayBmTile, 0x080197F0 + 1
	.set SetBackgroundTileDataOffset, 0x08000F8C + 1
	.section .text.sub_8019994, "ax", %progbits
@ sub_8019994 @ JP 0x08019994 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8019994
	.thumb_func
sub_8019994:
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	movs r1, #0x80
	lsls r1, r1, #8
	movs r0, #2
	bl SetBackgroundTileDataOffset
	ldr r1, _080199F8 @ =0x0202BCAC
	ldrh r0, [r1, #0xc]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x14
	strh r0, [r1, #0x24]
	ldrh r0, [r1, #0xe]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x14
	strh r0, [r1, #0x26]
	movs r5, #9
	adds r7, r1, #0
_080199B8:
	movs r4, #0xe
	subs r6, r5, #1
_080199BC:
	movs r0, #0x24
	ldrsh r3, [r7, r0]
	adds r3, r3, r4
	movs r1, #0x26
	ldrsh r0, [r7, r1]
	adds r0, r0, r5
	str r0, [sp]
	ldr r0, _080199FC @ =0x02023CA8
	adds r1, r4, #0
	adds r2, r5, #0
	bl DisplayBmTile
	subs r4, #1
	cmp r4, #0
	bge _080199BC
	adds r5, r6, #0
	cmp r5, #0
	bge _080199B8
	movs r0, #4
	bl BG_EnableSyncByMask
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080199F8: .4byte 0x0202BCAC
_080199FC: .4byte 0x02023CA8

