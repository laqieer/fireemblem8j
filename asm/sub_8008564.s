	.syntax unified
	.set sub_8001BC0, 0x08001BC0 + 1
	.section .text.sub_8008564, "ax", %progbits
@ sub_8008564 @ JP 0x08008564 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8008564
	.thumb_func
sub_8008564:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	mov r8, r1
	str r2, [sp]
	adds r5, r3, #0
	ldr r4, [sp, #0x28]
	bl sub_8001BC0
	adds r7, r0, #0
	subs r5, #1
	subs r4, #1
	mov r0, r8
	adds r3, r0, r5
	cmp r8, r3
	bge _080085BC
	ldr r1, _0800867C @ =0x00003011
	mov sb, r1
	ldr r2, [sp]
	adds r0, r2, r4
	mov r6, r8
	lsls r1, r6, #1
	lsls r0, r0, #6
	adds r0, r0, r7
	adds r2, r1, r0
	ldr r6, [sp]
	lsls r0, r6, #6
	adds r0, r0, r7
	adds r1, r1, r0
	ldr r6, _08008680 @ =0x00003811
	adds r0, r6, #0
	mov r6, r8
	subs r3, r3, r6
_080085AC:
	mov r6, sb
	strh r6, [r1]
	strh r0, [r2]
	adds r2, #2
	adds r1, #2
	subs r3, #1
	cmp r3, #0
	bne _080085AC
_080085BC:
	ldr r3, [sp]
	add r5, r8
	mov ip, r5
	lsls r0, r3, #5
	str r0, [sp, #4]
	adds r4, r4, r3
	mov sb, r4
	movs r1, #1
	add r1, r8
	mov sl, r1
	cmp r3, sb
	bge _08008600
	ldr r2, _08008684 @ =0x00003012
	adds r6, r2, #0
	ldr r4, _08008688 @ =0x00003412
	adds r5, r4, #0
	lsls r0, r3, #6
	mov r2, ip
	lsls r1, r2, #1
	adds r1, r1, r7
	adds r2, r0, r1
	mov r4, r8
	lsls r1, r4, #1
	adds r1, r1, r7
	adds r0, r0, r1
	mov r1, sb
	subs r3, r1, r3
_080085F2:
	strh r6, [r0]
	strh r5, [r2]
	adds r2, #0x40
	adds r0, #0x40
	subs r3, #1
	cmp r3, #0
	bne _080085F2
_08008600:
	mov r3, sl
	cmp r3, ip
	bge _08008632
	mov r5, sb
	mov sl, ip
_0800860A:
	ldr r2, [sp]
	adds r2, #1
	adds r4, r3, #1
	cmp r2, r5
	bge _0800862C
	ldr r0, _0800868C @ =0x00003013
	adds r6, r0, #0
	lsls r1, r2, #6
	lsls r0, r3, #1
	adds r0, r0, r7
	adds r0, r1, r0
	subs r2, r5, r2
_08008622:
	strh r6, [r0]
	adds r0, #0x40
	subs r2, #1
	cmp r2, #0
	bne _08008622
_0800862C:
	adds r3, r4, #0
	cmp r3, sl
	blt _0800860A
_08008632:
	ldr r0, [sp, #4]
	add r0, r8
	lsls r0, r0, #1
	adds r0, r0, r7
	ldr r2, _08008690 @ =0x00003010
	adds r1, r2, #0
	strh r1, [r0]
	ldr r0, [sp, #4]
	add r0, ip
	lsls r0, r0, #1
	adds r0, r0, r7
	ldr r3, _08008694 @ =0x00003410
	adds r1, r3, #0
	strh r1, [r0]
	mov r4, sb
	lsls r1, r4, #5
	mov r6, r8
	adds r0, r6, r1
	lsls r0, r0, #1
	adds r0, r0, r7
	ldr r3, _08008698 @ =0x00003810
	adds r2, r3, #0
	strh r2, [r0]
	add r1, ip
	lsls r1, r1, #1
	adds r1, r1, r7
	ldr r4, _0800869C @ =0x00003C10
	adds r0, r4, #0
	strh r0, [r1]
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0800867C: .4byte 0x00003011
_08008680: .4byte 0x00003811
_08008684: .4byte 0x00003012
_08008688: .4byte 0x00003412
_0800868C: .4byte 0x00003013
_08008690: .4byte 0x00003010
_08008694: .4byte 0x00003410
_08008698: .4byte 0x00003810
_0800869C: .4byte 0x00003C10

