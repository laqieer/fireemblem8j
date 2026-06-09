	.syntax unified
	.set AP_Create, 0x0800916C + 1
	.set AP_SwitchAnimation, 0x08009408 + 1
	.set GetMuImg, 0x0807B988 + 1
	.set GetMuImgBufById, 0x0807B96C + 1
	.set Proc_Find, 0x08002DEC + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_8013008, 0x08013008 + 1
	.set sub_807B5E0, 0x0807B5E0 + 1
	.set sub_807B620, 0x0807B620 + 1
	.set sub_807B99C, 0x0807B99C + 1
	.section .text.sub_807A964, "ax", %progbits
@ sub_807A964 @ JP 0x0807A964 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_807A964
	.thumb_func
sub_807A964:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r5, r3, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sb, r0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov sl, r1
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	str r2, [sp, #4]
	movs r0, #0
	mov r8, r0
	mov r0, sp
	mov r1, r8
	strb r1, [r0]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r5, r0
	bne _0807A9A4
	movs r5, #0xe0
	lsls r5, r5, #2
	adds r0, r5, #0
	mov r1, sp
	bl sub_807B5E0
	b _0807A9AC
_0807A9A4:
	adds r0, r5, #0
	mov r1, sp
	bl sub_807B620
_0807A9AC:
	adds r7, r0, #0
	cmp r7, #0
	beq _0807AAA4
	ldr r4, _0807AA9C @ =0x08A132D0
	adds r0, r4, #0
	bl Proc_Find
	cmp r0, #0
	beq _0807A9C2
	movs r2, #0xfe
	mov r8, r2
_0807A9C2:
	adds r0, r4, #0
	movs r1, #5
	bl sub_8002BCC
	adds r6, r0, #0
	cmp r6, #0
	beq _0807AAA4
	movs r2, #0
	str r2, [r6, #0x2c]
	adds r1, r6, #0
	adds r1, #0x3f
	movs r0, #1
	strb r0, [r1]
	mov r4, sb
	lsls r1, r4, #8
	adds r0, r6, #0
	adds r0, #0x4c
	movs r3, #0
	strh r1, [r0]
	mov r1, sl
	lsls r0, r1, #8
	adds r4, r6, #0
	adds r4, #0x4e
	strh r0, [r4]
	adds r0, r6, #0
	adds r0, #0x50
	strh r2, [r0]
	adds r0, #2
	strh r2, [r0]
	adds r1, r6, #0
	adds r1, #0x42
	movs r0, #0xb
	strb r0, [r1]
	adds r0, r6, #0
	adds r0, #0x48
	strh r2, [r0]
	subs r0, #5
	mov r4, r8
	strb r4, [r0]
	subs r0, #2
	mov r1, sp
	ldrb r1, [r1, #4]
	strb r1, [r0]
	subs r0, #1
	strb r3, [r0]
	lsls r0, r5, #5
	ldr r4, _0807AAA0 @ =0x06010000
	adds r0, r0, r4
	str r0, [r6, #0x38]
	mov r0, sp
	ldrb r1, [r0]
	adds r0, r6, #0
	adds r0, #0x3c
	strb r1, [r0]
	movs r0, #0x46
	adds r0, r0, r6
	mov r8, r0
	movs r0, #0x80
	lsls r0, r0, #4
	mov r1, r8
	strh r0, [r1]
	adds r0, r6, #0
	adds r0, #0x4a
	strh r2, [r0]
	subs r0, #6
	strb r3, [r0]
	ldr r0, [sp, #0x28]
	strb r0, [r7, #1]
	ldr r0, [sp, #4]
	bl sub_807B99C
	movs r1, #0xa
	bl AP_Create
	adds r5, r0, #0
	movs r1, #4
	bl AP_SwitchAnimation
	adds r0, r6, #0
	bl GetMuImg
	adds r4, r0, #0
	ldrb r0, [r7]
	bl GetMuImgBufById
	adds r1, r0, #0
	adds r0, r4, #0
	bl sub_8013008
	ldrb r0, [r7]
	bl GetMuImgBufById
	str r0, [r5, #0x24]
	ldrb r1, [r7, #1]
	movs r0, #0xf
	ands r0, r1
	lsls r0, r0, #0xc
	ldrh r2, [r7, #2]
	adds r0, r0, r2
	mov r4, r8
	ldrh r1, [r4]
	adds r1, r1, r0
	strh r1, [r5, #0x22]
	str r5, [r6, #0x30]
	str r7, [r6, #0x34]
	str r6, [r7, #0x48]
	adds r0, r6, #0
	b _0807AAA6
	.align 2, 0
_0807AA9C: .4byte 0x08A132D0
_0807AAA0: .4byte 0x06010000
_0807AAA4:
	movs r0, #0
_0807AAA6:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

