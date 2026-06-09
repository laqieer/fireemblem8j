	.syntax unified
	.set AdvanceGetLCGRNValue, 0x08000CC0 + 1
	.set sub_8019174, 0x08019174 + 1
	.set sub_80D637C, 0x080D637C + 1
	.section .text.sub_807D3BC, "ax", %progbits
@ sub_807D3BC @ JP 0x0807D3BC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_807D3BC
	.thumb_func
sub_807D3BC:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x90
	str r0, [sp, #0x78]
	str r2, [sp, #0x7c]
	movs r0, #0
	mov r8, r0
	subs r0, r1, #1
	lsls r0, r0, #0x18
	asrs r6, r0, #0x18
	adds r1, #2
	cmp r6, r1
	bge _0807D4B4
	ldr r2, [sp, #0x78]
	adds r2, #2
	mov sl, r2
	str r1, [sp, #0x80]
_0807D3E4:
	ldr r0, [sp, #0x78]
	subs r0, #1
	lsls r0, r0, #0x18
	asrs r5, r0, #0x18
	adds r3, r6, #1
	str r3, [sp, #0x84]
	cmp r5, sl
	bge _0807D4A8
	ldr r3, _0807D478 @ =0x0202E4D0
	movs r2, #0xff
	mov r7, r8
	adds r7, #1
	mov r4, r8
	lsls r0, r4, #1
	add r0, r8
	lsls r0, r0, #2
	mov r1, sp
	adds r4, r0, r1
	mov sb, r6
_0807D40A:
	strb r5, [r4]
	strb r6, [r4, #1]
	movs r1, #2
	ldrsh r0, [r3, r1]
	cmp sb, r0
	bge _0807D46E
	movs r1, #0
	ldrsh r0, [r3, r1]
	cmp r5, r0
	bge _0807D46E
	cmp r6, #0
	blt _0807D46E
	cmp r5, #0
	blt _0807D46E
	ldr r0, _0807D47C @ =0x0202E4D4
	ldr r0, [r0]
	lsls r1, r6, #2
	adds r0, r1, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #0
	bne _0807D46E
	ldr r0, _0807D480 @ =0x0202BCEC
	ldrb r0, [r0, #0xd]
	cmp r0, #0
	beq _0807D450
	ldr r0, _0807D484 @ =0x0202E4E4
	ldr r0, [r0]
	adds r0, r1, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #0
	beq _0807D46E
_0807D450:
	ldr r0, _0807D488 @ =0x0202E4D8
	ldr r0, [r0]
	adds r0, r1, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r1, [r0]
	ldr r0, _0807D48C @ =0x0203A4E8
	str r2, [sp, #0x88]
	str r3, [sp, #0x8c]
	bl sub_8019174
	ldr r2, [sp, #0x88]
	ldr r3, [sp, #0x8c]
	cmp r0, #0
	bne _0807D490
_0807D46E:
	ldrb r0, [r4, #2]
	orrs r0, r2
	strb r0, [r4, #2]
	b _0807D49E
	.align 2, 0
_0807D478: .4byte 0x0202E4D0
_0807D47C: .4byte 0x0202E4D4
_0807D480: .4byte 0x0202BCEC
_0807D484: .4byte 0x0202E4E4
_0807D488: .4byte 0x0202E4D8
_0807D48C: .4byte 0x0203A4E8
_0807D490:
	movs r0, #1
	strb r0, [r4, #2]
	lsls r0, r7, #0x18
	adds r7, #1
	adds r4, #0xc
	asrs r0, r0, #0x18
	mov r8, r0
_0807D49E:
	adds r0, r5, #1
	lsls r0, r0, #0x18
	asrs r5, r0, #0x18
	cmp r5, sl
	blt _0807D40A
_0807D4A8:
	ldr r2, [sp, #0x84]
	lsls r0, r2, #0x18
	asrs r6, r0, #0x18
	ldr r3, [sp, #0x80]
	cmp r6, r3
	blt _0807D3E4
_0807D4B4:
	mov r4, r8
	cmp r4, #0
	bne _0807D4C0
	movs r0, #1
	rsbs r0, r0, #0
	b _0807D532
_0807D4C0:
	movs r7, #1
	add r7, r8
	mov sb, r7
	add r0, sp, #0x6c
	mov sl, r0
	mov r2, sl
	movs r1, #0
	add r0, sp, #0x74
_0807D4D0:
	strb r1, [r0]
	subs r0, #1
	cmp r0, r2
	bge _0807D4D0
	movs r6, #0
	movs r5, #0
	cmp r5, r8
	bge _0807D50C
	mov ip, sl
	movs r2, #0x80
	lsls r2, r2, #0x11
	mov r1, sp
	adds r3, r2, #0
	adds r4, r2, #0
_0807D4EC:
	movs r0, #2
	ldrsb r0, [r1, r0]
	cmp r0, #1
	bne _0807D500
	mov r7, ip
	adds r0, r7, r6
	strb r5, [r0]
	asrs r0, r3, #0x18
	adds r3, r3, r4
	adds r6, r0, #0
_0807D500:
	adds r0, r2, #0
	adds r2, r2, r4
	adds r1, #0xc
	asrs r5, r0, #0x18
	cmp r5, r8
	blt _0807D4EC
_0807D50C:
	bl AdvanceGetLCGRNValue
	mov r1, sb
	bl sub_80D637C
	subs r0, #1
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	add r0, sl
	movs r1, #0
	ldrsb r1, [r0, r1]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	ldr r1, [sp, #0x7c]
	add r0, sp
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	movs r0, #1
_0807D532:
	add sp, #0x90
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

