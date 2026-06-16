	.syntax unified
	.set MultiBootCheckComplete, 0x0804ECA8 + 1
	.set MultiBootInit, 0x0804E754 + 1
	.set MultiBootSend, 0x0804EB80 + 1
	.set MultiBootStartProbe, 0x0804EBCC + 1
	.set MultiBootWaitSendDone, 0x0804EDC0 + 1
	.set sub_804ECBC, 0x0804ECBC + 1
	.set sub_80D6398, 0x080D6398 + 1
	.section .text.sub_804E790, "ax", %progbits
@ MultiBootMain @ JP 0x0804E790 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global MultiBootMain
	.thumb_func
MultiBootMain:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r7, r0, #0
	bl MultiBootCheckComplete
	cmp r0, #0
	beq _0804E7A6
	b _0804EB6E
_0804E7A6:
	adds r0, r7, #0
	adds r0, #0x4a
	ldrb r1, [r0]
	mov sl, r0
	cmp r1, #0xf
	bls _0804E7BA
	subs r0, r1, #1
	mov r1, sl
	strb r0, [r1]
	b _0804EB6E
_0804E7BA:
	adds r1, r7, #0
	adds r1, #0x48
	ldrb r0, [r1]
	cmp r0, #0
	beq _0804E7E4
	movs r0, #0
	strb r0, [r1]
	ldr r0, _0804E7E0 @ =0x04000128
	ldrh r0, [r0]
	movs r5, #0xfc
	ands r5, r0
	cmp r5, #8
	beq _0804E7E4
	adds r0, r7, #0
	bl MultiBootInit
	movs r0, #8
	eors r0, r5
	b _0804EB70
	.align 2, 0
