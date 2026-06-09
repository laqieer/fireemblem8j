	.syntax unified
	.set GetSaveWriteAddr, 0x080A7AA8 + 1
	.set SioStrCpy, 0x08042D4C + 1
	.set WriteAndVerifySramFast, 0x080D6548 + 1
	.set sub_8009FE4, 0x08009FE4 + 1
	.set sub_80A79D8, 0x080A79D8 + 1
	.set sub_80D6370, 0x080D6370 + 1
	.section .text.sub_80AAF78, "ax", %progbits
@ sub_80AAF78 @ JP 0x080AAF78 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80AAF78
	.thumb_func
sub_80AAF78:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x80
	movs r0, #5
	bl GetSaveWriteAddr
	mov sb, r0
	add r0, sp, #0x6c
	movs r4, #0
	strh r4, [r0]
	add r5, sp, #0x24
	ldr r2, _080AB0C0 @ =0x01000012
	adds r1, r5, #0
	bl sub_80D6370
	mov r0, sp
	adds r0, #0x6e
	strh r4, [r0]
	add r4, sp, #0x48
	ldr r2, _080AB0C4 @ =0x01000007
	adds r1, r4, #0
	bl sub_80D6370
	movs r7, #0
	mov r8, r5
	add r0, sp, #0x70
	mov sl, r0
	mov r1, sp
	adds r1, #0x58
	str r1, [sp, #0x78]
	mov r3, sp
	adds r3, #0x5c
	str r3, [sp, #0x7c]
	mov r5, sp
	adds r5, #0x14
	str r5, [sp, #0x74]
	mov r6, sb
_080AAFC8:
	movs r0, #0xc4
	muls r0, r7, r0
	adds r0, #0x10
	mov r1, sb
	adds r4, r1, r0
	movs r5, #4
_080AAFD4:
	mov r0, r8
	adds r1, r4, #0
	movs r2, #0x24
	bl WriteAndVerifySramFast
	adds r4, #0x24
	subs r5, #1
	cmp r5, #0
	bge _080AAFD4
	add r0, sp, #0x48
	adds r1, r6, #0
	movs r2, #0xf
	bl WriteAndVerifySramFast
	adds r6, #0xc4
	adds r7, #1
	cmp r7, #9
	ble _080AAFC8
	movs r0, #7
	mov r3, sl
	strh r0, [r3]
	movs r1, #0xf5
	lsls r1, r1, #3
	add r1, sb
	mov r0, sl
	movs r2, #2
	bl WriteAndVerifySramFast
	movs r7, #0
	ldr r5, [sp, #0x78]
	mov r8, r5
	movs r0, #3
	mov sl, r0
	ldr r6, _080AB0C8 @ =0x000007AC
	add r6, sb
	movs r1, #0
	mov sb, r1
_080AB01E:
	ldr r4, _080AB0CC @ =0x081F56BC
	lsls r3, r7, #2
	mov ip, r3
	add r4, sb
	ldrb r3, [r4]
	lsls r1, r3, #0x1e
	lsrs r1, r1, #0x1e
	mov r5, sl
	ands r1, r5
	mov r0, r8
	ldrb r2, [r0]
	movs r5, #4
	rsbs r5, r5, #0
	adds r0, r5, #0
	ands r2, r0
	orrs r2, r1
	lsls r0, r3, #0x1c
	lsrs r0, r0, #0x1e
	mov r1, sl
	ands r0, r1
	lsls r0, r0, #2
	subs r5, #9
	adds r1, r5, #0
	ands r2, r1
	orrs r2, r0
	movs r1, #0x10
	ands r1, r3
	movs r3, #0x11
	rsbs r3, r3, #0
	adds r0, r3, #0
	ands r2, r0
	orrs r2, r1
	mov r5, r8
	strb r2, [r5]
	ldr r2, [r4]
	lsrs r2, r2, #5
	lsls r2, r2, #5
	ldr r0, [sp, #0x58]
	movs r1, #0x1f
	ands r0, r1
	orrs r0, r2
	str r0, [sp, #0x58]
	ldr r0, _080AB0D0 @ =0x08A9CA34
	mov r1, ip
	adds r5, r1, r0
	ldr r0, [r5]
	mov r1, sp
	bl sub_8009FE4
	mov r0, sp
	ldr r1, [sp, #0x7c]
	bl SioStrCpy
	mov r0, r8
	adds r1, r6, #0
	movs r2, #0x14
	bl WriteAndVerifySramFast
	adds r6, #0x14
	movs r3, #0x14
	add sb, r3
	adds r7, #1
	cmp r7, #9
	ble _080AB01E
	ldr r0, _080AB0D4 @ =0x00020112
	str r0, [sp, #0x14]
	movs r0, #2
	ldr r5, [sp, #0x74]
	strb r0, [r5, #6]
	ldr r0, [sp, #0x74]
	movs r1, #5
	bl sub_80A79D8
	add sp, #0x80
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080AB0C0: .4byte 0x01000012
_080AB0C4: .4byte 0x01000007
_080AB0C8: .4byte 0x000007AC
_080AB0CC: .4byte 0x081F56BC
_080AB0D0: .4byte 0x08A9CA34
_080AB0D4: .4byte 0x00020112

