	.syntax unified
	.set sub_80D6374, 0x080D6374 + 1
	.section .text.sub_807395C, "ax", %progbits
@ sub_807395C @ JP 0x0807395C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_807395C
	.thumb_func
sub_807395C:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	mov sb, r0
	adds r0, r1, r2
	cmp r1, r0
	bge _080739C2
	mov sl, r0
	movs r0, #0x1f
	mov r8, r0
_08073974:
	movs r5, #0
	lsls r6, r1, #5
	adds r7, r1, #1
_0807397A:
	mov r1, sb
	adds r4, r1, r6
	lsls r0, r5, #1
	adds r4, r4, r0
	ldrh r2, [r4]
	movs r0, #0x1f
	ands r0, r2
	lsls r2, r2, #0x10
	lsrs r3, r2, #0x15
	mov r1, r8
	ands r3, r1
	lsrs r2, r2, #0x1a
	ands r2, r1
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r0, r3, #1
	adds r0, r0, r3
	lsls r0, r0, #1
	adds r1, r1, r0
	adds r1, r1, r2
	adds r0, r1, #0
	movs r1, #0xa
	bl sub_80D6374
	adds r1, r0, #0
	lsls r0, r1, #5
	orrs r0, r1
	lsls r1, r1, #0xa
	orrs r0, r1
	strh r0, [r4]
	adds r5, #1
	cmp r5, #0xf
	ble _0807397A
	adds r1, r7, #0
	cmp r1, sl
	blt _08073974
_080739C2:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

