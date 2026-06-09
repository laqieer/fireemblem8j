	.syntax unified
	.set PutSpriteExt, 0x08005330 + 1
	.section .text.sub_809249C, "ax", %progbits
@ sub_809249C @ JP 0x0809249C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_809249C
	.thumb_func
sub_809249C:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	lsls r1, r1, #0x18
	lsrs r7, r1, #0x18
	lsls r2, r2, #0x18
	lsrs r6, r2, #0x18
	ldr r0, _08092514 @ =0x08A938A4
	ldr r3, [r0]
	movs r0, #0xa0
	lsls r0, r0, #7
	str r0, [sp]
	movs r0, #0xd
	mov r1, r8
	adds r2, r7, #0
	bl PutSpriteExt
	movs r5, #0
	subs r0, r6, #1
	cmp r5, r0
	bge _080924F0
	mov r4, r8
	adds r4, #8
_080924D2:
	ldr r0, _08092514 @ =0x08A938A4
	ldr r3, [r0, #4]
	movs r0, #0xa0
	lsls r0, r0, #7
	str r0, [sp]
	movs r0, #0xd
	adds r1, r4, #0
	adds r2, r7, #0
	bl PutSpriteExt
	adds r4, #0x10
	adds r5, #1
	subs r0, r6, #1
	cmp r5, r0
	blt _080924D2
_080924F0:
	lsls r1, r5, #4
	add r1, r8
	adds r1, #8
	ldr r0, _08092514 @ =0x08A938A4
	ldr r3, [r0, #8]
	movs r0, #0xa0
	lsls r0, r0, #7
	str r0, [sp]
	movs r0, #0xd
	adds r2, r7, #0
	bl PutSpriteExt
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08092514: .4byte 0x08A938A4

