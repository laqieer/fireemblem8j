	.syntax unified
	.set BattleGenerateBallistaReal, 0x0802A310 + 1
	.set BattleGenerateReal, 0x0802A2DC + 1
	.set GetItemIndex, 0x08017294 + 1
	.set GetSelectTargetCount, 0x08050A9C + 1
	.set GetTarget, 0x08050AA8 + 1
	.set GetUnit, 0x08019108 + 1
	.set Proc_StartBlocking, 0x08002C30 + 1
	.set SetUnitStatus, 0x08017680 + 1
	.set sub_8025EE8, 0x08025EE8 + 1
	.set sub_802C7FC, 0x0802C7FC + 1
	.section .text.sub_80321E8, "ax", %progbits
@ sub_80321E8 @ JP 0x080321E8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80321E8
	.thumb_func
sub_80321E8:
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	ldr r4, _08032268 @ =0x0203A954
	ldrb r0, [r4, #0xd]
	bl GetUnit
	adds r6, r0, #0
	ldrb r0, [r4, #0xc]
	bl GetUnit
	ldrb r1, [r4, #0x12]
	lsls r1, r1, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r0, [r0]
	bl GetItemIndex
	ldr r1, _0803226C @ =0x0203A4E8
	adds r1, #0x7e
	movs r2, #0
	strb r2, [r1]
	cmp r0, #0xa6
	bne _08032248
	ldrb r0, [r4, #0xc]
	bl GetUnit
	bl sub_8025EE8
	bl GetSelectTargetCount
	adds r5, r0, #0
	movs r4, #0
	cmp r4, r5
	bge _08032248
_0803222C:
	adds r0, r4, #0
	bl GetTarget
	ldrb r0, [r0, #2]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetUnit
	movs r1, #2
	bl SetUnitStatus
	adds r4, #1
	cmp r4, r5
	blt _0803222C
_08032248:
	cmp r6, #0
	bne _08032250
	bl sub_802C7FC
_08032250:
	ldr r1, _08032268 @ =0x0203A954
	ldrb r0, [r1, #0x12]
	cmp r0, #8
	bne _08032270
	ldrb r0, [r1, #0xc]
	bl GetUnit
	adds r1, r6, #0
	bl BattleGenerateBallistaReal
	b _0803227C
	.align 2, 0
_08032268: .4byte 0x0203A954
_0803226C: .4byte 0x0203A4E8
_08032270:
	ldrb r0, [r1, #0xc]
	bl GetUnit
	adds r1, r6, #0
	bl BattleGenerateReal
_0803227C:
	ldr r0, _0803228C @ =0x085C5F9C
	adds r1, r7, #0
	bl Proc_StartBlocking
	movs r0, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0803228C: .4byte 0x085C5F9C

