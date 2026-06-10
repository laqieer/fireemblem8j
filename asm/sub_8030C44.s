	.syntax unified
	.set sub_80D6370, 0x080D6370 + 1
	.section .text.sub_8030C44, "ax", %progbits
@ sub_8030C44 @ JP 0x08030C44 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8030C44
	.thumb_func
sub_8030C44:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r5, r0, #0
	lsls r1, r1, #0x18
	asrs r6, r1, #0x18
	mov r0, sp
	movs r4, #0
	strh r4, [r0]
	ldr r7, _08030D14 @ =0x0202BCEC
	ldr r2, _08030D18 @ =0x01000026
	adds r1, r7, #0
	bl sub_80D6370
	strb r4, [r7, #0xe]
	cmp r5, #0
	beq _08030C74
	ldrb r0, [r7, #0x14]
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r7, #0x14]
_08030C74:
	movs r0, #0x42
	adds r0, r0, r7
	mov ip, r0
	movs r0, #1
	ands r6, r0
	lsls r1, r6, #5
	mov r2, ip
	ldrb r0, [r2]
	movs r3, #0x21
	rsbs r3, r3, #0
	ands r3, r0
	orrs r3, r1
	movs r4, #7
	rsbs r4, r4, #0
	ands r3, r4
	ldr r1, _08030D1C @ =0x0202BD2C
	ldrb r0, [r1]
	movs r2, #3
	rsbs r2, r2, #0
	mov r8, r2
	ands r2, r0
	movs r6, #0xd
	rsbs r6, r6, #0
	ands r2, r6
	movs r0, #0x11
	rsbs r0, r0, #0
	ands r2, r0
	subs r0, #0x50
	ands r2, r0
	movs r0, #0x20
	orrs r2, r0
	movs r5, #0x7f
	ands r2, r5
	movs r1, #0x41
	adds r1, r1, r7
	mov sl, r1
	ldrb r0, [r1]
	movs r1, #2
	rsbs r1, r1, #0
	mov sb, r1
	ands r1, r0
	mov r0, r8
	ands r1, r0
	ands r1, r6
	movs r0, #0x41
	rsbs r0, r0, #0
	ands r1, r0
	ands r1, r5
	adds r0, #0x28
	ands r3, r0
	mov r0, ip
	strb r3, [r0]
	ldrh r3, [r0]
	ldr r0, _08030D20 @ =0xFFFFFE7F
	ands r0, r3
	mov r3, ip
	strh r0, [r3]
	adds r3, r7, #0
	adds r3, #0x43
	ldrb r0, [r3]
	ands r4, r0
	strb r4, [r3]
	mov r0, sb
	ands r2, r0
	ldr r3, _08030D1C @ =0x0202BD2C
	strb r2, [r3]
	movs r0, #0x11
	rsbs r0, r0, #0
	ands r1, r0
	mov r2, sl
	strb r1, [r2]
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08030D14: .4byte 0x0202BCEC
_08030D18: .4byte 0x01000026
_08030D1C: .4byte 0x0202BD2C
_08030D20: .4byte 0xFFFFFE7F

