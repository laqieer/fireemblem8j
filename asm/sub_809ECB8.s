	.syntax unified
	.set Proc_Goto, 0x08002E74 + 1
	.set m4aSongNumStart, 0x080D4EF4 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_809C5EC, 0x0809C5EC + 1
	.set sub_809EC7C, 0x0809EC7C + 1
	.set sub_80B1524, 0x080B1524 + 1
	.set sub_80B1FBC, 0x080B1FBC + 1
	.set sub_80B2004, 0x080B2004 + 1
	.section .text.sub_809ECB8, "ax", %progbits
@ sub_809ECB8 @ JP 0x0809ECB8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_809ECB8
	.thumb_func
sub_809ECB8:
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r7, [r4, #0x3c]
	ldr r0, _0809ED10 @ =0x0000A440
	str r0, [sp]
	movs r0, #0x88
	movs r1, #0x64
	movs r2, #0xb
	movs r3, #4
	bl sub_809C5EC
	ldr r5, _0809ED14 @ =0x085775CC
	ldr r3, [r5]
	ldrh r1, [r3, #8]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0809ED1C
	ldr r1, [r4, #0x30]
	lsls r1, r1, #4
	adds r1, #0x48
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x10
	movs r2, #0xb
	bl sub_80B1FBC
	movs r0, #0
	bl sub_80B1524
	bl sub_809EC7C
	ldr r0, _0809ED18 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809ED7E
	movs r0, #0x6b
	bl m4aSongNumStart
	b _0809ED7E
	.align 2, 0
_0809ED10: .4byte 0x0000A440
_0809ED14: .4byte 0x085775CC
_0809ED18: .4byte 0x0202BCEC
_0809ED1C:
	movs r6, #1
	adds r2, r6, #0
	ands r2, r1
	cmp r2, #0
	beq _0809ED8C
	bl sub_809EC7C
	ldr r0, [r4, #0x3c]
	cmp r0, #0
	bne _0809ED54
	bl sub_80B2004
	ldr r0, _0809ED50 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809ED46
	movs r0, #0x6a
	bl m4aSongNumStart
_0809ED46:
	adds r0, r4, #0
	movs r1, #3
	bl Proc_Goto
	b _0809EDCE
	.align 2, 0
_0809ED50: .4byte 0x0202BCEC
_0809ED54:
	ldr r1, [r4, #0x30]
	lsls r1, r1, #4
	adds r1, #0x48
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x10
	movs r2, #0xb
	bl sub_80B1FBC
	ldr r0, _0809ED88 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809ED78
	movs r0, #0x6b
	bl m4aSongNumStart
_0809ED78:
	movs r0, #0
	bl sub_80B1524
_0809ED7E:
	adds r0, r4, #0
	bl sub_8002DE4
	b _0809EDCE
	.align 2, 0
_0809ED88: .4byte 0x0202BCEC
_0809ED8C:
	ldrh r1, [r3, #6]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0809ED98
	str r2, [r4, #0x3c]
_0809ED98:
	ldr r0, [r5]
	ldrh r1, [r0, #6]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _0809EDA6
	str r6, [r4, #0x3c]
_0809EDA6:
	ldr r0, [r4, #0x3c]
	cmp r7, r0
	beq _0809EDCE
	lsls r0, r0, #5
	adds r0, #0x94
	movs r3, #0x80
	lsls r3, r3, #4
	movs r1, #0x78
	movs r2, #0
	bl sub_80B1FBC
	ldr r0, _0809EDD8 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809EDCE
	movs r0, #0x67
	bl m4aSongNumStart
_0809EDCE:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809EDD8: .4byte 0x0202BCEC

