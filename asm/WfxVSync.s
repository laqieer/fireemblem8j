	.syntax unified
	.set WfxFlames_VSync, 0x08030930 + 1
	.set nullsub_44, 0x08030660 + 1
	.set sub_8030220, 0x08030220 + 1
	.set sub_8030344, 0x08030344 + 1
	.set sub_8030434, 0x08030434 + 1
	.set sub_803054C, 0x0803054C + 1
	.set sub_80309D4, 0x080309D4 + 1
	.section .text.WfxVSync, "ax", %progbits
@ WfxVSync @ JP 0x08030AF4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global WfxVSync
	.thumb_func
WfxVSync:
	push {lr}
	ldr r0, _08030B0C @ =0x0202BCEC
	ldrb r0, [r0, #0x15]
	subs r0, #1
	cmp r0, #6
	bhi _08030B58
	lsls r0, r0, #2
	ldr r1, _08030B10 @ =_08030B14
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08030B0C: .4byte 0x0202BCEC
_08030B10: .4byte _08030B14
_08030B14: @ jump table
	.4byte _08030B30 @ case 0
	.4byte _08030B3C @ case 1
	.4byte _08030B48 @ case 2
	.4byte _08030B42 @ case 3
	.4byte _08030B4E @ case 4
	.4byte _08030B36 @ case 5
	.4byte _08030B54 @ case 6
_08030B30:
	bl sub_8030220
	b _08030B58
_08030B36:
	bl sub_8030434
	b _08030B58
_08030B3C:
	bl sub_803054C
	b _08030B58
_08030B42:
	bl sub_8030344
	b _08030B58
_08030B48:
	bl nullsub_44
	b _08030B58
_08030B4E:
	bl WfxFlames_VSync
	b _08030B58
_08030B54:
	bl sub_80309D4
_08030B58:
	pop {r0}
	bx r0

