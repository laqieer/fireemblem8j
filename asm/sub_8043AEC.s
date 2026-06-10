	.syntax unified
	.set Proc_Goto, 0x08002E74 + 1
	.set m4aSongNumStart, 0x080D4EF4 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8043084, 0x08043084 + 1
	.set sub_8043190, 0x08043190 + 1
	.set sub_80434CC, 0x080434CC + 1
	.set sub_8043840, 0x08043840 + 1
	.set sub_8043A88, 0x08043A88 + 1
	.section .text.sub_8043AEC, "ax", %progbits
@ sub_8043AEC @ JP 0x08043AEC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8043AEC
	.thumb_func
sub_8043AEC:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r4, r0, #0
	ldr r6, [r4, #0x3c]
	ldr r1, _08043BB8 @ =0x085D33A8
	ldr r0, _08043BBC @ =0x0203DA20
	mov r8, r0
	ldrb r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	mov sb, r0
	ldr r5, [r4, #0x2c]
	adds r0, r5, #0
	adds r0, #0x44
	movs r1, #0
	mov sl, r1
	movs r7, #1
	strb r7, [r0]
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r5, #0x48]
	adds r0, r4, #0
	adds r0, #0x3c
	ldr r3, [r4, #0x34]
	subs r1, r3, #1
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	movs r2, #0
	bl sub_8043A88
	ldr r0, [r4, #0x3c]
	cmp r6, r0
	beq _08043B6A
	movs r0, #3
	bl sub_8043190
	adds r0, r5, #0
	adds r0, #0x3a
	adds r1, r0, r6
	mov r2, sl
	strb r2, [r1]
	ldr r1, [r4, #0x3c]
	adds r0, r0, r1
	strb r7, [r0]
	mov r0, r8
	ldrb r1, [r0]
	adds r0, r4, #0
	bl sub_80434CC
	adds r0, r4, #0
	bl sub_8043840
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #1
	bl sub_8043084
_08043B6A:
	ldr r0, _08043BC0 @ =0x085775CC
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	beq _08043BFC
	mov r1, r8
	ldrb r0, [r1]
	cmp r0, #1
	beq _08043BDA
	adds r0, r4, #0
	adds r0, #0x4d
	ldr r1, [r4, #0x3c]
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _08043BD2
	lsls r0, r1, #4
	add r0, sb
	ldrb r0, [r0]
	adds r1, r4, #0
	adds r1, #0x52
	strb r0, [r1]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #7
	bne _08043BC4
	movs r0, #1
	bl sub_8043190
	adds r0, r4, #0
	movs r1, #9
	bl Proc_Goto
	movs r0, #0xff
	mov r2, r8
	strb r0, [r2, #3]
	b _08043C58
	.align 2, 0
_08043BB8: .4byte 0x085D33A8
_08043BBC: .4byte 0x0203DA20
_08043BC0: .4byte 0x085775CC
_08043BC4:
	movs r0, #2
	bl sub_8043190
	adds r0, r4, #0
	bl sub_8002DE4
	b _08043BFC
_08043BD2:
	movs r0, #0
	bl sub_8043190
	b _08043BFC
_08043BDA:
	movs r0, #2
	bl sub_8043190
	adds r1, r4, #0
	adds r1, #0x52
	movs r0, #8
	strb r0, [r1]
	ldr r0, [r4, #0x3c]
	adds r1, #1
	strb r0, [r1]
	mov r0, sl
	str r0, [r4, #0x44]
	adds r0, r4, #0
	movs r1, #5
	bl Proc_Goto
	b _08043C58
_08043BFC:
	ldr r5, _08043C68 @ =0x085775CC
	ldr r0, [r5]
	ldrh r1, [r0, #8]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08043C1E
	movs r0, #1
	bl sub_8043190
	adds r0, r4, #0
	movs r1, #9
	bl Proc_Goto
	ldr r1, _08043C6C @ =0x0203DA20
	movs r0, #0xff
	strb r0, [r1, #3]
_08043C1E:
	ldr r0, [r5]
	ldrh r1, [r0, #8]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _08043C58
	adds r0, r4, #0
	adds r0, #0x5c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08043C58
	ldr r0, _08043C70 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08043C4A
	movs r0, #0x6a
	bl m4aSongNumStart
_08043C4A:
	ldr r1, _08043C6C @ =0x0203DA20
	movs r0, #0
	strb r0, [r1, #3]
	adds r0, r4, #0
	movs r1, #9
	bl Proc_Goto
_08043C58:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08043C68: .4byte 0x085775CC
_08043C6C: .4byte 0x0203DA20
_08043C70: .4byte 0x0202BCEC

