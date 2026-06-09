	.syntax unified
	.set Proc_Goto, 0x08002E74 + 1
	.set Proc_StartBlocking, 0x08002C30 + 1
	.set m4aSongNumStart, 0x080D4EF4 + 1
	.set sub_802D520, 0x0802D520 + 1
	.set sub_802DE40, 0x0802DE40 + 1
	.set sub_804F528, 0x0804F528 + 1
	.section .text.sub_802D76C, "ax", %progbits
@ sub_802D76C @ JP 0x0802D76C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_802D76C
	.thumb_func
sub_802D76C:
	push {r4, lr}
	adds r4, r0, #0
	bl sub_802DE40
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0802D7A8
	ldr r2, _0802D7A4 @ =0x085C3FBC
	adds r3, r4, #0
	adds r3, #0x42
	adds r0, r4, #0
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r1, r0, #2
	adds r1, r1, r0
	ldrb r3, [r3]
	adds r1, r1, r3
	lsls r1, r1, #2
	adds r1, r1, r2
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #3
	movs r2, #2
	ldrsh r1, [r1, r2]
	lsls r1, r1, #3
	bl sub_804F528
	b _0802D846
	.align 2, 0
_0802D7A4: .4byte 0x085C3FBC
_0802D7A8:
	adds r0, r4, #0
	bl sub_802D520
	ldr r2, _0802D800 @ =0x085C3FBC
	adds r3, r4, #0
	adds r3, #0x42
	adds r0, r4, #0
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r1, r0, #2
	adds r1, r1, r0
	ldrb r3, [r3]
	adds r1, r1, r3
	lsls r1, r1, #2
	adds r1, r1, r2
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #3
	movs r2, #2
	ldrsh r1, [r1, r2]
	lsls r1, r1, #3
	bl sub_804F528
	ldr r0, _0802D804 @ =0x085775CC
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0802D80C
	adds r0, r4, #0
	movs r1, #1
	bl Proc_Goto
	ldr r0, _0802D808 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0802D846
	movs r0, #0x6a
	bl m4aSongNumStart
	b _0802D846
	.align 2, 0
_0802D800: .4byte 0x085C3FBC
_0802D804: .4byte 0x085775CC
_0802D808: .4byte 0x0202BCEC
_0802D80C:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0802D834
	adds r0, r4, #0
	movs r1, #2
	bl Proc_Goto
	ldr r0, _0802D830 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0802D846
	movs r0, #0x6b
	bl m4aSongNumStart
	b _0802D846
	.align 2, 0
_0802D830: .4byte 0x0202BCEC
_0802D834:
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0802D846
	ldr r0, _0802D84C @ =0x085C40B4
	adds r1, r4, #0
	bl Proc_StartBlocking
_0802D846:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802D84C: .4byte 0x085C40B4

