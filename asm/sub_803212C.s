	.syntax unified
	.set GetSomeFacingDirection, 0x0801D838 + 1
	.set GetUnit, 0x08019108 + 1
	.set Proc_StartBlocking, 0x08002C30 + 1
	.set UnitDrop, 0x08018084 + 1
	.set sub_80181B0, 0x080181B0 + 1
	.set sub_801D8E0, 0x0801D8E0 + 1
	.set sub_807AB24, 0x0807AB24 + 1
	.section .text.sub_803212C, "ax", %progbits
@ sub_803212C @ JP 0x0803212C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_803212C
	.thumb_func
sub_803212C:
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r4, _08032194 @ =0x0203A954
	ldrb r0, [r4, #0xd]
	bl GetUnit
	adds r5, r0, #0
	ldrb r0, [r4, #0x14]
	ldr r1, _08032198 @ =0x0202E4E8
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r1, [r4, #0x13]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _080321A0
	ldrb r0, [r4, #0xc]
	bl GetUnit
	bl sub_80181B0
	ldrb r0, [r4, #0x13]
	ldrb r1, [r4, #0x14]
	movs r2, #0x10
	ldrsb r2, [r5, r2]
	movs r3, #0x11
	ldrsb r3, [r5, r3]
	bl GetSomeFacingDirection
	adds r1, r0, #0
	adds r0, r5, #0
	movs r2, #2
	adds r3, r6, #0
	bl sub_801D8E0
	ldrb r0, [r4, #0xc]
	bl GetUnit
	ldrb r1, [r4, #0x13]
	ldrb r2, [r4, #0x14]
	bl UnitDrop
	ldr r0, _0803219C @ =0x085C5F4C
	adds r1, r6, #0
	bl Proc_StartBlocking
	str r5, [r0, #0x54]
	b _080321AE
	.align 2, 0
_08032194: .4byte 0x0203A954
_08032198: .4byte 0x0202E4E8
_0803219C: .4byte 0x085C5F4C
_080321A0:
	ldr r0, _080321B8 @ =0x02033EF8
	movs r1, #0xa
	strb r1, [r0]
	movs r1, #4
	strb r1, [r0, #1]
	bl sub_807AB24
_080321AE:
	movs r0, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_080321B8: .4byte 0x02033EF8

