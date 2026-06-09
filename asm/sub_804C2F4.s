	.syntax unified
	.set LinkArenaBattleMap_AdvancePhase, 0x0804A0E4 + 1
	.set Proc_Goto, 0x08002E74 + 1
	.section .text.sub_804C2F4, "ax", %progbits
@ sub_804C2F4 @ JP 0x0804C2F4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_804C2F4
	.thumb_func
sub_804C2F4:
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r5, #0
	ldr r2, _0804C360 @ =0x0203DD8C
	ldr r0, _0804C364 @ =0x0203DA20
	adds r4, r0, #0
	adds r4, #0xa0
	ldrb r1, [r4]
	ldrb r0, [r2, #0xe]
	subs r1, r1, r0
	adds r0, r2, #0
	adds r0, #0xf
	adds r1, r1, r0
	ldr r3, _0804C368 @ =0x0202BCEC
	ldrb r0, [r3, #0xf]
	strb r0, [r1]
	ldrb r0, [r2, #0xe]
	adds r0, #1
	strb r0, [r2, #0xe]
	ldrb r0, [r3, #0xf]
	lsls r0, r0, #2
	adds r1, r2, #0
	adds r1, #0x14
	adds r0, r0, r1
	str r5, [r0]
	ldrb r0, [r2, #0xe]
	ldrb r1, [r4]
	cmp r0, r1
	bne _0804C36C
	movs r1, #0
	ldrb r0, [r4]
	cmp r5, r0
	bge _0804C34C
	adds r4, r2, #0
	adds r4, #0xa
	adds r3, r0, #0
_0804C33C:
	adds r0, r1, r4
	ldrb r0, [r0]
	cmp r0, #0
	beq _0804C346
	adds r5, r1, #0
_0804C346:
	adds r1, #1
	cmp r1, r3
	blt _0804C33C
_0804C34C:
	strb r5, [r2, #0xf]
	movs r0, #0xff
	bl LinkArenaBattleMap_AdvancePhase
	adds r0, r6, #0
	movs r1, #5
	bl Proc_Goto
	b _0804C37A
	.align 2, 0
_0804C360: .4byte 0x0203DD8C
_0804C364: .4byte 0x0203DA20
_0804C368: .4byte 0x0202BCEC
_0804C36C:
	ldrb r0, [r3, #0xf]
	bl LinkArenaBattleMap_AdvancePhase
	adds r0, r6, #0
	movs r1, #5
	bl Proc_Goto
_0804C37A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

