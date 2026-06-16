	.syntax unified
	.set EventEndFade, 0x080128E8 + 1
	.set EventStartFade, 0x08012888 + 1
	.set NewEventFadefx, 0x08012954 + 1
	.section .text.sub_800E1FC, "ax", %progbits
@ Event18_ColorFade @ JP 0x0800E1FC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global Event18_ColorFade
	.thumb_func
Event18_ColorFade:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	mov ip, r0
	ldr r0, [r0, #0x38]
	ldrb r1, [r0]
	movs r2, #0xf
	ands r2, r1
	adds r6, r2, #0
	ldrh r1, [r0, #2]
	movs r5, #2
	ldrsb r5, [r0, r5]
	lsls r1, r1, #0x10
	asrs r4, r1, #0x18
	ldrh r1, [r0, #4]
	mov sb, r1
	ldrh r1, [r0, #6]
	str r1, [sp, #8]
	ldrh r1, [r0, #8]
	str r1, [sp, #0xc]
	ldrh r0, [r0, #0xa]
	mov sl, r0
	cmp r2, #1
	beq _0800E24A
	cmp r2, #1
	bgt _0800E23C
	cmp r2, #0
	beq _0800E242
	b _0800E2B6
_0800E23C:
	cmp r6, #2
	beq _0800E252
	b _0800E2B6
_0800E242:
	bl EventStartFade
	movs r0, #2
	b _0800E2B8
_0800E24A:
	bl EventEndFade
	movs r0, #2
	b _0800E2B8
_0800E252:
	mov r0, ip
	ldrh r2, [r0, #0x3c]
	lsrs r0, r2, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _0800E26A
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r2
	cmp r0, #0
	beq _0800E26E
_0800E26A:
	movs r1, #0
	mov sb, r1
_0800E26E:
	movs r6, #0
	cmp r4, #0
	ble _0800E29E
	movs r0, #1
	mov r8, r0
	lsls r0, r5, #0x18
	movs r1, #0x80
	lsls r1, r1, #0x11
	adds r3, r0, r1
	lsls r0, r4, #0x18
	subs r2, r0, r1
	movs r7, #0xff
	lsls r7, r7, #0x18
_0800E288:
	mov r0, r8
	lsls r0, r5
	orrs r6, r0
	adds r0, r2, #0
	adds r2, r2, r7
	asrs r4, r0, #0x18
	asrs r0, r3, #0x18
	adds r3, r3, r1
	adds r5, r0, #0
	cmp r4, #0
	bgt _0800E288
_0800E29E:
	mov r1, sl
	str r1, [sp]
	mov r0, ip
	str r0, [sp, #4]
	mov r0, sb
	adds r1, r6, #0
	ldr r2, [sp, #8]
	ldr r3, [sp, #0xc]
	bl NewEventFadefx
	movs r0, #2
	b _0800E2B8
_0800E2B6:
	movs r0, #6
_0800E2B8:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

