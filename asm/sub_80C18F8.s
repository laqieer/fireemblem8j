	.syntax unified
	.set GmIsNodeInList, 0x080C18D0 + 1
	.section .text.sub_80C18F8, "ax", %progbits
@ GmFindPathRecursive @ JP 0x080C18F8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global GmFindPathRecursive
	.thumb_func
GmFindPathRecursive:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	adds r6, r0, #0
	str r1, [sp, #8]
	ldr r0, [sp, #0x38]
	ldr r7, [sp, #0x3c]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	str r2, [sp, #0xc]
	lsls r3, r3, #0x18
	asrs r3, r3, #0x18
	str r3, [sp, #0x10]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	mov sl, r0
	ldr r0, [r6, #0x20]
	cmp r7, r0
	bge _080C19C2
	lsls r0, r3, #3
	adds r1, r1, r0
	mov sb, r1
	movs r0, #0
	mov r8, r0
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r8, r0
	bge _080C19C2
	adds r0, r6, #0
	adds r0, #0x10
	adds r0, r0, r7
	str r0, [sp, #0x14]
	mov r4, sb
	adds r4, #1
_080C1942:
	movs r0, #0
	ldrsb r0, [r4, r0]
	ldr r1, [sp, #0xc]
	cmp r0, r1
	beq _080C19B2
	movs r5, #0
	cmp r0, sl
	bne _080C1954
	movs r5, #1
_080C1954:
	cmp r5, #0
	bne _080C1968
	movs r1, #0
	ldrsb r1, [r4, r1]
	ldr r0, _080C1998 @ =0x0201B100
	bl GmIsNodeInList
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080C19B2
_080C1968:
	ldrb r0, [r4]
	ldr r1, [sp, #0x14]
	strb r0, [r1]
	adds r1, r6, #0
	adds r1, #0x10
	cmp r5, #0
	beq _080C199C
	ldr r0, [r6, #0x20]
	cmp r7, r0
	bge _080C1994
	movs r2, #1
	cmp r2, r7
	bgt _080C1992
	adds r3, r1, #0
_080C1984:
	adds r0, r6, r2
	adds r1, r3, r2
	ldrb r1, [r1]
	strb r1, [r0]
	adds r2, #1
	cmp r2, r7
	ble _080C1984
_080C1992:
	str r7, [r6, #0x20]
_080C1994:
	movs r0, #1
	b _080C19C4
	.align 2, 0
_080C1998: .4byte 0x0201B100
_080C199C:
	movs r3, #0
	ldrsb r3, [r4, r3]
	mov r0, sl
	str r0, [sp]
	adds r0, r7, #1
	str r0, [sp, #4]
	adds r0, r6, #0
	ldr r1, [sp, #8]
	ldr r2, [sp, #0x10]
	bl GmFindPathRecursive
_080C19B2:
	adds r4, #1
	movs r1, #1
	add r8, r1
	mov r1, sb
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r8, r0
	blt _080C1942
_080C19C2:
	movs r0, #0
_080C19C4:
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

