	.syntax unified
	.set FormatTime, 0x08000D14 + 1
	.set InitText, 0x08003C8C + 1
	.set PutText, 0x08003DA0 + 1
	.set __udivsi3, 0x080D67D0 + 1
	.set __umodsi3, 0x080D6848 + 1
	.set sub_8003D98, 0x08003D98 + 1
	.set sub_80040B8, 0x080040B8 + 1
	.set sub_8009FA8, 0x08009FA8 + 1
	.set sub_80385E8, 0x080385E8 + 1
	.section .text.sub_80387B8, "ax", %progbits
@ sub_80387B8 @ JP 0x080387B8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80387B8
	.thumb_func
sub_80387B8:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	adds r6, r0, #0
	ldr r0, [sp, #0x30]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	mov sl, r2
	lsls r3, r3, #0x18
	asrs r3, r3, #0x18
	mov sb, r3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	mov r4, sp
	adds r4, #0xa
	add r5, sp, #0xc
	add r1, sp, #8
	adds r2, r4, #0
	adds r3, r5, #0
	bl FormatTime
	mov r0, sl
	subs r0, #7
	lsls r0, r0, #0x18
	asrs r7, r0, #0x18
	add r0, sp, #8
	ldrh r0, [r0]
	cmp r0, #9
	bhi _0803880E
	mov r0, sb
	str r0, [sp]
	mov r1, r8
	str r1, [sp, #4]
	adds r0, r6, #0
	movs r1, #0
	b _08038828
_0803880E:
	add r0, sp, #8
	ldrh r0, [r0]
	movs r1, #0xa
	bl __udivsi3
	adds r1, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov r0, sb
	str r0, [sp]
	mov r0, r8
	str r0, [sp, #4]
	adds r0, r6, #0
_08038828:
	movs r2, #1
	adds r3, r7, #0
	bl sub_80385E8
	adds r6, r0, #0
	adds r0, r7, #1
	lsls r0, r0, #0x18
	asrs r7, r0, #0x18
	add r0, sp, #8
	ldrh r0, [r0]
	movs r1, #0xa
	bl __umodsi3
	adds r1, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov r0, sb
	str r0, [sp]
	mov r0, r8
	str r0, [sp, #4]
	adds r0, r6, #0
	movs r2, #1
	adds r3, r7, #0
	bl sub_80385E8
	adds r6, r0, #0
	mov r0, sl
	subs r0, #5
	lsls r0, r0, #0x18
	asrs r7, r0, #0x18
	movs r0, #0xca
	lsls r0, r0, #1
	bl sub_8009FA8
	adds r4, r0, #0
	adds r0, r6, #0
	movs r1, #1
	bl InitText
	adds r0, r6, #0
	movs r1, #0
	mov r2, r8
	bl sub_8003D98
	adds r0, r6, #0
	adds r1, r4, #0
	bl sub_80040B8
	mov r1, sb
	lsls r4, r1, #5
	adds r1, r4, r7
	lsls r1, r1, #1
	ldr r0, _080388BC @ =0x02022CA8
	adds r1, r1, r0
	adds r0, r6, #0
	bl PutText
	adds r6, #8
	mov r0, sl
	subs r0, #4
	lsls r0, r0, #0x18
	asrs r7, r0, #0x18
	mov r1, sp
	ldrh r0, [r1, #0xa]
	adds r5, r4, #0
	cmp r0, #9
	bhi _080388C0
	mov r0, sb
	str r0, [sp]
	mov r1, r8
	str r1, [sp, #4]
	adds r0, r6, #0
	movs r1, #0
	b _080388DA
	.align 2, 0
_080388BC: .4byte 0x02022CA8
_080388C0:
	mov r1, sp
	ldrh r0, [r1, #0xa]
	movs r1, #0xa
	bl __udivsi3
	adds r1, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov r0, sb
	str r0, [sp]
	mov r0, r8
	str r0, [sp, #4]
	adds r0, r6, #0
_080388DA:
	movs r2, #1
	adds r3, r7, #0
	bl sub_80385E8
	adds r6, r0, #0
	adds r0, r7, #1
	lsls r0, r0, #0x18
	asrs r7, r0, #0x18
	mov r1, sp
	ldrh r0, [r1, #0xa]
	movs r1, #0xa
	bl __umodsi3
	adds r1, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov r0, sb
	str r0, [sp]
	mov r0, r8
	str r0, [sp, #4]
	adds r0, r6, #0
	movs r2, #1
	adds r3, r7, #0
	bl sub_80385E8
	adds r6, r0, #0
	mov r0, sl
	subs r0, #2
	lsls r0, r0, #0x18
	asrs r7, r0, #0x18
	movs r0, #0xca
	lsls r0, r0, #1
	bl sub_8009FA8
	adds r4, r0, #0
	adds r0, r6, #0
	movs r1, #1
	bl InitText
	adds r0, r6, #0
	movs r1, #0
	mov r2, r8
	bl sub_8003D98
	adds r0, r6, #0
	adds r1, r4, #0
	bl sub_80040B8
	adds r1, r5, r7
	lsls r1, r1, #1
	ldr r0, _08038968 @ =0x02022CA8
	adds r1, r1, r0
	adds r0, r6, #0
	bl PutText
	adds r6, #8
	mov r0, sl
	subs r0, #1
	lsls r0, r0, #0x18
	asrs r7, r0, #0x18
	mov r1, sp
	ldrh r0, [r1, #0xc]
	cmp r0, #9
	bhi _0803896C
	mov r0, sb
	str r0, [sp]
	mov r1, r8
	str r1, [sp, #4]
	adds r0, r6, #0
	movs r1, #0
	b _08038986
	.align 2, 0
_08038968: .4byte 0x02022CA8
_0803896C:
	mov r1, sp
	ldrh r0, [r1, #0xc]
	movs r1, #0xa
	bl __udivsi3
	adds r1, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov r0, sb
	str r0, [sp]
	mov r0, r8
	str r0, [sp, #4]
	adds r0, r6, #0
_08038986:
	movs r2, #1
	adds r3, r7, #0
	bl sub_80385E8
	adds r6, r0, #0
	adds r0, r7, #1
	lsls r0, r0, #0x18
	asrs r7, r0, #0x18
	mov r1, sp
	ldrh r0, [r1, #0xc]
	movs r1, #0xa
	bl __umodsi3
	adds r1, r0, #0
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov r0, sb
	str r0, [sp]
	mov r0, r8
	str r0, [sp, #4]
	adds r0, r6, #0
	movs r2, #1
	adds r3, r7, #0
	bl sub_80385E8
	adds r6, r0, #0
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

