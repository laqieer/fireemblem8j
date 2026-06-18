	.syntax unified
	.set LinkArenaBattleMap_RestoreUnitItems, 0x0804A0B4 + 1
	.set Proc_End, 0x08002CBC + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_80153A4, 0x080153A4 + 1
	.section .text.sub_804AF4C, "ax", %progbits
@ LABattleMap_ForecastMenu_Loop @ JP 0x0804AF4C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global LABattleMap_ForecastMenu_Loop
	.thumb_func
LABattleMap_ForecastMenu_Loop:
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r0, #0x64
	movs r1, #0
	ldrsh r4, [r0, r1]
	bl sub_80153A4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r4, r0
	bne _0804AF7E
	ldr r0, _0804AF84 @ =0x0203DD8C
	ldrb r0, [r0, #6]
	cmp r0, #0
	bne _0804AF78
	ldr r0, _0804AF88 @ =0x03004DF0
	ldr r0, [r0]
	bl LinkArenaBattleMap_RestoreUnitItems
	adds r0, r5, #0
	bl Proc_End
_0804AF78:
	adds r0, r5, #0
	bl sub_8002DE4
_0804AF7E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0804AF84: .4byte 0x0203DD8C
_0804AF88: .4byte 0x03004DF0

