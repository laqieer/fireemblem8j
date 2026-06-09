	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set DrawIcon, 0x08003608 + 1
	.set GetItemIconId, 0x080174A8 + 1
	.set GetItemMaxUses, 0x08017358 + 1
	.set PutNumberOrBlank, 0x08004A9C + 1
	.set __modsi3, 0x080D6690 + 1
	.set j_TmFillRect, 0x080DC0E4 + 1
	.set sub_8003CF8, 0x08003CF8 + 1
	.set sub_8004374, 0x08004374 + 1
	.set sub_801729C, 0x0801729C + 1
	.section .text.sub_80B54AC, "ax", %progbits
@ sub_80B54AC @ JP 0x080B54AC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B54AC
	.thumb_func
sub_80B54AC:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	adds r5, r0, #0
	ldr r4, _080B5554 @ =0x08A9E508
	movs r1, #6
	bl __modsi3
	lsls r0, r0, #4
	ldr r1, [r4]
	adds r6, r1, r0
	lsls r0, r5, #1
	str r0, [sp, #8]
	movs r0, #0x1f
	ldr r1, [sp, #8]
	ands r1, r0
	str r1, [sp, #8]
	ldr r0, _080B5558 @ =0x08A9E500
	ldr r1, [r0]
	lsls r0, r5, #2
	adds r0, r0, r1
	movs r2, #1
	ldrsb r2, [r0, r2]
	str r2, [sp, #0xc]
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	str r0, [sp, #0x10]
	ldr r3, _080B555C @ =0x08A9E4F8
	ldr r1, [r3]
	lsls r0, r0, #2
	ldr r2, [sp, #0x10]
	adds r0, r0, r2
	lsls r7, r0, #2
	adds r1, r1, r7
	ldrb r1, [r1, #2]
	mov r8, r1
	movs r3, #0
	mov sb, r3
	ldr r0, [sp, #8]
	lsls r4, r0, #6
	ldr r1, _080B5560 @ =0x02023CA8
	adds r1, r1, r4
	mov sl, r1
	mov r0, sl
	movs r1, #0x14
	movs r2, #1
	bl j_TmFillRect
	adds r0, r6, #0
	bl sub_8003CF8
	cmp r5, #0x1f
	ble _080B5520
	b _080B5624
_080B5520:
	ldr r2, _080B555C @ =0x08A9E4F8
	ldr r0, [r2]
	adds r1, r0, r7
	ldrb r0, [r1]
	movs r2, #3
	ands r2, r0
	cmp r2, #0
	beq _080B5624
	cmp r2, #1
	bne _080B5538
	movs r3, #4
	mov sb, r3
_080B5538:
	ldr r0, [sp, #0xc]
	cmp r0, #0
	bne _080B5542
	movs r2, #1
	mov sb, r2
_080B5542:
	ldrb r0, [r1, #1]
	cmp r0, #0
	blt _080B55E6
	cmp r0, #1
	ble _080B5564
	cmp r0, #2
	beq _080B55B8
	b _080B55E6
	.align 2, 0
_080B5554: .4byte 0x08A9E508
_080B5558: .4byte 0x08A9E500
_080B555C: .4byte 0x08A9E4F8
_080B5560: .4byte 0x02023CA8
_080B5564:
	mov r0, r8
	bl sub_801729C
	ldr r1, _080B55B4 @ =0x02023CA8
	adds r1, #4
	adds r1, r4, r1
	movs r2, #0
	str r2, [sp]
	str r0, [sp, #4]
	adds r0, r6, #0
	mov r2, sb
	movs r3, #0
	bl sub_8004374
	ldr r0, _080B55B4 @ =0x02023CA8
	adds r0, #0x14
	adds r5, r4, r0
	mov r4, sb
	cmp r4, #0
	bne _080B558E
	movs r4, #2
_080B558E:
	mov r0, r8
	bl GetItemMaxUses
	adds r2, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl PutNumberOrBlank
	mov r0, r8
	bl GetItemIconId
	adds r1, r0, #0
	movs r2, #0x80
	lsls r2, r2, #7
	mov r0, sl
	bl DrawIcon
	b _080B55E6
	.align 2, 0
_080B55B4: .4byte 0x02023CA8
_080B55B8:
	mov r0, r8
	bl sub_801729C
	ldr r1, _080B5634 @ =0x02023CA8
	adds r1, #4
	adds r1, r4, r1
	movs r2, #0
	str r2, [sp]
	str r0, [sp, #4]
	adds r0, r6, #0
	mov r2, sb
	movs r3, #0
	bl sub_8004374
	mov r0, r8
	bl GetItemIconId
	adds r1, r0, #0
	movs r2, #0x80
	lsls r2, r2, #7
	mov r0, sl
	bl DrawIcon
_080B55E6:
	adds r6, #8
	adds r0, r6, #0
	bl sub_8003CF8
	ldr r3, [sp, #8]
	lsls r1, r3, #6
	ldr r0, _080B5638 @ =0x02023CC0
	adds r5, r1, r0
	mov r2, sb
	cmp r2, #0
	bne _080B55FE
	movs r2, #3
_080B55FE:
	movs r0, #0
	str r0, [sp]
	ldr r0, _080B563C @ =0x08A9E4F8
	ldr r3, [sp, #0x10]
	lsls r1, r3, #2
	adds r1, r1, r3
	lsls r1, r1, #2
	ldr r0, [r0]
	adds r0, r0, r1
	adds r0, #3
	str r0, [sp, #4]
	adds r0, r6, #0
	adds r1, r5, #0
	movs r3, #0
	bl sub_8004374
	movs r0, #4
	bl BG_EnableSyncByMask
_080B5624:
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B5634: .4byte 0x02023CA8
_080B5638: .4byte 0x02023CC0
_080B563C: .4byte 0x08A9E4F8

