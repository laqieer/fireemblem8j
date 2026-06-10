	.syntax unified
	.set AiSetDecision, 0x08039C98 + 1
	.set AiUpdateDecision, 0x08039CDC + 1
	.set sub_80379F4, 0x080379F4 + 1
	.set sub_803BA10, 0x0803BA10 + 1
	.set sub_8040DE8, 0x08040DE8 + 1
	.section .text.sub_803F7BC, "ax", %progbits
@ sub_803F7BC @ JP 0x0803F7BC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_803F7BC
	.thumb_func
sub_803F7BC:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [sp, #0x10]
	str r0, [sp, #0xc]
	movs r1, #0
	mov r8, r1
	movs r2, #0xff
	mov sl, r2
	ldr r4, _0803F818 @ =0x03004DF0
	ldr r2, [r4]
	ldr r0, [r2, #0xc]
	movs r1, #0x80
	lsls r1, r1, #4
	ands r0, r1
	cmp r0, #0
	beq _0803F81C
	movs r0, #0x10
	ldrsb r0, [r2, r0]
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	bl sub_80379F4
	cmp r0, #0
	beq _0803F7FA
	b _0803F910
_0803F7FA:
	ldr r1, [r4]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	mov r2, r8
	str r2, [sp]
	str r2, [sp, #4]
	str r2, [sp, #8]
	movs r2, #0xa
	movs r3, #0
	bl AiSetDecision
	b _0803F910
	.align 2, 0
_0803F818: .4byte 0x03004DF0
_0803F81C:
	adds r0, r2, #0
	bl sub_8040DE8
	ldr r0, _0803F8E4 @ =0x0202E4D0
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r5, r0, #1
	cmp r5, #0
	blt _0803F8A0
_0803F82E:
	ldr r0, _0803F8E4 @ =0x0202E4D0
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r4, r0, #1
	subs r0, r5, #1
	mov sb, r0
	cmp r4, #0
	blt _0803F89A
	ldr r7, _0803F8E8 @ =0x0202E4DC
	lsls r6, r5, #2
_0803F842:
	ldr r0, [r7]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0803F894
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_80379F4
	cmp r0, #0
	beq _0803F894
	mov r0, r8
	adds r0, #1
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov r8, r0
	ldr r0, _0803F8EC @ =0x0202E4D4
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0
	bne _0803F894
	ldr r0, [r7]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r1, r0, r4
	ldrb r0, [r1]
	cmp r0, sl
	bhi _0803F894
	adds r1, r0, #0
	mov sl, r1
	lsls r0, r4, #0x10
	asrs r0, r0, #0x10
	str r0, [sp, #0xc]
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
	str r0, [sp, #0x10]
_0803F894:
	subs r4, #1
	cmp r4, #0
	bge _0803F842
_0803F89A:
	mov r5, sb
	cmp r5, #0
	bge _0803F82E
_0803F8A0:
	ldr r1, [sp, #0xc]
	cmp r1, #0
	blt _0803F8B6
	movs r0, #1
	str r0, [sp]
	adds r0, r1, #0
	ldr r1, [sp, #0x10]
	movs r2, #0
	movs r3, #0xff
	bl sub_803BA10
_0803F8B6:
	ldr r1, _0803F8F0 @ =0x0203AA90
	movs r0, #0xa
	ldrsb r0, [r1, r0]
	cmp r0, #1
	bne _0803F8F4
	ldrb r0, [r1, #2]
	ldr r2, [sp, #0xc]
	cmp r0, r2
	bne _0803F910
	ldrb r0, [r1, #3]
	ldr r1, [sp, #0x10]
	cmp r0, r1
	bne _0803F910
	movs r0, #0
	str r0, [sp]
	movs r0, #9
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl AiUpdateDecision
	b _0803F910
	.align 2, 0
_0803F8E4: .4byte 0x0202E4D0
_0803F8E8: .4byte 0x0202E4DC
_0803F8EC: .4byte 0x0202E4D4
_0803F8F0: .4byte 0x0203AA90
_0803F8F4:
	mov r2, r8
	cmp r2, #0
	beq _0803F908
	ldr r0, _0803F904 @ =0x0203AA00
	adds r0, #0x86
	movs r1, #7
	b _0803F90E
	.align 2, 0
_0803F904: .4byte 0x0203AA00
_0803F908:
	ldr r0, _0803F924 @ =0x0203AA00
	adds r0, #0x86
	movs r1, #6
_0803F90E:
	strb r1, [r0]
_0803F910:
	movs r0, #1
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0803F924: .4byte 0x0203AA00

