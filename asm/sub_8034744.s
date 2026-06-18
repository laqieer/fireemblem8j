	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set Proc_Find, 0x08002DEC + 1
	.set PutText, 0x08003DA0 + 1
	.set j_TmApplyTsa, 0x080DC0DC + 1
	.set sub_8003CF8, 0x08003CF8 + 1
	.set sub_8003D84, 0x08003D84 + 1
	.set sub_8003F28, 0x08003F28 + 1
	.set sub_8009FA8, 0x08009FA8 + 1
	.set sub_80346DC, 0x080346DC + 1
	.set sub_804F0EC, 0x0804F0EC + 1
	.set sub_804F610, 0x0804F610 + 1
	.section .text.sub_8034744, "ax", %progbits
@ UnitInfoWindow_DrawBase @ JP 0x08034744 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global UnitInfoWindow_DrawBase
	.thumb_func
UnitInfoWindow_DrawBase:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x20
	mov r8, r0
	str r1, [sp, #4]
	adds r7, r2, #0
	mov sb, r3
	ldr r6, [sp, #0x40]
	cmp r0, #0
	bne _0803476A
	ldr r0, _080348C8 @ =0x085C661C
	bl Proc_Find
	mov r8, r0
	bl sub_804F610
_0803476A:
	ldr r0, [sp, #4]
	mov r1, r8
	str r0, [r1, #0x2c]
	mov r0, r8
	adds r0, #0x60
	strb r7, [r0]
	adds r0, #1
	mov r2, sb
	strb r2, [r0]
	mov r5, sb
	adds r5, #2
	ldr r3, [sp, #0x44]
	lsls r3, r3, #1
	adds r3, #2
	movs r0, #3
	str r0, [sp]
	adds r0, r7, #0
	adds r1, r5, #0
	adds r2, r6, #0
	bl sub_804F0EC
	mov r3, sb
	lsls r4, r3, #5
	adds r0, r4, r7
	lsls r0, r0, #1
	ldr r1, _080348CC @ =0x020234A8
	mov sl, r1
	add r0, sl
	ldr r1, _080348D0 @ =0x08A93138
	movs r2, #0x80
	lsls r2, r2, #5
	bl j_TmApplyTsa
	str r5, [sp, #0x14]
	str r4, [sp, #0x18]
	mov r2, sb
	adds r2, #1
	str r2, [sp, #0x10]
	mov r3, r8
	adds r3, #0x30
	str r3, [sp, #0xc]
	mov r4, r8
	adds r4, #0x63
	str r4, [sp, #0x1c]
	cmp r6, #0xa
	ble _08034874
	adds r2, r7, #0
	adds r2, #8
	adds r0, r7, r6
	subs r1, r0, #1
	mov r6, sl
	mov sl, r0
	cmp r2, r1
	bge _0803481C
	str r1, [sp, #8]
	lsls r1, r2, #1
	lsls r0, r5, #6
	adds r0, r0, r6
	adds r5, r1, r0
	ldr r3, [sp, #0x10]
	lsls r0, r3, #6
	adds r0, r0, r6
	adds r4, r1, r0
	ldr r3, _080348D4 @ =0x080DCCC6
	movs r0, #3
	rsbs r0, r0, #0
	add r0, sl
	mov ip, r0
	mov r0, sb
	lsls r0, r0, #6
	mov sb, r0
	add sb, r6
	add r1, sb
_080347FC:
	cmp r2, ip
	blt _08034802
	adds r3, #2
_08034802:
	ldrh r0, [r3]
	strh r0, [r1]
	ldrh r0, [r3, #8]
	strh r0, [r4]
	ldrh r0, [r3, #0x10]
	strh r0, [r5]
	adds r5, #2
	adds r4, #2
	adds r1, #2
	adds r2, #1
	ldr r0, [sp, #8]
	cmp r2, r0
	blt _080347FC
_0803481C:
	ldr r0, [sp, #0x18]
	adds r0, #7
	adds r0, r0, r7
	lsls r0, r0, #1
	adds r0, r0, r6
	ldr r2, _080348D4 @ =0x080DCCC6
	ldrh r1, [r2]
	strh r1, [r0]
	ldr r4, [sp, #0x10]
	lsls r3, r4, #5
	adds r0, r3, #7
	adds r0, r0, r7
	lsls r0, r0, #1
	adds r0, r0, r6
	ldrh r1, [r2, #8]
	strh r1, [r0]
	ldr r0, [sp, #0x14]
	lsls r2, r0, #5
	adds r0, r2, #7
	adds r0, r0, r7
	lsls r0, r0, #1
	adds r0, r0, r6
	ldr r4, _080348D4 @ =0x080DCCC6
	ldrh r1, [r4, #0x10]
	strh r1, [r0]
	ldr r0, [sp, #0x18]
	subs r0, #1
	add r0, sl
	lsls r0, r0, #1
	adds r0, r0, r6
	ldrh r1, [r4, #6]
	strh r1, [r0]
	subs r3, #1
	add r3, sl
	lsls r3, r3, #1
	adds r3, r3, r6
	ldrh r0, [r4, #0xe]
	strh r0, [r3]
	subs r2, #1
	add r2, sl
	lsls r2, r2, #1
	adds r2, r2, r6
	ldrh r0, [r4, #0x16]
	strh r0, [r2]
_08034874:
	ldr r0, [sp, #0xc]
	bl sub_8003CF8
	mov r0, r8
	bl sub_80346DC
	ldr r0, [sp, #0x1c]
	ldrb r1, [r0]
	ldr r0, [sp, #0xc]
	bl sub_8003D84
	ldr r1, [sp, #4]
	ldr r0, [r1]
	ldrh r0, [r0]
	bl sub_8009FA8
	adds r1, r0, #0
	ldr r0, [sp, #0xc]
	bl sub_8003F28
	ldr r2, [sp, #0x10]
	lsls r1, r2, #5
	adds r1, #3
	adds r1, r1, r7
	lsls r1, r1, #1
	ldr r0, _080348D8 @ =0x02022CA8
	adds r1, r1, r0
	ldr r0, [sp, #0xc]
	bl PutText
	movs r0, #3
	bl BG_EnableSyncByMask
	mov r0, r8
	add sp, #0x20
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080348C8: .4byte 0x085C661C
_080348CC: .4byte 0x020234A8
_080348D0: .4byte 0x08A93138
_080348D4: .4byte 0x080DCCC6
_080348D8: .4byte 0x02022CA8

