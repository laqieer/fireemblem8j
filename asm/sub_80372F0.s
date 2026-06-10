	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set j_TmCopyRect, 0x080DC0F4 + 1
	.set sub_80011D0, 0x080011D0 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_80372F0, "ax", %progbits
@ sub_80372F0 @ JP 0x080372F0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80372F0
	.thumb_func
sub_80372F0:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r7, r0, #0
	adds r0, #0x32
	ldrb r0, [r0]
	movs r1, #0x14
	mov sb, r1
	cmp r0, #1
	bne _0803730C
	movs r2, #0x10
	mov sb, r2
_0803730C:
	ldr r0, _08037370 @ =0x02022CA8
	mov r8, r0
	movs r1, #0
	bl sub_80011D0
	ldr r1, _08037374 @ =0x020234A8
	mov sl, r1
	mov r0, sl
	movs r1, #0
	bl sub_80011D0
	movs r0, #3
	bl BG_EnableSyncByMask
	ldr r1, _08037378 @ =0x085C6A44
	adds r2, r7, #0
	adds r2, #0x36
	movs r0, #0
	ldrsb r0, [r2, r0]
	adds r0, r0, r1
	movs r5, #0
	ldrsb r5, [r0, r5]
	adds r0, r7, #0
	adds r0, #0x35
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r6, r2, #0
	cmp r0, #0
	bge _08037384
	movs r4, #0xa
	subs r4, r4, r5
	lsls r4, r4, #1
	ldr r0, _0803737C @ =0x02003D2C
	adds r0, r4, r0
	mov r1, r8
	adds r2, r5, #0
	mov r3, sb
	bl j_TmCopyRect
	ldr r0, _08037380 @ =0x0200422C
	adds r4, r4, r0
	adds r0, r4, #0
	mov r1, sl
	adds r2, r5, #0
	mov r3, sb
	bl j_TmCopyRect
	b _080373A6
	.align 2, 0
_08037370: .4byte 0x02022CA8
_08037374: .4byte 0x020234A8
_08037378: .4byte 0x085C6A44
_0803737C: .4byte 0x02003D2C
_08037380: .4byte 0x0200422C
_08037384:
	ldr r0, _080373CC @ =0x02003D2C
	movs r4, #0x1e
	subs r4, r4, r5
	lsls r4, r4, #1
	mov r2, r8
	adds r1, r4, r2
	adds r2, r5, #0
	mov r3, sb
	bl j_TmCopyRect
	ldr r0, _080373D0 @ =0x0200422C
	add r4, sl
	adds r1, r4, #0
	adds r2, r5, #0
	mov r3, sb
	bl j_TmCopyRect
_080373A6:
	ldrb r0, [r6]
	adds r0, #1
	strb r0, [r6]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #4
	bne _080373BE
	movs r0, #0
	strb r0, [r6]
	adds r0, r7, #0
	bl sub_8002DE4
_080373BE:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080373CC: .4byte 0x02003D2C
_080373D0: .4byte 0x0200422C

