	.syntax unified
	.set GetClassSMSId, 0x08018AA4 + 1
	.set PutSprite, 0x080052F0 + 1
	.section .text.sub_8027D48, "ax", %progbits
@ sub_8027D48 @ JP 0x08027D48 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8027D48
	.thumb_func
sub_8027D48:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	mov r8, r0
	adds r6, r1, #0
	adds r5, r2, #0
	ldr r0, [sp, #0x1c]
	ldr r4, [sp, #0x20]
	lsls r3, r3, #0x10
	lsrs r7, r3, #0x10
	bl GetClassSMSId
	adds r2, r0, #0
	ldr r0, _08027D9C @ =0x085C3B4C
	lsls r4, r4, #2
	adds r4, r4, r0
	ldr r0, [r4]
	adds r4, r0, #1
	adds r1, r6, #0
	adds r1, #0x10
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r1, r0
	bhi _08027DD0
	adds r0, r5, #0
	adds r0, #0x20
	cmp r0, #0xc0
	bhi _08027DD0
	ldr r1, _08027DA0 @ =0x08903E0C
	movs r0, #0x7f
	ands r0, r2
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r0, [r0, #2]
	cmp r0, #0
	blt _08027DD0
	cmp r0, #1
	ble _08027DA4
	cmp r0, #2
	beq _08027DBC
	b _08027DD0
	.align 2, 0
_08027D9C: .4byte 0x085C3B4C
_08027DA0: .4byte 0x08903E0C
_08027DA4:
	adds r2, r5, #0
	subs r2, #0x10
	ldr r3, _08027DB8 @ =0x085B8D04
	adds r0, r7, r4
	str r0, [sp]
	mov r0, r8
	adds r1, r6, #0
	bl PutSprite
	b _08027DD0
	.align 2, 0
_08027DB8: .4byte 0x085B8D04
_08027DBC:
	adds r1, r6, #0
	subs r1, #8
	adds r2, r5, #0
	subs r2, #0x10
	ldr r3, _08027DDC @ =0x085B8CEC
	adds r0, r7, r4
	str r0, [sp]
	mov r0, r8
	bl PutSprite
_08027DD0:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08027DDC: .4byte 0x085B8CEC

