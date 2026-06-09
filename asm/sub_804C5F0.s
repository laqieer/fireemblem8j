	.syntax unified
	.set GetFacingDirection, 0x0807DD00 + 1
	.set GetUnit, 0x08019108 + 1
	.set Proc_Find, 0x08002DEC + 1
	.set SetMuMoveScript, 0x0807ABB4 + 1
	.set StartLinkArenaMUDeathFade, 0x0804CCEC + 1
	.set sub_8027144, 0x08027144 + 1
	.set sub_80280A0, 0x080280A0 + 1
	.set sub_807A888, 0x0807A888 + 1
	.section .text.sub_804C5F0, "ax", %progbits
@ sub_804C5F0 @ JP 0x0804C5F0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_804C5F0
	.thumb_func
sub_804C5F0:
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	ldr r6, _0804C660 @ =0x0203A4E8
	movs r0, #0x13
	ldrsb r0, [r6, r0]
	cmp r0, #0
	bne _0804C60C
	ldr r0, _0804C664 @ =0x08A132D0
	bl Proc_Find
	adds r4, r0, #0
	bl StartLinkArenaMUDeathFade
	str r4, [r7, #0x54]
_0804C60C:
	ldr r5, _0804C668 @ =0x0203A568
	movs r0, #0x13
	ldrsb r0, [r5, r0]
	cmp r0, #0
	bne _0804C658
	bl sub_8027144
	movs r0, #0xb
	ldrsb r0, [r5, r0]
	bl GetUnit
	bl sub_80280A0
	adds r0, r5, #0
	bl sub_807A888
	adds r4, r0, #0
	movs r0, #0x10
	ldrsb r0, [r6, r0]
	movs r1, #0x11
	ldrsb r1, [r6, r1]
	movs r2, #0x10
	ldrsb r2, [r5, r2]
	movs r3, #0x11
	ldrsb r3, [r5, r3]
	bl GetFacingDirection
	ldr r1, _0804C66C @ =0x02033EF8
	strb r0, [r1]
	movs r0, #4
	strb r0, [r1, #1]
	adds r0, r4, #0
	bl SetMuMoveScript
	adds r0, r4, #0
	bl StartLinkArenaMUDeathFade
	str r4, [r7, #0x54]
_0804C658:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804C660: .4byte 0x0203A4E8
_0804C664: .4byte 0x08A132D0
_0804C668: .4byte 0x0203A568
_0804C66C: .4byte 0x02033EF8

