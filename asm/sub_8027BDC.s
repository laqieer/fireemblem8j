	.syntax unified
	.set GetClassSMSId, 0x08018AA4 + 1
	.set PutSprite, 0x080052F0 + 1
	.set sub_80267A0, 0x080267A0 + 1
	.section .text.sub_8027BDC, "ax", %progbits
@ sub_8027BDC @ JP 0x08027BDC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8027BDC
	.thumb_func
sub_8027BDC:
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	mov sb, r0
	adds r6, r1, #0
	adds r5, r2, #0
	ldr r0, [sp, #0x20]
	lsls r3, r3, #0x10
	lsrs r7, r3, #0x10
	bl GetClassSMSId
	mov r8, r0
	bl sub_80267A0
	adds r4, r0, #0
	adds r4, #0x80
	adds r1, r6, #0
	adds r1, #0x10
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r1, r0
	bhi _08027C7C
	adds r0, r5, #0
	adds r0, #0x20
	cmp r0, #0xc0
	bhi _08027C7C
	ldr r1, _08027C30 @ =0x08903E0C
	movs r0, #0x7f
	mov r2, r8
	ands r0, r2
	lsls r0, r0, #3
	adds r0, r0, r1
	ldrh r0, [r0, #2]
	cmp r0, #1
	beq _08027C50
	cmp r0, #1
	bgt _08027C34
	cmp r0, #0
	beq _08027C3A
	b _08027C7C
	.align 2, 0
_08027C30: .4byte 0x08903E0C
_08027C34:
	cmp r0, #2
	beq _08027C68
	b _08027C7C
_08027C3A:
	ldr r3, _08027C4C @ =0x085B8CE4
	adds r0, r7, r4
	str r0, [sp]
	mov r0, sb
	adds r1, r6, #0
	adds r2, r5, #0
	bl PutSprite
	b _08027C7C
	.align 2, 0
_08027C4C: .4byte 0x085B8CE4
_08027C50:
	adds r2, r5, #0
	subs r2, #0x10
	ldr r3, _08027C64 @ =0x085B8D04
	adds r0, r7, r4
	str r0, [sp]
	mov r0, sb
	adds r1, r6, #0
	bl PutSprite
	b _08027C7C
	.align 2, 0
_08027C64: .4byte 0x085B8D04
_08027C68:
	adds r1, r6, #0
	subs r1, #8
	adds r2, r5, #0
	subs r2, #0x10
	ldr r3, _08027C8C @ =0x085B8CEC
	adds r0, r7, r4
	str r0, [sp]
	mov r0, sb
	bl PutSprite
_08027C7C:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08027C8C: .4byte 0x085B8CEC

