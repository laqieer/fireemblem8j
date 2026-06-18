	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set j_TmCopyRect, 0x080DC0F4 + 1
	.set j_TmFillRect, 0x080DC0E4 + 1
	.section .text.sub_80C3448, "ax", %progbits
@ DrawGMapPIPanelAtHeight @ JP 0x080C3448 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global DrawGMapPIPanelAtHeight
	.thumb_func
DrawGMapPIPanelAtHeight:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r7, r1, #0
	ldr r1, _080C3474 @ =0x08AC1E08
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #2
	ldrsb r1, [r0, r1]
	mov sl, r1
	ldrb r0, [r0, #3]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	str r0, [sp]
	cmp r2, #0
	beq _080C3478
	cmp r2, #1
	beq _080C3480
	b _080C3488
	.align 2, 0
_080C3474: .4byte 0x08AC1E08
_080C3478:
	movs r0, #0xc
	mov sb, r0
	movs r1, #4
	b _080C3486
_080C3480:
	movs r0, #0xc
	mov sb, r0
	movs r1, #9
_080C3486:
	mov r8, r1
_080C3488:
	mov r0, sl
	cmp r0, #0
	bge _080C34D8
	ldr r1, [sp]
	cmp r1, #0
	bge _080C34D8
	ldr r5, _080C35EC @ =0x020234A8
	adds r0, r5, #0
	mov r1, sb
	mov r2, r8
	movs r3, #0
	bl j_TmFillRect
	ldr r6, _080C35F0 @ =0x02022CA8
	adds r0, r6, #0
	mov r1, sb
	mov r2, r8
	movs r3, #0
	bl j_TmFillRect
	adds r4, r7, #0
	subs r4, #0xa
	mov r0, r8
	subs r4, r0, r4
	lsls r4, r4, #6
	ldr r0, _080C35F4 @ =0x0201B958
	adds r0, r4, r0
	adds r1, r5, #0
	mov r2, sb
	adds r3, r7, #0
	bl j_TmCopyRect
	ldr r0, _080C35F8 @ =0x0201B458
	adds r4, r4, r0
	adds r0, r4, #0
	adds r1, r6, #0
	mov r2, sb
	adds r3, r7, #0
	bl j_TmCopyRect
_080C34D8:
	mov r1, sl
	cmp r1, #0
	ble _080C3532
	ldr r0, [sp]
	cmp r0, #0
	bge _080C3532
	movs r5, #0x1e
	mov r1, sb
	subs r5, r5, r1
	lsls r5, r5, #1
	ldr r6, _080C35EC @ =0x020234A8
	adds r6, r5, r6
	adds r0, r6, #0
	mov r2, r8
	movs r3, #0
	bl j_TmFillRect
	ldr r0, _080C35F0 @ =0x02022CA8
	adds r5, r5, r0
	adds r0, r5, #0
	mov r1, sb
	mov r2, r8
	movs r3, #0
	bl j_TmFillRect
	adds r4, r7, #0
	subs r4, #0xa
	mov r0, r8
	subs r4, r0, r4
	lsls r4, r4, #6
	ldr r0, _080C35F4 @ =0x0201B958
	adds r0, r4, r0
	adds r1, r6, #0
	mov r2, sb
	adds r3, r7, #0
	bl j_TmCopyRect
	ldr r0, _080C35F8 @ =0x0201B458
	adds r4, r4, r0
	adds r0, r4, #0
	adds r1, r5, #0
	mov r2, sb
	adds r3, r7, #0
	bl j_TmCopyRect
_080C3532:
	mov r1, sl
	cmp r1, #0
	bge _080C3584
	ldr r0, [sp]
	cmp r0, #0
	ble _080C3584
	ldr r5, _080C35FC @ =0x020238A8
	adds r0, r5, #0
	movs r1, #0xc
	movs r2, #4
	movs r3, #0
	bl j_TmFillRect
	ldr r6, _080C3600 @ =0x020230A8
	adds r0, r6, #0
	movs r1, #0xc
	movs r2, #4
	movs r3, #0
	bl j_TmFillRect
	ldr r0, _080C3604 @ =0x0201BBD8
	movs r4, #0x16
	subs r4, r4, r7
	lsls r4, r4, #6
	ldr r1, _080C3608 @ =0xFFFFFC00
	adds r5, r5, r1
	adds r5, r4, r5
	adds r1, r5, #0
	movs r2, #0xc
	adds r3, r7, #0
	bl j_TmCopyRect
	ldr r0, _080C360C @ =0x0201B758
	ldr r1, _080C3608 @ =0xFFFFFC00
	adds r6, r6, r1
	adds r4, r4, r6
	adds r1, r4, #0
	movs r2, #0xc
	adds r3, r7, #0
	bl j_TmCopyRect
_080C3584:
	mov r0, sl
	cmp r0, #0
	ble _080C35D6
	ldr r1, [sp]
	cmp r1, #0
	ble _080C35D6
	ldr r5, _080C3610 @ =0x020238CC
	adds r0, r5, #0
	movs r1, #0xc
	movs r2, #4
	movs r3, #0
	bl j_TmFillRect
	ldr r6, _080C3614 @ =0x020230CC
	adds r0, r6, #0
	movs r1, #0xc
	movs r2, #4
	movs r3, #0
	bl j_TmFillRect
	ldr r0, _080C3604 @ =0x0201BBD8
	movs r4, #0x16
	subs r4, r4, r7
	lsls r4, r4, #6
	ldr r1, _080C3608 @ =0xFFFFFC00
	adds r5, r5, r1
	adds r5, r4, r5
	adds r1, r5, #0
	movs r2, #0xc
	adds r3, r7, #0
	bl j_TmCopyRect
	ldr r0, _080C360C @ =0x0201B758
	ldr r1, _080C3608 @ =0xFFFFFC00
	adds r6, r6, r1
	adds r4, r4, r6
	adds r1, r4, #0
	movs r2, #0xc
	adds r3, r7, #0
	bl j_TmCopyRect
_080C35D6:
	movs r0, #3
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
_080C35EC: .4byte 0x020234A8
_080C35F0: .4byte 0x02022CA8
_080C35F4: .4byte 0x0201B958
_080C35F8: .4byte 0x0201B458
_080C35FC: .4byte 0x020238A8
_080C3600: .4byte 0x020230A8
_080C3604: .4byte 0x0201BBD8
_080C3608: .4byte 0xFFFFFC00
_080C360C: .4byte 0x0201B758
_080C3610: .4byte 0x020238CC
_080C3614: .4byte 0x020230CC

