	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set DrawIcon, 0x08003608 + 1
	.set PutText, 0x08003DA0 + 1
	.set Text_Skip, 0x08003D88 + 1
	.set j_TmFillRect, 0x080DC0E4 + 1
	.set sub_8003CF8, 0x08003CF8 + 1
	.set sub_8003D84, 0x08003D84 + 1
	.set sub_8003D90, 0x08003D90 + 1
	.set sub_8003F28, 0x08003F28 + 1
	.set sub_8009FA8, 0x08009FA8 + 1
	.section .text.sub_8092518, "ax", %progbits
@ sub_8092518 @ JP 0x08092518 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8092518
	.thumb_func
sub_8092518:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	ldr r5, _080925A0 @ =0x02023D12
	adds r0, r5, #0
	movs r1, #4
	movs r2, #1
	movs r3, #0
	bl j_TmFillRect
	ldr r4, _080925A4 @ =0x0200E150
	adds r0, r4, #0
	bl sub_8003CF8
	movs r7, #0
	mov r8, r4
	mov sl, r5
_08092546:
	movs r6, #0
	lsls r0, r7, #3
	adds r1, r7, #1
	mov sb, r1
	adds r0, r0, r7
	lsls r5, r0, #4
	ldr r2, _080925A8 @ =0x08A93994
	adds r1, r5, r2
_08092556:
	ldrb r0, [r1]
	ldr r2, [sp]
	cmp r0, r2
	bne _080925DC
	ldr r4, _080925A4 @ =0x0200E150
	adds r0, r4, #0
	movs r1, #0
	bl sub_8003D84
	adds r0, r4, #0
	movs r1, #0
	bl sub_8003D90
	ldr r0, _080925AC @ =0x0000048C
	bl sub_8009FA8
	adds r1, r0, #0
	adds r0, r4, #0
	bl sub_8003F28
	cmp r7, #5
	bne _080925B0
	cmp r6, #0
	beq _080925B0
	adds r0, r4, #0
	mov r1, sl
	bl PutText
	adds r1, r6, #0
	adds r1, #0x6f
	mov r0, sl
	adds r0, #8
	movs r2, #0xa0
	lsls r2, r2, #7
	bl DrawIcon
	b _080925E6
	.align 2, 0
_080925A0: .4byte 0x02023D12
_080925A4: .4byte 0x0200E150
_080925A8: .4byte 0x08A93994
_080925AC: .4byte 0x0000048C
_080925B0:
	mov r0, r8
	movs r1, #4
	bl Text_Skip
	ldr r1, _080925D4 @ =0x08A93998
	adds r0, r5, r1
	ldr r0, [r0]
	bl sub_8009FA8
	adds r1, r0, #0
	mov r0, r8
	bl sub_8003F28
	mov r0, r8
	ldr r1, _080925D8 @ =0x02023D12
	bl PutText
	b _080925E6
	.align 2, 0
_080925D4: .4byte 0x08A93998
_080925D8: .4byte 0x02023D12
_080925DC:
	adds r5, #0x10
	adds r1, #0x10
	adds r6, #1
	cmp r6, #8
	ble _08092556
_080925E6:
	mov r7, sb
	cmp r7, #9
	ble _08092546
	movs r0, #4
	bl BG_EnableSyncByMask
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

