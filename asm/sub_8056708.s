	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set EfxTmCpyBG, 0x080733B8 + 1
	.set GetAnimPosition, 0x0805AF10 + 1
	.set sub_80733E8, 0x080733E8 + 1
	.set sub_80D6394, 0x080D6394 + 1
	.section .text.sub_8056708, "ax", %progbits
@ sub_8056708 @ JP 0x08056708 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8056708
	.thumb_func
sub_8056708:
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r4, r0, #0
	adds r0, r1, #0
	adds r5, r2, #0
	adds r6, r3, #0
	ldr r7, _08056740 @ =0x02019790
	adds r1, r7, #0
	bl sub_80D6394
	adds r0, r4, #0
	bl GetAnimPosition
	cmp r0, #0
	bne _08056748
	ldr r1, _08056744 @ =0x020234A8
	lsls r2, r5, #0x10
	lsrs r2, r2, #0x10
	lsls r3, r6, #0x10
	lsrs r3, r3, #0x10
	movs r0, #1
	str r0, [sp]
	adds r0, #0xff
	str r0, [sp, #4]
	adds r0, r7, #0
	bl sub_80733E8
	b _08056760
	.align 2, 0
_08056740: .4byte 0x02019790
_08056744: .4byte 0x020234A8
_08056748:
	ldr r1, _08056770 @ =0x020234A8
	lsls r2, r5, #0x10
	lsrs r2, r2, #0x10
	lsls r3, r6, #0x10
	lsrs r3, r3, #0x10
	movs r0, #1
	str r0, [sp]
	adds r0, #0xff
	str r0, [sp, #4]
	adds r0, r7, #0
	bl EfxTmCpyBG
_08056760:
	movs r0, #2
	bl BG_EnableSyncByMask
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08056770: .4byte 0x020234A8

