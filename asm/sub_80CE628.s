	.syntax unified
	.set CopyToPalOpAnim, 0x080CB6AC + 1
	.set SetBlendConfig, 0x08001DF0 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8012E84, 0x08012E84 + 1
	.set sub_8013008, 0x08013008 + 1
	.set sub_80D637C, 0x080D637C + 1
	.section .text.sub_80CE628, "ax", %progbits
@ sub_80CE628 @ JP 0x080CE628 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80CE628
	.thumb_func
sub_80CE628:
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldrh r0, [r4, #0x3e]
	movs r1, #6
	bl sub_80D637C
	adds r3, r0, #0
	movs r0, #6
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0x1a
	bl sub_8012E84
	adds r3, r0, #0
	cmp r3, #0xc
	bgt _080CE65C
	lsls r1, r3, #0x18
	lsrs r1, r1, #0x18
	movs r0, #1
	movs r2, #0x10
	movs r3, #8
	bl SetBlendConfig
	b _080CE66E
_080CE65C:
	movs r1, #0x19
	subs r1, r1, r3
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r0, #1
	movs r2, #0x10
	movs r3, #8
	bl SetBlendConfig
_080CE66E:
	ldrh r0, [r4, #0x3e]
	adds r0, #1
	strh r0, [r4, #0x3e]
	ldrh r0, [r4, #0x2a]
	cmp r0, #2
	beq _080CE6BC
	cmp r0, #2
	bgt _080CE684
	cmp r0, #1
	beq _080CE68A
	b _080CE70C
_080CE684:
	cmp r0, #3
	beq _080CE6F0
	b _080CE70C
_080CE68A:
	ldr r0, _080CE6A8 @ =0x08B864A8
	ldr r1, _080CE6AC @ =0x06010000
	bl sub_8013008
	ldr r0, _080CE6B0 @ =0x08B86DB0
	movs r1, #0x80
	lsls r1, r1, #2
	movs r2, #0x20
	bl CopyToPalOpAnim
	ldr r0, _080CE6B4 @ =0x08B86A6C
	ldr r1, _080CE6B8 @ =0x06010F00
	bl sub_8013008
	b _080CE70C
	.align 2, 0
_080CE6A8: .4byte 0x08B864A8
_080CE6AC: .4byte 0x06010000
_080CE6B0: .4byte 0x08B86DB0
_080CE6B4: .4byte 0x08B86A6C
_080CE6B8: .4byte 0x06010F00
_080CE6BC:
	ldr r0, _080CE6DC @ =0x08B86DD0
	ldr r1, _080CE6E0 @ =0x06011E00
	bl sub_8013008
	ldr r0, _080CE6E4 @ =0x08B87648
	movs r1, #0x90
	lsls r1, r1, #2
	movs r2, #0x20
	bl CopyToPalOpAnim
	ldr r0, _080CE6E8 @ =0x08B87324
	ldr r1, _080CE6EC @ =0x06012D00
	bl sub_8013008
	b _080CE70C
	.align 2, 0
_080CE6DC: .4byte 0x08B86DD0
_080CE6E0: .4byte 0x06011E00
_080CE6E4: .4byte 0x08B87648
_080CE6E8: .4byte 0x08B87324
_080CE6EC: .4byte 0x06012D00
_080CE6F0:
	ldr r0, _080CE720 @ =0x08B87668
	ldr r1, _080CE724 @ =0x06013C00
	bl sub_8013008
	ldr r0, _080CE728 @ =0x08B87F2C
	movs r1, #0xa0
	lsls r1, r1, #2
	movs r2, #0x20
	bl CopyToPalOpAnim
	ldr r0, _080CE72C @ =0x08B87BE0
	ldr r1, _080CE730 @ =0x06014B00
	bl sub_8013008
_080CE70C:
	ldrh r0, [r4, #0x2a]
	cmp r0, #0xe
	bne _080CE734
	movs r0, #0
	strh r0, [r4, #0x2a]
	adds r0, r4, #0
	bl sub_8002DE4
	b _080CE738
	.align 2, 0
_080CE720: .4byte 0x08B87668
_080CE724: .4byte 0x06013C00
_080CE728: .4byte 0x08B87F2C
_080CE72C: .4byte 0x08B87BE0
_080CE730: .4byte 0x06014B00
_080CE734:
	adds r0, #1
	strh r0, [r4, #0x2a]
_080CE738:
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0

