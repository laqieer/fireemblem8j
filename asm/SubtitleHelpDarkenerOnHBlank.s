	.syntax unified
	.section .text.SubtitleHelpDarkenerOnHBlank, "ax", %progbits
@ SubtitleHelpDarkenerOnHBlank @ JP 0x080354B4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global SubtitleHelpDarkenerOnHBlank
	.thumb_func
SubtitleHelpDarkenerOnHBlank:
	push {lr}
	ldr r0, _080354DC @ =0x04000006
	ldrh r0, [r0]
	adds r2, r0, #0
	subs r0, #0x8c
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x14
	bls _080354E8
	ldr r2, _080354E0 @ =0x04000050
	ldr r1, _080354E4 @ =0x0300305C
	ldrh r0, [r1]
	strh r0, [r2]
	adds r2, #2
	ldrh r0, [r1, #8]
	strh r0, [r2]
	adds r2, #2
	ldrb r0, [r1, #0xa]
	strb r0, [r2]
	b _0803550A
	.align 2, 0
_080354DC: .4byte 0x04000006
_080354E0: .4byte 0x04000050
_080354E4: .4byte 0x0300305C
_080354E8:
	ldr r1, _08035510 @ =0x085C6646
	adds r0, r2, #0
	subs r0, #0x80
	adds r0, r0, r1
	ldrb r2, [r0]
	ldr r0, _08035514 @ =0x0202BCAC
	adds r0, #0x38
	ldrb r0, [r0]
	subs r2, r2, r0
	cmp r2, #0
	bge _08035500
	movs r2, #0
_08035500:
	ldr r0, _08035518 @ =0x04000050
	movs r1, #0xec
	strh r1, [r0]
	adds r0, #4
	strb r2, [r0]
_0803550A:
	pop {r0}
	bx r0
	.align 2, 0
_08035510: .4byte 0x085C6646
_08035514: .4byte 0x0202BCAC
_08035518: .4byte 0x04000050

