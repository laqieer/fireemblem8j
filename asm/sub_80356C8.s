	.syntax unified
	.set PutSprite, 0x080052F0 + 1
	.section .text.sub_80356C8, "ax", %progbits
@ sub_80356C8 @ JP 0x080356C8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80356C8
	.thumb_func
sub_80356C8:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	adds r6, r0, #0
	movs r1, #0
	ldr r0, _0803576C @ =0x0202BCEC
	adds r0, #0x42
	mov r8, r0
	ldrb r0, [r0]
	lsls r0, r0, #0x1a
	cmp r0, #0
	bge _080356E4
	movs r1, #5
_080356E4:
	ldr r4, _08035770 @ =0x085B8D24
	lsls r5, r1, #0xc
	movs r0, #0xa0
	lsls r0, r0, #2
	adds r0, r5, r0
	str r0, [sp]
	movs r0, #2
	movs r1, #0x38
	adds r2, r6, #0
	adds r3, r4, #0
	bl PutSprite
	movs r0, #0xa1
	lsls r0, r0, #2
	adds r0, r5, r0
	str r0, [sp]
	movs r0, #2
	movs r1, #0x58
	adds r2, r6, #0
	adds r3, r4, #0
	bl PutSprite
	movs r0, #0xa2
	lsls r0, r0, #2
	adds r0, r5, r0
	str r0, [sp]
	movs r0, #2
	movs r1, #0x78
	adds r2, r6, #0
	adds r3, r4, #0
	bl PutSprite
	ldr r4, _08035774 @ =0x085B8CE4
	movs r0, #0xa3
	lsls r0, r0, #2
	adds r0, r5, r0
	str r0, [sp]
	movs r0, #2
	movs r1, #0x98
	adds r2, r6, #0
	adds r3, r4, #0
	bl PutSprite
	ldr r7, _08035778 @ =0x085B8CFC
	ldr r0, _0803577C @ =0x0000028E
	adds r0, r5, r0
	str r0, [sp]
	movs r0, #2
	movs r1, #0xa8
	adds r2, r6, #0
	adds r3, r7, #0
	bl PutSprite
	mov r1, r8
	ldrb r0, [r1]
	lsls r0, r0, #0x1a
	cmp r0, #0
	blt _08035784
	ldr r0, _08035780 @ =0x0000028F
	adds r0, r5, r0
	str r0, [sp]
	movs r0, #2
	movs r1, #0xb0
	adds r2, r6, #0
	adds r3, r4, #0
	bl PutSprite
	b _080357AA
	.align 2, 0
_0803576C: .4byte 0x0202BCEC
_08035770: .4byte 0x085B8D24
_08035774: .4byte 0x085B8CE4
_08035778: .4byte 0x085B8CFC
_0803577C: .4byte 0x0000028E
_08035780: .4byte 0x0000028F
_08035784:
	ldr r0, _080357B8 @ =0x00000292
	adds r0, r5, r0
	str r0, [sp]
	movs r0, #2
	movs r1, #0xb0
	adds r2, r6, #0
	adds r3, r4, #0
	bl PutSprite
	movs r0, #0xa5
	lsls r0, r0, #2
	adds r0, r5, r0
	str r0, [sp]
	movs r0, #2
	movs r1, #0xc0
	adds r2, r6, #0
	adds r3, r7, #0
	bl PutSprite
_080357AA:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080357B8: .4byte 0x00000292

