	.syntax unified
	.set GetSpellAssocMapAnimProcScript, 0x0807A68C + 1
	.set MapAnim_AdvanceBattleRound, 0x0807CBF0 + 1
	.set Proc_GotoScript, 0x08002EAC + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_807CC4C, "ax", %progbits
@ sub_807CC4C @ JP 0x0807CC4C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_807CC4C
	.thumb_func
sub_807CC4C:
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, _0807CC74 @ =0x0203E1EC
	ldr r0, [r5, #0x50]
	ldr r0, [r0]
	lsls r0, r0, #8
	lsrs r0, r0, #0x1b
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	beq _0807CC7C
	adds r0, r4, #0
	bl sub_8002DE4
	ldr r1, _0807CC78 @ =0x08A13C38
	adds r0, r4, #0
	bl Proc_GotoScript
	b _0807CCA2
	.align 2, 0
_0807CC74: .4byte 0x0203E1EC
_0807CC78: .4byte 0x08A13C38
_0807CC7C:
	bl MapAnim_AdvanceBattleRound
	adds r0, r5, #0
	adds r0, #0x58
	ldrb r1, [r0]
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r1, r5, #4
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, #0x4a
	ldrh r0, [r0]
	bl GetSpellAssocMapAnimProcScript
	str r0, [r5, #0x54]
	adds r0, r4, #0
	bl sub_8002DE4
_0807CCA2:
	pop {r4, r5}
	pop {r0}
	bx r0

