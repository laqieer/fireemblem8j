	.syntax unified
	.section .text.MidiKeyToCgbFreq, "ax", %progbits
@ MidiKeyToCgbFreq @ JP 0x080D58C8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global MidiKeyToCgbFreq
	.thumb_func
MidiKeyToCgbFreq:
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	lsls r1, r1, #0x18
	lsrs r5, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov ip, r2
	cmp r0, #4
	bne _080D5900
	cmp r5, #0x14
	bhi _080D58E4
	movs r5, #0
	b _080D58F2
_080D58E4:
	adds r0, r5, #0
	subs r0, #0x15
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0x3b
	bls _080D58F2
	movs r5, #0x3b
_080D58F2:
	ldr r0, _080D58FC @ =0x081F7068
	adds r0, r5, r0
	ldrb r0, [r0]
	b _080D5962
	.align 2, 0
_080D58FC: .4byte 0x081F7068
_080D5900:
	cmp r5, #0x23
	bhi _080D590C
	movs r0, #0
	mov ip, r0
	movs r5, #0
	b _080D591E
_080D590C:
	adds r0, r5, #0
	subs r0, #0x24
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	cmp r5, #0x82
	bls _080D591E
	movs r5, #0x82
	movs r1, #0xff
	mov ip, r1
_080D591E:
	ldr r3, _080D5968 @ =0x081F6FCC
	adds r0, r5, r3
	ldrb r6, [r0]
	ldr r4, _080D596C @ =0x081F7050
	movs r2, #0xf
	adds r0, r6, #0
	ands r0, r2
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r7, #0
	ldrsh r1, [r0, r7]
	asrs r0, r6, #4
	adds r6, r1, #0
	asrs r6, r0
	adds r0, r5, #1
	adds r0, r0, r3
	ldrb r1, [r0]
	adds r0, r1, #0
	ands r0, r2
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r2, #0
	ldrsh r0, [r0, r2]
	asrs r1, r1, #4
	asrs r0, r1
	subs r0, r0, r6
	mov r7, ip
	muls r7, r0, r7
	adds r0, r7, #0
	asrs r0, r0, #8
	adds r0, r6, r0
	movs r1, #0x80
	lsls r1, r1, #4
	adds r0, r0, r1
_080D5962:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080D5968: .4byte 0x081F6FCC
_080D596C: .4byte 0x081F7050

