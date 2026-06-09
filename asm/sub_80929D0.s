	.syntax unified
	.set InitMenuScrollBarImg, 0x080999E4 + 1
	.set PutMenuScrollBarAt, 0x08099990 + 1
	.set StartMenuScrollBar, 0x0809997C + 1
	.set UpdateMenuScrollBarConfig, 0x080999B0 + 1
	.set sub_8013008, 0x08013008 + 1
	.set sub_8026F38, 0x08026F38 + 1
	.section .text.sub_80929D0, "ax", %progbits
@ sub_80929D0 @ JP 0x080929D0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80929D0
	.thumb_func
sub_80929D0:
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x14]
	str r0, [r5, #0x2c]
	adds r0, r5, #0
	adds r0, #0x3b
	movs r4, #0
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	ldr r0, [r5, #0x2c]
	ldrh r0, [r0, #0x3e]
	movs r1, #0
	strh r0, [r5, #0x38]
	adds r0, r5, #0
	adds r0, #0x3a
	strb r1, [r0]
	adds r0, r5, #0
	bl StartMenuScrollBar
	str r0, [r5, #0x34]
	movs r0, #0xe0
	movs r1, #0x40
	bl PutMenuScrollBarAt
	ldr r0, [r5, #0x2c]
	ldrh r1, [r0, #0x3e]
	ldr r0, _08092A50 @ =0x0200F158
	ldrb r2, [r0]
	movs r0, #0xa
	movs r3, #6
	bl UpdateMenuScrollBarConfig
	movs r0, #0xe4
	lsls r0, r0, #7
	movs r1, #1
	bl InitMenuScrollBarImg
	bl sub_8026F38
	movs r0, #7
	strh r0, [r5, #0x3e]
	adds r1, r5, #0
	adds r1, #0x40
	movs r0, #0xe1
	strh r0, [r1]
	adds r0, r5, #0
	adds r0, #0x44
	strh r4, [r0]
	subs r0, #2
	strh r4, [r0]
	adds r0, #6
	movs r1, #4
	strh r1, [r0]
	subs r0, #2
	strh r1, [r0]
	ldr r0, _08092A54 @ =0x08A99270
	ldr r1, _08092A58 @ =0x06010280
	bl sub_8013008
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08092A50: .4byte 0x0200F158
_08092A54: .4byte 0x08A99270
_08092A58: .4byte 0x06010280

