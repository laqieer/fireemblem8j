	.syntax unified
	.set SioStrCpy, 0x08042D4C + 1
	.set sub_8003CF8, 0x08003CF8 + 1
	.set sub_8003D90, 0x08003D90 + 1
	.set sub_8009FA8, 0x08009FA8 + 1
	.set sub_8014C7C, 0x08014C7C + 1
	.set sub_80D65BC, 0x080D65BC + 1
	.section .text.sub_8043744, "ax", %progbits
@ DrawLinkArenaTeamListMenu @ JP 0x08043744 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global DrawLinkArenaTeamListMenu
	.thumb_func
DrawLinkArenaTeamListMenu:
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	mov r8, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r6, #0
	ldr r2, _080437BC @ =0x085D33A8
	lsls r1, r0, #2
	adds r1, r1, r2
	ldr r7, [r1]
	cmp r0, #1
	bne _080437C8
	ldr r1, _080437C0 @ =0x0203DA20
	ldrb r0, [r1, #5]
	adds r0, #2
	cmp r6, r0
	bge _080437B2
	mov sb, r1
	movs r0, #5
	mov r8, r0
	mov r5, sb
	adds r5, #0x64
	movs r7, #0
_08043778:
	movs r0, #0x58
	bl sub_8009FA8
	ldr r4, _080437C4 @ =0x0203DD4C
	adds r4, r7, r4
	adds r1, r4, #0
	bl SioStrCpy
	adds r0, r5, #0
	bl sub_8003CF8
	movs r0, #0xa
	str r0, [sp]
	adds r0, r5, #0
	movs r1, #1
	mov r2, r8
	adds r3, r4, #0
	bl sub_8014C7C
	movs r1, #3
	add r8, r1
	adds r5, #8
	adds r7, #0xf
	adds r6, #1
	mov r1, sb
	ldrb r0, [r1, #5]
	adds r0, #2
	cmp r6, r0
	blt _08043778
_080437B2:
	ldr r0, _080437C0 @ =0x0203DA20
	ldrb r0, [r0, #5]
	adds r0, #2
	b _08043830
	.align 2, 0
_080437BC: .4byte 0x085D33A8
_080437C0: .4byte 0x0203DA20
_080437C4: .4byte 0x0203DD4C
_080437C8:
	lsls r0, r6, #4
	adds r1, r0, r7
	ldr r0, [r1, #8]
	cmp r0, #0
	bne _080437D6
	adds r0, r6, #0
	b _08043830
_080437D6:
	mov r0, r8
	adds r0, #0x4d
	adds r4, r0, r6
	movs r0, #1
	strb r0, [r4]
	movs r5, #0
	ldr r0, [r1, #0xc]
	cmp r0, #0
	beq _080437F6
	bl sub_80D65BC
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080437F6
	strb r5, [r4]
	movs r5, #1
_080437F6:
	lsls r4, r6, #3
	ldr r0, _0804382C @ =0x0203DA84
	adds r4, r4, r0
	adds r0, r4, #0
	bl sub_8003CF8
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_8003D90
	lsls r0, r6, #4
	adds r0, r0, r7
	ldr r0, [r0, #8]
	bl sub_8009FA8
	adds r3, r0, #0
	lsls r2, r6, #1
	adds r2, #5
	movs r0, #7
	str r0, [sp]
	adds r0, r4, #0
	movs r1, #1
	bl sub_8014C7C
	adds r6, #1
	b _080437C8
	.align 2, 0
_0804382C: .4byte 0x0203DA84
_08043830:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

