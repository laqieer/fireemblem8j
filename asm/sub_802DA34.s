	.syntax unified
	.set Proc_Goto, 0x08002E74 + 1
	.set TradeMenu_RefreshSelectableCells, 0x0802D4C4 + 1
	.set __divsi3, 0x080D65F8 + 1
	.set __modsi3, 0x080D6690 + 1
	.section .text.sub_802DA34, "ax", %progbits
@ sub_802DA34 @ JP 0x0802DA34 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_802DA34
	.thumb_func
sub_802DA34:
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _0802DA74 @ =0x0202BCAC
	adds r5, r0, #0
	adds r5, #0x3f
	movs r0, #0
	ldrsb r0, [r5, r0]
	cmp r0, #0
	blt _0802DA78
	movs r1, #5
	bl __divsi3
	adds r1, r4, #0
	adds r1, #0x41
	strb r0, [r1]
	movs r0, #0
	ldrsb r0, [r5, r0]
	movs r1, #5
	bl __modsi3
	adds r1, r4, #0
	adds r1, #0x42
	strb r0, [r1]
	adds r0, r4, #0
	bl TradeMenu_RefreshSelectableCells
	adds r0, r4, #0
	movs r1, #1
	bl Proc_Goto
	movs r0, #0
	b _0802DA7A
	.align 2, 0
_0802DA74: .4byte 0x0202BCAC
_0802DA78:
	movs r0, #1
_0802DA7A:
	pop {r4, r5}
	pop {r1}
	bx r1

