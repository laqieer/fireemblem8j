	.syntax unified
	.set __divsi3, 0x080D65F8 + 1
	.set m4aSoundVSyncOn, 0x080D5574 + 1
	.section .text.sub_80D5368, "ax", %progbits
@ sub_80D5368 @ JP 0x080D5368 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80D5368
	.thumb_func
sub_80D5368:
	push {r4, r5, r6, lr}
	adds r2, r0, #0
	ldr r0, _080D53E8 @ =0x03007FF0
	ldr r4, [r0]
	movs r0, #0xf0
	lsls r0, r0, #0xc
	ands r0, r2
	lsrs r2, r0, #0x10
	movs r6, #0
	strb r2, [r4, #8]
	ldr r1, _080D53EC @ =0x081F6FB4
	subs r0, r2, #1
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrh r5, [r0]
	str r5, [r4, #0x10]
	movs r0, #0xc6
	lsls r0, r0, #3
	adds r1, r5, #0
	bl __divsi3
	strb r0, [r4, #0xb]
	ldr r0, _080D53F0 @ =0x00091D1B
	muls r0, r5, r0
	ldr r1, _080D53F4 @ =0x00001388
	adds r0, r0, r1
	ldr r1, _080D53F8 @ =0x00002710
	bl __divsi3
	adds r1, r0, #0
	str r1, [r4, #0x14]
	movs r0, #0x80
	lsls r0, r0, #0x11
	bl __divsi3
	adds r0, #1
	asrs r0, r0, #1
	str r0, [r4, #0x18]
	ldr r0, _080D53FC @ =0x04000102
	strh r6, [r0]
	ldr r4, _080D5400 @ =0x04000100
	ldr r0, _080D5404 @ =0x00044940
	adds r1, r5, #0
	bl __divsi3
	rsbs r0, r0, #0
	strh r0, [r4]
	bl m4aSoundVSyncOn
	ldr r1, _080D5408 @ =0x04000006
_080D53CC:
	ldrb r0, [r1]
	cmp r0, #0x9f
	beq _080D53CC
	ldr r1, _080D5408 @ =0x04000006
_080D53D4:
	ldrb r0, [r1]
	cmp r0, #0x9f
	bne _080D53D4
	ldr r1, _080D53FC @ =0x04000102
	movs r0, #0x80
	strh r0, [r1]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080D53E8: .4byte 0x03007FF0
_080D53EC: .4byte 0x081F6FB4
_080D53F0: .4byte 0x00091D1B
_080D53F4: .4byte 0x00001388
_080D53F8: .4byte 0x00002710
_080D53FC: .4byte 0x04000102
_080D5400: .4byte 0x04000100
_080D5404: .4byte 0x00044940
_080D5408: .4byte 0x04000006

