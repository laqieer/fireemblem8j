	.syntax unified
	.set __ashldi3, 0x080D6588 + 1
	.set sub_8004140, 0x08004140 + 1
	.set sub_80D65C0, 0x080D65C0 + 1
	.section .text.sub_80041A0, "ax", %progbits
@ sub_80041A0 @ JP 0x080041A0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80041A0
	.thumb_func
sub_80041A0:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	str r0, [sp]
	str r1, [sp, #4]
	ldr r0, _080042DC @ =0x02028E70
	ldr r0, [r0]
	ldr r1, [r0, #0xc]
	ldr r0, [sp]
	bl sub_80D65C0
	str r0, [sp, #0xc]
	ldr r1, [sp]
	ldrb r0, [r1, #2]
	movs r2, #7
	ands r2, r0
	str r2, [sp, #0x10]
	ldr r3, [sp, #4]
	adds r3, #8
	str r3, [sp, #0x14]
	movs r0, #9
	bl sub_8004140
	mov sl, r0
	ldr r1, [sp]
	ldrb r0, [r1, #3]
	bl sub_8004140
	mov sb, r0
	movs r2, #0xf
	str r2, [sp, #8]
	ldr r7, [sp, #0xc]
	adds r7, #0x40
_080041E8:
	ldr r3, [sp, #0x14]
	ldm r3!, {r0}
	str r3, [sp, #0x14]
	movs r1, #0
	ldr r3, [sp, #0x10]
	lsls r2, r3, #1
	bl __ashldi3
	movs r6, #0xff
	ands r6, r0
	lsls r6, r6, #1
	mov r3, sl
	adds r2, r6, r3
	ldrh r2, [r2]
	mov r8, r2
	lsls r5, r1, #0x18
	lsrs r4, r0, #8
	adds r2, r5, #0
	orrs r2, r4
	movs r4, #0xff
	ands r4, r2
	lsls r4, r4, #1
	adds r2, r4, r3
	ldrh r2, [r2]
	lsls r2, r2, #0x10
	mov r3, r8
	orrs r3, r2
	ldr r2, [sp, #0xc]
	ldr r5, [r2]
	ands r5, r3
	str r5, [r2]
	add r6, sb
	ldrh r3, [r6]
	add r4, sb
	ldrh r2, [r4]
	lsls r2, r2, #0x10
	orrs r3, r2
	orrs r5, r3
	ldr r3, [sp, #0xc]
	stm r3!, {r5}
	str r3, [sp, #0xc]
	lsls r5, r1, #0x10
	lsrs r4, r0, #0x10
	adds r2, r5, #0
	orrs r2, r4
	movs r6, #0xff
	ands r6, r2
	lsls r6, r6, #1
	mov r3, sl
	adds r2, r6, r3
	ldrh r2, [r2]
	mov r8, r2
	lsls r5, r1, #8
	lsrs r4, r0, #0x18
	adds r2, r5, #0
	orrs r2, r4
	movs r4, #0xff
	ands r4, r2
	lsls r4, r4, #1
	adds r2, r4, r3
	ldrh r2, [r2]
	lsls r2, r2, #0x10
	mov r3, r8
	orrs r3, r2
	ldr r5, [r7]
	ands r5, r3
	add r6, sb
	ldrh r3, [r6]
	add r4, sb
	ldrh r2, [r4]
	lsls r2, r2, #0x10
	orrs r3, r2
	orrs r5, r3
	str r5, [r7]
	adds r2, r1, #0
	movs r4, #0xff
	ands r4, r2
	lsls r4, r4, #1
	mov r3, sl
	adds r2, r4, r3
	ldrh r5, [r2]
	lsrs r2, r1, #8
	movs r1, #0xff
	ands r1, r2
	lsls r1, r1, #1
	mov r2, sl
	adds r0, r1, r2
	ldrh r0, [r0]
	lsls r0, r0, #0x10
	orrs r5, r0
	ldr r3, [r7, #0x40]
	ands r3, r5
	add r4, sb
	ldrh r2, [r4]
	add r1, sb
	ldrh r0, [r1]
	lsls r0, r0, #0x10
	orrs r2, r0
	orrs r3, r2
	str r3, [r7, #0x40]
	adds r7, #4
	ldr r3, [sp, #8]
	subs r3, #1
	str r3, [sp, #8]
	cmp r3, #0
	bge _080041E8
	ldr r1, [sp, #4]
	ldrb r0, [r1, #5]
	ldr r2, [sp]
	ldrb r2, [r2, #2]
	adds r0, r0, r2
	ldr r3, [sp]
	strb r0, [r3, #2]
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080042DC: .4byte 0x02028E70

