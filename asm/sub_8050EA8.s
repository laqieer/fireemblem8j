	.syntax unified
	.set CheckEkrWindowAppearUnexist, 0x08057CFC + 1
	.section .text.sub_8050EA8, "ax", %progbits
@ sub_8050EA8 @ JP 0x08050EA8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8050EA8
	.thumb_func
sub_8050EA8:
	push {r4, lr}
	adds r4, r0, #0
	bl CheckEkrWindowAppearUnexist
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _08050EC0
	ldr r0, _08050EC8 @ =ekrBattlePrepareDragonIntro
	str r0, [r4, #0xc]
	movs r0, #0
	strh r0, [r4, #0x2c]
_08050EC0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08050EC8: .4byte 0x08050ECD  @ ekrBattlePrepareDragonIntro

