	.syntax unified
	.set sub_80D636C, 0x080D636C + 1
	.section .text.sub_80CAEF4, "ax", %progbits
@ sub_80CAEF4 @ JP 0x080CAEF4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80CAEF4
	.thumb_func
sub_80CAEF4:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	str r0, [sp]
	str r1, [sp, #4]
	ldr r0, _080CAF78 @ =0x02020188
	mov r8, r0
	ldr r1, _080CAF7C @ =0x06013400
	str r1, [sp, #8]
	ldr r5, [sp, #4]
	cmp r5, #0
	beq _080CAF16
	adds r5, #1
	str r5, [sp, #4]
_080CAF16:
	movs r0, #0
_080CAF18:
	ldr r4, [sp, #4]
	adds r0, #1
	str r0, [sp, #0xc]
	ldr r0, [sp]
	cmp r4, r0
	bgt _080CAFB8
	movs r1, #0xf0
	mov sb, r1
_080CAF28:
	asrs r2, r4, #3
	adds r5, r4, #1
	mov sl, r5
	adds r7, r4, #0
	movs r0, #1
	ands r7, r0
	movs r5, #7
	subs r1, r5, r2
	ldr r0, _080CAF80 @ =0x000003FF
	ands r1, r0
	lsls r1, r1, #5
	ands r4, r5
	asrs r4, r4, #1
	ldr r5, [sp, #8]
	adds r3, r5, r1
	adds r3, #3
	adds r2, #8
	ands r2, r0
	lsls r2, r2, #5
	adds r0, r5, r2
	adds r6, r0, r4
	subs r5, r3, r4
	add r1, r8
	adds r1, #3
	add r2, r8
	movs r0, #7
	mov ip, r0
	adds r3, r2, r4
	subs r2, r1, r4
_080CAF62:
	cmp r7, #0
	beq _080CAF84
	ldrb r1, [r5]
	movs r0, #0xf
	ands r0, r1
	ldrb r1, [r2]
	orrs r0, r1
	strb r0, [r2]
	ldrb r1, [r6]
	mov r0, sb
	b _080CAF94
	.align 2, 0
_080CAF78: .4byte 0x02020188
_080CAF7C: .4byte 0x06013400
_080CAF80: .4byte 0x000003FF
_080CAF84:
	ldrb r1, [r5]
	mov r0, sb
	ands r0, r1
	ldrb r1, [r2]
	orrs r0, r1
	strb r0, [r2]
	ldrb r1, [r6]
	movs r0, #0xf
_080CAF94:
	ands r0, r1
	ldrb r1, [r3]
	orrs r0, r1
	strb r0, [r3]
	adds r6, #4
	adds r5, #4
	adds r3, #4
	adds r2, #4
	movs r1, #1
	rsbs r1, r1, #0
	add ip, r1
	mov r0, ip
	cmp r0, #0
	bge _080CAF62
	mov r4, sl
	ldr r1, [sp]
	cmp r4, r1
	ble _080CAF28
_080CAFB8:
	movs r0, #0x80
	lsls r0, r0, #3
	add r8, r0
	ldr r5, [sp, #8]
	adds r5, r5, r0
	str r5, [sp, #8]
	ldr r0, [sp, #0xc]
	cmp r0, #3
	ble _080CAF18
	ldr r0, _080CB008 @ =0x02020188
	mov r8, r0
	movs r5, #0x8c
	lsls r5, r5, #2
	ldr r6, _080CB00C @ =0x000003FF
	movs r4, #3
_080CAFD6:
	adds r1, r5, #0
	ands r1, r6
	lsls r1, r1, #5
	ldr r0, _080CB010 @ =0x06010000
	adds r1, r1, r0
	mov r0, r8
	movs r2, #0x80
	bl sub_80D636C
	movs r1, #0x80
	lsls r1, r1, #3
	add r8, r1
	adds r5, #0x20
	subs r4, #1
	cmp r4, #0
	bge _080CAFD6
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080CB008: .4byte 0x02020188
_080CB00C: .4byte 0x000003FF
_080CB010: .4byte 0x06010000

