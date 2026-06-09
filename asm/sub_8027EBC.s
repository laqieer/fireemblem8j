	.syntax unified
	.set GetClassSMSId, 0x08018AA4 + 1
	.set PutSpriteExt, 0x08005330 + 1
	.section .text.sub_8027EBC, "ax", %progbits
@ sub_8027EBC @ JP 0x08027EBC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8027EBC
	.thumb_func
sub_8027EBC:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	mov ip, r0
	mov r8, r1
	adds r5, r2, #0
	adds r6, r3, #0
	ldr r0, [sp, #0x20]
	lsls r0, r0, #0x18
	asrs r7, r0, #0x18
	adds r1, r5, #0
	adds r1, #0x10
	movs r0, #0x88
	lsls r0, r0, #1
	cmp r1, r0
	bhi _08027F92
	adds r0, r6, #0
	adds r0, #0x20
	cmp r0, #0xe0
	bhi _08027F92
	ldr r4, _08027F08 @ =0x08903E0C
	mov r0, ip
	bl GetClassSMSId
	movs r1, #0x7f
	ands r1, r0
	lsls r1, r1, #3
	adds r1, r1, r4
	ldrh r0, [r1, #2]
	cmp r0, #1
	beq _08027F3C
	cmp r0, #1
	bgt _08027F0C
	cmp r0, #0
	beq _08027F12
	b _08027F92
	.align 2, 0
_08027F08: .4byte 0x08903E0C
_08027F0C:
	cmp r0, #2
	beq _08027F6C
	b _08027F92
_08027F12:
	adds r1, r5, #0
	subs r1, #8
	ldr r0, _08027F34 @ =0x000001FF
	ands r1, r0
	adds r2, r6, #0
	subs r2, #0x10
	movs r0, #0xff
	ands r2, r0
	cmp r7, #0
	beq _08027F2C
	movs r0, #0x80
	lsls r0, r0, #3
	orrs r2, r0
_08027F2C:
	ldr r3, _08027F38 @ =0x085B8CE4
	ldr r0, [sp, #0x1c]
	adds r0, #0x40
	b _08027F5A
	.align 2, 0
_08027F34: .4byte 0x000001FF
_08027F38: .4byte 0x085B8CE4
_08027F3C:
	adds r1, r5, #0
	subs r1, #8
	ldr r0, _08027F64 @ =0x000001FF
	ands r1, r0
	adds r2, r6, #0
	subs r2, #0x20
	movs r0, #0xff
	ands r2, r0
	cmp r7, #0
	beq _08027F56
	movs r0, #0x80
	lsls r0, r0, #3
	orrs r2, r0
_08027F56:
	ldr r3, _08027F68 @ =0x085B8D04
	ldr r0, [sp, #0x1c]
_08027F5A:
	str r0, [sp]
	mov r0, r8
	bl PutSpriteExt
	b _08027F92
	.align 2, 0
_08027F64: .4byte 0x000001FF
_08027F68: .4byte 0x085B8D04
_08027F6C:
	adds r1, r5, #0
	subs r1, #0x10
	ldr r0, _08027FA0 @ =0x000001FF
	ands r1, r0
	adds r2, r6, #0
	subs r2, #0x20
	movs r0, #0xff
	ands r2, r0
	cmp r7, #0
	beq _08027F86
	movs r0, #0x80
	lsls r0, r0, #3
	orrs r2, r0
_08027F86:
	ldr r3, _08027FA4 @ =0x085B8CEC
	ldr r0, [sp, #0x1c]
	str r0, [sp]
	mov r0, r8
	bl PutSpriteExt
_08027F92:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08027FA0: .4byte 0x000001FF
_08027FA4: .4byte 0x085B8CEC

