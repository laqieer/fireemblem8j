	.syntax unified
	.set sub_8086AC4, 0x08086AC4 + 1
	.set sub_80A776C, 0x080A776C + 1
	.section .text.sub_80A8030, "ax", %progbits
@ sub_80A8030 @ JP 0x080A8030 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A8030
	.thumb_func
sub_80A8030:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x78
	str r0, [sp, #0x64]
	mov r8, r1
	str r2, [sp, #0x68]
	ldr r0, _080A8074 @ =0x088582BC
	mov sl, r0
	ldr r6, [sp, #0x64]
	subs r6, #1
	movs r0, #0x34
	adds r1, r6, #0
	muls r1, r0, r1
	mov sb, r1
	mov r0, sl
	adds r0, #0x2c
	adds r7, r1, r0
	ldr r0, [r7]
	cmp r0, #0
	bne _080A8078
	movs r0, #0
	movs r3, #6
_080A8062:
	mov r2, r8
	strb r0, [r2]
	movs r1, #1
	add r8, r1
	subs r3, #1
	cmp r3, #0
	bge _080A8062
	b _080A814E
	.align 2, 0
_080A8074: .4byte 0x088582BC
_080A8078:
	movs r4, #0
	bl sub_8086AC4
	adds r5, r0, #0
	ldr r2, [sp, #0x68]
	cmp r2, #0
	bne _080A8092
	mov r1, sp
	adds r0, r1, #0
	str r0, [sp, #0x68]
	mov r0, sp
	bl sub_80A776C
_080A8092:
	ldrh r0, [r5]
	ldr r1, _080A8110 @ =0x0000FFFF
	str r6, [sp, #0x74]
	cmp r0, r1
	beq _080A812C
	str r7, [sp, #0x70]
	mov r2, sb
	str r2, [sp, #0x6c]
_080A80A2:
	ldrh r0, [r5]
	ldr r1, [sp, #0x64]
	cmp r0, r1
	beq _080A80BC
	ldrh r0, [r5, #2]
	adds r2, r4, #1
	mov sb, r2
	movs r1, #0x10
	adds r1, r1, r5
	mov ip, r1
	ldr r2, [sp, #0x64]
	cmp r0, r2
	bne _080A8120
_080A80BC:
	asrs r1, r4, #2
	adds r0, r4, #0
	movs r2, #3
	ands r0, r2
	lsls r0, r0, #1
	mov sl, r0
	movs r3, #0
	ldr r2, [sp, #0x70]
	ldr r0, [r2]
	adds r4, #1
	mov sb, r4
	movs r2, #0x10
	adds r2, r2, r5
	mov ip, r2
	ldrb r0, [r0, #0x15]
	cmp r3, r0
	bge _080A8120
	ldr r0, _080A8114 @ =0x088582E8
	ldr r2, [sp, #0x6c]
	adds r6, r2, r0
	ldr r0, [sp, #0x68]
	adds r0, #0x20
	adds r7, r0, r1
_080A80EA:
	ldr r4, [r6]
	adds r0, r4, r3
	ldrh r1, [r5]
	ldrb r2, [r0]
	cmp r1, r2
	beq _080A80FC
	ldrh r0, [r5, #2]
	cmp r0, r2
	bne _080A8118
_080A80FC:
	mov r0, r8
	adds r1, r0, r3
	ldrb r0, [r7]
	mov r2, sl
	asrs r0, r2
	movs r2, #3
	ands r0, r2
	strb r0, [r1]
	b _080A8120
	.align 2, 0
_080A8110: .4byte 0x0000FFFF
_080A8114: .4byte 0x088582E8
_080A8118:
	adds r3, #1
	ldrb r4, [r4, #0x15]
	cmp r3, r4
	blt _080A80EA
_080A8120:
	mov r4, sb
	mov r5, ip
	ldrh r0, [r5]
	ldr r1, _080A8160 @ =0x0000FFFF
	cmp r0, r1
	bne _080A80A2
_080A812C:
	movs r0, #0x34
	ldr r2, [sp, #0x74]
	muls r0, r2, r0
	ldr r1, _080A8164 @ =0x088582BC
	adds r1, #0x2c
	adds r0, r0, r1
	ldr r0, [r0]
	ldrb r3, [r0, #0x15]
	cmp r3, #6
	bgt _080A814E
	movs r1, #0
_080A8142:
	mov r2, r8
	adds r0, r2, r3
	strb r1, [r0]
	adds r3, #1
	cmp r3, #6
	ble _080A8142
_080A814E:
	add sp, #0x78
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A8160: .4byte 0x0000FFFF
_080A8164: .4byte 0x088582BC

