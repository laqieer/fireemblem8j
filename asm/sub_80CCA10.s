	.syntax unified
	.set PutSpriteExt, 0x08005330 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_80CC590, 0x080CC590 + 1
	.section .text.sub_80CCA10, "ax", %progbits
@ OpAnimEphraimDisplayName @ JP 0x080CCA10 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global OpAnimEphraimDisplayName
	.thumb_func
OpAnimEphraimDisplayName:
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r4, r0, #0
	movs r0, #0xe8
	movs r1, #0x88
	bl sub_80CC590
	ldr r3, _080CCA98 @ =0x08B3F1CE
	ldr r0, _080CCA9C @ =0x00002056
	str r0, [sp]
	movs r0, #1
	movs r1, #0xaa
	movs r2, #0x78
	bl PutSpriteExt
	ldr r3, _080CCAA0 @ =0x08B3F1DC
	ldr r0, _080CCAA4 @ =0x0000207A
	str r0, [sp]
	movs r0, #1
	movs r1, #0x98
	movs r2, #0x88
	bl PutSpriteExt
	ldrh r0, [r4, #0x2a]
	cmp r0, #0x38
	bne _080CCAB4
	movs r0, #0
	strh r0, [r4, #0x2a]
	ldrh r0, [r4, #0x30]
	strh r0, [r4, #0x34]
	ldrh r0, [r4, #0x32]
	strh r0, [r4, #0x36]
	ldr r2, _080CCAA8 @ =0x03003020
	ldrb r0, [r2, #1]
	movs r1, #1
	orrs r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
	ldr r6, _080CCAAC @ =0x00007FFF
	movs r0, #0xf0
	lsls r0, r0, #8
	adds r5, r0, #0
	ldr r2, _080CCAB0 @ =0x02023CA8
	movs r7, #0
	movs r3, #0xa0
	lsls r3, r3, #2
_080CCA7C:
	ldrh r1, [r2]
	adds r0, r6, #0
	ands r0, r1
	orrs r0, r5
	strh r0, [r2]
	adds r2, #2
	subs r3, #1
	cmp r3, #0
	bne _080CCA7C
	adds r0, r4, #0
	bl sub_8002DE4
	b _080CCAB8
	.align 2, 0
_080CCA98: .4byte 0x08B3F1CE
_080CCA9C: .4byte 0x00002056
_080CCAA0: .4byte 0x08B3F1DC
_080CCAA4: .4byte 0x0000207A
_080CCAA8: .4byte 0x03003020
_080CCAAC: .4byte 0x00007FFF
_080CCAB0: .4byte 0x02023CA8
_080CCAB4:
	adds r0, #1
	strh r0, [r4, #0x2a]
_080CCAB8:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

