	.syntax unified
	.set ResetClassReelSpell, 0x08070EA4 + 1
	.set sub_805B764, 0x0805B764 + 1
	.set sub_805B7A4, 0x0805B7A4 + 1
	.section .text.sub_80D216C, "ax", %progbits
@ ClassChgSel_StartClassBattleSprite @ JP 0x080D216C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global ClassChgSel_StartClassBattleSprite
	.thumb_func
ClassChgSel_StartClassBattleSprite:
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	mov r8, r0
	mov sb, r1
	lsls r2, r2, #0x10
	asrs r6, r2, #0x10
	lsls r3, r3, #0x10
	asrs r7, r3, #0x10
	ldr r2, _080D222C @ =0x085775CC
	ldr r0, [r2]
	ldrh r1, [r0, #4]
	movs r0, #0xc
	ands r0, r1
	cmp r0, #0
	beq _080D2194
	ldr r1, _080D2230 @ =0x030053F8
	movs r0, #0
	strh r0, [r1]
_080D2194:
	ldr r0, [r2]
	ldrh r1, [r0, #8]
	movs r5, #0x80
	lsls r5, r5, #2
	adds r0, r5, #0
	ands r0, r1
	cmp r0, #0
	beq _080D21AC
	ldr r1, _080D2230 @ =0x030053F8
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
_080D21AC:
	bl sub_805B764
	ldr r4, _080D2234 @ =0x03005390
	movs r2, #0
	movs r1, #0
	strh r6, [r4, #2]
	strh r7, [r4, #4]
	movs r3, #1
	strh r3, [r4, #0xc]
	mov r0, r8
	strh r0, [r4, #6]
	mov r0, sb
	strh r0, [r4, #8]
	ldr r0, [sp, #0x1c]
	strh r0, [r4, #0xa]
	strb r2, [r4, #1]
	strh r5, [r4, #0xe]
	movs r0, #0xa
	strh r0, [r4, #0x10]
	ldr r0, _080D2238 @ =0x02000088
	str r0, [r4, #0x1c]
	ldr r0, _080D223C @ =0x020041C8
	str r0, [r4, #0x24]
	ldr r0, _080D2240 @ =0x02004088
	str r0, [r4, #0x20]
	ldr r0, _080D2244 @ =0x0200F1C8
	str r0, [r4, #0x28]
	ldr r0, _080D2248 @ =0x030053D0
	str r0, [r4, #0x30]
	movs r2, #4
	strh r2, [r0]
	strh r1, [r0, #2]
	strh r1, [r0, #4]
	strh r1, [r0, #6]
	strh r1, [r0, #8]
	movs r1, #0xc0
	lsls r1, r1, #2
	strh r1, [r0, #0xe]
	movs r1, #8
	strh r1, [r0, #0x10]
	strh r5, [r0, #0xa]
	strh r2, [r0, #0xc]
	strh r3, [r0, #0x12]
	ldr r1, _080D224C @ =0x020234A8
	str r1, [r0, #0x14]
	ldr r1, _080D2250 @ =0x02017790
	str r1, [r0, #0x18]
	ldr r1, _080D2254 @ =0x02019790
	str r1, [r0, #0x1c]
	ldr r1, _080D2258 @ =0x0201A790
	str r1, [r0, #0x20]
	ldr r1, _080D225C @ =ClassChgSel_SetBlendWindowConfig
	str r1, [r0, #0x24]
	bl ResetClassReelSpell
	adds r0, r4, #0
	bl sub_805B7A4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080D222C: .4byte 0x085775CC
_080D2230: .4byte 0x030053F8
_080D2234: .4byte 0x03005390
_080D2238: .4byte 0x02000088
_080D223C: .4byte 0x020041C8
_080D2240: .4byte 0x02004088
_080D2244: .4byte 0x0200F1C8
_080D2248: .4byte 0x030053D0
_080D224C: .4byte 0x020234A8
_080D2250: .4byte 0x02017790
_080D2254: .4byte 0x02019790
_080D2258: .4byte 0x0201A790
_080D225C: .4byte 0x080D2045  @ ClassChgSel_SetBlendWindowConfig

