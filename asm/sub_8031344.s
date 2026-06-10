	.syntax unified
	.set GetUnit, 0x08019108 + 1
	.set Proc_Goto, 0x08002E74 + 1
	.set RefreshEntityBmMaps, 0x08019ECC + 1
	.set sub_8027144, 0x08027144 + 1
	.set sub_802C94C, 0x0802C94C + 1
	.set sub_802CC9C, 0x0802CC9C + 1
	.set sub_80317DC, 0x080317DC + 1
	.set sub_80BA310, 0x080BA310 + 1
	.section .text.sub_8031344, "ax", %progbits
@ sub_8031344 @ JP 0x08031344 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8031344
	.thumb_func
sub_8031344:
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r5, _080313B0 @ =0x0203A954
	ldrb r0, [r5, #0xc]
	bl GetUnit
	ldr r4, _080313B4 @ =0x03004DF0
	str r0, [r4]
	bl sub_80317DC
	ldr r0, [r4]
	bl sub_802CC9C
	bl sub_802C94C
	ldr r2, _080313B8 @ =0x03003020
	ldrb r1, [r2, #1]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #2
	ands r0, r1
	subs r1, #4
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r2, #1]
	bl RefreshEntityBmMaps
	ldrb r0, [r5, #0xf]
	ldr r1, _080313BC @ =0x0202E4D4
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r1, [r5, #0xe]
	ldr r0, [r0]
	adds r0, r0, r1
	movs r1, #0
	strb r1, [r0]
	bl sub_8027144
	adds r0, r6, #0
	movs r1, #0xa
	bl Proc_Goto
	bl sub_80BA310
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080313B0: .4byte 0x0203A954
_080313B4: .4byte 0x03004DF0
_080313B8: .4byte 0x03003020
_080313BC: .4byte 0x0202E4D4

