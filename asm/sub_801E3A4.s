	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set CanUnitUseWeapon, 0x0801631C + 1
	.set DrawIcon, 0x08003608 + 1
	.set GetItemType, 0x080172F0 + 1
	.set GetItemUseDescId, 0x080172D8 + 1
	.set Proc_Find, 0x08002DEC + 1
	.set PutText, 0x08003DA0 + 1
	.set sub_8001BC0, 0x08001BC0 + 1
	.set sub_8003CF8, 0x08003CF8 + 1
	.set sub_8003F10, 0x08003F10 + 1
	.set sub_80043B8, 0x080043B8 + 1
	.set sub_80043DC, 0x080043DC + 1
	.set sub_8009FA8, 0x08009FA8 + 1
	.set sub_802A38C, 0x0802A38C + 1
	.set sub_804F0EC, 0x0804F0EC + 1
	.section .text.sub_801E3A4, "ax", %progbits
@ sub_801E3A4 @ JP 0x0801E3A4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_801E3A4
	.thumb_func
sub_801E3A4:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	adds r5, r0, #0
	ldr r0, _0801E420 @ =0x085C3308
	bl Proc_Find
	adds r7, r0, #0
	movs r0, #0
	bl sub_8001BC0
	adds r4, r7, #0
	adds r4, #0x30
	ldrb r1, [r4]
	lsls r1, r1, #1
	adds r0, r0, r1
	movs r1, #0x31
	adds r1, r1, r7
	mov r8, r1
	ldrb r1, [r1]
	lsls r1, r1, #6
	adds r0, r0, r1
	str r0, [sp, #4]
	adds r6, r7, #0
	adds r6, #0x34
	ldr r2, [r7, #0x2c]
	mov sb, r2
	adds r0, r7, #0
	adds r0, #0x32
	ldrb r0, [r0]
	str r0, [sp, #8]
	adds r0, r6, #0
	bl sub_8003CF8
	adds r0, r7, #0
	adds r0, #0x3c
	bl sub_8003CF8
	adds r0, r7, #0
	adds r0, #0x44
	bl sub_8003CF8
	ldrb r0, [r4]
	mov r2, r8
	ldrb r1, [r2]
	movs r2, #0
	str r2, [sp]
	movs r2, #0xe
	movs r3, #8
	bl sub_804F0EC
	cmp r5, #0
	blt _0801E43C
	cmp r5, #4
	ble _0801E424
	cmp r5, #5
	beq _0801E430
	b _0801E43C
	.align 2, 0
_0801E420: .4byte 0x085C3308
_0801E424:
	lsls r1, r5, #1
	mov r0, sb
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	b _0801E440
_0801E430:
	ldr r0, _0801E438 @ =0x0202BCAC
	ldrh r4, [r0, #0x2c]
	b _0801E440
	.align 2, 0
_0801E438: .4byte 0x0202BCAC
_0801E43C:
	adds r4, r5, #0
	movs r5, #8
_0801E440:
	adds r0, r4, #0
	bl GetItemType
	cmp r0, #9
	beq _0801E45C
	cmp r0, #9
	bgt _0801E454
	cmp r0, #4
	beq _0801E45C
	b _0801E500
_0801E454:
	cmp r0, #0xc
	bgt _0801E500
	cmp r0, #0xb
	blt _0801E500
_0801E45C:
	adds r0, r4, #0
	bl GetItemUseDescId
	bl sub_8009FA8
	adds r4, r0, #0
	movs r5, #0
	ldr r7, [sp, #4]
	adds r7, #0x42
	movs r0, #8
	adds r0, r0, r6
	mov r8, r0
	ldr r1, [sp, #4]
	adds r1, #0xc2
	mov sb, r1
	movs r2, #0x10
	adds r2, r2, r6
	mov sl, r2
	b _0801E486
_0801E482:
	adds r4, #1
	adds r5, #1
_0801E486:
	lsls r0, r5, #3
	adds r0, r6, r0
	movs r1, #0
	movs r2, #0
	adds r3, r4, #0
	bl sub_80043B8
	adds r0, r4, #0
	bl sub_8003F10
	adds r4, r0, #0
	ldrb r0, [r4]
	cmp r0, #0
	bne _0801E482
	ldr r3, _0801E4F8 @ =0x0203A4E8
	ldr r2, _0801E4FC @ =0x0203A568
	adds r0, r2, #0
	adds r0, #0x5a
	ldrh r0, [r0]
	adds r1, r3, #0
	adds r1, #0x5a
	strh r0, [r1]
	adds r0, r2, #0
	adds r0, #0x60
	ldrh r1, [r0]
	adds r0, r3, #0
	adds r0, #0x60
	strh r1, [r0]
	adds r0, r2, #0
	adds r0, #0x66
	ldrh r0, [r0]
	adds r1, r3, #0
	adds r1, #0x66
	strh r0, [r1]
	adds r0, r2, #0
	adds r0, #0x62
	ldrh r1, [r0]
	adds r0, r3, #0
	adds r0, #0x62
	strh r1, [r0]
	adds r0, r6, #0
	adds r1, r7, #0
	bl PutText
	mov r0, r8
	mov r1, sb
	bl PutText
	ldr r0, [sp, #4]
	movs r2, #0xa1
	lsls r2, r2, #1
	adds r1, r0, r2
	mov r0, sl
	bl PutText
	b _0801E67C
	.align 2, 0
_0801E4F8: .4byte 0x0203A4E8
_0801E4FC: .4byte 0x0203A568
_0801E500:
	lsls r1, r5, #0x18
	asrs r1, r1, #0x18
	mov r0, sb
	bl sub_802A38C
	cmp r5, #8
	bne _0801E542
	ldr r3, _0801E694 @ =0x0203A568
	ldr r2, _0801E698 @ =0x0203A4E8
	adds r0, r2, #0
	adds r0, #0x5a
	ldrh r0, [r0]
	adds r1, r3, #0
	adds r1, #0x5a
	strh r0, [r1]
	adds r0, r2, #0
	adds r0, #0x60
	ldrh r1, [r0]
	adds r0, r3, #0
	adds r0, #0x60
	strh r1, [r0]
	adds r0, r2, #0
	adds r0, #0x66
	ldrh r0, [r0]
	adds r1, r3, #0
	adds r1, #0x66
	strh r0, [r1]
	adds r0, r2, #0
	adds r0, #0x62
	ldrh r1, [r0]
	adds r0, r3, #0
	adds r0, #0x62
	strh r1, [r0]
_0801E542:
	ldr r0, _0801E698 @ =0x0203A4E8
	mov r8, r0
	movs r1, #0x48
	add r1, r8
	mov sl, r1
	ldrh r1, [r1]
	mov r0, sb
	bl CanUnitUseWeapon
	lsls r0, r0, #0x18
	movs r2, #1
	mov sb, r2
	cmp r0, #0
	beq _0801E562
	movs r0, #2
	mov sb, r0
_0801E562:
	movs r0, #0x90
	lsls r0, r0, #3
	bl sub_8009FA8
	adds r3, r0, #0
	adds r0, r6, #0
	movs r1, #0x1e
	movs r2, #0
	bl sub_80043B8
	adds r5, r6, #0
	adds r5, #8
	ldr r0, _0801E69C @ =0x00000482
	bl sub_8009FA8
	adds r3, r0, #0
	adds r0, r5, #0
	movs r1, #2
	movs r2, #0
	bl sub_80043B8
	adds r4, r6, #0
	adds r4, #0x10
	ldr r0, _0801E6A0 @ =0x00000483
	bl sub_8009FA8
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #2
	movs r2, #0
	bl sub_80043B8
	movs r0, #0x92
	lsls r0, r0, #3
	bl sub_8009FA8
	adds r3, r0, #0
	adds r0, r5, #0
	movs r1, #0x32
	movs r2, #0
	bl sub_80043B8
	ldr r0, _0801E6A4 @ =0x00000484
	bl sub_8009FA8
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x32
	movs r2, #0
	bl sub_80043B8
	mov r0, r8
	adds r0, #0x5a
	movs r1, #0
	ldrsh r3, [r0, r1]
	adds r0, r5, #0
	movs r1, #0x24
	mov r2, sb
	bl sub_80043DC
	mov r0, r8
	adds r0, #0x60
	movs r2, #0
	ldrsh r3, [r0, r2]
	adds r0, r4, #0
	movs r1, #0x24
	mov r2, sb
	bl sub_80043DC
	mov r0, r8
	adds r0, #0x66
	movs r1, #0
	ldrsh r3, [r0, r1]
	adds r0, r5, #0
	movs r1, #0x54
	mov r2, sb
	bl sub_80043DC
	mov r0, r8
	adds r0, #0x62
	movs r2, #0
	ldrsh r3, [r0, r2]
	adds r0, r4, #0
	movs r1, #0x54
	mov r2, sb
	bl sub_80043DC
	adds r0, r7, #0
	adds r0, #0x34
	adds r6, r7, #0
	adds r6, #0x31
	ldrb r1, [r6]
	adds r1, #1
	lsls r1, r1, #5
	adds r1, #1
	adds r5, r7, #0
	adds r5, #0x30
	ldrb r2, [r5]
	adds r1, r1, r2
	lsls r1, r1, #1
	ldr r4, _0801E6A8 @ =0x02022CA8
	adds r1, r1, r4
	bl PutText
	adds r0, r7, #0
	adds r0, #0x3c
	ldrb r1, [r6]
	adds r1, #3
	lsls r1, r1, #5
	adds r1, #1
	ldrb r2, [r5]
	adds r1, r1, r2
	lsls r1, r1, #1
	adds r1, r1, r4
	bl PutText
	adds r0, r7, #0
	adds r0, #0x44
	ldrb r1, [r6]
	adds r1, #5
	lsls r1, r1, #5
	adds r1, #1
	ldrb r2, [r5]
	adds r1, r1, r2
	lsls r1, r1, #1
	adds r1, r1, r4
	bl PutText
	ldr r4, [sp, #4]
	adds r4, #0x4e
	mov r1, sl
	ldrh r0, [r1]
	bl GetItemType
	adds r1, r0, #0
	adds r1, #0x70
	ldr r0, [sp, #8]
	lsls r2, r0, #0xc
	adds r0, r4, #0
	bl DrawIcon
_0801E67C:
	movs r0, #1
	bl BG_EnableSyncByMask
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801E694: .4byte 0x0203A568
_0801E698: .4byte 0x0203A4E8
_0801E69C: .4byte 0x00000482
_0801E6A0: .4byte 0x00000483
_0801E6A4: .4byte 0x00000484
_0801E6A8: .4byte 0x02022CA8

