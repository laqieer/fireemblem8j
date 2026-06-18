	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set SetPrimaryHBlankHandler, 0x08001D28 + 1
	.set j_TmApplyTsa, 0x080DC0DC + 1
	.set sub_8001ACC, 0x08001ACC + 1
	.set sub_8001EE4, 0x08001EE4 + 1
	.set sub_800226C, 0x0800226C + 1
	.set sub_8013008, 0x08013008 + 1
	.set sub_80D636C, 0x080D636C + 1
	.section .text.sub_80D0DD8, "ax", %progbits
@ GameIntroPrepareNintendofx @ JP 0x080D0DD8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global GameIntroPrepareNintendofx
	.thumb_func
GameIntroPrepareNintendofx:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r7, r0, #0
	movs r0, #1
	bl sub_800226C
	movs r0, #0
	bl sub_8001ACC
	movs r0, #0
	bl SetPrimaryHBlankHandler
	ldr r5, _080D0E98 @ =0x03003020
	ldrb r1, [r5, #1]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	mov sl, r1
	ands r0, r1
	subs r1, #2
	mov sb, r1
	ands r0, r1
	subs r1, #4
	mov r8, r1
	ands r0, r1
	movs r6, #0x11
	rsbs r6, r6, #0
	ands r0, r6
	strb r0, [r5, #1]
	ldr r0, _080D0E9C @ =0x08BAA2E0
	movs r1, #0xc0
	lsls r1, r1, #0x13
	bl sub_8013008
	ldr r0, _080D0EA0 @ =0x08BAB2DC
	ldr r4, _080D0EA4 @ =0x02020188
	adds r1, r4, #0
	bl sub_8013008
	ldr r0, _080D0EA8 @ =0x02022CA8
	adds r1, r4, #0
	movs r2, #0
	bl j_TmApplyTsa
	ldr r0, _080D0EAC @ =0x08BAA71C
	ldr r1, _080D0EB0 @ =0x06002000
	bl sub_8013008
	ldr r0, _080D0EB4 @ =0x08BAB41C
	adds r1, r4, #0
	bl sub_8013008
	ldr r0, _080D0EB8 @ =0x020234A8
	movs r2, #0x88
	lsls r2, r2, #5
	adds r1, r4, #0
	bl j_TmApplyTsa
	movs r4, #0
	str r4, [sp]
	ldr r1, _080D0EBC @ =0x020228A8
	ldr r2, _080D0EC0 @ =0x01000100
	mov r0, sp
	bl sub_80D636C
	bl sub_8001EE4
	movs r0, #3
	bl BG_EnableSyncByMask
	ldrb r0, [r5, #1]
	movs r1, #1
	orrs r0, r1
	mov r1, sl
	ands r0, r1
	mov r1, sb
	ands r0, r1
	mov r1, r8
	ands r0, r1
	ands r0, r6
	strb r0, [r5, #1]
	str r4, [r7, #0x2c]
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080D0E98: .4byte 0x03003020
_080D0E9C: .4byte 0x08BAA2E0
_080D0EA0: .4byte 0x08BAB2DC
_080D0EA4: .4byte 0x02020188
_080D0EA8: .4byte 0x02022CA8
_080D0EAC: .4byte 0x08BAA71C
_080D0EB0: .4byte 0x06002000
_080D0EB4: .4byte 0x08BAB41C
_080D0EB8: .4byte 0x020234A8
_080D0EBC: .4byte 0x020228A8
_080D0EC0: .4byte 0x01000100

