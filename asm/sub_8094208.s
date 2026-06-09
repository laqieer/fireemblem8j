	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_8094208, "ax", %progbits
@ sub_8094208 @ JP 0x08094208 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8094208
	.thumb_func
sub_8094208:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov r8, r0
	mov r2, r8
	adds r2, #0x38
	ldr r1, _080942E4 @ =0x08A93882
	mov r3, r8
	ldrh r0, [r3, #0x3c]
	adds r0, r0, r1
	ldrb r0, [r0]
	ldrb r1, [r2]
	adds r0, r0, r1
	strb r0, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x14
	bls _08094236
	movs r0, #0x14
	strb r0, [r2]
_08094236:
	mov r3, r8
	ldrh r0, [r3, #0x3c]
	adds r0, #1
	strh r0, [r3, #0x3c]
	mov r0, r8
	adds r0, #0x36
	mov r1, r8
	adds r1, #0x37
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	bls _080942F8
	movs r5, #0
	str r2, [sp]
	ldrb r0, [r2]
	cmp r5, r0
	blt _0809425A
	b _08094386
_0809425A:
	adds r7, r2, #0
_0809425C:
	mov r1, r8
	ldrh r0, [r1, #0x3e]
	lsrs r4, r0, #3
	adds r0, r4, #0
	adds r0, #0xc
	adds r6, r5, #0
	adds r6, #0x1c
	movs r3, #8
	adds r3, r3, r5
	mov ip, r3
	adds r5, #1
	mov sl, r5
	cmp r4, r0
	bge _080942AE
	adds r5, r6, #0
	lsls r2, r3, #1
	movs r0, #0x1f
	mov sb, r0
_08094280:
	adds r3, r4, #0
	mov r1, sb
	ands r3, r1
	lsls r1, r3, #5
	ldrb r0, [r7]
	subs r0, r5, r0
	adds r1, r1, r0
	lsls r1, r1, #1
	ldr r0, _080942E8 @ =0x02022CA8
	adds r1, r1, r0
	lsls r0, r3, #6
	adds r0, r2, r0
	ldr r3, _080942EC @ =0x0200D7E0
	adds r0, r0, r3
	ldrh r0, [r0]
	strh r0, [r1]
	adds r4, #1
	mov r1, r8
	ldrh r0, [r1, #0x3e]
	lsrs r0, r0, #3
	adds r0, #0xc
	cmp r4, r0
	blt _08094280
_080942AE:
	ldr r3, _080942F0 @ =0x02023CA8
	mov sb, r3
	adds r5, r6, #0
	mov r1, ip
	lsls r0, r1, #1
	ldr r3, _080942F4 @ =0x0200DFE0
	adds r2, r0, r3
	movs r3, #0xa0
	movs r4, #1
_080942C0:
	ldrb r0, [r7]
	subs r0, r5, r0
	adds r0, r3, r0
	lsls r0, r0, #1
	add r0, sb
	ldrh r1, [r2]
	strh r1, [r0]
	adds r2, #0x40
	adds r3, #0x20
	subs r4, #1
	cmp r4, #0
	bge _080942C0
	mov r5, sl
	ldrb r0, [r7]
	cmp r5, r0
	blt _0809425C
	b _08094386
	.align 2, 0
_080942E4: .4byte 0x08A93882
_080942E8: .4byte 0x02022CA8
_080942EC: .4byte 0x0200D7E0
_080942F0: .4byte 0x02023CA8
_080942F4: .4byte 0x0200DFE0
_080942F8:
	movs r5, #0
	str r2, [sp]
	ldrb r1, [r2]
	cmp r5, r1
	bge _08094386
	adds r7, r2, #0
_08094304:
	mov r3, r8
	ldrh r0, [r3, #0x3e]
	lsrs r4, r0, #3
	adds r0, r4, #0
	adds r0, #0xc
	adds r6, r5, #0
	adds r6, #0x1c
	adds r1, r5, #1
	mov sl, r1
	cmp r4, r0
	bge _08094354
	mov ip, r6
	movs r3, #0x1f
	mov sb, r3
_08094320:
	adds r3, r4, #0
	mov r0, sb
	ands r3, r0
	lsls r2, r3, #5
	adds r2, #8
	adds r2, r2, r5
	lsls r2, r2, #1
	ldr r1, _080943AC @ =0x02022CA8
	adds r2, r2, r1
	ldrb r0, [r7]
	mov r1, ip
	subs r0, r1, r0
	lsls r0, r0, #1
	lsls r1, r3, #6
	adds r0, r0, r1
	ldr r3, _080943B0 @ =0x0200D7E0
	adds r0, r0, r3
	ldrh r0, [r0]
	strh r0, [r2]
	adds r4, #1
	mov r1, r8
	ldrh r0, [r1, #0x3e]
	lsrs r0, r0, #3
	adds r0, #0xc
	cmp r4, r0
	blt _08094320
_08094354:
	movs r4, #0
	ldr r3, _080943B4 @ =0x0200DFE0
	mov ip, r3
	adds r3, r6, #0
	adds r0, r5, #0
	adds r0, #0xa8
	lsls r0, r0, #1
	ldr r1, _080943B8 @ =0x02023CA8
	adds r2, r0, r1
_08094366:
	ldrb r0, [r7]
	subs r0, r3, r0
	lsls r0, r0, #1
	lsls r1, r4, #6
	adds r0, r0, r1
	add r0, ip
	ldrh r0, [r0]
	strh r0, [r2]
	adds r2, #0x40
	adds r4, #1
	cmp r4, #1
	ble _08094366
	mov r5, sl
	ldrb r3, [r7]
	cmp r5, r3
	blt _08094304
_08094386:
	movs r0, #5
	bl BG_EnableSyncByMask
	ldr r1, [sp]
	ldrb r0, [r1]
	cmp r0, #0x13
	bls _0809439A
	mov r0, r8
	bl sub_8002DE4
_0809439A:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080943AC: .4byte 0x02022CA8
_080943B0: .4byte 0x0200D7E0
_080943B4: .4byte 0x0200DFE0
_080943B8: .4byte 0x02023CA8

