	.syntax unified
	.set LinkArenaBattleMap_AdvancePhase, 0x0804A0E4 + 1
	.set Proc_Goto, 0x08002E74 + 1
	.set sub_807B4B8, 0x0807B4B8 + 1
	.section .text.sub_804C1DC, "ax", %progbits
@ sub_804C1DC @ JP 0x0804C1DC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_804C1DC
	.thumb_func
sub_804C1DC:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0804C1F4 @ =0x0203DD8C
	ldrb r0, [r0, #8]
	cmp r0, #0
	bne _0804C1F8
	ldr r1, [r4, #0x58]
	adds r0, r4, #0
	bl Proc_Goto
	b _0804C214
	.align 2, 0
_0804C1F4: .4byte 0x0203DD8C
_0804C1F8:
	bl sub_807B4B8
	bl sub_807B4B8
	ldr r1, _0804C21C @ =0x0203DA20
	movs r0, #1
	strb r0, [r1, #0xb]
	movs r0, #0xff
	bl LinkArenaBattleMap_AdvancePhase
	adds r0, r4, #0
	movs r1, #5
	bl Proc_Goto
_0804C214:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0804C21C: .4byte 0x0203DA20

