	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set NewEkrsubAnimeEmulator, 0x08073BBC + 1
	.set RegisterDataMove, 0x08001F64 + 1
	.set sub_8001EE4, 0x08001EE4 + 1
	.set sub_805BBFC, 0x0805BBFC + 1
	.set sub_80D636C, 0x080D636C + 1
	.set sub_80D6394, 0x080D6394 + 1
	.section .text.sub_805B80C, "ax", %progbits
@ sub_805B80C @ JP 0x0805B80C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_805B80C
	.thumb_func
sub_805B80C:
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0xc
	adds r6, r0, #0
	movs r0, #0
	ldrsh r1, [r6, r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	ldr r2, _0805B874 @ =0x08EE0008
	adds r0, r0, r2
	mov r8, r0
	movs r0, #6
	ldrsh r1, [r6, r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r5, r0, r2
	movs r1, #0
	ldrsh r0, [r6, r1]
	movs r4, #1
	rsbs r4, r4, #0
	cmp r0, r4
	beq _0805B84A
	mov r2, r8
	ldr r0, [r2, #0xc]
	ldr r1, [r6, #0x20]
	bl sub_80D6394
_0805B84A:
	movs r1, #6
	ldrsh r0, [r6, r1]
	cmp r0, r4
	beq _0805B860
	ldr r0, [r5, #0xc]
	ldr r1, [r6, #0x20]
	movs r2, #0x80
	lsls r2, r2, #5
	adds r1, r1, r2
	bl sub_80D6394
_0805B860:
	movs r1, #0xc
	ldrsh r0, [r6, r1]
	cmp r0, #3
	bgt _0805B878
	cmp r0, #1
	bge _0805B886
	cmp r0, #0
	beq _0805B87C
	b _0805B886
	.align 2, 0
_0805B874: .4byte 0x08EE0008
_0805B878:
	cmp r0, #4
	bne _0805B886
_0805B87C:
	ldr r3, [r6, #0x20]
	movs r2, #0x80
	lsls r2, r2, #5
	adds r7, r3, r2
	b _0805B894
_0805B886:
	ldr r0, [r6, #0x20]
	movs r1, #0x80
	lsls r1, r1, #4
	adds r3, r0, r1
	movs r2, #0xc0
	lsls r2, r2, #5
	adds r7, r0, r2
_0805B894:
	mov r0, r8
	ldr r0, [r0, #0x10]
	mov r8, r0
	ldr r5, [r5, #0x10]
	mov sb, r5
	movs r1, #0xe
	ldrsh r4, [r6, r1]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r4, r0
	beq _0805B918
	cmp r4, r0
	blt _0805B978
	cmp r4, #3
	bgt _0805B978
	movs r2, #4
	ldrsh r0, [r6, r2]
	adds r0, #0x40
	lsls r0, r0, #5
	movs r4, #0xc0
	lsls r4, r4, #0x13
	adds r0, r0, r4
	ldr r1, [r6, #0x1c]
	adds r1, r1, r0
	movs r5, #0x80
	lsls r5, r5, #4
	adds r0, r3, #0
	adds r2, r5, #0
	bl RegisterDataMove
	movs r1, #0xa
	ldrsh r0, [r6, r1]
	lsls r0, r0, #5
	adds r0, r0, r4
	ldr r1, [r6, #0x1c]
	adds r1, r1, r0
	adds r0, r7, #0
	adds r2, r5, #0
	bl RegisterDataMove
	movs r2, #2
	ldrsh r1, [r6, r2]
	lsls r1, r1, #5
	ldr r4, _0805B914 @ =0x020228A8
	adds r1, r1, r4
	mov r0, r8
	movs r2, #8
	bl sub_80D636C
	movs r0, #8
	ldrsh r1, [r6, r0]
	lsls r1, r1, #5
	adds r1, r1, r4
	mov r0, sb
	movs r2, #8
	bl sub_80D636C
	bl sub_8001EE4
	adds r0, r6, #0
	bl sub_805BBFC
	b _0805B978
	.align 2, 0
_0805B914: .4byte 0x020228A8
_0805B918:
	movs r1, #0
	ldrsh r0, [r6, r1]
	cmp r0, r4
	beq _0805B946
	movs r2, #4
	ldrsh r0, [r6, r2]
	lsls r0, r0, #5
	ldr r1, [r6, #0x1c]
	adds r1, r1, r0
	movs r2, #0x80
	lsls r2, r2, #4
	adds r0, r3, #0
	bl RegisterDataMove
	movs r0, #2
	ldrsh r1, [r6, r0]
	lsls r1, r1, #5
	ldr r0, _0805B990 @ =0x02022AA8
	adds r1, r1, r0
	mov r0, r8
	movs r2, #8
	bl sub_80D636C
_0805B946:
	movs r1, #6
	ldrsh r0, [r6, r1]
	cmp r0, r4
	beq _0805B974
	movs r2, #0xa
	ldrsh r0, [r6, r2]
	lsls r0, r0, #5
	ldr r1, [r6, #0x1c]
	adds r1, r1, r0
	movs r2, #0x80
	lsls r2, r2, #4
	adds r0, r7, #0
	bl RegisterDataMove
	movs r0, #8
	ldrsh r1, [r6, r0]
	lsls r1, r1, #5
	ldr r0, _0805B990 @ =0x02022AA8
	adds r1, r1, r0
	mov r0, sb
	movs r2, #8
	bl sub_80D636C
_0805B974:
	bl sub_8001EE4
_0805B978:
	ldrh r0, [r6, #0xe]
	adds r0, #1
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #4
	bls _0805B986
	b _0805BBA6
_0805B986:
	lsls r0, r0, #2
	ldr r1, _0805B994 @ =_0805B998
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0805B990: .4byte 0x02022AA8
_0805B994: .4byte _0805B998
_0805B998: @ jump table
	.4byte _0805B9CC @ case 0
	.4byte _0805B9AC @ case 1
	.4byte _0805B9B4 @ case 2
	.4byte _0805B9BC @ case 3
	.4byte _0805B9C4 @ case 4
_0805B9AC:
	movs r0, #1
	bl BG_EnableSyncByMask
	b _0805BBA6
_0805B9B4:
	movs r0, #2
	bl BG_EnableSyncByMask
	b _0805BBA6
_0805B9BC:
	movs r0, #4
	bl BG_EnableSyncByMask
	b _0805BBA6
_0805B9C4:
	movs r0, #8
	bl BG_EnableSyncByMask
	b _0805BBA6
_0805B9CC:
	movs r0, #0
	str r0, [r6, #0x14]
	str r0, [r6, #0x18]
	movs r2, #6
	ldrsh r1, [r6, r2]
	subs r0, #1
	cmp r1, r0
	beq _0805BABA
	movs r1, #0xc
	ldrsh r0, [r6, r1]
	cmp r0, #4
	bhi _0805BABA
	lsls r0, r0, #2
	ldr r1, _0805B9F0 @ =_0805B9F4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0805B9F0: .4byte _0805B9F4
_0805B9F4: @ jump table
	.4byte _0805BA08 @ case 0
	.4byte _0805BA34 @ case 1
	.4byte _0805BA60 @ case 2
	.4byte _0805BA8C @ case 3
	.4byte _0805BA08 @ case 4
_0805BA08:
	movs r2, #8
	ldrsh r0, [r6, r2]
	lsls r0, r0, #0xc
	ldrh r1, [r6, #0xa]
	orrs r0, r1
	movs r2, #0xc0
	lsls r2, r2, #4
	adds r1, r2, #0
	orrs r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r2, _0805BA30 @ =0x085F15E8
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	movs r0, #4
	str r0, [sp, #8]
	movs r0, #0xa8
	b _0805BAB0
	.align 2, 0
_0805BA30: .4byte 0x085F15E8
_0805BA34:
	movs r1, #8
	ldrsh r0, [r6, r1]
	lsls r0, r0, #0xc
	ldrh r1, [r6, #0xa]
	orrs r0, r1
	movs r2, #0xc0
	lsls r2, r2, #4
	adds r1, r2, #0
	orrs r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r2, _0805BA5C @ =0x085F14DC
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	movs r0, #4
	str r0, [sp, #8]
	movs r0, #0xb0
	b _0805BAB0
	.align 2, 0
_0805BA5C: .4byte 0x085F14DC
_0805BA60:
	movs r1, #8
	ldrsh r0, [r6, r1]
	lsls r0, r0, #0xc
	ldrh r1, [r6, #0xa]
	orrs r0, r1
	movs r2, #0xc0
	lsls r2, r2, #4
	adds r1, r2, #0
	orrs r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r2, _0805BA88 @ =0x085F14DC
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	movs r0, #4
	str r0, [sp, #8]
	movs r0, #0xb0
	b _0805BAB0
	.align 2, 0
_0805BA88: .4byte 0x085F14DC
_0805BA8C:
	movs r1, #8
	ldrsh r0, [r6, r1]
	lsls r0, r0, #0xc
	ldrh r1, [r6, #0xa]
	orrs r0, r1
	movs r2, #0xc0
	lsls r2, r2, #4
	adds r1, r2, #0
	orrs r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r2, _0805BAD8 @ =0x085F14DC
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	movs r0, #4
	str r0, [sp, #8]
	movs r0, #0x80
_0805BAB0:
	movs r1, #0x68
	movs r3, #2
	bl NewEkrsubAnimeEmulator
	str r0, [r6, #0x18]
_0805BABA:
	movs r0, #0
	ldrsh r1, [r6, r0]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _0805BBA6
	movs r1, #0xc
	ldrsh r0, [r6, r1]
	cmp r0, #4
	bhi _0805BBA6
	lsls r0, r0, #2
	ldr r1, _0805BADC @ =_0805BAE0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0805BAD8: .4byte 0x085F14DC
_0805BADC: .4byte _0805BAE0
_0805BAE0: @ jump table
	.4byte _0805BAF4 @ case 0
	.4byte _0805BB20 @ case 1
	.4byte _0805BB4C @ case 2
	.4byte _0805BB78 @ case 3
	.4byte _0805BAF4 @ case 4
_0805BAF4:
	movs r2, #2
	ldrsh r0, [r6, r2]
	lsls r0, r0, #0xc
	ldrh r1, [r6, #4]
	orrs r0, r1
	movs r2, #0xc0
	lsls r2, r2, #4
	adds r1, r2, #0
	orrs r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r2, _0805BB1C @ =0x085F1668
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	movs r0, #4
	str r0, [sp, #8]
	movs r0, #0x48
	b _0805BB9C
	.align 2, 0
_0805BB1C: .4byte 0x085F1668
_0805BB20:
	movs r1, #2
	ldrsh r0, [r6, r1]
	lsls r0, r0, #0xc
	ldrh r1, [r6, #4]
	orrs r0, r1
	movs r2, #0xc0
	lsls r2, r2, #4
	adds r1, r2, #0
	orrs r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r2, _0805BB48 @ =0x085F1568
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	movs r0, #4
	str r0, [sp, #8]
	movs r0, #0x20
	b _0805BB9C
	.align 2, 0
_0805BB48: .4byte 0x085F1568
_0805BB4C:
	movs r1, #2
	ldrsh r0, [r6, r1]
	lsls r0, r0, #0xc
	ldrh r1, [r6, #4]
	orrs r0, r1
	movs r2, #0xc0
	lsls r2, r2, #4
	adds r1, r2, #0
	orrs r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r2, _0805BB74 @ =0x085F1568
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	movs r0, #4
	str r0, [sp, #8]
	movs r0, #0x40
	b _0805BB9C
	.align 2, 0
_0805BB74: .4byte 0x085F1568
_0805BB78:
	movs r1, #2
	ldrsh r0, [r6, r1]
	lsls r0, r0, #0xc
	ldrh r1, [r6, #4]
	orrs r0, r1
	movs r2, #0xc0
	lsls r2, r2, #4
	adds r1, r2, #0
	orrs r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r2, _0805BBB4 @ =0x085F1668
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	movs r0, #4
	str r0, [sp, #8]
	movs r0, #0x78
_0805BB9C:
	movs r1, #0x68
	movs r3, #2
	bl NewEkrsubAnimeEmulator
	str r0, [r6, #0x14]
_0805BBA6:
	add sp, #0xc
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805BBB4: .4byte 0x085F1668

