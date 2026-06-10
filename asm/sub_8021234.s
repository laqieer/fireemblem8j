	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set SetBlendConfig, 0x08001DF0 + 1
	.set SetBlendTargetA, 0x08001E20 + 1
	.set SetBlendTargetB, 0x08001E5C + 1
	.set m4aSongNumStart, 0x080D4EF4 + 1
	.set sub_8000D68, 0x08000D68 + 1
	.set sub_80011D0, 0x080011D0 + 1
	.set sub_8013008, 0x08013008 + 1
	.section .text.sub_8021234, "ax", %progbits
@ sub_8021234 @ JP 0x08021234 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8021234
	.thumb_func
sub_8021234:
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	ldr r0, _080212CC @ =0x085CC560
	ldr r1, _080212D0 @ =0x06002000
	bl sub_8013008
	ldr r0, _080212D4 @ =0x085CDC84
	movs r1, #0x40
	movs r2, #0x20
	bl sub_8000D68
	ldr r0, _080212D8 @ =0x085CDCA4
	ldr r4, _080212DC @ =0x02003D2C
	adds r1, r4, #0
	bl sub_8013008
	movs r0, #0x84
	lsls r0, r0, #6
	adds r1, r0, #0
	movs r5, #0xd8
	lsls r5, r5, #2
_08021260:
	ldrh r2, [r4]
	adds r0, r1, r2
	strh r0, [r4]
	adds r4, #2
	subs r5, #1
	cmp r5, #0
	bne _08021260
	ldr r0, _080212E0 @ =0x02022CA8
	movs r1, #0x80
	lsls r1, r1, #1
	bl sub_80011D0
	movs r0, #1
	bl BG_EnableSyncByMask
	ldr r0, _080212E4 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08021292
	movs r0, #0xb6
	lsls r0, r0, #2
	bl m4aSongNumStart
_08021292:
	movs r0, #1
	movs r1, #0x10
	movs r2, #0x10
	movs r3, #0
	bl SetBlendConfig
	str r5, [sp]
	movs r0, #1
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetA
	movs r0, #1
	str r0, [sp]
	movs r0, #0
	movs r1, #1
	movs r2, #1
	movs r3, #1
	bl SetBlendTargetB
	adds r0, r6, #0
	adds r0, #0x4c
	strh r5, [r0]
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080212CC: .4byte 0x085CC560
_080212D0: .4byte 0x06002000
_080212D4: .4byte 0x085CDC84
_080212D8: .4byte 0x085CDCA4
_080212DC: .4byte 0x02003D2C
_080212E0: .4byte 0x02022CA8
_080212E4: .4byte 0x0202BCEC

