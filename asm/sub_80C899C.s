	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set j_TmCopyRect, 0x080DC0F4 + 1
	.set j_TmFillRect, 0x080DC0E4 + 1
	.section .text.sub_80C899C, "ax", %progbits
@ sub_80C899C @ JP 0x080C899C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C899C
	.thumb_func
sub_80C899C:
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r6, r1, #0
	ldr r3, _080C89CC @ =0x081F683C
	adds r0, #0x2a
	movs r2, #0
	ldrsb r2, [r0, r2]
	ldr r0, _080C89D0 @ =0x03005270
	ldrb r1, [r0]
	lsls r1, r1, #0x1a
	lsrs r1, r1, #0x1e
	lsls r0, r1, #2
	adds r0, r0, r1
	adds r2, r2, r0
	adds r2, r2, r3
	ldrb r5, [r2]
	cmp r5, #1
	beq _080C8A1C
	cmp r5, #1
	bgt _080C89D4
	cmp r5, #0
	beq _080C89DE
	b _080C8AC4
	.align 2, 0
_080C89CC: .4byte 0x081F683C
_080C89D0: .4byte 0x03005270
_080C89D4:
	cmp r5, #2
	beq _080C8A5C
	cmp r5, #3
	beq _080C8A8C
	b _080C8AC4
_080C89DE:
	ldr r4, _080C8A14 @ =0x02022CA8
	adds r0, r4, #0
	movs r1, #8
	movs r2, #8
	movs r3, #0
	bl j_TmFillRect
	movs r0, #0x1c
	subs r0, r0, r6
	lsls r0, r0, #1
	ldr r1, _080C8A18 @ =0x0201B430
	adds r0, r0, r1
	adds r1, r4, #0
	adds r2, r6, #0
	movs r3, #8
	bl j_TmCopyRect
	adds r0, r6, #0
	subs r0, #8
	adds r3, r7, #0
	adds r3, #0x2f
	strb r0, [r3]
	adds r0, r7, #0
	adds r0, #0x30
	strb r5, [r0]
	b _080C8AC4
	.align 2, 0
_080C8A14: .4byte 0x02022CA8
_080C8A18: .4byte 0x0201B430
_080C8A1C:
	ldr r4, _080C8A54 @ =0x02022CD4
	adds r0, r4, #0
	movs r1, #8
	movs r2, #8
	movs r3, #0
	bl j_TmFillRect
	ldr r0, _080C8A58 @ =0x0201B458
	movs r1, #0x1e
	subs r1, r1, r6
	lsls r1, r1, #1
	subs r4, #0x2c
	adds r1, r1, r4
	adds r2, r6, #0
	movs r3, #8
	bl j_TmCopyRect
	movs r0, #0x1e
	subs r0, r0, r6
	adds r3, r7, #0
	adds r3, #0x2f
	movs r1, #0
	strb r0, [r3]
	adds r0, r7, #0
	adds r0, #0x30
	strb r1, [r0]
	b _080C8AC4
	.align 2, 0
_080C8A54: .4byte 0x02022CD4
_080C8A58: .4byte 0x0201B458
_080C8A5C:
	ldr r4, _080C8A84 @ =0x02022FA8
	adds r0, r4, #0
	movs r1, #8
	movs r2, #8
	movs r3, #0
	bl j_TmFillRect
	movs r0, #0x1c
	subs r0, r0, r6
	lsls r0, r0, #1
	ldr r1, _080C8A88 @ =0x0201B430
	adds r0, r0, r1
	adds r1, r4, #0
	adds r2, r6, #0
	movs r3, #8
	bl j_TmCopyRect
	adds r0, r6, #0
	subs r0, #8
	b _080C8AB6
	.align 2, 0
_080C8A84: .4byte 0x02022FA8
_080C8A88: .4byte 0x0201B430
_080C8A8C:
	ldr r4, _080C8AD0 @ =0x02022FD4
	adds r0, r4, #0
	movs r1, #8
	movs r2, #8
	movs r3, #0
	bl j_TmFillRect
	ldr r0, _080C8AD4 @ =0x0201B458
	movs r1, #0xcf
	lsls r1, r1, #1
	subs r1, r1, r6
	lsls r1, r1, #1
	ldr r2, _080C8AD8 @ =0xFFFFFCD4
	adds r4, r4, r2
	adds r1, r1, r4
	adds r2, r6, #0
	movs r3, #0xc
	bl j_TmCopyRect
	movs r0, #0x1e
	subs r0, r0, r6
_080C8AB6:
	adds r3, r7, #0
	adds r3, #0x2f
	strb r0, [r3]
	adds r1, r7, #0
	adds r1, #0x30
	movs r0, #0xc
	strb r0, [r1]
_080C8AC4:
	movs r0, #1
	bl BG_EnableSyncByMask
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C8AD0: .4byte 0x02022FD4
_080C8AD4: .4byte 0x0201B458
_080C8AD8: .4byte 0xFFFFFCD4

