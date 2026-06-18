	.syntax unified
	.set PutSprite, 0x080052F0 + 1
	.set sub_80C7264, 0x080C7264 + 1
	.section .text.sub_80C5F68, "ax", %progbits
@ GmapEffect_0 @ JP 0x080C5F68 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global GmapEffect_0
	.thumb_func
GmapEffect_0:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	mov r8, r0
	ldr r2, _080C5F94 @ =0x03005270
	ldrb r1, [r2]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _080C5F98
	mov r4, sp
	adds r4, #6
	add r0, sp, #4
	adds r1, r4, #0
	bl sub_80C7264
	mov sl, r4
	b _080C5FA6
	.align 2, 0
_080C5F94: .4byte 0x03005270
_080C5F98:
	add r1, sp, #4
	ldrh r0, [r2, #2]
	strh r0, [r1]
	adds r1, #2
	ldrh r0, [r2, #4]
	strh r0, [r1]
	mov sl, r1
_080C5FA6:
	movs r6, #0
	movs r0, #0x2a
	add r0, r8
	mov sb, r0
_080C5FAE:
	mov r1, sb
	ldrb r2, [r1]
	lsls r2, r2, #5
	lsls r0, r6, #3
	ldr r1, _080C6014 @ =0x08AC2360
	adds r0, r0, r1
	adds r4, r2, r0
	movs r2, #5
	ldrsb r2, [r4, r2]
	mov r3, r8
	ldrh r3, [r3, #0x2c]
	adds r2, r2, r3
	add r0, sp, #4
	ldrh r0, [r0]
	subs r2, r2, r0
	lsls r2, r2, #0x10
	movs r0, #6
	ldrsb r0, [r4, r0]
	mov r1, r8
	ldrh r1, [r1, #0x2e]
	adds r0, r0, r1
	mov r3, sl
	ldrh r1, [r3]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	asrs r5, r0, #0x10
	asrs r7, r2, #0x10
	movs r0, #0x80
	lsls r0, r0, #0xe
	adds r2, r2, r0
	lsrs r2, r2, #0x10
	movs r1, #0x88
	lsls r1, r1, #1
	cmp r2, r1
	bhi _080C603A
	adds r0, r5, #0
	adds r0, #0x20
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xc0
	bhi _080C603A
	ldr r0, _080C6018 @ =0x03005270
	ldrb r1, [r0]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _080C601C
	movs r2, #0xc
	movs r1, #0xc0
	lsls r1, r1, #4
	b _080C6022
	.align 2, 0
_080C6014: .4byte 0x08AC2360
_080C6018: .4byte 0x03005270
_080C601C:
	movs r2, #0xd
	movs r1, #0x80
	lsls r1, r1, #4
_080C6022:
	ldr r3, [r4]
	ldrb r0, [r4, #4]
	movs r4, #0xc3
	lsls r4, r4, #7
	adds r1, r1, r4
	adds r0, r0, r1
	str r0, [sp]
	adds r0, r2, #0
	adds r1, r7, #0
	adds r2, r5, #0
	bl PutSprite
_080C603A:
	adds r6, #1
	cmp r6, #3
	ble _080C5FAE
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

