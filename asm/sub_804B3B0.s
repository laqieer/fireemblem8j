	.syntax unified
	.set BattleGenerateReal, 0x0802A2DC + 1
	.set EquipUnitItemSlot, 0x08016968 + 1
	.set GetUnit, 0x08019108 + 1
	.set MuExistsActive, 0x0807AB5C + 1
	.set Proc_StartBlocking, 0x08002C30 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_80280A0, 0x080280A0 + 1
	.section .text.sub_804B3B0, "ax", %progbits
@ sub_804B3B0 @ JP 0x0804B3B0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_804B3B0
	.thumb_func
sub_804B3B0:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	bl MuExistsActive
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _0804B41E
	ldr r5, _0804B428 @ =0x03001810
	ldr r4, _0804B42C @ =0x0203DD8C
	ldrb r0, [r4, #4]
	adds r0, r0, r5
	ldrb r0, [r0]
	bl GetUnit
	adds r6, r0, #0
	ldrb r0, [r4, #5]
	adds r0, r0, r5
	ldrb r0, [r0]
	bl GetUnit
	mov r8, r0
	adds r0, r6, #0
	bl sub_80280A0
	ldr r1, _0804B430 @ =0x0203A954
	movs r0, #2
	strb r0, [r1, #0x11]
	ldrb r0, [r4, #5]
	adds r0, r0, r5
	ldrb r0, [r0]
	strb r0, [r1, #0xd]
	ldr r0, _0804B434 @ =0x0300182C
	ldrb r1, [r0, #3]
	adds r0, r6, #0
	bl EquipUnitItemSlot
	adds r0, r6, #0
	mov r1, r8
	bl BattleGenerateReal
	ldr r2, _0804B438 @ =0x0202BCAC
	ldrb r1, [r2, #4]
	movs r0, #0x40
	orrs r0, r1
	strb r0, [r2, #4]
	ldr r0, _0804B43C @ =0x085D4800
	adds r1, r7, #0
	bl Proc_StartBlocking
	adds r0, r7, #0
	bl sub_8002DE4
_0804B41E:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804B428: .4byte 0x03001810
_0804B42C: .4byte 0x0203DD8C
_0804B430: .4byte 0x0203A954
_0804B434: .4byte 0x0300182C
_0804B438: .4byte 0x0202BCAC
_0804B43C: .4byte 0x085D4800

