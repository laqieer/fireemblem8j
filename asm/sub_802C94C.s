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
	.section .text.sub_802C94C, "ax", %progbits
@ sub_802C94C @ JP 0x0802C94C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_802C94C
	.thumb_func
sub_802C94C:
	push {lr}
	ldr r0, _0802C980 @ =0x02023CA8
	movs r1, #0
	bl sub_80011D0
	movs r0, #4
	bl BG_EnableSyncByMask
	ldr r1, _0802C984 @ =0x020228A8
	movs r0, #0
	strh r0, [r1]
	bl sub_8001EE4
	bl sub_8019914
	bl EkrBattleStarting_CheckBattleAnimEnabled
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0802C988
	movs r0, #0
	bl sub_8050ABC
	bl sub_8056B5C
	b _0802C99E
	.align 2, 0
_0802C980: .4byte 0x02023CA8
_0802C984: .4byte 0x020228A8
_0802C988:
	bl sub_807B4B8
	bl sub_8019914
	bl sub_807DB9C
	ldr r0, _0802C9A4 @ =0x0203A4D0
	ldrh r1, [r0]
	movs r2, #0x80
	orrs r1, r2
	strh r1, [r0]
_0802C99E:
	pop {r0}
	bx r0
	.align 2, 0
_0802C9A4: .4byte 0x0203A4D0

