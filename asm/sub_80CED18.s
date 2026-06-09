	.syntax unified
	.set CopyToPalOpAnim, 0x080CB6AC + 1
	.set sub_80CEB38, 0x080CEB38 + 1
	.section .text.sub_80CED18, "ax", %progbits
@ sub_80CED18 @ JP 0x080CED18 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80CED18
	.thumb_func
sub_80CED18:
	push {r4, lr}
	adds r4, r0, #0
	bl sub_80CEB38
	ldr r0, _080CED64 @ =0x08B72370
	movs r2, #0xb0
	lsls r2, r2, #1
	movs r1, #0
	bl CopyToPalOpAnim
	adds r1, r4, #0
	adds r1, #0x47
	movs r2, #0
	movs r0, #1
	strb r0, [r1]
	ldr r0, _080CED68 @ =0x02020188
	str r0, [r4, #0x48]
	movs r1, #0x80
	lsls r1, r1, #4
	adds r0, r0, r1
	str r0, [r4, #0x4c]
	adds r0, r4, #0
	adds r0, #0x44
	movs r1, #0xe8
	strh r1, [r0]
	adds r3, r4, #0
	adds r3, #0x42
	movs r0, #0x8c
	lsls r0, r0, #1
	strh r0, [r3]
	adds r0, r4, #0
	adds r0, #0x40
	strh r1, [r0]
	strh r2, [r4, #0x30]
	strh r2, [r4, #0x32]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080CED64: .4byte 0x08B72370
_080CED68: .4byte 0x02020188

