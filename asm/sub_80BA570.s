	.syntax unified
	.set GetPartyGoldAmount, 0x08024D98 + 1
	.set Proc_Goto, 0x08002E74 + 1
	.set StartArenaDialogue, 0x080BA788 + 1
	.set sub_80088FC, 0x080088FC + 1
	.set sub_8031E18, 0x08031E18 + 1
	.section .text.sub_80BA570, "ax", %progbits
@ ArenaUi_CheckConfirmation @ JP 0x080BA570 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global ArenaUi_CheckConfirmation
	.thumb_func
ArenaUi_CheckConfirmation:
	push {r4, r5, lr}
	adds r5, r0, #0
	bl sub_80088FC
	cmp r0, #1
	beq _080BA594
	ldr r0, _080BA590 @ =0x00000874
	adds r1, r5, #0
	bl StartArenaDialogue
	adds r0, r5, #0
	movs r1, #2
	bl Proc_Goto
	b _080BA5B2
	.align 2, 0
_080BA590: .4byte 0x00000874
_080BA594:
	bl sub_8031E18
	adds r4, r0, #0
	bl GetPartyGoldAmount
	cmp r4, r0
	ble _080BA5B2
	ldr r0, _080BA5B8 @ =0x0000087A
	adds r1, r5, #0
	bl StartArenaDialogue
	adds r0, r5, #0
	movs r1, #2
	bl Proc_Goto
_080BA5B2:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080BA5B8: .4byte 0x0000087A

