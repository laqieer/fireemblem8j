	.syntax unified
	.set AP_Update, 0x080091AC + 1
	.set PutSpriteExt, 0x08005330 + 1
	.set sub_80C0574, 0x080C0574 + 1
	.section .text.sub_80C05C8, "ax", %progbits
@ GmapScreen2_Loop @ JP 0x080C05C8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global GmapScreen2_Loop
	.thumb_func
GmapScreen2_Loop:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	mov sb, r0
	mov r2, sb
	adds r2, #0x32
	ldrb r1, [r2]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _080C05E6
	b _080C07CA
_080C05E6:
	mov r1, sb
	ldr r0, [r1, #0x2c]
	lsrs r0, r0, #5
	str r0, [sp, #0xc]
	movs r0, #0
	mov r8, r0
	str r2, [sp, #0x10]
	add r1, sp, #4
	mov sl, r1
_080C05F8:
	ldr r0, _080C0620 @ =0x03005270
	mov r2, r8
	lsls r1, r2, #2
	adds r1, r1, r0
	adds r1, #0x30
	ldrb r2, [r1]
	movs r0, #1
	ands r0, r2
	cmp r0, #0
	beq _080C06D0
	mov r0, r8
	lsls r1, r0, #5
	ldr r0, _080C0624 @ =0x081F5D7C
	adds r6, r1, r0
	movs r0, #2
	ands r0, r2
	cmp r0, #0
	beq _080C0628
	ldrb r0, [r6, #2]
	b _080C062A
	.align 2, 0
_080C0620: .4byte 0x03005270
_080C0624: .4byte 0x081F5D7C
_080C0628:
	ldrb r0, [r6, #3]
_080C062A:
	lsls r0, r0, #4
	ldr r1, _080C0710 @ =0x081F5C6C
	adds r5, r0, r1
	movs r1, #8
	ldrsb r1, [r5, r1]
	ldrh r0, [r6, #0x18]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	asrs r7, r0, #0x10
	movs r1, #9
	ldrsb r1, [r5, r1]
	ldrh r0, [r6, #0x1a]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	asrs r6, r0, #0x10
	mov r1, sb
	ldr r0, [r1, #0x3c]
	mov r4, sp
	adds r4, #6
	str r4, [sp]
	adds r1, r7, #0
	adds r2, r6, #0
	add r3, sp, #4
	bl sub_80C0574
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080C06D0
	mov r2, sl
	ldrh r0, [r2]
	ldr r2, _080C0714 @ =0x000001FF
	adds r1, r2, #0
	ands r0, r1
	mov r1, sl
	strh r0, [r1]
	ldrb r3, [r4]
	strh r3, [r4]
	mov r0, r8
	cmp r0, #0
	bge _080C067C
	adds r0, #0x1f
_080C067C:
	asrs r0, r0, #5
	lsls r0, r0, #2
	mov r2, sb
	adds r2, #0x34
	adds r2, r2, r0
	movs r0, #0x1f
	mov r1, r8
	ands r0, r1
	movs r1, #1
	lsls r1, r0
	ldr r0, [r2]
	ands r0, r1
	cmp r0, #0
	beq _080C06A2
	movs r2, #0x80
	lsls r2, r2, #3
	adds r0, r2, #0
	orrs r3, r0
	strh r3, [r4]
_080C06A2:
	mov r0, sl
	movs r2, #0
	ldrsh r1, [r0, r2]
	movs r0, #0
	ldrsh r2, [r4, r0]
	ldr r3, [r5, #4]
	ldrh r4, [r5]
	ldr r0, [sp, #0xc]
	adds r4, r0, r4
	mov r0, sb
	adds r0, #0x30
	ldrb r5, [r0]
	movs r0, #0xf
	ands r0, r5
	lsls r0, r0, #0xc
	adds r4, r4, r0
	movs r0, #0x80
	lsls r0, r0, #4
	adds r4, r4, r0
	str r4, [sp]
	movs r0, #0xc
	bl PutSpriteExt
_080C06D0:
	movs r1, #1
	add r8, r1
	mov r2, r8
	cmp r2, #0x1c
	ble _080C05F8
	ldr r0, [sp, #0x10]
	ldrb r1, [r0]
	movs r4, #2
	adds r0, r4, #0
	ands r0, r1
	cmp r0, #0
	beq _080C07CA
	mov r3, sb
	adds r3, #0x33
	ldrb r0, [r3]
	lsls r2, r0, #5
	ldr r1, _080C0718 @ =0x081F5D7C
	adds r6, r2, r1
	ldr r2, _080C071C @ =0x03005270
	lsls r0, r0, #2
	adds r0, r0, r2
	adds r0, #0x30
	ldrb r1, [r0]
	adds r0, r4, #0
	ands r0, r1
	adds r7, r2, #0
	mov r8, r3
	cmp r0, #0
	beq _080C0720
	ldrb r0, [r6, #2]
	b _080C0722
	.align 2, 0
_080C0710: .4byte 0x081F5C6C
_080C0714: .4byte 0x000001FF
_080C0718: .4byte 0x081F5D7C
_080C071C: .4byte 0x03005270
_080C0720:
	ldrb r0, [r6, #3]
_080C0722:
	lsls r0, r0, #4
	ldr r1, _080C07DC @ =0x081F5C6C
	adds r5, r0, r1
	add r3, sp, #8
	mov r2, sb
	ldr r1, [r2, #0x3c]
	ldrh r0, [r1, #0x34]
	strh r0, [r3]
	mov r4, sp
	adds r4, #0xa
	ldrh r0, [r1, #0x36]
	strh r0, [r4]
	add r2, sp, #4
	movs r0, #8
	ldrsb r0, [r5, r0]
	ldrh r1, [r6, #0x18]
	subs r1, r1, r0
	movs r0, #0xc
	ldrsb r0, [r5, r0]
	adds r0, r0, r1
	ldrh r1, [r3]
	subs r0, r0, r1
	strh r0, [r2]
	adds r2, #2
	movs r0, #9
	ldrsb r0, [r5, r0]
	ldrh r1, [r6, #0x1a]
	subs r1, r1, r0
	movs r0, #0xd
	ldrsb r0, [r5, r0]
	adds r0, r0, r1
	ldrh r1, [r4]
	subs r0, r0, r1
	strh r0, [r2]
	adds r0, #0x20
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0xdf
	bhi _080C07CA
	add r0, sp, #4
	ldrh r0, [r0]
	adds r0, #0x20
	lsls r0, r0, #0x10
	ldr r1, _080C07E0 @ =0x012F0000
	cmp r0, r1
	bhi _080C07CA
	mov r1, r8
	ldrb r0, [r1]
	lsls r0, r0, #2
	adds r0, r0, r7
	adds r0, #0x30
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	add r0, sp, #4
	ldrh r0, [r0]
	ldr r7, _080C07E4 @ =0x000001FF
	ands r7, r0
	ldrb r6, [r2]
	mov r2, r8
	ldrb r3, [r2]
	lsrs r0, r3, #5
	lsls r0, r0, #2
	mov r2, sb
	adds r2, #0x34
	adds r2, r2, r0
	movs r0, #0x1f
	ands r3, r0
	movs r1, #1
	lsls r1, r3
	ldr r0, [r2]
	ands r0, r1
	cmp r0, #0
	beq _080C07BE
	movs r1, #0x80
	lsls r1, r1, #3
	adds r0, r1, #0
	orrs r6, r0
_080C07BE:
	mov r2, sb
	ldr r0, [r2, #0x38]
	adds r1, r7, #0
	adds r2, r6, #0
	bl AP_Update
_080C07CA:
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C07DC: .4byte 0x081F5C6C
_080C07E0: .4byte 0x012F0000
_080C07E4: .4byte 0x000001FF

