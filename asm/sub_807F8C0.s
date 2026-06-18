	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set SetBlendConfig, 0x08001DF0 + 1
	.set sub_80011D0, 0x080011D0 + 1
	.set sub_8001570, 0x08001570 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8013008, 0x08013008 + 1
	.set sub_8014B50, 0x08014B50 + 1
	.section .text.sub_807F8C0, "ax", %progbits
@ NightMarefx_Loop @ JP 0x0807F8C0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global NightMarefx_Loop
	.thumb_func
NightMarefx_Loop:
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	adds r0, #0x42
	ldrh r0, [r0]
	cmp r0, #0
	bne _0807F98E
	adds r0, r5, #0
	adds r0, #0x40
	ldrh r1, [r0]
	adds r6, r0, #0
	cmp r1, #0
	bne _0807F8E6
	movs r0, #0xe1
	lsls r0, r0, #2
	ldr r1, [r5, #0x30]
	bl sub_8014B50
	b _0807F8F2
_0807F8E6:
	cmp r1, #0x21
	bls _0807F8F2
	adds r0, r5, #0
	bl sub_8002DE4
	b _0807F998
_0807F8F2:
	ldr r0, _0807F914 @ =0x081F5154
	ldrh r1, [r6]
	lsls r1, r1, #2
	adds r1, r1, r0
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	bge _0807F91C
	ldr r0, _0807F918 @ =0x02023CA8
	movs r1, #0
	bl sub_80011D0
	movs r0, #4
	bl BG_EnableSyncByMask
	b _0807F966
	.align 2, 0
_0807F914: .4byte 0x081F5154
_0807F918: .4byte 0x02023CA8
_0807F91C:
	ldr r0, _0807F9A0 @ =0x08A14140
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	lsls r1, r1, #2
	adds r1, r1, r0
	ldr r0, [r1]
	ldr r4, _0807F9A4 @ =0x02020188
	adds r1, r4, #0
	bl sub_8013008
	ldr r1, _0807F9A8 @ =0x02023CA8
	ldr r0, [r5, #0x30]
	cmp r0, #0
	bge _0807F93C
	adds r0, #7
_0807F93C:
	asrs r0, r0, #3
	subs r0, #9
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	ldr r3, [r5, #0x34]
	cmp r3, #0
	bge _0807F94C
	adds r3, #7
_0807F94C:
	asrs r3, r3, #3
	subs r3, #9
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	ldr r0, _0807F9AC @ =0x00004140
	str r0, [sp]
	adds r0, r1, #0
	adds r1, r4, #0
	bl sub_8001570
	movs r0, #4
	bl BG_EnableSyncByMask
_0807F966:
	ldr r4, _0807F9B0 @ =0x081F5154
	ldrh r0, [r6]
	lsls r0, r0, #2
	adds r0, r0, r4
	ldrb r1, [r0, #2]
	movs r0, #1
	movs r2, #0x10
	movs r3, #0
	bl SetBlendConfig
	ldrh r0, [r6]
	lsls r0, r0, #2
	adds r0, r0, r4
	ldrb r0, [r0, #1]
	adds r1, r5, #0
	adds r1, #0x42
	strh r0, [r1]
	ldrh r0, [r6]
	adds r0, #1
	strh r0, [r6]
_0807F98E:
	adds r1, r5, #0
	adds r1, #0x42
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
_0807F998:
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807F9A0: .4byte 0x08A14140
_0807F9A4: .4byte 0x02020188
_0807F9A8: .4byte 0x02023CA8
_0807F9AC: .4byte 0x00004140
_0807F9B0: .4byte 0x081F5154

