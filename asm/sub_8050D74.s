	.syntax unified
	.set GetSelectTargetCount, 0x08050AC8 + 1
	.set NewEkrNamewinAppear, 0x08057D98 + 1
	.set sub_8057CAC, 0x08057CAC + 1
	.section .text.sub_8050D74, "ax", %progbits
@ sub_8050D74 @ JP 0x08050D74 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8050D74
	.thumb_func
sub_8050D74:
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x1f
	bne _08050DBC
	bl GetSelectTargetCount
	cmp r0, #1
	beq _08050DB4
	ldr r0, [r4, #0x54]
	cmp r0, #1
	beq _08050D9A
	ldr r0, [r4, #0x58]
	cmp r0, #1
	bne _08050DB4
_08050D9A:
	movs r0, #1
	movs r1, #7
	bl sub_8057CAC
	movs r0, #1
	movs r1, #7
	movs r2, #0
	bl NewEkrNamewinAppear
	ldr r0, _08050DB0 @ =sub_8050DC8
	b _08050DB6
	.align 2, 0
_08050DB0: .4byte 0x08050DC9  @ sub_8050DC8
_08050DB4:
	ldr r0, _08050DC4 @ =ekrBattlePrepareDragonIntro
_08050DB6:
	str r0, [r4, #0xc]
	movs r0, #0
	strh r0, [r4, #0x2c]
_08050DBC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08050DC4: .4byte 0x08050ECD  @ ekrBattlePrepareDragonIntro

