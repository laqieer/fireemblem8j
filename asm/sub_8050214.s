	.syntax unified
	.set GetMenuCursorPosition, 0x08050174 + 1
	.set Proc_GotoScript, 0x08002EAC + 1
	.set sub_804F528, 0x0804F528 + 1
	.set sub_8050008, 0x08050008 + 1
	.set sub_8050418, 0x08050418 + 1
	.set sub_808B2A4, 0x0808B2A4 + 1
	.set sub_80D65C4, 0x080D65C4 + 1
	.section .text.sub_8050214, "ax", %progbits
@ sub_8050214 @ JP 0x08050214 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8050214
	.thumb_func
sub_8050214:
	push {r4, r5, lr}
	sub sp, #8
	adds r5, r0, #0
	bl sub_8050008
	add r4, sp, #4
	adds r0, r5, #0
	mov r1, sp
	adds r2, r4, #0
	bl GetMenuCursorPosition
	adds r0, r5, #0
	mov r1, sp
	adds r2, r4, #0
	bl sub_8050418
	ldr r0, [sp]
	ldr r1, [sp, #4]
	bl sub_804F528
	ldr r0, _0805025C @ =0x085775CC
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x81
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08050264
	bl sub_808B2A4
	ldr r1, _08050260 @ =0x085E0698
	adds r0, r5, #0
	bl Proc_GotoScript
	b _0805028A
	.align 2, 0
_0805025C: .4byte 0x085775CC
_08050260: .4byte 0x085E0698
_08050264:
	adds r3, r5, #0
	adds r3, #0x61
	adds r1, r5, #0
	adds r1, #0x62
	ldrb r0, [r3]
	ldrb r1, [r1]
	cmp r0, r1
	beq _0805028A
	ldr r2, [r5, #0x30]
	adds r1, r0, #0
	lsls r1, r1, #2
	adds r0, r5, #0
	adds r0, #0x34
	adds r0, r0, r1
	ldr r1, [r0]
	ldr r2, [r2, #0x20]
	adds r0, r5, #0
	bl sub_80D65C4
_0805028A:
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

