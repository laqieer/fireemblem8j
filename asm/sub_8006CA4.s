	.syntax unified
	.set CheckTalkFlag, 0x080069E0 + 1
	.set Proc_StartBlocking, 0x08002C30 + 1
	.set PutText, 0x08003DA0 + 1
	.set SetTalkFaceLayer, 0x08007890 + 1
	.set SetTalkFaceMouthMove, 0x080088B4 + 1
	.set TalkHasCorrectBubble, 0x08008808 + 1
	.set __modsi3, 0x080D6690 + 1
	.set sub_80080A4, 0x080080A4 + 1
	.set sub_80087A4, 0x080087A4 + 1
	.set sub_8008A40, 0x08008A40 + 1
	.set sub_8008E10, 0x08008E10 + 1
	.set sub_80D6374, 0x080D6374 + 1
	.section .text.sub_8006CA4, "ax", %progbits
@ sub_8006CA4 @ JP 0x08006CA4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8006CA4
	.thumb_func
sub_8006CA4:
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	bl TalkHasCorrectBubble
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08006D10
	ldr r4, _08006D0C @ =0x085B90D4
	ldr r0, [r4]
	ldrb r0, [r0, #0x11]
	cmp r0, #0xff
	beq _08006D10
	movs r0, #2
	bl CheckTalkFlag
	cmp r0, #0
	bne _08006D10
	ldr r1, [r4]
	ldr r0, [r1, #4]
	cmp r0, #0
	bne _08006CD0
	ldr r0, [r1]
_08006CD0:
	movs r1, #0
	bl sub_8008A40
	adds r0, #7
	movs r1, #8
	bl sub_80D6374
	ldr r1, [r4]
	adds r0, #2
	strb r0, [r1, #0xe]
	bl sub_80080A4
	ldr r4, _08006D0C @ =0x085B90D4
	ldr r0, [r4]
	ldrb r0, [r0, #0x11]
	adds r1, r7, #0
	bl sub_80087A4
	ldr r0, [r4]
	ldrb r4, [r0, #0x11]
	movs r0, #0x10
	bl CheckTalkFlag
	adds r1, r0, #0
	adds r0, r4, #0
	bl SetTalkFaceLayer
	movs r0, #1
	b _08006D80
	.align 2, 0
_08006D0C: .4byte 0x085B90D4
_08006D10:
	ldr r6, _08006D2C @ =0x085B90D4
	ldr r5, [r6]
	ldrb r0, [r5, #9]
	ldrb r1, [r5, #0xa]
	cmp r0, r1
	blo _08006D34
	movs r0, #0
	strb r0, [r5, #0x12]
	ldr r0, _08006D30 @ =0x085B9260
	adds r1, r7, #0
	bl Proc_StartBlocking
	movs r0, #1
	b _08006D80
	.align 2, 0
_08006D2C: .4byte 0x085B90D4
_08006D30: .4byte 0x085B9260
_08006D34:
	ldrb r0, [r5, #0x15]
	cmp r0, #0
	bne _08006D70
	ldrb r4, [r5, #9]
	ldrb r0, [r5, #0xb]
	adds r0, r4, r0
	ldrb r1, [r5, #0xa]
	bl __modsi3
	lsls r0, r0, #3
	ldr r1, _08006D88 @ =0x030000C8
	adds r0, r0, r1
	lsls r4, r4, #1
	ldrb r1, [r5, #0xd]
	adds r4, r4, r1
	lsls r4, r4, #5
	ldrb r5, [r5, #0xc]
	adds r4, r4, r5
	lsls r4, r4, #1
	ldr r1, _08006D8C @ =0x02022CA8
	adds r4, r4, r1
	adds r1, r4, #0
	bl PutText
	movs r0, #1
	bl sub_8008E10
	ldr r1, [r6]
	movs r0, #1
	strb r0, [r1, #0x15]
_08006D70:
	ldr r1, [r6]
	ldrb r0, [r1, #0x16]
	cmp r0, #0
	beq _08006D7E
	ldrb r0, [r1, #0x11]
	bl SetTalkFaceMouthMove
_08006D7E:
	movs r0, #0
_08006D80:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08006D88: .4byte 0x030000C8
_08006D8C: .4byte 0x02022CA8

