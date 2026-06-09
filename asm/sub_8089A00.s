	.syntax unified
	.set DrawIcon, 0x08003608 + 1
	.set GetDisplayRankStringFromExp, 0x08016BA0 + 1
	.set GetWeaponExpProgressState, 0x08016BF8 + 1
	.set PutSpecialChar, 0x08004A14 + 1
	.set __divsi3, 0x080D65F8 + 1
	.set sub_8088DE8, 0x08088DE8 + 1
	.section .text.sub_8089A00, "ax", %progbits
@ sub_8089A00 @ JP 0x08089A00 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8089A00
	.thumb_func
sub_8089A00:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	mov sb, r0
	adds r6, r1, #0
	mov sl, r2
	adds r1, r3, #0
	ldr r0, _08089AB4 @ =0x02003BFC
	ldr r0, [r0, #0xc]
	adds r0, #0x28
	adds r0, r0, r1
	ldrb r5, [r0]
	lsls r4, r2, #5
	adds r0, r4, r6
	lsls r0, r0, #1
	ldr r2, _08089AB8 @ =0x02003D2C
	mov r8, r2
	add r0, r8
	adds r1, #0x70
	movs r2, #0xa0
	lsls r2, r2, #7
	bl DrawIcon
	movs r7, #2
	cmp r5, #0xfa
	ble _08089A3C
	movs r7, #4
_08089A3C:
	adds r4, #5
	adds r4, r4, r6
	lsls r4, r4, #1
	add r4, r8
	adds r0, r5, #0
	bl GetDisplayRankStringFromExp
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r7, #0
	bl PutSpecialChar
	add r2, sp, #0x10
	adds r0, r5, #0
	add r1, sp, #0xc
	bl GetWeaponExpProgressState
	mov r0, sb
	lsls r5, r0, #1
	add r5, sb
	lsls r5, r5, #1
	ldr r2, _08089ABC @ =0x00000401
	adds r5, r5, r2
	mov r4, sl
	adds r4, #1
	lsls r4, r4, #5
	adds r4, #3
	adds r4, r4, r6
	lsls r4, r4, #1
	ldr r0, _08089AC0 @ =0x0200472C
	adds r4, r4, r0
	movs r6, #0xc0
	lsls r6, r6, #7
	movs r0, #0x22
	str r0, [sp]
	ldr r1, [sp, #0xc]
	lsls r0, r1, #4
	adds r0, r0, r1
	lsls r0, r0, #1
	ldr r1, [sp, #0x10]
	subs r1, #1
	bl __divsi3
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	adds r0, r5, #0
	movs r1, #5
	adds r2, r4, #0
	adds r3, r6, #0
	bl sub_8088DE8
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08089AB4: .4byte 0x02003BFC
_08089AB8: .4byte 0x02003D2C
_08089ABC: .4byte 0x00000401
_08089AC0: .4byte 0x0200472C

