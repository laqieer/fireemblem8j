	.syntax unified
	.set DisableMuCamera, 0x0807A910 + 1
	.set EnableMuCamera, 0x0807A908 + 1
	.set nullsub_67, 0x0807ACB8 + 1
	.set sub_807AAB8, 0x0807AAB8 + 1
	.set sub_807AE28, 0x0807AE28 + 1
	.set sub_807B4C8, 0x0807B4C8 + 1
	.set sub_807B4E0, 0x0807B4E0 + 1
	.set sub_807B99C, 0x0807B99C + 1
	.section .text.sub_807ACBC, "ax", %progbits
@ RunMuMoveScript @ JP 0x0807ACBC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global RunMuMoveScript
	.thumb_func
RunMuMoveScript:
	push {r4, r5, lr}
	adds r4, r0, #0
_0807ACC0:
	ldr r0, [r4, #0x34]
	ldrb r2, [r0, #4]
	adds r1, r2, #1
	strb r1, [r0, #4]
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	adds r0, #5
	adds r0, r0, r2
	movs r5, #0
	ldrsb r5, [r0, r5]
	adds r0, r5, #1
	cmp r0, #0xf
	bhi _0807ACC0
	lsls r0, r0, #2
	ldr r1, _0807ACE4 @ =_0807ACE8
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0807ACE4: .4byte _0807ACE8
_0807ACE8: @ jump table
	.4byte _0807AD90 @ case 0
	.4byte _0807AD9E @ case 1
	.4byte _0807AD9E @ case 2
	.4byte _0807AD9E @ case 3
	.4byte _0807AD9E @ case 4
	.4byte _0807AD88 @ case 5
	.4byte _0807ADC8 @ case 6
	.4byte _0807ADC8 @ case 7
	.4byte _0807ADC8 @ case 8
	.4byte _0807ADC8 @ case 9
	.4byte _0807AD28 @ case 10
	.4byte _0807AD4C @ case 11
	.4byte _0807ACC0 @ case 12
	.4byte _0807ADF2 @ case 13
	.4byte _0807AE10 @ case 14
	.4byte _0807AE18 @ case 15
_0807AD28:
	ldr r0, [r4, #0x34]
	ldrb r2, [r0, #4]
	adds r1, r2, #1
	strb r1, [r0, #4]
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	adds r0, #5
	adds r0, r0, r2
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r0, r4, #0
	adds r0, #0x48
	strh r1, [r0]
	adds r1, r4, #0
	adds r1, #0x3f
	movs r0, #3
	strb r0, [r1]
	b _0807AE20
_0807AD4C:
	adds r0, r4, #0
	bl nullsub_67
	adds r1, r4, #0
	adds r1, #0x3f
	movs r0, #5
	strb r0, [r1]
	adds r0, r4, #0
	adds r0, #0x4c
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x14
	ldr r2, _0807AD84 @ =0x0202BCAC
	movs r3, #0xc
	ldrsh r1, [r2, r3]
	subs r0, r0, r1
	adds r1, r4, #0
	adds r1, #0x4e
	ldrh r1, [r1]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x14
	movs r3, #0xe
	ldrsh r2, [r2, r3]
	subs r1, r1, r2
	bl sub_807AE28
	b _0807AE20
	.align 2, 0
_0807AD84: .4byte 0x0202BCAC
_0807AD88:
	adds r0, r4, #0
	bl sub_807B4E0
	b _0807AE20
_0807AD90:
	adds r0, r4, #0
	bl nullsub_67
	adds r0, r4, #0
	bl sub_807B4C8
	b _0807AE20
_0807AD9E:
	adds r0, r4, #0
	adds r0, #0x42
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r5, r0
	beq _0807AE20
	adds r0, r4, #0
	adds r0, #0x41
	ldrb r0, [r0]
	bl sub_807B99C
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_807AAB8
	adds r1, r4, #0
	adds r1, #0x3f
	movs r0, #2
	strb r0, [r1]
	b _0807AE20
_0807ADC8:
	subs r0, r5, #5
	lsls r0, r0, #0x10
	asrs r5, r0, #0x10
	adds r0, r4, #0
	adds r0, #0x42
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r5, r0
	bne _0807ADDE
	b _0807ACC0
_0807ADDE:
	adds r0, r4, #0
	adds r0, #0x41
	ldrb r0, [r0]
	bl sub_807B99C
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_807AAB8
	b _0807ACC0
_0807ADF2:
	ldr r0, [r4, #0x34]
	ldrb r2, [r0, #4]
	adds r1, r2, #1
	strb r1, [r0, #4]
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	adds r0, #5
	adds r0, r0, r2
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, r4, #0
	adds r1, #0x4a
	strh r0, [r1]
	b _0807ACC0
_0807AE10:
	adds r0, r4, #0
	bl EnableMuCamera
	b _0807ACC0
_0807AE18:
	adds r0, r4, #0
	bl DisableMuCamera
	b _0807ACC0
_0807AE20:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