_0804E7E0: .4byte 0x04000128
_0804E7E4:
	ldrb r0, [r7, #0x18]
	cmp r0, #0xdf
	bls _0804E836
	adds r0, r7, #0
	bl sub_804ECBC
	adds r5, r0, #0
	cmp r5, #0
	beq _0804E7F8
	b _0804EB70
_0804E7F8:
	adds r0, r7, #0
	adds r0, #0x4b
	ldrb r0, [r0]
	cmp r0, #1
	bne _0804E814
	ldrb r0, [r7, #0x18]
	cmp r0, #0xe1
	bls _0804E814
	adds r0, r7, #0
	bl MultiBootCheckComplete
	cmp r0, #0
	bne _0804E814
	b _0804EB5E
_0804E814:
	adds r0, r7, #0
	bl MultiBootCheckComplete
	cmp r0, #0
	beq _0804E820
	b _0804EB6E
_0804E820:
	ldrh r0, [r7, #0x16]
	cmp r0, #0
	bne _0804E830
	adds r0, r7, #0
	bl MultiBootInit
	movs r0, #0x71
	b _0804EB70
_0804E830:
	subs r0, #1
	strh r0, [r7, #0x16]
	b _0804EB6E
_0804E836:
	ldrb r0, [r7, #0x18]
	cmp r0, #2
	bne _0804E83E
	b _0804E974
_0804E83E:
	cmp r0, #2
	bgt _0804E84C
	cmp r0, #0
	beq _0804E85A
	cmp r0, #1
	beq _0804E916
	b _0804EAAC
_0804E84C:
	cmp r0, #0xd0
	bne _0804E852
	b _0804E9C0
_0804E852:
	cmp r0, #0xd1
	bne _0804E858
	b _0804EA5A
_0804E858:
	b _0804EAAC
_0804E85A:
	movs r3, #0xe
	movs r5, #3
	ldr r0, _0804E8A0 @ =0x04000120
	ldrh r0, [r0, #6]
	adds r1, r0, #0
	ldr r0, _0804E8A4 @ =0x0000FFFF
	ldrb r2, [r7, #0x1e]
	adds r6, r2, #0
	cmp r1, r0
	bne _0804E882
	adds r4, r1, #0
	ldr r1, _0804E8A8 @ =0x04000126
_0804E872:
	asrs r3, r3, #1
	subs r1, #2
	subs r5, #1
	cmp r5, #0
	beq _0804E882
	ldrh r0, [r1]
	cmp r0, r4
	beq _0804E872
_0804E882:
	movs r0, #0xe
	ands r3, r0
	strb r3, [r7, #0x1d]
	movs r5, #3
	ldr r0, _0804E8A0 @ =0x04000120
	ldrh r0, [r0, #6]
	adds r4, r0, #0
	asrs r0, r2, #3
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0804E8B0
	ldr r0, _0804E8AC @ =0x00007208
	b _0804E8D6
	.align 2, 0
_0804E8A0: .4byte 0x04000120
_0804E8A4: .4byte 0x0000FFFF
_0804E8A8: .4byte 0x04000126
_0804E8AC: .4byte 0x00007208
_0804E8B0:
	subs r5, #1
	cmp r5, #0
	beq _0804E8DC
	lsls r0, r5, #1
	ldr r1, _0804E904 @ =0x04000120
	adds r0, r0, r1
	ldrh r0, [r0]
	adds r4, r0, #0
	adds r0, r2, #0
	asrs r0, r5
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0804E8B0
	adds r0, r1, #0
	lsls r0, r5
	movs r1, #0xe4
	lsls r1, r1, #7
	orrs r0, r1
_0804E8D6:
	cmp r4, r0
	beq _0804E8B0
	movs r3, #0
_0804E8DC:
	adds r0, r3, #0
	ands r0, r6
	strb r0, [r7, #0x1e]
	cmp r3, #0
	bne _0804E8EC
	movs r0, #0xf
	mov r2, sl
	strb r0, [r2]
_0804E8EC:
	mov r1, sl
	ldrb r0, [r1]
	cmp r0, #0
	bne _0804E908
	ldrb r0, [r7, #0x1d]
	ldrb r2, [r7, #0x1e]
	cmp r0, r2
	beq _0804E90E
	adds r0, r7, #0
	bl MultiBootStartProbe
	b _0804E916
	.align 2, 0
_0804E904: .4byte 0x04000120
_0804E908:
	subs r0, #1
	mov r1, sl
	strb r0, [r1]
_0804E90E:
	ldrb r1, [r7, #0x1e]
	movs r2, #0xc4
	lsls r2, r2, #7
	b _0804EA16
_0804E916:
	adds r1, r7, #0
	adds r1, #0x49
	movs r0, #0
	strb r0, [r1]
	movs r5, #3
	mov ip, r1
	ldr r3, _0804E96C @ =0x0300185C
_0804E924:
	lsls r0, r5, #1
	ldr r2, _0804E970 @ =0x04000120
	adds r0, r0, r2
	ldrh r0, [r0]
	adds r4, r0, #0
	asrs r0, r4, #8
	subs r2, r5, #1
	cmp r0, #0x72
	bne _0804E94E
	lsls r0, r2, #1
	adds r0, r0, r3
	strh r4, [r0]
	movs r0, #0xff
	ands r4, r0
	movs r0, #1
	lsls r0, r5
	cmp r4, r0
	bne _0804E94E
	ldrb r0, [r1]
	orrs r4, r0
	strb r4, [r1]
_0804E94E:
	adds r5, r2, #0
	cmp r5, #0
	bne _0804E924
	ldrb r0, [r7, #0x1d]
	mov r1, ip
	ldrb r1, [r1]
	cmp r0, r1
	bne _0804E90E
	movs r0, #2
	strb r0, [r7, #0x18]
	mov r2, ip
	ldrb r1, [r2]
	movs r2, #0xc2
	lsls r2, r2, #7
	b _0804EA16
	.align 2, 0
_0804E96C: .4byte 0x0300185C
_0804E970: .4byte 0x04000120
_0804E974:
	movs r5, #3
	movs r0, #0x49
	adds r0, r0, r7
	mov ip, r0
	mov r4, ip
	movs r6, #1
	ldr r1, _0804E9B8 @ =0x0300185C
	mov sb, r1
	ldr r2, _0804E9BC @ =0x04000120
	mov r8, r2
_0804E988:
	ldrb r3, [r4]
	adds r0, r3, #0
	asrs r0, r5
	ands r0, r6
	subs r2, r5, #1
	cmp r0, #0
	beq _0804E9AE
	lsls r0, r5, #1
	add r0, r8
	ldrh r1, [r0]
	lsls r0, r2, #1
	add r0, sb
	ldrh r0, [r0]
	cmp r1, r0
	beq _0804E9AE
	adds r0, r6, #0
	lsls r0, r5
	eors r3, r0
	strb r3, [r4]
_0804E9AE:
	adds r5, r2, #0
	cmp r5, #0
	bne _0804E988
	b _0804EB14
	.align 2, 0
_0804E9B8: .4byte 0x0300185C
_0804E9BC: .4byte 0x04000120
_0804E9C0:
	movs r3, #1
	movs r5, #3
	movs r0, #0x49
	adds r0, r0, r7
	mov ip, r0
	adds r6, r7, #0
	adds r6, #0x19
	ldr r1, _0804EA24 @ =0x0300185C
	mov r8, r1
_0804E9D2:
	lsls r0, r5, #1
	ldr r2, _0804EA28 @ =0x04000120
	adds r0, r0, r2
	ldrh r0, [r0]
	adds r4, r0, #0
	subs r2, r5, #1
	adds r0, r6, r2
	strb r4, [r0]
	mov r0, ip
	ldrb r1, [r0]
	asrs r1, r5
	movs r0, #1
	ands r1, r0
	cmp r1, #0
	beq _0804EA06
	asrs r0, r4, #8
	subs r0, #0x72
	cmp r0, #1
	bls _0804E9FA
	b _0804EB64
_0804E9FA:
	lsls r0, r2, #1
	add r0, r8
	ldrh r0, [r0]
	cmp r4, r0
	bne _0804EA06
	movs r3, #0
_0804EA06:
	adds r5, r2, #0
	cmp r5, #0
	bne _0804E9D2
	cmp r3, #0
	bne _0804EA2C
	ldrb r1, [r7, #0x1c]
	movs r2, #0xc6
	lsls r2, r2, #7
_0804EA16:
	adds r0, r2, #0
	orrs r1, r0
	adds r0, r7, #0
	bl MultiBootSend
	b _0804EB70
	.align 2, 0
_0804EA24: .4byte 0x0300185C
_0804EA28: .4byte 0x04000120
_0804EA2C:
	movs r0, #0xd1
	strb r0, [r7, #0x18]
	movs r3, #0x11
	movs r5, #3
	adds r1, r6, #2
_0804EA36:
	ldrb r0, [r1]
	adds r3, r3, r0
	subs r1, #1
	subs r5, #1
	cmp r5, #0
	bne _0804EA36
	strb r3, [r7, #0x14]
	movs r0, #0xff
	ands r3, r0
	movs r1, #0xc8
	lsls r1, r1, #7
	adds r0, r1, #0
	orrs r3, r0
	adds r0, r7, #0
	adds r1, r3, #0
	bl MultiBootSend
	b _0804EB70
_0804EA5A:
	movs r5, #3
	movs r2, #0x49
	ldrb r1, [r2, r7]
	ldr r2, _0804EA98 @ =0x04000126
	movs r3, #1
_0804EA64:
	ldrh r0, [r2]
	adds r4, r0, #0
	adds r0, r1, #0
	asrs r0, r5
	ands r0, r3
	cmp r0, #0
	beq _0804EA78
	asrs r0, r4, #8
	cmp r0, #0x73
	bne _0804EB64
_0804EA78:
	subs r2, #2
	subs r5, #1
	cmp r5, #0
	bne _0804EA64
	adds r0, r7, #0
	bl sub_80D6398
	adds r5, r0, #0
	cmp r5, #0
	bne _0804EA9C
	movs r0, #0xe0
	strb r0, [r7, #0x18]
	adds r0, #0xb0
	strh r0, [r7, #0x16]
	b _0804EB6E
	.align 2, 0
_0804EA98: .4byte 0x04000126
_0804EA9C:
	adds r0, r7, #0
	bl MultiBootInit
	movs r0, #0x1e
	mov r1, sl
	strb r0, [r1]
	movs r0, #0x70
	b _0804EB70
_0804EAAC:
	movs r5, #3
	movs r2, #0x49
	adds r2, r2, r7
	mov ip, r2
	mov r8, ip
	movs r0, #1
	mov sb, r0
_0804EABA:
	mov r1, r8
	ldrb r6, [r1]
	adds r0, r6, #0
	asrs r0, r5
	mov r2, sb
	ands r0, r2
	cmp r0, #0
	beq _0804EAF4
	lsls r0, r5, #1
	ldr r1, _0804EB10 @ =0x04000120
	adds r0, r0, r1
	ldrh r0, [r0]
	adds r4, r0, #0
	asrs r2, r4, #8
	ldrb r0, [r7, #0x18]
	lsrs r0, r0, #1
	movs r1, #0x62
	subs r1, r1, r0
	mov r3, sb
	lsls r3, r5
	cmp r2, r1
	bne _0804EAEE
	movs r0, #0xff
	ands r4, r0
	cmp r4, r3
	beq _0804EAF4
_0804EAEE:
	eors r6, r3
	mov r2, r8
	strb r6, [r2]
_0804EAF4:
	subs r5, #1
	cmp r5, #0
	bne _0804EABA
	ldrb r0, [r7, #0x18]
	cmp r0, #0xc4
	bne _0804EB14
	mov r0, ip
	ldrb r1, [r0]
	movs r0, #0xe
	ands r0, r1
	strb r0, [r7, #0x1e]
	strb r5, [r7, #0x18]
	b _0804E90E
	.align 2, 0
_0804EB10: .4byte 0x04000120
_0804EB14:
	mov r1, ip
	ldrb r0, [r1]
	cmp r0, #0
	bne _0804EB26
	adds r0, r7, #0
	bl MultiBootInit
	movs r0, #0x50
	b _0804EB70
_0804EB26:
	ldrb r0, [r7, #0x18]
	adds r0, #2
	strb r0, [r7, #0x18]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xc4
	bne _0804EB36
	b _0804E90E
_0804EB36:
	ldrb r0, [r7, #0x18]
	ldr r1, [r7, #0x28]
	adds r0, r0, r1
	subs r1, r0, #3
	ldrb r2, [r1]
	lsls r2, r2, #8
	subs r0, #4
	ldrb r1, [r0]
	orrs r1, r2
	adds r0, r7, #0
	bl MultiBootSend
	adds r5, r0, #0
	cmp r5, #0
	bne _0804EB70
	adds r0, r7, #0
	adds r0, #0x4b
	ldrb r0, [r0]
	cmp r0, #1
	bne _0804EB6E
_0804EB5E:
	bl MultiBootWaitSendDone
	b _0804E7BA
_0804EB64:
	adds r0, r7, #0
	bl MultiBootInit
	movs r0, #0x60
	b _0804EB70
_0804EB6E:
	movs r0, #0
_0804EB70:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

