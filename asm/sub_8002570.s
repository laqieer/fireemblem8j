	.syntax unified
	.set StartSongDelayed, 0x080027A8 + 1
	.set m4aMPlayFadeOutTemporarily, 0x080D509C + 1
	.section .text.sub_8002570, "ax", %progbits
@ sub_8002570 @ JP 0x08002570 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8002570
	.thumb_func
sub_8002570:
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, _080025B0 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1f
	cmp r0, #0
	bne _080025AA
	ldr r4, _080025B4 @ =0x02024E5C
	ldrh r0, [r4, #4]
	movs r6, #0
	strh r0, [r4, #2]
	movs r0, #7
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bne _08002598
	ldr r0, _080025B8 @ =0x03006640
	movs r1, #3
	bl m4aMPlayFadeOutTemporarily
_08002598:
	strb r6, [r4, #6]
	strb r6, [r4, #7]
	cmp r5, #0
	beq _080025AA
	ldr r2, _080025BC @ =0x03006430
	adds r0, r5, #0
	movs r1, #0x20
	bl StartSongDelayed
_080025AA:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080025B0: .4byte 0x0202BCEC
_080025B4: .4byte 0x02024E5C
_080025B8: .4byte 0x03006640
_080025BC: .4byte 0x03006430

