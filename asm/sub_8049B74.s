	.syntax unified
	.set SetTextFont, 0x08003C68 + 1
	.set sub_8049B2C, 0x08049B2C + 1
	.section .text.sub_8049B74, "ax", %progbits
@ sub_8049B74 @ JP 0x08049B74 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8049B74
	.thumb_func
sub_8049B74:
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r1, _08049BD4 @ =0x080DEF14
	adds r2, r6, #0
	adds r2, #0x32
	ldr r0, _08049BD8 @ =0x085D31E8
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #2
	ldrb r2, [r2]
	adds r0, r0, r2
	adds r0, r0, r1
	ldrb r0, [r0]
	ldr r2, _08049BDC @ =0x080DEF74
	lsls r0, r0, #1
	adds r1, r0, r2
	ldrb r1, [r1]
	movs r5, #0
	strh r1, [r6, #0x2a]
	adds r0, #1
	adds r0, r0, r2
	ldrb r0, [r0]
	strh r0, [r6, #0x2c]
	movs r0, #0
	bl SetTextFont
	adds r0, r6, #0
	adds r0, #0x48
	movs r2, #0x2a
	ldrsh r1, [r6, r2]
	movs r3, #0x2c
	ldrsh r2, [r6, r3]
	ldr r3, [r6, #0x38]
	ldr r4, [r6, #0x34]
	subs r3, r3, r4
	bl sub_8049B2C
	str r5, [r6, #0x3c]
	ldr r0, [r6, #0x38]
	ldr r1, [r6, #0x34]
	subs r0, r0, r1
	str r0, [r6, #0x44]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08049BD4: .4byte 0x080DEF14
_08049BD8: .4byte 0x085D31E8
_08049BDC: .4byte 0x080DEF74

