	.syntax unified
	.set GetClassSMSId, 0x08018AA4 + 1
	.set PutSpriteExt, 0x08005330 + 1
	.set sub_80267A0, 0x080267A0 + 1
	.section .text.sub_8027C90, "ax", %progbits
@ sub_8027C90 @ JP 0x08027C90 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8027C90
	.thumb_func
sub_8027C90:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	mov r8, r0
	adds r5, r1, #0
	adds r4, r2, #0
	adds r0, r3, #0
	bl GetClassSMSId
	adds r6, r0, #0
	bl sub_80267A0
	adds r7, r0, #0
	adds r7, #0x80
	adds r1, r5, #0
	adds r1, #0x10
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r1, r0
	bhi _08027D34
	adds r0, r4, #0
	adds r0, #0x20
	cmp r0, #0xc0
	bhi _08027D34
	ldr r1, _08027CDC @ =0x08903E0C
	movs r0, #0x7f
	ands r0, r6
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r0, [r0, #2]
	cmp r0, #1
	beq _08027CF4
	cmp r0, #1
	bgt _08027CE0
	cmp r0, #0
	beq _08027CE6
	b _08027D34
	.align 2, 0
_08027CDC: .4byte 0x08903E0C
_08027CE0:
	cmp r0, #2
	beq _08027D14
	b _08027D34
_08027CE6:
	movs r0, #0x80
	lsls r0, r0, #4
	adds r2, r4, r0
	ldr r3, _08027CF0 @ =0x085B8CE4
	b _08027D04
	.align 2, 0
_08027CF0: .4byte 0x085B8CE4
_08027CF4:
	adds r2, r4, #0
	subs r2, #0x10
	movs r0, #0xff
	ands r2, r0
	movs r0, #0x80
	lsls r0, r0, #4
	adds r2, r2, r0
	ldr r3, _08027D10 @ =0x085B8D04
_08027D04:
	str r7, [sp]
	mov r0, r8
	adds r1, r5, #0
	bl PutSpriteExt
	b _08027D34
	.align 2, 0
_08027D10: .4byte 0x085B8D04
_08027D14:
	adds r1, r5, #0
	subs r1, #8
	ldr r0, _08027D40 @ =0x000001FF
	ands r1, r0
	adds r2, r4, #0
	subs r2, #0x10
	movs r0, #0xff
	ands r2, r0
	movs r0, #0x80
	lsls r0, r0, #4
	adds r2, r2, r0
	ldr r3, _08027D44 @ =0x085B8CEC
	str r7, [sp]
	mov r0, r8
	bl PutSpriteExt
_08027D34:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08027D40: .4byte 0x000001FF
_08027D44: .4byte 0x085B8CEC

