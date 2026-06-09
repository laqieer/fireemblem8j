	.syntax unified
	.set LinkArenaBattleMap_AdvancePhase, 0x0804A0E4 + 1
	.set Proc_Goto, 0x08002E74 + 1
	.section .text.sub_804C2B8, "ax", %progbits
@ sub_804C2B8 @ JP 0x0804C2B8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_804C2B8
	.thumb_func
sub_804C2B8:
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _0804C2D8 @ =0x0203DA20
	ldrb r0, [r1]
	cmp r0, #1
	bne _0804C2DC
	strb r0, [r1, #0xb]
	movs r0, #0xff
	bl LinkArenaBattleMap_AdvancePhase
	adds r0, r4, #0
	movs r1, #8
	bl Proc_Goto
	b _0804C2EE
	.align 2, 0
_0804C2D8: .4byte 0x0203DA20
_0804C2DC:
	movs r0, #2
	strb r0, [r1, #0xb]
	movs r0, #0xff
	bl LinkArenaBattleMap_AdvancePhase
	adds r0, r4, #0
	movs r1, #8
	bl Proc_Goto
_0804C2EE:
	pop {r4}
	pop {r0}
	bx r0

