	.syntax unified
	.set GetConvoyItemCount, 0x080314BC + 1
	.set GetUnitItemCount, 0x08017780 + 1
	.set PutNumber, 0x08004A90 + 1
	.set PutText, 0x08003DA0 + 1
	.set sub_8003CF8, 0x08003CF8 + 1
	.set sub_8003D84, 0x08003D84 + 1
	.set sub_8003D98, 0x08003D98 + 1
	.set sub_8003F28, 0x08003F28 + 1
	.set sub_8009FA8, 0x08009FA8 + 1
	.set sub_804F0EC, 0x0804F0EC + 1
	.set sub_80B1474, 0x080B1474 + 1
	.set sub_80B1D98, 0x080B1D98 + 1
	.set sub_80B1FBC, 0x080B1FBC + 1
	.section .text.sub_80B5C3C, "ax", %progbits
@ sub_80B5C3C @ JP 0x080B5C3C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B5C3C
	.thumb_func
sub_80B5C3C:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	str r0, [sp, #4]
	ldr r0, _080B5D50 @ =0x08A9E508
	ldr r0, [r0]
	adds r6, r0, #0
	adds r6, #0x60
	ldr r0, [sp, #4]
	adds r0, #0x2b
	ldrb r0, [r0]
	mov sl, r0
	lsls r4, r0, #1
	adds r3, r4, #2
	movs r0, #1
	str r0, [sp]
	movs r0, #0xd
	movs r1, #5
	movs r2, #0xc
	bl sub_804F0EC
	ldr r3, _080B5D54 @ =0x03003020
	ldrb r0, [r3, #1]
	movs r1, #0x20
	orrs r0, r1
	movs r1, #0x40
	orrs r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r3, #1]
	adds r2, r3, #0
	adds r2, #0x34
	ldrb r0, [r2]
	movs r1, #1
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2]
	adds r1, r3, #0
	adds r1, #0x2d
	movs r0, #0x68
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x28
	strb r0, [r1]
	subs r1, #5
	movs r0, #0xc8
	strb r0, [r1]
	adds r4, #7
	lsls r4, r4, #3
	adds r0, r3, #0
	adds r0, #0x30
	strb r4, [r0]
	ldr r0, [sp, #4]
	adds r0, #0x29
	ldrb r2, [r0]
	lsls r2, r2, #4
	ldr r1, [sp, #4]
	movs r3, #0x2c
	ldrsh r0, [r1, r3]
	subs r0, #0x38
	subs r2, r2, r0
	movs r0, #0
	movs r1, #0x28
	movs r3, #1
	bl sub_80B1474
	ldr r0, [sp, #4]
	adds r0, #0x2a
	ldrb r1, [r0]
	lsls r1, r1, #4
	adds r1, #0x30
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x70
	movs r2, #9
	bl sub_80B1FBC
	movs r0, #0
	mov sb, r0
	cmp sb, sl
	bge _080B5DDC
	ldr r0, _080B5D58 @ =0x02022CC8
	movs r1, #0xc6
	lsls r1, r1, #1
	adds r1, r0, r1
	str r1, [sp, #8]
	movs r3, #0xc0
	lsls r3, r3, #1
	adds r3, r0, r3
	str r3, [sp, #0xc]
	movs r0, #0
	mov r8, r0
_080B5D0A:
	movs r7, #0
	ldr r1, _080B5D5C @ =0x08A9E50C
	ldr r0, [r1]
	add r0, r8
	ldr r4, [r0, #4]
	adds r0, r6, #0
	bl sub_8003CF8
	adds r0, r6, #0
	movs r1, #0
	bl sub_8003D84
	mov r0, sl
	subs r0, #1
	cmp sb, r0
	bne _080B5D64
	bl GetConvoyItemCount
	adds r5, r0, #0
	cmp r5, #0x64
	bne _080B5D36
	movs r7, #1
_080B5D36:
	adds r0, r6, #0
	movs r1, #0
	adds r2, r7, #0
	bl sub_8003D98
	ldr r0, _080B5D60 @ =0x0000028F
	bl sub_8009FA8
	adds r1, r0, #0
	adds r0, r6, #0
	bl sub_8003F28
	b _080B5D8C
	.align 2, 0
_080B5D50: .4byte 0x08A9E508
_080B5D54: .4byte 0x03003020
_080B5D58: .4byte 0x02022CC8
_080B5D5C: .4byte 0x08A9E50C
_080B5D60: .4byte 0x0000028F
_080B5D64:
	adds r0, r4, #0
	bl GetUnitItemCount
	adds r5, r0, #0
	cmp r5, #5
	bne _080B5D72
	movs r7, #1
_080B5D72:
	adds r0, r6, #0
	movs r1, #0
	adds r2, r7, #0
	bl sub_8003D98
	ldr r0, [r4]
	ldrh r0, [r0]
	bl sub_8009FA8
	adds r1, r0, #0
	adds r0, r6, #0
	bl sub_8003F28
_080B5D8C:
	cmp r7, #0
	bne _080B5DA0
	ldr r3, _080B5D9C @ =0x08A9E50C
	ldr r0, [r3]
	add r0, r8
	movs r1, #1
	b _080B5DA8
	.align 2, 0
_080B5D9C: .4byte 0x08A9E50C
_080B5DA0:
	ldr r1, _080B5DF8 @ =0x08A9E50C
	ldr r0, [r1]
	add r0, r8
	movs r1, #0
_080B5DA8:
	strb r1, [r0]
	adds r0, r6, #0
	ldr r1, [sp, #0xc]
	bl PutText
	movs r1, #1
	cmp r7, #0
	bne _080B5DBA
	movs r1, #2
_080B5DBA:
	ldr r0, [sp, #8]
	adds r2, r5, #0
	bl PutNumber
	adds r6, #8
	ldr r3, [sp, #8]
	adds r3, #0x80
	str r3, [sp, #8]
	ldr r0, [sp, #0xc]
	adds r0, #0x80
	str r0, [sp, #0xc]
	movs r1, #8
	add r8, r1
	movs r3, #1
	add sb, r3
	cmp sb, sl
	blt _080B5D0A
_080B5DDC:
	ldr r0, _080B5DFC @ =sub_80B5BB0
	ldr r1, [sp, #4]
	bl sub_80B1D98
	ldr r1, [sp, #4]
	str r0, [r1, #0x34]
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B5DF8: .4byte 0x08A9E50C
_080B5DFC: .4byte 0x080B5BB1  @ sub_80B5BB0

