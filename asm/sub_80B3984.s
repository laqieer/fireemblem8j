	.syntax unified
	.set CountDisplayedSoundRoomSongs, 0x080B3930 + 1
	.set CountSecretSoundRoomSongs, 0x080B38D4 + 1
	.set CountTotalSoundRoomSongs, 0x080B38B4 + 1
	.set __divsi3, 0x080D65F8 + 1
	.set sub_80A8890, 0x080A8890 + 1
	.set sub_80D6370, 0x080D6370 + 1
	.set sub_80D65C4, 0x080D65C4 + 1
	.section .text.sub_80B3984, "ax", %progbits
@ sub_80B3984 @ JP 0x080B3984 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B3984
	.thumb_func
sub_80B3984:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x2c
	adds r7, r0, #0
	bl CountTotalSoundRoomSongs
	movs r1, #0x36
	adds r1, r1, r7
	mov r8, r1
	movs r1, #0
	mov r2, r8
	strb r0, [r2]
	add r0, sp, #0x24
	movs r4, #0
	strh r1, [r0]
	adds r1, r7, #0
	adds r1, #0x40
	ldr r2, _080B3AD8 @ =0x01000008
	bl sub_80D6370
	adds r5, r7, #0
	adds r5, #0x33
	strb r4, [r5]
	mov r0, sp
	bl sub_80A8890
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080B3ABA
	movs r6, #0
	ldr r1, _080B3ADC @ =0x08A9DDDC
	ldr r0, [r1]
	mov sb, r8
	mov r8, r5
	movs r3, #0x34
	adds r3, r3, r7
	mov sl, r3
	cmp r0, #0
	blt _080B3A2C
	movs r4, #0
	movs r0, #8
	adds r0, r0, r1
	mov ip, r0
_080B39E0:
	mov r2, ip
	ldr r0, [r2]
	cmp r0, #0
	bne _080B3A1A
	adds r0, r4, r1
	ldr r1, [r0]
	asrs r0, r1, #5
	lsls r0, r0, #2
	add r0, sp
	movs r3, #0x1f
	ands r1, r3
	ldr r0, [r0]
	lsrs r0, r1
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _080B3A1A
	asrs r2, r6, #5
	lsls r2, r2, #2
	adds r2, r2, r7
	adds r0, r6, #0
	ands r0, r3
	lsls r1, r0
	ldr r0, [r2, #0x40]
	orrs r0, r1
	str r0, [r2, #0x40]
	ldrb r0, [r5]
	adds r0, #1
	strb r0, [r5]
_080B3A1A:
	adds r4, #0x10
	movs r3, #0x10
	add ip, r3
	adds r6, #1
	ldr r1, _080B3ADC @ =0x08A9DDDC
	adds r0, r4, r1
	ldr r0, [r0]
	cmp r0, #0
	bge _080B39E0
_080B3A2C:
	bl CountSecretSoundRoomSongs
	adds r2, r0, #0
	mov r0, r8
	ldrb r1, [r0]
	movs r0, #0x64
	muls r0, r1, r0
	mov r3, sb
	ldrb r1, [r3]
	subs r1, r1, r2
	bl __divsi3
	mov r1, sl
	strb r0, [r1]
	movs r6, #0
	ldr r1, _080B3ADC @ =0x08A9DDDC
	ldr r0, [r1]
	cmp r0, #0
	blt _080B3ABA
	movs r5, #0
_080B3A54:
	adds r0, r1, #0
	adds r0, #8
	adds r0, r5, r0
	ldr r2, [r0]
	cmp r2, #0
	beq _080B3AAC
	adds r0, r5, r1
	ldr r1, [r0]
	asrs r0, r1, #5
	lsls r0, r0, #2
	add r0, sp
	movs r3, #0x1f
	ands r1, r3
	ldr r0, [r0]
	lsrs r0, r1
	movs r4, #1
	ands r0, r4
	cmp r0, #0
	bne _080B3A8A
	adds r0, r7, #0
	str r3, [sp, #0x28]
	bl sub_80D65C4
	lsls r0, r0, #0x18
	ldr r3, [sp, #0x28]
	cmp r0, #0
	beq _080B3AAC
_080B3A8A:
	asrs r2, r6, #5
	lsls r2, r2, #2
	adds r2, r2, r7
	adds r0, r6, #0
	ands r0, r3
	adds r1, r4, #0
	lsls r1, r0
	ldr r0, [r2, #0x40]
	orrs r0, r1
	str r0, [r2, #0x40]
	mov r2, r8
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
	adds r0, r7, #0
	adds r0, #0x2e
	strb r4, [r0]
_080B3AAC:
	adds r5, #0x10
	adds r6, #1
	ldr r1, _080B3ADC @ =0x08A9DDDC
	adds r0, r5, r1
	ldr r0, [r0]
	cmp r0, #0
	bge _080B3A54
_080B3ABA:
	adds r0, r7, #0
	bl CountDisplayedSoundRoomSongs
	adds r1, r7, #0
	adds r1, #0x36
	strb r0, [r1]
	add sp, #0x2c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B3AD8: .4byte 0x01000008
_080B3ADC: .4byte 0x08A9DDDC

