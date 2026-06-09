	.syntax unified
	.set LinkArenaBattleMap_AdvancePhase, 0x0804A0E4 + 1
	.set Proc_Goto, 0x08002E74 + 1
	.section .text.sub_804C220, "ax", %progbits
@ sub_804C220 @ JP 0x0804C220 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_804C220
	.thumb_func
sub_804C220:
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	movs r6, #0
	ldr r1, _0804C234 @ =0x0203DA20
	ldrb r0, [r1]
	cmp r0, #1
	bne _0804C238
	strb r0, [r1, #0xb]
	b _0804C28A
	.align 2, 0
_0804C234: .4byte 0x0203DA20
_0804C238:
	ldr r2, _0804C29C @ =0x0203DD8C
	adds r4, r1, #0
	adds r4, #0xa0
	ldrb r1, [r4]
	ldrb r0, [r2, #0xe]
	subs r1, r1, r0
	adds r0, r2, #0
	adds r0, #0xf
	adds r1, r1, r0
	ldr r3, _0804C2A0 @ =0x0202BCEC
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
	str r6, [r0]
	ldrb r0, [r2, #0xe]
	ldrb r1, [r4]
	cmp r0, r1
	bne _0804C2A4
	movs r1, #0
	ldrb r0, [r4]
	cmp r6, r0
	bge _0804C288
	adds r4, r2, #0
	adds r4, #0xa
	adds r3, r0, #0
_0804C278:
	adds r0, r1, r4
	ldrb r0, [r0]
	cmp r0, #0
	beq _0804C282
	adds r6, r1, #0
_0804C282:
	adds r1, #1
	cmp r1, r3
	blt _0804C278
_0804C288:
	strb r6, [r2, #0xf]
_0804C28A:
	movs r0, #0xff
	bl LinkArenaBattleMap_AdvancePhase
	adds r0, r5, #0
	movs r1, #8
	bl Proc_Goto
	b _0804C2B2
	.align 2, 0
_0804C29C: .4byte 0x0203DD8C
_0804C2A0: .4byte 0x0202BCEC
_0804C2A4:
	ldrb r0, [r3, #0xf]
	bl LinkArenaBattleMap_AdvancePhase
	adds r0, r5, #0
	movs r1, #8
	bl Proc_Goto
_0804C2B2:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

