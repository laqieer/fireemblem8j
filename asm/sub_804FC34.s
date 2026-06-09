	.syntax unified
	.set BG_SetPosition, 0x08001448 + 1
	.set Proc_End, 0x08002CBC + 1
	.set UnlockGame, 0x08015394 + 1
	.set sub_80D65C0, 0x080D65C0 + 1
	.set sub_80D65C4, 0x080D65C4 + 1
	.section .text.sub_804FC34, "ax", %progbits
@ sub_804FC34 @ JP 0x0804FC34 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_804FC34
	.thumb_func
sub_804FC34:
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r0, #0x61
	ldrb r1, [r0]
	lsls r1, r1, #2
	subs r0, #0x2d
	adds r0, r0, r1
	ldr r3, [r0]
	adds r4, r5, #0
	adds r4, #0x63
	ldrb r1, [r4]
	movs r0, #4
	orrs r0, r1
	strb r0, [r4]
	ldr r0, [r3, #0x30]
	ldr r2, [r0, #0x20]
	cmp r2, #0
	beq _0804FC60
	adds r0, r5, #0
	adds r1, r3, #0
	bl sub_80D65C4
_0804FC60:
	ldr r0, [r5, #0x30]
	ldr r1, [r0, #0x10]
	cmp r1, #0
	beq _0804FC6E
	adds r0, r5, #0
	bl sub_80D65C0
_0804FC6E:
	ldrb r1, [r4]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0804FC7C
	bl UnlockGame
_0804FC7C:
	adds r0, r5, #0
	bl Proc_End
	adds r4, r5, #0
	adds r4, #0x64
	ldrb r0, [r4]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1e
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	ldrb r0, [r4]
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x1e
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	ldr r0, [r5, #0x14]
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

