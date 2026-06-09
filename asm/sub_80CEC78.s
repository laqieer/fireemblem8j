	.syntax unified
	.set CopyToPalOpAnim, 0x080CB6AC + 1
	.set sub_80CEB38, 0x080CEB38 + 1
	.section .text.sub_80CEC78, "ax", %progbits
@ sub_80CEC78 @ JP 0x080CEC78 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80CEC78
	.thumb_func
sub_80CEC78:
	push {r4, lr}
	adds r4, r0, #0
	bl sub_80CEB38
	ldr r0, _080CECC0 @ =0x08B6BE7C
	movs r2, #0xb0
	lsls r2, r2, #1
	movs r1, #0
	bl CopyToPalOpAnim
	adds r1, r4, #0
	adds r1, #0x47
	movs r2, #0
	movs r0, #1
	strb r0, [r1]
	ldr r0, _080CECC4 @ =0x02020188
	str r0, [r4, #0x48]
	movs r1, #0x80
	lsls r1, r1, #4
	adds r0, r0, r1
	str r0, [r4, #0x4c]
	adds r1, r4, #0
	adds r1, #0x44
	movs r0, #0xc0
	strh r0, [r1]
	subs r1, #2
	adds r0, #0x80
	strh r0, [r1]
	subs r1, #2
	subs r0, #0x28
	strh r0, [r1]
	strh r2, [r4, #0x30]
	strh r2, [r4, #0x32]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080CECC0: .4byte 0x08B6BE7C
_080CECC4: .4byte 0x02020188

