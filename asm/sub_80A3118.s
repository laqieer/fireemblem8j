	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set InitText, 0x08003C8C + 1
	.set SetBlendConfig, 0x08001DF0 + 1
	.set j_TmApplyTsa, 0x080DC0DC + 1
	.set sub_800783C, 0x0800783C + 1
	.set sub_8013008, 0x08013008 + 1
	.set sub_809AF14, 0x0809AF14 + 1
	.set sub_80A2D48, 0x080A2D48 + 1
	.set sub_80A3018, 0x080A3018 + 1
	.set sub_80B1F1C, 0x080B1F1C + 1
	.set sub_80B1F40, 0x080B1F40 + 1
	.section .text.sub_80A3118, "ax", %progbits
@ sub_80A3118 @ JP 0x080A3118 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A3118
	.thumb_func
sub_80A3118:
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #4
	adds r5, r0, #0
	bl sub_80A2D48
	movs r0, #0xa0
	lsls r0, r0, #7
	movs r1, #5
	bl sub_809AF14
	ldr r0, _080A3210 @ =0x08A9A9E0
	ldr r4, _080A3214 @ =0x02020188
	adds r1, r4, #0
	bl sub_8013008
	ldr r0, _080A3218 @ =0x020234A8
	movs r2, #0xa5
	lsls r2, r2, #7
	adds r1, r4, #0
	bl j_TmApplyTsa
	movs r0, #7
	bl BG_EnableSyncByMask
	adds r0, r5, #0
	bl sub_80B1F1C
	movs r0, #0xc0
	lsls r0, r0, #3
	movs r1, #1
	bl sub_80B1F40
	ldr r6, _080A321C @ =0x03003020
	ldrb r1, [r6, #1]
	movs r0, #0x21
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r6, #1]
	adds r1, r6, #0
	adds r1, #0x2d
	movs r0, #0x80
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x28
	strb r0, [r1]
	subs r1, #5
	movs r0, #0xe0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x98
	strb r0, [r1]
	movs r0, #0x34
	adds r0, r0, r6
	mov r8, r0
	ldrb r1, [r0]
	movs r5, #1
	orrs r1, r5
	movs r2, #2
	orrs r1, r2
	movs r0, #4
	orrs r1, r0
	movs r4, #8
	orrs r1, r4
	movs r3, #0x10
	orrs r1, r3
	adds r6, #0x36
	ldrb r0, [r6]
	orrs r0, r5
	orrs r0, r2
	movs r2, #5
	rsbs r2, r2, #0
	ands r0, r2
	orrs r0, r4
	orrs r0, r3
	movs r2, #0x20
	orrs r1, r2
	mov r3, r8
	strb r1, [r3]
	orrs r0, r2
	strb r0, [r6]
	movs r0, #0
	movs r1, #8
	movs r2, #8
	movs r3, #8
	bl SetBlendConfig
	ldr r5, _080A3220 @ =0x02013498
	movs r4, #5
_080A31D6:
	adds r0, r5, #0
	movs r1, #8
	bl InitText
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bge _080A31D6
	ldr r0, _080A3224 @ =0x02013580
	movs r1, #8
	bl InitText
	bl sub_80A3018
	movs r0, #0
	str r0, [sp]
	movs r0, #4
	movs r1, #0xd8
	movs r2, #0x58
	movs r3, #0x82
	bl sub_800783C
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A3210: .4byte 0x08A9A9E0
_080A3214: .4byte 0x02020188
_080A3218: .4byte 0x020234A8
_080A321C: .4byte 0x03003020
_080A3220: .4byte 0x02013498
_080A3224: .4byte 0x02013580

