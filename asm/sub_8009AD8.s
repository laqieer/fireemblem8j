	.syntax unified
	.set Proc_Goto, 0x08002E74 + 1
	.set sub_80C165C, 0x080C165C + 1
	.section .text.sub_8009AD8, "ax", %progbits
@ sub_8009AD8 @ JP 0x08009AD8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8009AD8
	.thumb_func
sub_8009AD8:
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #0xd
	bhi _08009B74
	lsls r0, r0, #2
	ldr r1, _08009AF0 @ =_08009AF4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08009AF0: .4byte _08009AF4
_08009AF4: @ jump table
	.4byte _08009B2C @ case 0
	.4byte _08009B30 @ case 1
	.4byte _08009B30 @ case 2
	.4byte _08009B30 @ case 3
	.4byte _08009B3A @ case 4
	.4byte _08009B44 @ case 5
	.4byte _08009B4E @ case 6
	.4byte _08009B58 @ case 7
	.4byte _08009B62 @ case 8
	.4byte _08009B74 @ case 9
	.4byte _08009B74 @ case 10
	.4byte _08009B74 @ case 11
	.4byte _08009B74 @ case 12
	.4byte _08009B6C @ case 13
_08009B2C:
	bl sub_80C165C
_08009B30:
	adds r0, r4, #0
	movs r1, #6
	bl Proc_Goto
	b _08009B74
_08009B3A:
	adds r0, r4, #0
	movs r1, #7
	bl Proc_Goto
	b _08009B74
_08009B44:
	adds r0, r4, #0
	movs r1, #0x18
	bl Proc_Goto
	b _08009B74
_08009B4E:
	adds r0, r4, #0
	movs r1, #0xb
	bl Proc_Goto
	b _08009B74
_08009B58:
	adds r0, r4, #0
	movs r1, #0xc
	bl Proc_Goto
	b _08009B74
_08009B62:
	adds r0, r4, #0
	movs r1, #0xd
	bl Proc_Goto
	b _08009B74
_08009B6C:
	adds r0, r4, #0
	movs r1, #0xe
	bl Proc_Goto
_08009B74:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

