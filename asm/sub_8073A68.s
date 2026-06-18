	.syntax unified
	.set sub_80D6374, 0x080D6374 + 1
	.section .text.sub_8073A68, "ax", %progbits
@ EfxCalcSplitedColorStep @ JP 0x08073A68 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global EfxCalcSplitedColorStep
	.thumb_func
EfxCalcSplitedColorStep:
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r6, r0, #0
	adds r5, r1, #0
	adds r4, r2, #0
	mov r8, r3
	ldr r0, [sp, #0x1c]
	mov sb, r0
	movs r7, #0
	cmp r7, r8
	bhs _08073ADC
_08073A82:
	movs r0, #0
	ldrsb r0, [r5, r0]
	movs r1, #0
	ldrsb r1, [r6, r1]
	subs r0, r0, r1
	adds r6, #1
	adds r5, #1
	lsls r0, r0, #0x18
	asrs r0, r0, #0x10
	mov r1, sb
	bl sub_80D6374
	strh r0, [r4]
	adds r4, #2
	movs r0, #0
	ldrsb r0, [r5, r0]
	movs r1, #0
	ldrsb r1, [r6, r1]
	subs r0, r0, r1
	adds r6, #1
	adds r5, #1
	lsls r0, r0, #0x18
	asrs r0, r0, #0x10
	mov r1, sb
	bl sub_80D6374
	strh r0, [r4]
	adds r4, #2
	movs r0, #0
	ldrsb r0, [r5, r0]
	movs r1, #0
	ldrsb r1, [r6, r1]
	subs r0, r0, r1
	adds r6, #1
	adds r5, #1
	lsls r0, r0, #0x18
	asrs r0, r0, #0x10
	mov r1, sb
	bl sub_80D6374
	strh r0, [r4]
	adds r4, #2
	adds r7, #1
	cmp r7, r8
	blo _08073A82
_08073ADC:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

