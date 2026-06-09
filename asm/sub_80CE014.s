	.syntax unified
	.set CopyToPalOpAnim, 0x080CB6AC + 1
	.set SetBlendConfig, 0x08001DF0 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8012E84, 0x08012E84 + 1
	.set sub_8013008, 0x08013008 + 1
	.set sub_80D637C, 0x080D637C + 1
	.section .text.sub_80CE014, "ax", %progbits
@ sub_80CE014 @ JP 0x080CE014 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80CE014
	.thumb_func
sub_80CE014:
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldrh r0, [r4, #0x3e]
	movs r1, #0xe
	bl sub_80D637C
	adds r3, r0, #0
	movs r0, #0xe
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0x1a
	bl sub_8012E84
	adds r3, r0, #0
	cmp r3, #0xc
	bgt _080CE048
	lsls r1, r3, #0x18
	lsrs r1, r1, #0x18
	movs r0, #1
	movs r2, #0x10
	movs r3, #8
	bl SetBlendConfig
	b _080CE05A
_080CE048:
	movs r1, #0x19
	subs r1, r1, r3
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r0, #1
	movs r2, #0x10
	movs r3, #8
	bl SetBlendConfig
_080CE05A:
	ldrh r0, [r4, #0x3e]
	adds r0, #1
	strh r0, [r4, #0x3e]
	ldrh r0, [r4, #0x2a]
	cmp r0, #1
	beq _080CE06C
	cmp r0, #2
	beq _080CE0A0
	b _080CE0BC
_080CE06C:
	ldr r0, _080CE08C @ =0x08B79EBC
	ldr r1, _080CE090 @ =0x06010000
	bl sub_8013008
	ldr r0, _080CE094 @ =0x08B7A73C
	movs r1, #0x80
	lsls r1, r1, #2
	movs r2, #0x20
	bl CopyToPalOpAnim
	ldr r0, _080CE098 @ =0x08B7A410
	ldr r1, _080CE09C @ =0x06010F00
	bl sub_8013008
	b _080CE0BC
	.align 2, 0
_080CE08C: .4byte 0x08B79EBC
_080CE090: .4byte 0x06010000
_080CE094: .4byte 0x08B7A73C
_080CE098: .4byte 0x08B7A410
_080CE09C: .4byte 0x06010F00
_080CE0A0:
	ldr r0, _080CE0D0 @ =0x08B7A75C
	ldr r1, _080CE0D4 @ =0x06011E00
	bl sub_8013008
	ldr r0, _080CE0D8 @ =0x08B7AFFC
	movs r1, #0x90
	lsls r1, r1, #2
	movs r2, #0x20
	bl CopyToPalOpAnim
	ldr r0, _080CE0DC @ =0x08B7AC84
	ldr r1, _080CE0E0 @ =0x06012D00
	bl sub_8013008
_080CE0BC:
	ldrh r0, [r4, #0x2a]
	cmp r0, #8
	bne _080CE0E4
	movs r0, #0
	strh r0, [r4, #0x2a]
	adds r0, r4, #0
	bl sub_8002DE4
	b _080CE0E8
	.align 2, 0
_080CE0D0: .4byte 0x08B7A75C
_080CE0D4: .4byte 0x06011E00
_080CE0D8: .4byte 0x08B7AFFC
_080CE0DC: .4byte 0x08B7AC84
_080CE0E0: .4byte 0x06012D00
_080CE0E4:
	adds r0, #1
	strh r0, [r4, #0x2a]
_080CE0E8:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

