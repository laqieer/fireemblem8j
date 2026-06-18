	.syntax unified
	.set CanPrepScreenCheckMap, 0x080977E4 + 1
	.set CanPrepScreenSave, 0x080972D4 + 1
	.set CheckInLinkArena, 0x08042E1C + 1
	.set j_TmFillRect, 0x080DC0E4 + 1
	.set sub_8097778, 0x08097778 + 1
	.set sub_8099290, 0x08099290 + 1
	.set sub_80992B4, 0x080992B4 + 1
	.set sub_80992D0, 0x080992D0 + 1
	.set sub_8099308, 0x08099308 + 1
	.set sub_80993B0, 0x080993B0 + 1
	.set sub_80994E4, 0x080994E4 + 1
	.section .text.sub_8097804, "ax", %progbits
@ InitPrepScreenMainMenu @ JP 0x08097804 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global InitPrepScreenMainMenu
	.thumb_func
InitPrepScreenMainMenu:
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	bl sub_8099290
	bl CheckInLinkArena
	lsls r0, r0, #0x18
	asrs r4, r0, #0x18
	cmp r4, #0
	bne _080978B0
	ldr r1, _08097858 @ =sub_8097498
	ldr r3, _0809785C @ =0x00000509
	str r4, [sp]
	movs r0, #0
	movs r2, #0
	bl sub_8099308
	ldr r1, _08097860 @ =sub_80974AC
	ldr r3, _08097864 @ =0x0000050B
	str r4, [sp]
	movs r0, #1
	movs r2, #0
	bl sub_8099308
	adds r0, r5, #0
	bl sub_8097778
	bl CanPrepScreenCheckMap
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08097870
	ldr r1, _08097868 @ =sub_80975A0
	ldr r3, _0809786C @ =0x0000050C
	str r4, [sp]
	movs r0, #7
	movs r2, #0
	bl sub_8099308
	b _0809787E
	.align 2, 0
_08097858: .4byte 0x08097499  @ sub_8097498
_0809785C: .4byte 0x00000509
_08097860: .4byte 0x080974AD  @ sub_80974AC
_08097864: .4byte 0x0000050B
_08097868: .4byte 0x080975A1  @ sub_80975A0
_0809786C: .4byte 0x0000050C
_08097870:
	ldr r1, _080978A0 @ =sub_80975A0
	ldr r3, _080978A4 @ =0x0000050C
	str r0, [sp]
	movs r0, #7
	movs r2, #1
	bl sub_8099308
_0809787E:
	movs r4, #0
	bl CanPrepScreenSave
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0809788C
	movs r4, #1
_0809788C:
	ldr r1, _080978A8 @ =sub_80974F0
	ldr r3, _080978AC @ =0x0000050D
	movs r0, #0
	str r0, [sp]
	movs r0, #2
	adds r2, r4, #0
	bl sub_8099308
	b _080978DC
	.align 2, 0
_080978A0: .4byte 0x080975A1  @ sub_80975A0
_080978A4: .4byte 0x0000050C
_080978A8: .4byte 0x080974F1  @ sub_80974F0
_080978AC: .4byte 0x0000050D
_080978B0:
	ldr r1, _08097914 @ =sub_8097498
	ldr r3, _08097918 @ =0x00000509
	movs r4, #0
	str r4, [sp]
	movs r0, #0
	movs r2, #0
	bl sub_8099308
	ldr r1, _0809791C @ =sub_80974AC
	ldr r3, _08097920 @ =0x0000050B
	str r4, [sp]
	movs r0, #1
	movs r2, #0
	bl sub_8099308
	ldr r1, _08097924 @ =sub_8097564
	str r4, [sp]
	movs r0, #3
	movs r2, #0
	movs r3, #0x45
	bl sub_8099308
_080978DC:
	ldr r0, _08097928 @ =sub_8097570
	bl sub_80992B4
	ldr r0, _0809792C @ =sub_8097520
	bl sub_80992D0
	ldr r0, _08097930 @ =0x02022CA8
	movs r1, #0xc
	movs r2, #0x13
	movs r3, #0
	bl j_TmFillRect
	ldr r0, _08097934 @ =0x020234A8
	movs r1, #0xc
	movs r2, #0x13
	movs r3, #0
	bl j_TmFillRect
	bl CheckInLinkArena
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08097938
	movs r0, #1
	movs r1, #5
	bl sub_80994E4
	b _08097940
	.align 2, 0
_08097914: .4byte 0x08097499  @ sub_8097498
_08097918: .4byte 0x00000509
_0809791C: .4byte 0x080974AD  @ sub_80974AC
_08097920: .4byte 0x0000050B
_08097924: .4byte 0x08097565  @ sub_8097564
_08097928: .4byte 0x08097571  @ sub_8097570
_0809792C: .4byte 0x08097521  @ sub_8097520
_08097930: .4byte 0x02022CA8
_08097934: .4byte 0x020234A8
_08097938:
	movs r0, #1
	movs r1, #6
	bl sub_80994E4
_08097940:
	adds r0, r5, #0
	adds r0, #0x2d
	ldrb r0, [r0]
	bl sub_80993B0
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

