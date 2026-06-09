	.syntax unified
	.set GetUnit, 0x08019108 + 1
	.set Proc_Goto, 0x08002E74 + 1
	.set SetMuMoveScript, 0x0807ABB4 + 1
	.set StartLinkArenaMUDeathFade, 0x0804CCEC + 1
	.set sub_8027144, 0x08027144 + 1
	.set sub_80280A0, 0x080280A0 + 1
	.set sub_807A888, 0x0807A888 + 1
	.section .text.sub_804C3C4, "ax", %progbits
@ sub_804C3C4 @ JP 0x0804C3C4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_804C3C4
	.thumb_func
sub_804C3C4:
	push {r4, r5, r6, lr}
	adds r5, r0, #0
_0804C3C8:
	ldr r1, [r5, #0x58]
	cmp r1, #5
	bne _0804C3D8
	adds r0, r5, #0
	movs r1, #1
	bl Proc_Goto
	b _0804C43C
_0804C3D8:
	ldr r0, [r5, #0x5c]
	adds r0, r0, r1
	adds r0, #1
	bl GetUnit
	adds r6, r0, #0
	ldr r0, [r6, #0xc]
	ldr r1, _0804C3FC @ =0x00010004
	ands r0, r1
	cmp r0, #0
	bne _0804C3F4
	ldr r0, [r6]
	cmp r0, #0
	bne _0804C400
_0804C3F4:
	ldr r0, [r5, #0x58]
	adds r0, #1
	str r0, [r5, #0x58]
	b _0804C3C8
	.align 2, 0
_0804C3FC: .4byte 0x00010004
_0804C400:
	bl sub_8027144
	adds r0, r6, #0
	bl sub_80280A0
	adds r0, r6, #0
	bl sub_807A888
	adds r4, r0, #0
	ldr r1, _0804C444 @ =0x02033EF8
	movs r0, #2
	strb r0, [r1]
	movs r0, #4
	strb r0, [r1, #1]
	adds r0, r4, #0
	bl SetMuMoveScript
	adds r0, r4, #0
	bl StartLinkArenaMUDeathFade
	str r4, [r5, #0x54]
	ldr r0, [r5, #0x58]
	adds r0, #1
	str r0, [r5, #0x58]
	ldr r0, [r6, #0xc]
	ldr r1, _0804C448 @ =0xFFFFFDFF
	ands r0, r1
	movs r1, #5
	orrs r0, r1
	str r0, [r6, #0xc]
_0804C43C:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0804C444: .4byte 0x02033EF8
_0804C448: .4byte 0xFFFFFDFF

