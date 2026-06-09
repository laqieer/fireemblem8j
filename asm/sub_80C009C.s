	.syntax unified
	.set sub_80D6378, 0x080D6378 + 1
	.section .text.sub_80C009C, "ax", %progbits
@ sub_80C009C @ JP 0x080C009C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C009C
	.thumb_func
sub_80C009C:
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r4, r2, #0
	adds r5, r3, #0
	cmp r0, #0
	blt _080C00E0
	ldr r2, _080C00DC @ =0x020228A8
	lsls r0, r0, #4
	movs r3, #0x80
	lsls r3, r3, #1
	adds r1, r1, r3
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r1, [r0]
	movs r3, #0x1f
	ands r3, r1
	movs r0, #0xf8
	lsls r0, r0, #2
	ands r0, r1
	lsrs r0, r0, #5
	mov r8, r0
	movs r0, #0xf8
	lsls r0, r0, #7
	ands r1, r0
	lsrs r1, r1, #0xa
	mov sb, r1
	b _080C00E8
	.align 2, 0
_080C00DC: .4byte 0x020228A8
_080C00E0:
	movs r0, #0
	mov sb, r0
	mov r8, r0
	movs r3, #0
_080C00E8:
	cmp r4, #0
	blt _080C0118
	ldr r2, _080C0114 @ =0x020228A8
	lsls r0, r4, #4
	movs r4, #0x80
	lsls r4, r4, #1
	adds r1, r5, r4
	adds r0, r0, r1
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r1, [r0]
	movs r2, #0x1f
	ands r2, r1
	movs r0, #0xf8
	lsls r0, r0, #2
	ands r0, r1
	lsrs r4, r0, #5
	movs r0, #0xf8
	lsls r0, r0, #7
	ands r1, r0
	lsrs r7, r1, #0xa
	b _080C011E
	.align 2, 0
_080C0114: .4byte 0x020228A8
_080C0118:
	movs r7, #0
	movs r4, #0
	movs r2, #0
_080C011E:
	movs r5, #0x80
	lsls r5, r5, #5
	subs r0, r2, r3
	ldr r2, [sp, #0x20]
	adds r1, r0, #0
	muls r1, r2, r1
	adds r0, r5, #0
	str r3, [sp]
	bl sub_80D6378
	adds r6, r0, #0
	ldr r3, [sp]
	adds r6, r3, r6
	mov r3, r8
	subs r0, r4, r3
	ldr r4, [sp, #0x20]
	adds r1, r0, #0
	muls r1, r4, r1
	adds r0, r5, #0
	bl sub_80D6378
	adds r4, r0, #0
	add r4, r8
	mov r1, sb
	subs r0, r7, r1
	ldr r2, [sp, #0x20]
	adds r1, r0, #0
	muls r1, r2, r1
	adds r0, r5, #0
	bl sub_80D6378
	add r0, sb
	lsls r0, r0, #0xa
	lsls r4, r4, #5
	adds r0, r0, r4
	adds r0, r0, r6
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

