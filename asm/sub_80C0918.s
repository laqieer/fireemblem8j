	.syntax unified
	.set PutSprite, 0x080052F0 + 1
	.set sub_8001EE4, 0x08001EE4 + 1
	.section .text.sub_80C0918, "ax", %progbits
@ sub_80C0918 @ JP 0x080C0918 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C0918
	.thumb_func
sub_80C0918:
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r6, r0, #0
	ldr r0, _080C09F8 @ =0x03005270
	ldrb r1, [r0, #1]
	adds r2, r6, #0
	adds r2, #0x32
	strb r1, [r2]
	ldr r7, [r0, #8]
	str r7, [r6, #0x38]
	ldr r0, [r0, #0xc]
	mov ip, r0
	str r0, [r6, #0x3c]
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r0, #0
	ble _080C09EE
	ldr r5, [r6, #0x2c]
	adds r0, r6, #0
	adds r0, #0x33
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r4, r0, #1
	adds r4, r4, r0
	lsls r4, r4, #2
	ldr r0, _080C09FC @ =0x081F6164
	adds r4, r4, r0
	add r2, sp, #4
	ldr r1, [r6, #0x4c]
	ldrh r0, [r1, #0x34]
	strh r0, [r2]
	mov r3, sp
	adds r3, #6
	ldrh r0, [r1, #0x36]
	strh r0, [r3]
	asrs r1, r7, #8
	adds r0, r2, #0
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r1, r1, r0
	movs r0, #8
	ldrsb r0, [r4, r0]
	subs r1, r1, r0
	mov r7, ip
	asrs r2, r7, #8
	movs r7, #0
	ldrsh r0, [r3, r7]
	subs r2, r2, r0
	movs r0, #9
	ldrsb r0, [r4, r0]
	subs r2, r2, r0
	ldr r3, [r4, #4]
	lsrs r5, r5, #5
	ldrh r4, [r4]
	adds r5, r5, r4
	adds r0, r6, #0
	adds r0, #0x30
	ldrb r4, [r0]
	movs r0, #0xf
	ands r0, r4
	lsls r0, r0, #0xc
	adds r5, r5, r0
	movs r0, #0x80
	lsls r0, r0, #4
	adds r5, r5, r0
	str r5, [sp]
	movs r0, #4
	bl PutSprite
	adds r4, r6, #0
	adds r4, #0x35
	ldrb r0, [r4]
	subs r0, #1
	strb r0, [r4]
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0
	bne _080C09E6
	adds r1, r6, #0
	adds r1, #0x34
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0xf
	bls _080C09CA
	strb r2, [r1]
_080C09CA:
	ldr r2, _080C0A00 @ =0x020228A8
	ldrb r0, [r1]
	lsls r0, r0, #1
	ldr r1, _080C0A04 @ =0x08B1CD60
	adds r0, r0, r1
	ldrh r0, [r0]
	movs r1, #0xa7
	lsls r1, r1, #2
	adds r2, r2, r1
	strh r0, [r2]
	bl sub_8001EE4
	movs r0, #4
	strb r0, [r4]
_080C09E6:
	ldr r0, [r6, #0x38]
	str r0, [r6, #0x40]
	ldr r0, [r6, #0x3c]
	str r0, [r6, #0x44]
_080C09EE:
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C09F8: .4byte 0x03005270
_080C09FC: .4byte 0x081F6164
_080C0A00: .4byte 0x020228A8
_080C0A04: .4byte 0x08B1CD60

