	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set EkrBattleStarting_IsBattleAnimEnabled, 0x08056B3C + 1
	.set sub_80011D0, 0x080011D0 + 1
	.set sub_8019914, 0x08019914 + 1
	.set sub_8050ABC, 0x08050ABC + 1
	.set sub_8056B5C, 0x08056B5C + 1
	.set sub_807B4B8, 0x0807B4B8 + 1
	.set sub_807DB9C, 0x0807DB9C + 1
	.section .text.sub_804C5A0, "ax", %progbits
@ sub_804C5A0 @ JP 0x0804C5A0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_804C5A0
	.thumb_func
sub_804C5A0:
	push {lr}
	ldr r0, _0804C5CC @ =0x02023CA8
	movs r1, #0
	bl sub_80011D0
	movs r0, #4
	bl BG_EnableSyncByMask
	bl sub_8019914
	bl EkrBattleStarting_IsBattleAnimEnabled
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0804C5D0
	movs r0, #1
	bl sub_8050ABC
	bl sub_8056B5C
	b _0804C5E6
	.align 2, 0
_0804C5CC: .4byte 0x02023CA8
_0804C5D0:
	bl sub_807B4B8
	bl sub_8019914
	bl sub_807DB9C
	ldr r2, _0804C5EC @ =0x0203A4D0
	ldrh r1, [r2]
	movs r0, #0x80
	orrs r0, r1
	strh r0, [r2]
_0804C5E6:
	pop {r0}
	bx r0
	.align 2, 0
_0804C5EC: .4byte 0x0203A4D0

