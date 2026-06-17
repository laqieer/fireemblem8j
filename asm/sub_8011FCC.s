	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set EkrBattleStarting_CheckBattleAnimEnabled, 0x08056B4C + 1
	.set sub_80011D0, 0x080011D0 + 1
	.set sub_8001EE4, 0x08001EE4 + 1
	.set sub_8019914, 0x08019914 + 1
	.set sub_8050ABC, 0x08050ABC + 1
	.set sub_8056B5C, 0x08056B5C + 1
	.set sub_807B4B8, 0x0807B4B8 + 1
	.set sub_807DB9C, 0x0807DB9C + 1
	.section .text.sub_8011FCC, "ax", %progbits
@ StartScriptBattleAnim @ JP 0x08011FCC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global StartScriptBattleAnim
	.thumb_func
StartScriptBattleAnim:
	push {r4, lr}
	adds r4, r0, #0
	lsls r4, r4, #0x18
	asrs r4, r4, #0x18
	ldr r0, _08012010 @ =0x02023CA8
	movs r1, #0
	bl sub_80011D0
	movs r0, #4
	bl BG_EnableSyncByMask
	ldr r1, _08012014 @ =0x020228A8
	movs r0, #0
	strh r0, [r1]
	bl sub_8001EE4
	bl sub_8019914
	bl EkrBattleStarting_CheckBattleAnimEnabled
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r4, #0
	beq _08011FFE
	movs r0, #0
_08011FFE:
	cmp r0, #0
	beq _08012018
	movs r0, #0
	bl sub_8050ABC
	bl sub_8056B5C
	b _0801202E
	.align 2, 0
_08012010: .4byte 0x02023CA8
_08012014: .4byte 0x020228A8
_08012018:
	bl sub_807B4B8
	bl sub_8019914
	bl sub_807DB9C
	ldr r0, _08012034 @ =0x0203A4D0
	ldrh r1, [r0]
	movs r2, #0x80
	orrs r1, r2
	strh r1, [r0]
_0801202E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08012034: .4byte 0x0203A4D0

