	.syntax unified
	.set BMapVSync_Start, 0x080300A0 + 1
	.set GetUnit, 0x08019108 + 1
	.set LinkArenaBattleMap_AdvancePhase, 0x0804A0E4 + 1
	.set LinkArenaBattleMap_CountTeamUnits, 0x0804A540 + 1
	.set LinkArenaBattleMap_InitConfig, 0x0804A5C8 + 1
	.set ResetUnitSprites, 0x0802662C + 1
	.set SetCursorMapPosition, 0x08015BD8 + 1
	.set sub_8001ACC, 0x08001ACC + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_8015710, 0x08015710 + 1
	.set sub_80265CC, 0x080265CC + 1
	.set sub_8027144, 0x08027144 + 1
	.set sub_8042FC8, 0x08042FC8 + 1
	.set sub_804A508, 0x0804A508 + 1
	.set sub_804A584, 0x0804A584 + 1
	.set sub_804C12C, 0x0804C12C + 1
	.section .text.sub_804A624, "ax", %progbits
@ sub_804A624 @ JP 0x0804A624 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_804A624
	.thumb_func
sub_804A624:
	push {r4, r5, lr}
	movs r0, #0
	bl sub_8001ACC
	bl sub_8042FC8
	bl sub_804A508
	bl LinkArenaBattleMap_CountTeamUnits
	ldr r4, _0804A6D0 @ =0x0203DD8C
	movs r5, #0
	strb r5, [r4, #9]
	ldr r0, _0804A6D4 @ =0x0203DA20
	strb r5, [r0, #0xb]
	ldr r1, _0804A6D8 @ =0x085D41FC
	ldrb r0, [r4]
	adds r0, r0, r1
	ldrb r0, [r0]
	bl LinkArenaBattleMap_AdvancePhase
	movs r0, #1
	strb r0, [r4, #0xe]
	strb r5, [r4, #2]
	strb r0, [r4, #3]
	movs r1, #0
	movs r0, #3
	adds r4, #0x20
_0804A65C:
	str r1, [r4]
	subs r4, #4
	subs r0, #1
	cmp r0, #0
	bge _0804A65C
	movs r4, #0
	ldr r0, _0804A6DC @ =0x03001810
	ldrb r0, [r0, #3]
	bl GetUnit
	ldr r2, _0804A6E0 @ =0x03001824
	movs r1, #0x10
	ldrsb r1, [r0, r1]
	lsls r1, r1, #4
	strh r1, [r2]
	movs r1, #0x11
	ldrsb r1, [r0, r1]
	lsls r1, r1, #4
	strh r1, [r2, #2]
	movs r2, #0x10
	ldrsb r2, [r0, r2]
	movs r1, #0x11
	ldrsb r1, [r0, r1]
	adds r0, r2, #0
	bl SetCursorMapPosition
	ldr r0, _0804A6E4 @ =0x0202BCAC
	strh r4, [r0, #0xc]
	strh r4, [r0, #0xe]
	bl sub_8015710
	bl sub_80265CC
	bl ResetUnitSprites
	bl sub_8027144
	bl sub_804A584
	bl sub_804C12C
	ldr r0, _0804A6E8 @ =0x085C5DE8
	movs r1, #4
	bl sub_8002BCC
	bl BMapVSync_Start
	bl LinkArenaBattleMap_InitConfig
	ldr r2, _0804A6EC @ =0x0202BCEC
	ldrb r1, [r2, #0x14]
	movs r0, #0xbf
	ands r0, r1
	strb r0, [r2, #0x14]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804A6D0: .4byte 0x0203DD8C
_0804A6D4: .4byte 0x0203DA20
_0804A6D8: .4byte 0x085D41FC
_0804A6DC: .4byte 0x03001810
_0804A6E0: .4byte 0x03001824
_0804A6E4: .4byte 0x0202BCAC
_0804A6E8: .4byte 0x085C5DE8
_0804A6EC: .4byte 0x0202BCEC

