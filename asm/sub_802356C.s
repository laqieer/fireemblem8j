	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set EndFaceById, 0x08005660 + 1
	.set ForceMenuItemPanel, 0x0801E2E0 + 1
	.set GetUnitItemCount, 0x08017780 + 1
	.set SetFaceBlinkControlById, 0x0800635C + 1
	.set StartOrphanMenu, 0x0804F970 + 1
	.set j_TmCopyRect, 0x080DC0F4 + 1
	.set j_TmFillRect, 0x080DC0E4 + 1
	.set sub_8005544, 0x08005544 + 1
	.set sub_8018FCC, 0x08018FCC + 1
	.set sub_80234FC, 0x080234FC + 1
	.set sub_804F610, 0x0804F610 + 1
	.set sub_80503C0, 0x080503C0 + 1
	.section .text.sub_802356C, "ax", %progbits
@ sub_802356C @ JP 0x0802356C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_802356C
	.thumb_func
sub_802356C:
	push {r4, r5, r6, lr}
	sub sp, #4
	bl sub_80234FC
	ldr r6, _080235F4 @ =0x03004DF0
	ldr r0, [r6]
	bl GetUnitItemCount
	cmp r0, #0
	beq _0802360C
	ldr r0, _080235F8 @ =0x02003D2C
	ldr r5, _080235FC @ =0x02022CFE
	adds r1, r5, #0
	movs r2, #9
	movs r3, #0x13
	bl j_TmCopyRect
	ldr r0, _08023600 @ =0x0200422C
	ldr r4, _08023604 @ =0x020234FE
	adds r1, r4, #0
	movs r2, #9
	movs r3, #0x13
	bl j_TmCopyRect
	subs r5, #0x14
	adds r0, r5, #0
	movs r1, #0xe
	movs r2, #0xc
	movs r3, #0
	bl j_TmFillRect
	subs r4, #0x14
	adds r0, r4, #0
	movs r1, #0xd
	movs r2, #0xc
	movs r3, #0
	bl j_TmFillRect
	movs r0, #3
	bl BG_EnableSyncByMask
	ldr r0, _08023608 @ =0x085C5664
	bl StartOrphanMenu
	adds r4, r0, #0
	ldr r0, [r6]
	bl sub_8018FCC
	adds r1, r0, #0
	movs r0, #2
	str r0, [sp]
	movs r0, #0
	movs r2, #0xb0
	movs r3, #0xc
	bl sub_8005544
	movs r0, #0
	movs r1, #5
	bl SetFaceBlinkControlById
	ldr r1, [r6]
	adds r0, r4, #0
	movs r2, #0xf
	movs r3, #0xb
	bl ForceMenuItemPanel
	movs r0, #1
	b _0802362E
	.align 2, 0
_080235F4: .4byte 0x03004DF0
_080235F8: .4byte 0x02003D2C
_080235FC: .4byte 0x02022CFE
_08023600: .4byte 0x0200422C
_08023604: .4byte 0x020234FE
_08023608: .4byte 0x085C5664
_0802360C:
	bl sub_804F610
	movs r0, #0
	bl EndFaceById
	ldr r0, _08023638 @ =0x085C56D0
	ldr r2, _0802363C @ =0x0202BCAC
	movs r3, #0x1c
	ldrsh r1, [r2, r3]
	movs r3, #0xc
	ldrsh r2, [r2, r3]
	subs r1, r1, r2
	movs r2, #1
	movs r3, #0x16
	bl sub_80503C0
	movs r0, #0x1b
_0802362E:
	add sp, #4
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08023638: .4byte 0x085C56D0
_0802363C: .4byte 0x0202BCAC

