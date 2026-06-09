	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set BG_SetPosition, 0x08001448 + 1
	.set InitText, 0x08003C8C + 1
	.set Proc_Goto, 0x08002E74 + 1
	.set ResetText, 0x08003BC4 + 1
	.set ResetTextFont, 0x08003C50 + 1
	.set StartMuralBackground, 0x08088E74 + 1
	.set sub_80011D0, 0x080011D0 + 1
	.set sub_8001ACC, 0x08001ACC + 1
	.set sub_8001EE4, 0x08001EE4 + 1
	.set sub_804F0EC, 0x0804F0EC + 1
	.set sub_804F8E0, 0x0804F8E0 + 1
	.set sub_80A6A30, 0x080A6A30 + 1
	.set sub_80A6E4C, 0x080A6E4C + 1
	.set sub_80A723C, 0x080A723C + 1
	.set sub_80A730C, 0x080A730C + 1
	.section .text.sub_80A74D4, "ax", %progbits
@ sub_80A74D4 @ JP 0x080A74D4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A74D4
	.thumb_func
sub_80A74D4:
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	movs r0, #0
	bl sub_8001ACC
	bl ResetTextFont
	bl ResetText
	ldr r4, _080A75CC @ =0x03003020
	ldrb r0, [r4, #1]
	movs r3, #1
	orrs r0, r3
	movs r5, #2
	orrs r0, r5
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x11
	rsbs r1, r1, #0
	ands r0, r1
	strb r0, [r4, #1]
	ldrb r2, [r4, #0xc]
	adds r1, #0xd
	adds r0, r1, #0
	ands r0, r2
	orrs r0, r3
	strb r0, [r4, #0xc]
	ldrb r2, [r4, #0x10]
	adds r0, r1, #0
	ands r0, r2
	orrs r0, r5
	strb r0, [r4, #0x10]
	ldrb r0, [r4, #0x14]
	ands r1, r0
	strb r1, [r4, #0x14]
	ldrb r0, [r4, #0x18]
	movs r1, #3
	orrs r0, r1
	strb r0, [r4, #0x18]
	bl sub_804F8E0
	bl sub_8001EE4
	ldr r0, _080A75D0 @ =0x02022CA8
	movs r1, #0
	bl sub_80011D0
	ldr r0, _080A75D4 @ =0x020234A8
	movs r1, #0
	bl sub_80011D0
	ldr r0, _080A75D8 @ =0x02023CA8
	movs r1, #0
	bl sub_80011D0
	ldr r0, _080A75DC @ =0x020244A8
	movs r1, #0
	bl sub_80011D0
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	ldrb r1, [r4, #1]
	movs r0, #0x21
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r4, #1]
	movs r0, #2
	str r0, [sp]
	movs r1, #6
	movs r2, #0x1a
	movs r3, #7
	bl sub_804F0EC
	movs r0, #0xf
	bl BG_EnableSyncByMask
	ldr r5, _080A75E0 @ =0x02014EFC
	movs r4, #2
_080A75A4:
	adds r0, r5, #0
	movs r1, #0x1b
	bl InitText
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bge _080A75A4
	ldr r0, [r6, #0x30]
	ldr r1, [r6, #0x34]
	bl sub_80A723C
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080A75E4
	adds r0, r6, #0
	movs r1, #0x63
	bl Proc_Goto
	b _080A7606
	.align 2, 0
_080A75CC: .4byte 0x03003020
_080A75D0: .4byte 0x02022CA8
_080A75D4: .4byte 0x020234A8
_080A75D8: .4byte 0x02023CA8
_080A75DC: .4byte 0x020244A8
_080A75E0: .4byte 0x02014EFC
_080A75E4:
	movs r0, #5
	movs r1, #0x11
	bl sub_80A6A30
	ldr r0, _080A7610 @ =sub_80A705C
	bl sub_80A6E4C
	ldr r0, _080A7614 @ =0x02014EFC
	ldr r1, _080A7618 @ =0x08A95DDC
	bl sub_80A730C
	movs r0, #0
	movs r1, #0
	movs r2, #0xa
	bl StartMuralBackground
	str r0, [r6, #0x2c]
_080A7606:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A7610: .4byte 0x080A705D  @ sub_80A705C
_080A7614: .4byte 0x02014EFC
_080A7618: .4byte 0x08A95DDC

