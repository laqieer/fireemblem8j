	.syntax unified
	.set CopyToPalOpAnim, 0x080CB6AC + 1
	.set SetBlendConfig, 0x08001DF0 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8012E84, 0x08012E84 + 1
	.set sub_8013008, 0x08013008 + 1
	.set sub_80D637C, 0x080D637C + 1
	.section .text.sub_80CE320, "ax", %progbits
@ sub_80CE320 @ JP 0x080CE320 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80CE320
	.thumb_func
sub_80CE320:
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldrh r0, [r4, #0x3e]
	movs r1, #9
	bl sub_80D637C
	adds r3, r0, #0
	movs r0, #9
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0x1a
	bl sub_8012E84
	adds r3, r0, #0
	cmp r3, #0xc
	bgt _080CE354
	lsls r1, r3, #0x18
	lsrs r1, r1, #0x18
	movs r0, #1
	movs r2, #0x10
	movs r3, #8
	bl SetBlendConfig
	b _080CE366
_080CE354:
	movs r1, #0x19
	subs r1, r1, r3
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r0, #1
	movs r2, #0x10
	movs r3, #8
	bl SetBlendConfig
_080CE366:
	ldrh r0, [r4, #0x3e]
	adds r0, #1
	strh r0, [r4, #0x3e]
	ldrh r0, [r4, #0x2a]
	cmp r0, #1
	beq _080CE378
	cmp r0, #2
	beq _080CE3AC
	b _080CE3C8
_080CE378:
	ldr r0, _080CE398 @ =0x08B7F118
	ldr r1, _080CE39C @ =0x06010000
	bl sub_8013008
	ldr r0, _080CE3A0 @ =0x08B7FA78
	movs r1, #0x80
	lsls r1, r1, #2
	movs r2, #0x20
	bl CopyToPalOpAnim
	ldr r0, _080CE3A4 @ =0x08B7F71C
	ldr r1, _080CE3A8 @ =0x06010F00
	bl sub_8013008
	b _080CE3C8
	.align 2, 0
_080CE398: .4byte 0x08B7F118
_080CE39C: .4byte 0x06010000
_080CE3A0: .4byte 0x08B7FA78
_080CE3A4: .4byte 0x08B7F71C
_080CE3A8: .4byte 0x06010F00
_080CE3AC:
	ldr r0, _080CE3DC @ =0x08B7FA98
	ldr r1, _080CE3E0 @ =0x06011E00
	bl sub_8013008
	ldr r0, _080CE3E4 @ =0x08B803B4
	movs r1, #0x90
	lsls r1, r1, #2
	movs r2, #0x20
	bl CopyToPalOpAnim
	ldr r0, _080CE3E8 @ =0x08B80010
	ldr r1, _080CE3EC @ =0x06012D00
	bl sub_8013008
_080CE3C8:
	ldrh r0, [r4, #0x2a]
	cmp r0, #0xb
	bne _080CE3F0
	movs r0, #0
	strh r0, [r4, #0x2a]
	adds r0, r4, #0
	bl sub_8002DE4
	b _080CE3F4
	.align 2, 0
_080CE3DC: .4byte 0x08B7FA98
_080CE3E0: .4byte 0x06011E00
_080CE3E4: .4byte 0x08B803B4
_080CE3E8: .4byte 0x08B80010
_080CE3EC: .4byte 0x06012D00
_080CE3F0:
	adds r0, #1
	strh r0, [r4, #0x2a]
_080CE3F4:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

