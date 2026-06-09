	.syntax unified
	.set CheckGameEndFlag, 0x080A96F8 + 1
	.set Proc_Goto, 0x08002E74 + 1
	.set SetTextFont, 0x08003C68 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8003D84, 0x08003D84 + 1
	.set sub_8003D90, 0x08003D90 + 1
	.set sub_80040B8, 0x080040B8 + 1
	.section .text.sub_80BBE08, "ax", %progbits
@ sub_80BBE08 @ JP 0x080BBE08 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80BBE08
	.thumb_func
sub_80BBE08:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080BBE34 @ =0x085775CC
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _080BBE38
	bl CheckGameEndFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080BBE38
	adds r0, r4, #0
	bl sub_8002DE4
	ldr r0, [r4, #0x14]
	movs r1, #0x64
	bl Proc_Goto
	b _080BBEE0
	.align 2, 0
_080BBE34: .4byte 0x085775CC
_080BBE38:
	ldr r0, [r4, #0x3c]
	cmp r0, #0
	beq _080BBE42
	subs r0, #1
	b _080BBEDE
_080BBE42:
	movs r0, #0
	bl SetTextFont
	ldr r0, [r4, #0x44]
	ldrb r0, [r0]
	cmp r0, #7
	bhi _080BBED2
	lsls r0, r0, #2
	ldr r1, _080BBE5C @ =_080BBE60
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080BBE5C: .4byte _080BBE60
_080BBE60: @ jump table
	.4byte _080BBE80 @ case 0
	.4byte _080BBE88 @ case 1
	.4byte _080BBED2 @ case 2
	.4byte _080BBED2 @ case 3
	.4byte _080BBEAA @ case 4
	.4byte _080BBEB4 @ case 5
	.4byte _080BBEBE @ case 6
	.4byte _080BBEC8 @ case 7
_080BBE80:
	adds r0, r4, #0
	bl sub_8002DE4
	b _080BBEDC
_080BBE88:
	ldr r0, [r4, #0x44]
	adds r0, #1
	str r0, [r4, #0x44]
	ldr r0, [r4, #0x48]
	adds r0, #8
	str r0, [r4, #0x48]
	ldr r1, [r4, #0x3c]
	adds r1, #0x10
	str r1, [r4, #0x3c]
	movs r1, #0
	bl sub_8003D84
	ldr r0, [r4, #0x48]
	movs r1, #0
	bl sub_8003D90
	b _080BBEDC
_080BBEAA:
	movs r0, #8
	str r0, [r4, #0x3c]
	ldr r0, [r4, #0x44]
	adds r0, #1
	b _080BBEDA
_080BBEB4:
	movs r0, #0x10
	str r0, [r4, #0x3c]
	ldr r0, [r4, #0x44]
	adds r0, #1
	b _080BBEDA
_080BBEBE:
	movs r0, #0x20
	str r0, [r4, #0x3c]
	ldr r0, [r4, #0x44]
	adds r0, #1
	b _080BBEDA
_080BBEC8:
	movs r0, #0x40
	str r0, [r4, #0x3c]
	ldr r0, [r4, #0x44]
	adds r0, #1
	b _080BBEDA
_080BBED2:
	ldr r0, [r4, #0x48]
	ldr r1, [r4, #0x44]
	bl sub_80040B8
_080BBEDA:
	str r0, [r4, #0x44]
_080BBEDC:
	ldr r0, [r4, #0x40]
_080BBEDE:
	str r0, [r4, #0x3c]
_080BBEE0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

