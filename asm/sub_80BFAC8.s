	.syntax unified
	.set AP_Update, 0x080091AC + 1
	.set SetStandingMuFacingWM, 0x08027080 + 1
	.set sub_8027EBC, 0x08027EBC + 1
	.set sub_80C7264, 0x080C7264 + 1
	.section .text.sub_80BFAC8, "ax", %progbits
@ GmapUnit_Loop @ JP 0x080BFAC8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global GmapUnit_Loop
	.thumb_func
GmapUnit_Loop:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0xc
	adds r6, r0, #0
	ldrh r1, [r6, #0x2a]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _080BFADE
	b _080BFBF4
_080BFADE:
	ldr r0, _080BFAF8 @ =0x03005270
	ldrb r1, [r0]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _080BFAFC
	mov r4, sp
	adds r4, #0xa
	add r0, sp, #8
	adds r1, r4, #0
	bl sub_80C7264
	b _080BFB0C
	.align 2, 0
_080BFAF8: .4byte 0x03005270
_080BFAFC:
	add r1, sp, #8
	ldr r2, [r6, #0x14]
	ldrh r0, [r2, #0x34]
	strh r0, [r1]
	adds r1, #2
	ldrh r0, [r2, #0x36]
	strh r0, [r1]
	adds r4, r1, #0
_080BFB0C:
	add r1, sp, #8
	ldrh r0, [r6, #0x3c]
	ldrh r1, [r1]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	ldrh r0, [r6, #0x3e]
	ldrh r1, [r4]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	asrs r7, r0, #0x10
	movs r1, #0x80
	lsls r1, r1, #0xe
	adds r0, r0, r1
	lsrs r0, r0, #0x10
	cmp r0, #0xdf
	bhi _080BFBF4
	adds r0, r2, #0
	adds r0, #0x10
	lsls r0, r0, #0x10
	ldr r1, _080BFBAC @ =0x010F0000
	cmp r0, r1
	bhi _080BFBF4
	ldr r3, _080BFBB0 @ =0x000001FF
	mov r8, r3
	mov r0, r8
	ands r0, r2
	mov r8, r0
	mov r2, r8
	movs r0, #0xff
	ands r7, r0
	adds r0, r6, #0
	adds r0, #0x37
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #4
	bne _080BFBBC
	ldr r5, _080BFBB4 @ =0x081F5C48
	adds r4, r6, #0
	adds r4, #0x34
	movs r0, #0
	ldrsb r0, [r4, r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	ldr r1, [r6, #0x30]
	lsls r1, r1, #5
	ldr r2, _080BFBB8 @ =0x06010000
	adds r1, r1, r2
	bl SetStandingMuFacingWM
	adds r0, r6, #0
	adds r0, #0x36
	ldrb r0, [r0]
	movs r1, #0xf
	ands r1, r0
	lsls r1, r1, #0xc
	ldr r2, [r6, #0x30]
	movs r0, #0
	ldrsb r0, [r4, r0]
	adds r0, r0, r5
	adds r2, r2, r1
	ldrb r0, [r0]
	adds r2, r2, r0
	ldrh r0, [r6, #0x2e]
	adds r2, r2, r0
	ldrh r0, [r6, #0x38]
	ldrh r1, [r6, #0x2c]
	str r2, [sp]
	ldrh r3, [r6, #0x2a]
	movs r2, #2
	ands r2, r3
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	str r2, [sp, #4]
	mov r2, r8
	adds r3, r7, #0
	bl sub_8027EBC
	b _080BFBF4
	.align 2, 0
_080BFBAC: .4byte 0x010F0000
_080BFBB0: .4byte 0x000001FF
_080BFBB4: .4byte 0x081F5C48
_080BFBB8: .4byte 0x06010000
_080BFBBC:
	ldrh r1, [r6, #0x2a]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080BFBD2
	movs r3, #0x80
	lsls r3, r3, #3
	adds r0, r3, #0
	orrs r7, r0
	lsls r0, r7, #0x10
	asrs r7, r0, #0x10
_080BFBD2:
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _080BFBEA
	ldr r0, [r6, #0x40]
	adds r0, #0x20
	movs r1, #1
	strb r1, [r0]
	ldrh r1, [r6, #0x2a]
	ldr r0, _080BFC00 @ =0x0000FFFB
	ands r0, r1
	strh r0, [r6, #0x2a]
_080BFBEA:
	ldr r0, [r6, #0x40]
	adds r1, r2, #0
	adds r2, r7, #0
	bl AP_Update
_080BFBF4:
	add sp, #0xc
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BFC00: .4byte 0x0000FFFB

