	.syntax unified
	.set GetUnit, 0x08019108 + 1
	.set Proc_Goto, 0x08002E74 + 1
	.set RefreshEntityBmMaps, 0x08019ECC + 1
	.set sub_8027144, 0x08027144 + 1
	.set sub_80280A0, 0x080280A0 + 1
	.set sub_807A888, 0x0807A888 + 1
	.set sub_807AB0C, 0x0807AB0C + 1
	.section .text.sub_8031288, "ax", %progbits
@ sub_8031288 @ JP 0x08031288 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8031288
	.thumb_func
sub_8031288:
	push {r4, r5, lr}
	adds r4, r0, #0
	bl RefreshEntityBmMaps
	bl sub_8027144
	ldr r2, _080312F8 @ =0x03003020
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
	adds r0, r4, #0
	movs r1, #6
	bl Proc_Goto
	ldr r4, _080312FC @ =0x0203A954
	ldrb r0, [r4, #0xc]
	bl GetUnit
	ldr r5, _08031300 @ =0x03004DF0
	str r0, [r5]
	movs r1, #0x11
	ldrsb r1, [r0, r1]
	ldr r2, _08031304 @ =0x0202E4D4
	ldr r2, [r2]
	lsls r1, r1, #2
	adds r1, r1, r2
	movs r2, #0x10
	ldrsb r2, [r0, r2]
	ldr r0, [r1]
	adds r0, r0, r2
	movs r1, #0
	strb r1, [r0]
	ldrb r0, [r4, #0xc]
	bl GetUnit
	bl sub_80280A0
	ldr r0, [r5]
	bl sub_807A888
	bl sub_807AB0C
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080312F8: .4byte 0x03003020
_080312FC: .4byte 0x0203A954
_08031300: .4byte 0x03004DF0
_08031304: .4byte 0x0202E4D4

