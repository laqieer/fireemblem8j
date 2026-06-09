	.syntax unified
	.set CopyToPalOpAnim, 0x080CB6AC + 1
	.set NewOpAnimfxTerminator, 0x080CB684 + 1
	.set SetNextGameActionId, 0x08009EB0 + 1
	.set SetPrimaryHBlankHandler, 0x08001D28 + 1
	.set sub_8001ACC, 0x08001ACC + 1
	.set sub_800226C, 0x0800226C + 1
	.set sub_8013008, 0x08013008 + 1
	.set sub_80D636C, 0x080D636C + 1
	.section .text.sub_80CB960, "ax", %progbits
@ sub_80CB960 @ JP 0x080CB960 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80CB960
	.thumb_func
sub_80CB960:
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r0, #1
	bl sub_800226C
	movs r0, #0
	bl sub_8001ACC
	movs r0, #0
	bl SetPrimaryHBlankHandler
	movs r1, #0
	strh r1, [r4, #0x2a]
	ldr r0, _080CBA1C @ =0x02022188
	strh r1, [r0, #0xc]
	ldr r2, _080CBA20 @ =0x03003020
	ldrb r0, [r2]
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r2]
	ldrb r1, [r2, #1]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #2
	ands r0, r1
	subs r1, #4
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r2, #1]
	ldr r0, _080CBA24 @ =0x08B8B4B0
	ldr r1, _080CBA28 @ =0x06010000
	bl sub_8013008
	ldr r0, _080CBA2C @ =0x08B8B500
	ldr r1, _080CBA30 @ =0x06010100
	bl sub_8013008
	ldr r0, _080CBA34 @ =0x08B8B998
	ldr r1, _080CBA38 @ =0x060108C0
	bl sub_8013008
	ldr r0, _080CBA3C @ =0x08B8C45C
	ldr r1, _080CBA40 @ =0x060119C0
	bl sub_8013008
	ldr r0, _080CBA44 @ =0x08B8B4E0
	movs r1, #0x80
	lsls r1, r1, #2
	movs r2, #0x20
	bl CopyToPalOpAnim
	ldr r0, _080CBA48 @ =0x08B8B978
	movs r1, #0x88
	lsls r1, r1, #2
	movs r2, #0x20
	bl CopyToPalOpAnim
	ldr r0, _080CBA4C @ =0x08B8C43C
	movs r1, #0x90
	lsls r1, r1, #2
	movs r2, #0x20
	bl CopyToPalOpAnim
	ldr r0, _080CBA50 @ =0x08B8CF14
	movs r1, #0x98
	lsls r1, r1, #2
	movs r2, #0x20
	bl CopyToPalOpAnim
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [sp]
	ldr r1, _080CBA54 @ =0x06017800
	ldr r2, _080CBA58 @ =0x01000200
	mov r0, sp
	bl sub_80D636C
	movs r0, #3
	bl SetNextGameActionId
	adds r0, r4, #0
	bl NewOpAnimfxTerminator
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080CBA1C: .4byte 0x02022188
_080CBA20: .4byte 0x03003020
_080CBA24: .4byte 0x08B8B4B0
_080CBA28: .4byte 0x06010000
_080CBA2C: .4byte 0x08B8B500
_080CBA30: .4byte 0x06010100
_080CBA34: .4byte 0x08B8B998
_080CBA38: .4byte 0x060108C0
_080CBA3C: .4byte 0x08B8C45C
_080CBA40: .4byte 0x060119C0
_080CBA44: .4byte 0x08B8B4E0
_080CBA48: .4byte 0x08B8B978
_080CBA4C: .4byte 0x08B8C43C
_080CBA50: .4byte 0x08B8CF14
_080CBA54: .4byte 0x06017800
_080CBA58: .4byte 0x01000200

