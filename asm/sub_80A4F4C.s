	.syntax unified
	.set GetSupportScreenClassIdAt, 0x080A4940 + 1
	.set __divsi3, 0x080D65F8 + 1
	.set __modsi3, 0x080D6690 + 1
	.set sub_8026ED0, 0x08026ED0 + 1
	.set sub_8027BDC, 0x08027BDC + 1
	.set sub_80A487C, 0x080A487C + 1
	.section .text.sub_80A4F4C, "ax", %progbits
@ sub_80A4F4C @ JP 0x080A4F4C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A4F4C
	.thumb_func
sub_80A4F4C:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	mov r8, r0
	bl sub_80A487C
	adds r7, r0, #0
	movs r6, #0
	cmp r6, r7
	bge _080A4FA6
_080A4F62:
	adds r0, r6, #0
	movs r1, #3
	bl __divsi3
	lsls r0, r0, #4
	mov r2, r8
	ldr r1, [r2, #0x34]
	subs r1, #0x24
	subs r5, r0, r1
	adds r0, r6, #0
	movs r1, #3
	bl __modsi3
	lsls r0, r0, #6
	adds r4, r0, #0
	adds r4, #0x18
	adds r0, r5, #0
	subs r0, #0x24
	cmp r0, #0x52
	bhi _080A4FA0
	adds r0, r6, #0
	bl GetSupportScreenClassIdAt
	str r0, [sp]
	movs r0, #0
	adds r1, r4, #0
	adds r2, r5, #0
	movs r3, #0xc8
	lsls r3, r3, #8
	bl sub_8027BDC
_080A4FA0:
	adds r6, #1
	cmp r6, r7
	blt _080A4F62
_080A4FA6:
	bl sub_8026ED0
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

