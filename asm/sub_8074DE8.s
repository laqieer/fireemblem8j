	.syntax unified
	.set GetAnimSpriteRotScaleX, 0x08073CC8 + 1
	.set GetAnimSpriteRotScaleY, 0x08073CE4 + 1
	.set sub_80D6374, 0x080D6374 + 1
	.section .text.sub_8074DE8, "ax", %progbits
@ sub_8074DE8 @ JP 0x08074DE8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8074DE8
	.thumb_func
sub_8074DE8:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r2, [r0, #0x3c]
	ldr r3, [r2]
	ldr r1, _08074E18 @ =0xFFFF0000
	adds r0, r3, #0
	ands r0, r1
	cmp r0, r1
	bne _08074E0C
	ldr r7, _08074E1C @ =0x0000FFFF
	ands r7, r3
	cmp r7, #0
	beq _08074E0C
_08074E04:
	subs r7, #1
	adds r2, #0xc
	cmp r7, #0
	bne _08074E04
_08074E0C:
	adds r6, r2, #0
	movs r7, #0
	movs r0, #0
	mov r8, r0
	b _08074E54
	.align 2, 0
_08074E18: .4byte 0xFFFF0000
_08074E1C: .4byte 0x0000FFFF
_08074E20:
	movs r0, #6
	ldrsh r5, [r6, r0]
	ldr r0, [r6]
	bl GetAnimSpriteRotScaleX
	lsls r0, r0, #0x10
	asrs r0, r0, #0x11
	adds r5, r5, r0
	ldr r0, [r6]
	bl GetAnimSpriteRotScaleX
	adds r4, r0, #0
	ldr r0, [r6]
	bl GetAnimSpriteRotScaleY
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	adds r1, r4, #0
	muls r1, r0, r1
	adds r0, r1, #0
	muls r0, r5, r0
	add r8, r0
	adds r7, r7, r1
	adds r6, #0xc
_08074E54:
	ldr r0, [r6]
	cmp r0, #1
	bne _08074E20
	cmp r7, #0
	bne _08074E68
	ldr r0, _08074E64 @ =0x7FFFFFFF
	b _08074E70
	.align 2, 0
_08074E64: .4byte 0x7FFFFFFF
_08074E68:
	mov r0, r8
	adds r1, r7, #0
	bl sub_80D6374
_08074E70:
	mov r8, r0
	mov r0, r8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

