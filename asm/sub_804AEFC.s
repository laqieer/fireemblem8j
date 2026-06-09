	.syntax unified
	.set GetUnit, 0x08019108 + 1
	.set LinkArenaBattleMap_BackupUnitItems, 0x0804A094 + 1
	.set ResetTextFont, 0x08003C50 + 1
	.set StartOrphanMenu, 0x0804F970 + 1
	.set sub_8003508, 0x08003508 + 1
	.set sub_80153A4, 0x080153A4 + 1
	.section .text.sub_804AEFC, "ax", %progbits
@ sub_804AEFC @ JP 0x0804AEFC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_804AEFC
	.thumb_func
sub_804AEFC:
	push {r4, lr}
	adds r4, r0, #0
	bl ResetTextFont
	ldr r2, _0804AF3C @ =0x0203DD8C
	movs r0, #0xff
	strb r0, [r2, #6]
	ldr r1, _0804AF40 @ =0x03001810
	ldrb r0, [r2, #4]
	adds r0, r0, r1
	ldrb r0, [r0]
	bl GetUnit
	ldr r1, _0804AF44 @ =0x03004DF0
	str r0, [r1]
	bl LinkArenaBattleMap_BackupUnitItems
	bl sub_80153A4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r4, #0x64
	strh r0, [r4]
	movs r0, #4
	bl sub_8003508
	ldr r0, _0804AF48 @ =0x085D4E44
	bl StartOrphanMenu
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804AF3C: .4byte 0x0203DD8C
_0804AF40: .4byte 0x03001810
_0804AF44: .4byte 0x03004DF0
_0804AF48: .4byte 0x085D4E44

