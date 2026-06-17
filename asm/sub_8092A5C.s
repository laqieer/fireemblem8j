	.syntax unified
	.set PutSprite, 0x080052F0 + 1
	.set PutSpriteExt, 0x08005330 + 1
	.set UnitList_SetMuralWindow, 0x080927EC + 1
	.set UpdateMenuScrollBarConfig, 0x080999B0 + 1
	.set __umodsi3, 0x080D6848 + 1
	.set sub_8000CD8, 0x08000CD8 + 1
	.set sub_8001EE4, 0x08001EE4 + 1
	.set sub_8026ED0, 0x08026ED0 + 1
	.set sub_8027AF4, 0x08027AF4 + 1
	.set sub_804F528, 0x0804F528 + 1
	.section .text.sub_8092A5C, "ax", %progbits
@ sub_8092A5C @ JP 0x08092A5C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global UnitListScreenSprites_Main
	.thumb_func
UnitListScreenSprites_Main:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x2c
	adds r6, r0, #0
	add r1, sp, #4
	ldr r0, _08092B0C @ =0x081F555C
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldr r0, [r0]
	str r0, [r1]
	ldr r0, [r6, #0x2c]
	adds r0, #0x34
	ldrb r0, [r0]
	ldr r5, _08092B10 @ =0x000020E2
	cmp r0, #0
	bne _08092A84
	movs r5, #0xe2
_08092A84:
	adds r4, r6, #0
	adds r4, #0x3b
	ldrb r0, [r4]
	lsrs r0, r0, #3
	movs r1, #3
	ands r0, r1
	lsls r0, r0, #2
	add r0, sp
	adds r0, #4
	ldr r2, [r0]
	adds r2, #7
	ldr r3, _08092B14 @ =0x08A938B0
	movs r7, #0x90
	lsls r7, r7, #8
	str r7, [sp]
	movs r0, #0xb
	adds r1, r5, #0
	bl PutSpriteExt
	ldr r1, _08092B18 @ =0x08A9396C
	ldr r0, [r6, #0x2c]
	adds r0, #0x2f
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r3, [r0]
	str r7, [sp]
	movs r0, #0xd
	movs r1, #0x10
	movs r2, #8
	bl PutSpriteExt
	ldr r0, [r6, #0x2c]
	ldrh r1, [r0, #0x3e]
	ldr r0, _08092B1C @ =0x0200F158
	ldrb r2, [r0]
	movs r0, #0xa
	movs r3, #6
	bl UpdateMenuScrollBarConfig
	ldr r5, [r6, #0x2c]
	adds r0, r5, #0
	adds r0, #0x29
	ldrb r0, [r0]
	str r4, [sp, #0x14]
	cmp r0, #2
	bls _08092B24
	ldr r2, _08092B20 @ =0x08A93994
	adds r3, r5, #0
	adds r3, #0x2d
	adds r0, r5, #0
	adds r0, #0x2f
	ldrb r1, [r0]
	lsls r0, r1, #3
	adds r0, r0, r1
	ldrb r3, [r3]
	adds r0, r0, r3
	lsls r0, r0, #4
	adds r0, r0, r2
	ldrb r0, [r0, #8]
	adds r1, r5, #0
	adds r1, #0x2c
	ldrb r1, [r1]
	lsls r1, r1, #4
	adds r1, #0x28
	bl sub_804F528
	b _08092B3A
	.align 2, 0
_08092B0C: .4byte 0x081F555C
_08092B10: .4byte 0x000020E2
_08092B14: .4byte 0x08A938B0
_08092B18: .4byte 0x08A9396C
_08092B1C: .4byte 0x0200F158
_08092B20: .4byte 0x08A93994
_08092B24:
	adds r0, r5, #0
	adds r0, #0x2c
	ldrb r2, [r0]
	lsls r2, r2, #4
	adds r2, #0x40
	ldr r3, _08092B8C @ =0x08A938B8
	str r7, [sp]
	movs r0, #0xd
	movs r1, #4
	bl PutSpriteExt
_08092B3A:
	ldr r1, [r6, #0x2c]
	ldrh r0, [r6, #0x38]
	ldrh r2, [r1, #0x3e]
	cmp r0, r2
	bne _08092B4E
	ldrh r0, [r1, #0x3e]
	movs r1, #0xf
	ands r0, r1
	cmp r0, #0
	beq _08092B98
_08092B4E:
	ldr r0, _08092B90 @ =0x020228A8
	ldr r1, _08092B94 @ =0x02013460
	ldrh r1, [r1, #0x10]
	movs r3, #0xcf
	lsls r3, r3, #2
	adds r0, r0, r3
	strh r1, [r0]
	bl sub_8001EE4
	adds r2, r6, #0
	adds r2, #0x3c
	movs r0, #0x20
	strb r0, [r2]
	ldr r0, [r6, #0x2c]
	ldrh r0, [r0, #0x3e]
	strh r0, [r6, #0x38]
	adds r0, r6, #0
	adds r0, #0x3a
	ldrb r1, [r0]
	str r2, [sp, #0x18]
	mov sb, r0
	cmp r1, #0
	bne _08092BD4
	movs r0, #1
	bl UnitList_SetMuralWindow
	movs r0, #1
	mov r4, sb
	strb r0, [r4]
	b _08092BD4
	.align 2, 0
_08092B8C: .4byte 0x08A938B8
_08092B90: .4byte 0x020228A8
_08092B94: .4byte 0x02013460
_08092B98:
	ldr r2, _08092DF8 @ =0x020228A8
	ldr r3, _08092DFC @ =0x02013460
	adds r4, r6, #0
	adds r4, #0x3c
	ldrb r0, [r4]
	lsrs r0, r0, #2
	movs r1, #0xf
	ands r0, r1
	lsls r0, r0, #1
	adds r0, r0, r3
	ldrh r0, [r0]
	movs r1, #0xcf
	lsls r1, r1, #2
	adds r2, r2, r1
	strh r0, [r2]
	bl sub_8001EE4
	adds r0, r6, #0
	adds r0, #0x3a
	ldrb r1, [r0]
	str r4, [sp, #0x18]
	mov sb, r0
	cmp r1, #1
	bne _08092BD4
	movs r0, #0
	bl UnitList_SetMuralWindow
	movs r0, #0
	mov r2, sb
	strb r0, [r2]
_08092BD4:
	bl sub_8026ED0
	ldrh r0, [r6, #0x38]
	lsrs r7, r0, #4
	movs r1, #0xf
	ands r0, r1
	rsbs r0, r0, #0
	mov r8, r0
	movs r5, #0
	ldr r0, _08092E00 @ =0x0200F158
	adds r3, r6, #0
	adds r3, #0x46
	str r3, [sp, #0x24]
	adds r4, r6, #0
	adds r4, #0x48
	str r4, [sp, #0x28]
	adds r1, r6, #0
	adds r1, #0x42
	str r1, [sp, #0x1c]
	adds r2, r6, #0
	adds r2, #0x44
	str r2, [sp, #0x20]
	ldrb r0, [r0]
	cmp r7, r0
	bge _08092C3C
	ldr r1, _08092E04 @ =0x0200D6E0
	adds r4, r7, #0
	lsls r0, r7, #2
	adds r0, r0, r1
	mov sl, r0
_08092C10:
	lsls r2, r5, #4
	mov r0, r8
	adds r0, #0x38
	adds r2, r2, r0
	mov r3, sl
	adds r3, #4
	mov sl, r3
	subs r3, #4
	ldm r3!, {r0}
	ldr r3, [r0]
	movs r0, #4
	movs r1, #8
	bl sub_8027AF4
	adds r4, #1
	adds r5, #1
	cmp r5, #5
	bgt _08092C3C
	ldr r0, _08092E00 @ =0x0200F158
	ldrb r0, [r0]
	cmp r4, r0
	blt _08092C10
_08092C3C:
	mov r4, sb
	ldrb r0, [r4]
	cmp r0, #0
	beq _08092C68
	adds r3, r5, r7
	ldr r0, _08092E00 @ =0x0200F158
	ldrb r0, [r0]
	cmp r3, r0
	bge _08092C68
	lsls r2, r5, #4
	mov r0, r8
	adds r0, #0x38
	adds r2, r2, r0
	ldr r1, _08092E04 @ =0x0200D6E0
	lsls r0, r3, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r3, [r0]
	movs r0, #4
	movs r1, #8
	bl sub_8027AF4
_08092C68:
	ldr r2, _08092E08 @ =0x085775CC
	ldr r0, [r2]
	ldrh r1, [r0, #8]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _08092C80
	movs r0, #0x1f
	ldr r1, [sp, #0x24]
	strh r0, [r1]
	movs r0, #1
	strh r0, [r6, #0x3e]
_08092C80:
	ldr r0, [r2]
	ldrh r1, [r0, #8]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08092C9A
	movs r0, #0x1f
	ldr r2, [sp, #0x28]
	strh r0, [r2]
	adds r1, r6, #0
	adds r1, #0x40
	movs r0, #0xe7
	strh r0, [r1]
_08092C9A:
	ldr r3, [sp, #0x24]
	ldrh r0, [r3]
	ldr r4, [sp, #0x1c]
	ldrh r4, [r4]
	adds r0, r0, r4
	ldr r1, [sp, #0x1c]
	strh r0, [r1]
	ldr r2, [sp, #0x28]
	ldrh r0, [r2]
	ldr r3, [sp, #0x20]
	ldrh r3, [r3]
	adds r0, r0, r3
	ldr r4, [sp, #0x20]
	strh r0, [r4]
	ldr r0, [sp, #0x24]
	ldrh r1, [r0]
	movs r2, #0
	ldrsh r0, [r0, r2]
	cmp r0, #4
	ble _08092CC8
	subs r0, r1, #1
	ldr r3, [sp, #0x24]
	strh r0, [r3]
_08092CC8:
	ldr r4, [sp, #0x28]
	ldrh r1, [r4]
	movs r2, #0
	ldrsh r0, [r4, r2]
	cmp r0, #4
	ble _08092CD8
	subs r0, r1, #1
	strh r0, [r4]
_08092CD8:
	bl sub_8000CD8
	movs r1, #3
	ands r1, r0
	cmp r1, #0
	bne _08092D04
	ldrh r1, [r6, #0x3e]
	movs r3, #0x3e
	ldrsh r0, [r6, r3]
	cmp r0, #6
	bgt _08092CF2
	adds r0, r1, #1
	strh r0, [r6, #0x3e]
_08092CF2:
	adds r1, r6, #0
	adds r1, #0x40
	ldrh r2, [r1]
	movs r4, #0
	ldrsh r0, [r1, r4]
	cmp r0, #0xe1
	ble _08092D04
	subs r0, r2, #1
	strh r0, [r1]
_08092D04:
	ldr r1, [r6, #0x2c]
	adds r0, r1, #0
	adds r0, #0x2f
	ldrb r0, [r0]
	cmp r0, #1
	bls _08092D68
	adds r0, r1, #0
	adds r0, #0x39
	ldrb r0, [r0]
	cmp r0, #3
	beq _08092D68
	movs r0, #0x3e
	ldrsh r4, [r6, r0]
	ldr r5, _08092E0C @ =0x085B8CDC
	ldr r1, [sp, #0x1c]
	ldrh r0, [r1]
	lsrs r0, r0, #5
	movs r1, #6
	bl __umodsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r2, _08092E10 @ =0x00001414
	adds r0, r0, r2
	str r0, [sp]
	movs r0, #0
	adds r1, r4, #0
	movs r2, #0x28
	adds r3, r5, #0
	bl PutSprite
	movs r3, #0x3e
	ldrsh r4, [r6, r3]
	ldr r1, [sp, #0x1c]
	ldrh r0, [r1]
	lsrs r0, r0, #5
	movs r1, #6
	bl __umodsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r2, _08092E14 @ =0x0000141A
	adds r0, r0, r2
	str r0, [sp]
	movs r0, #0
	adds r1, r4, #0
	movs r2, #0x30
	adds r3, r5, #0
	bl PutSprite
_08092D68:
	ldr r1, [r6, #0x2c]
	adds r0, r1, #0
	adds r0, #0x2f
	adds r2, r1, #0
	adds r2, #0x2e
	ldrb r0, [r0]
	ldrb r2, [r2]
	cmp r0, r2
	bhs _08092DD6
	adds r0, r1, #0
	adds r0, #0x39
	ldrb r0, [r0]
	cmp r0, #3
	beq _08092DD6
	adds r4, r6, #0
	adds r4, #0x40
	movs r3, #0
	ldrsh r5, [r4, r3]
	ldr r6, _08092E18 @ =0x085B8D54
	ldr r1, [sp, #0x20]
	ldrh r0, [r1]
	lsrs r0, r0, #5
	movs r1, #6
	bl __umodsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r2, _08092E10 @ =0x00001414
	adds r0, r0, r2
	str r0, [sp]
	movs r0, #0
	adds r1, r5, #0
	movs r2, #0x28
	adds r3, r6, #0
	bl PutSprite
	movs r3, #0
	ldrsh r4, [r4, r3]
	ldr r1, [sp, #0x20]
	ldrh r0, [r1]
	lsrs r0, r0, #5
	movs r1, #6
	bl __umodsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r2, _08092E14 @ =0x0000141A
	adds r0, r0, r2
	str r0, [sp]
	movs r0, #0
	adds r1, r4, #0
	movs r2, #0x30
	adds r3, r6, #0
	bl PutSprite
_08092DD6:
	ldr r3, [sp, #0x14]
	ldrb r0, [r3]
	adds r0, #1
	strb r0, [r3]
	ldr r4, [sp, #0x18]
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	add sp, #0x2c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08092DF8: .4byte 0x020228A8
_08092DFC: .4byte 0x02013460
_08092E00: .4byte 0x0200F158
_08092E04: .4byte 0x0200D6E0
_08092E08: .4byte 0x085775CC
_08092E0C: .4byte 0x085B8CDC
_08092E10: .4byte 0x00001414
_08092E14: .4byte 0x0000141A
_08092E18: .4byte 0x085B8D54

