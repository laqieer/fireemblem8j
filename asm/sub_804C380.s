	.syntax unified
	.set LinkArenaBattleMap_AdvancePhase, 0x0804A0E4 + 1
	.set Proc_Goto, 0x08002E74 + 1
	.section .text.sub_804C380, "ax", %progbits
@ sub_804C380 @ JP 0x0804C380 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_804C380
	.thumb_func
sub_804C380:
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _0804C3A0 @ =0x0203DA20
	movs r0, #2
	strb r0, [r1, #0xb]
	movs r0, #0xff
	bl LinkArenaBattleMap_AdvancePhase
	adds r0, r4, #0
	movs r1, #5
	bl Proc_Goto
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804C3A0: .4byte 0x0203DA20

