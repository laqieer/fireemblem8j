	.syntax unified
	.set sub_8001EF0, 0x08001EF0 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8012E84, 0x08012E84 + 1
	.set sub_80D636C, 0x080D636C + 1
	.section .text.sub_806D668, "ax", %progbits
@ EfxmagicShadowshot_FadeToBlack_Loop @ JP 0x0806D668 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global EfxmagicShadowshot_FadeToBlack_Loop
	.thumb_func
EfxmagicShadowshot_FadeToBlack_Loop:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	str r0, [sp, #4]
	ldr r7, _0806D694 @ =0x020228A8
	ldr r6, _0806D698 @ =0x020165C8
	adds r0, #0x4c
	movs r2, #0
	ldrsh r1, [r0, r2]
	cmp r1, #0x14
	ble _0806D69C
	adds r3, r1, #0
	subs r3, #0x14
	movs r0, #0xc
	str r0, [sp]
	movs r0, #0
	movs r1, #0x10
	movs r2, #0
	b _0806D6B4
	.align 2, 0
_0806D694: .4byte 0x020228A8
_0806D698: .4byte 0x020165C8
_0806D69C:
	cmp r1, #0xc
	ble _0806D6A6
	movs r2, #0x10
	mov sl, r2
	b _0806D6BA
_0806D6A6:
	movs r1, #0
	ldrsh r3, [r0, r1]
	movs r0, #0xc
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0x10
_0806D6B4:
	bl sub_8012E84
	mov sl, r0
_0806D6BA:
	ldrh r0, [r7]
	strh r0, [r6]
	movs r4, #0
	ldr r2, [sp, #4]
	adds r2, #0x4c
	str r2, [sp, #8]
_0806D6C6:
	subs r0, r4, #2
	cmp r0, #0x1c
	bhi _0806D764
	lsls r0, r0, #2
	ldr r1, _0806D6D8 @ =_0806D6DC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0806D6D8: .4byte _0806D6DC
_0806D6DC: @ jump table
	.4byte _0806D750 @ case 0
	.4byte _0806D750 @ case 1
	.4byte _0806D764 @ case 2
	.4byte _0806D764 @ case 3
	.4byte _0806D764 @ case 4
	.4byte _0806D764 @ case 5
	.4byte _0806D764 @ case 6
	.4byte _0806D764 @ case 7
	.4byte _0806D764 @ case 8
	.4byte _0806D764 @ case 9
	.4byte _0806D764 @ case 10
	.4byte _0806D764 @ case 11
	.4byte _0806D764 @ case 12
	.4byte _0806D764 @ case 13
	.4byte _0806D750 @ case 14
	.4byte _0806D764 @ case 15
	.4byte _0806D764 @ case 16
	.4byte _0806D764 @ case 17
	.4byte _0806D764 @ case 18
	.4byte _0806D750 @ case 19
	.4byte _0806D750 @ case 20
	.4byte _0806D764 @ case 21
	.4byte _0806D764 @ case 22
	.4byte _0806D764 @ case 23
	.4byte _0806D764 @ case 24
	.4byte _0806D750 @ case 25
	.4byte _0806D750 @ case 26
	.4byte _0806D750 @ case 27
	.4byte _0806D750 @ case 28
_0806D750:
	adds r0, r7, #0
	adds r1, r6, #0
	movs r2, #8
	bl sub_80D636C
	adds r7, #0x20
	adds r6, #0x20
	adds r4, #1
	mov sb, r4
	b _0806D7C2
_0806D764:
	adds r7, #2
	adds r6, #2
	adds r4, #1
	mov sb, r4
	movs r0, #0x1f
	mov r8, r0
	movs r5, #0x1f
	movs r0, #0x10
	mov r1, sl
	subs r4, r0, r1
	movs r2, #0xe
	mov ip, r2
_0806D77C:
	ldrh r1, [r7]
	adds r0, r5, #0
	ands r0, r1
	adds r3, r0, #0
	muls r3, r4, r3
	asrs r3, r3, #4
	lsls r1, r1, #0x10
	lsrs r0, r1, #0x15
	mov r2, r8
	ands r0, r2
	adds r2, r0, #0
	muls r2, r4, r2
	asrs r2, r2, #4
	lsrs r1, r1, #0x1a
	mov r0, r8
	ands r1, r0
	adds r0, r1, #0
	muls r0, r4, r0
	asrs r0, r0, #4
	ands r0, r5
	lsls r0, r0, #0xa
	ands r2, r5
	lsls r2, r2, #5
	orrs r0, r2
	ands r3, r5
	orrs r3, r0
	strh r3, [r6]
	adds r7, #2
	adds r6, #2
	movs r1, #1
	rsbs r1, r1, #0
	add ip, r1
	mov r2, ip
	cmp r2, #0
	bge _0806D77C
_0806D7C2:
	mov r4, sb
	cmp r4, #0x1f
	bgt _0806D7CA
	b _0806D6C6
_0806D7CA:
	ldr r0, _0806D804 @ =0x020165C8
	movs r1, #0xa0
	lsls r1, r1, #0x13
	movs r2, #0x80
	lsls r2, r2, #1
	bl sub_80D636C
	bl sub_8001EF0
	ldr r1, [sp, #8]
	movs r2, #0
	ldrsh r0, [r1, r2]
	cmp r0, #0x20
	bne _0806D7EC
	ldr r0, [sp, #4]
	bl sub_8002DE4
_0806D7EC:
	ldr r1, [sp, #8]
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806D804: .4byte 0x020165C8

