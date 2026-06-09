	.syntax unified
	.set sub_8001BC0, 0x08001BC0 + 1
	.set sub_80D6370, 0x080D6370 + 1
	.section .text.sub_80C0B0C, "ax", %progbits
@ sub_80C0B0C @ JP 0x080C0B0C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C0B0C
	.thumb_func
sub_80C0B0C:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r5, r0, #0
	adds r4, r1, #0
	cmp r4, #0x12
	bgt _080C0B2A
	adds r0, r4, #0
	adds r0, #0x15
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	b _080C0B2C
_080C0B2A:
	movs r0, #0x28
_080C0B2C:
	mov sb, r0
	movs r0, #0x1f
	adds r7, r5, #0
	ands r7, r0
	movs r0, #0x20
	subs r0, r0, r7
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	adds r0, r2, #0
	bl sub_8001BC0
	mov sl, r0
	lsls r0, r4, #4
	subs r0, r0, r4
	lsls r0, r0, #2
	adds r0, r0, r5
	lsls r0, r0, #1
	ldr r1, _080C0B88 @ =0x02019D00
	adds r6, r0, r1
	mov r1, r8
	cmp r1, #0x1e
	bls _080C0B8C
	lsls r0, r4, #0x10
	lsrs r5, r0, #0x10
	cmp r5, sb
	bhs _080C0BD2
_080C0B62:
	movs r0, #0x1f
	ands r0, r5
	lsls r0, r0, #5
	adds r0, r0, r7
	lsls r0, r0, #1
	mov r3, sl
	adds r4, r3, r0
	adds r0, r6, #0
	adds r1, r4, #0
	movs r2, #0x1f
	bl sub_80D6370
	adds r6, #0x78
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, sb
	blo _080C0B62
	b _080C0BD2
	.align 2, 0
_080C0B88: .4byte 0x02019D00
_080C0B8C:
	lsls r0, r4, #0x10
	lsrs r5, r0, #0x10
	cmp r5, sb
	bhs _080C0BD2
	mov r1, r8
	movs r0, #0x1f
	subs r1, r0, r1
	str r1, [sp]
_080C0B9C:
	adds r0, r5, #0
	movs r3, #0x1f
	ands r0, r3
	lsls r0, r0, #6
	mov r1, sl
	adds r4, r1, r0
	lsls r1, r7, #1
	adds r1, r4, r1
	adds r0, r6, #0
	mov r2, r8
	bl sub_80D6370
	mov r3, r8
	lsls r0, r3, #1
	adds r0, r6, r0
	adds r1, r4, #0
	ldr r2, [sp]
	ldr r3, _080C0BE4 @ =0x001FFFFF
	ands r2, r3
	bl sub_80D6370
	adds r6, #0x78
	adds r0, r5, #1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, sb
	blo _080C0B9C
_080C0BD2:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C0BE4: .4byte 0x001FFFFF

