	.syntax unified
	.set SioSend, 0x08042238 + 1
	.set sub_80D65E4, 0x080D65E4 + 1
	.section .text.sub_8042720, "ax", %progbits
@ SioReceiveData @ JP 0x08042720 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global SioReceiveData
	.thumb_func
SioReceiveData:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov sb, r0
	str r1, [sp]
	mov sl, r2
_08042732:
	ldr r0, _08042760 @ =0x085D31E8
	mov r8, r0
	ldr r2, [r0]
	ldr r7, _08042764 @ =0x00001B76
	adds r0, r2, r7
	ldrb r1, [r0]
	movs r0, #0x8c
	muls r0, r1, r0
	ldr r1, _08042768 @ =0x000012B4
	adds r0, r0, r1
	adds r5, r2, r0
	adds r6, r5, #4
	ldrb r0, [r5, #4]
	cmp r0, #0xcf
	bne _0804275A
	ldrb r1, [r6, #1]
	movs r0, #6
	ldrsb r0, [r2, r0]
	cmp r1, r0
	bne _0804276C
_0804275A:
	movs r0, #0
	b _08042894
	.align 2, 0
_08042760: .4byte 0x085D31E8
_08042764: .4byte 0x00001B76
_08042768: .4byte 0x000012B4
_0804276C:
	lsls r0, r1, #1
	adds r3, r2, #0
	adds r3, #0x26
	adds r0, r3, r0
	ldrh r1, [r6, #2]
	ldrh r0, [r0]
	cmp r1, r0
	beq _080427B8
	ldr r0, _080427B4 @ =0x03004EFC
	movs r1, #0xce
	strb r1, [r0]
	ldrb r1, [r2, #6]
	lsls r1, r1, #4
	ldrb r2, [r6, #1]
	orrs r1, r2
	strb r1, [r0, #1]
	ldrb r1, [r6, #1]
	lsls r1, r1, #1
	adds r1, r3, r1
	ldrh r1, [r1]
	movs r4, #0
	strh r1, [r0, #2]
	movs r1, #4
	bl SioSend
	strb r4, [r5, #4]
	mov r0, r8
	ldr r1, [r0]
	adds r1, r1, r7
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	mov r0, r8
	ldr r1, [r0]
	adds r1, r1, r7
	b _08042826
	.align 2, 0
_080427B4: .4byte 0x03004EFC
_080427B8:
	movs r2, #0
	ldrh r1, [r6, #4]
	cmp r2, r1
	bhs _080427DA
	adds r3, r5, #0
	adds r3, #0xa
_080427C4:
	mov r0, sb
	adds r1, r0, r2
	adds r0, r3, r2
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	ldrh r1, [r6, #4]
	cmp r2, r1
	blo _080427C4
_080427DA:
	mov r0, sl
	cmp r0, #0
	beq _0804283C
	mov r0, sb
	bl sub_80D65E4
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0804283C
	ldr r0, _08042830 @ =0x03004EFC
	movs r1, #0xce
	strb r1, [r0]
	ldr r5, _08042834 @ =0x085D31E8
	ldr r3, [r5]
	ldrb r1, [r3, #6]
	lsls r1, r1, #4
	ldrb r2, [r6, #1]
	orrs r1, r2
	strb r1, [r0, #1]
	ldrb r1, [r6, #1]
	lsls r1, r1, #1
	adds r3, #0x26
	adds r3, r3, r1
	ldrh r1, [r3]
	movs r4, #0
	strh r1, [r0, #2]
	movs r1, #4
	bl SioSend
	strb r4, [r6]
	ldr r1, [r5]
	ldr r2, _08042838 @ =0x00001B76
	adds r1, r1, r2
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldr r1, [r5]
	adds r1, r1, r2
_08042826:
	ldrb r2, [r1]
	movs r0, #0xf
	ands r0, r2
	strb r0, [r1]
	b _08042732
	.align 2, 0
_08042830: .4byte 0x03004EFC
_08042834: .4byte 0x085D31E8
_08042838: .4byte 0x00001B76
_0804283C:
	movs r0, #0
	strb r0, [r6]
	ldrb r5, [r6, #1]
	ldr r4, _080428A4 @ =0x085D31E8
	ldr r2, [r4]
	lsls r0, r5, #1
	adds r1, r2, #0
	adds r1, #0x26
	adds r1, r1, r0
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	ldr r3, _080428A8 @ =0x00001B76
	adds r2, r2, r3
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	ldr r1, [r4]
	adds r1, r1, r3
	ldrb r2, [r1]
	movs r0, #0xf
	ands r0, r2
	strb r0, [r1]
	ldr r1, [sp]
	strb r5, [r1]
	ldr r0, _080428AC @ =0x03004EFC
	movs r1, #0xce
	strb r1, [r0]
	ldr r3, [r4]
	ldrb r1, [r3, #6]
	lsls r1, r1, #4
	ldrb r2, [r6, #1]
	orrs r1, r2
	strb r1, [r0, #1]
	ldrb r1, [r6, #1]
	lsls r1, r1, #1
	adds r3, #0x26
	adds r3, r3, r1
	ldrh r1, [r3]
	strh r1, [r0, #2]
	movs r1, #4
	bl SioSend
	ldrh r0, [r6, #4]
_08042894:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080428A4: .4byte 0x085D31E8
_080428A8: .4byte 0x00001B76
_080428AC: .4byte 0x03004EFC

