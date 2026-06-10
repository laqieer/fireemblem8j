	.syntax unified
	.set NextRN_N, 0x08000C58 + 1
	.set sub_8012684, 0x08012684 + 1
	.set sub_80D6374, 0x080D6374 + 1
	.section .text.sub_800FAD0, "ax", %progbits
@ sub_800FAD0 @ JP 0x0800FAD0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_800FAD0
	.thumb_func
sub_800FAD0:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x54
	adds r6, r0, #0
	ldr r0, [sp, #0x74]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	mov r8, r1
	lsls r2, r2, #0x18
	lsrs r7, r2, #0x18
	lsls r3, r3, #0x18
	asrs r3, r3, #0x18
	str r3, [sp, #0x40]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	mov sl, r0
	movs r0, #0
	mov sb, r0
	movs r3, #0
	cmp r7, #0
	beq _0800FB46
	str r6, [sp, #0x48]
	cmp r3, r8
	bge _0800FB36
	movs r1, #0x40
	mov ip, r1
_0800FB0A:
	ldr r2, [sp, #0x48]
	ldrb r1, [r2, #5]
	mov r0, ip
	ands r0, r1
	cmp r0, #0
	beq _0800FB26
	mov r0, sp
	add r0, sb
	strb r3, [r0]
	mov r0, sb
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sb, r0
_0800FB26:
	ldr r4, [sp, #0x48]
	adds r4, #0x14
	str r4, [sp, #0x48]
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, r8
	blt _0800FB0A
_0800FB36:
	mov r0, sb
	muls r0, r7, r0
	adds r0, #0x32
	movs r1, #0x64
	bl sub_80D6374
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
_0800FB46:
	movs r5, #0
	str r5, [sp, #0x4c]
	str r5, [sp, #0x50]
	cmp r3, #0
	beq _0800FBAC
	movs r7, #1
_0800FB52:
	mov r0, sb
	str r3, [sp, #0x44]
	bl NextRN_N
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	mov r1, sp
	adds r0, r1, r2
	ldrb r2, [r0]
	ldr r3, [sp, #0x44]
	cmp r2, #0x1f
	bhi _0800FB74
	adds r0, r7, #0
	lsls r0, r2
	ldr r4, [sp, #0x4c]
	ands r0, r4
	b _0800FB80
_0800FB74:
	adds r1, r2, #0
	subs r1, #0x20
	adds r0, r7, #0
	lsls r0, r1
	ldr r5, [sp, #0x50]
	ands r0, r5
_0800FB80:
	cmp r0, #0
	bne _0800FBA8
	cmp r2, #0x1f
	bhi _0800FB94
	adds r0, r7, #0
	lsls r0, r2
	ldr r1, [sp, #0x4c]
	orrs r1, r0
	str r1, [sp, #0x4c]
	b _0800FBA2
_0800FB94:
	adds r1, r2, #0
	subs r1, #0x20
	adds r0, r7, #0
	lsls r0, r1
	ldr r2, [sp, #0x50]
	orrs r2, r0
	str r2, [sp, #0x50]
_0800FBA2:
	subs r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
_0800FBA8:
	cmp r3, #0
	bne _0800FB52
_0800FBAC:
	str r6, [sp, #0x48]
	ldr r6, _0800FBCC @ =0x0203EFB4
	movs r3, #0
	mov ip, r6
	cmp r3, r8
	bge _0800FC08
	movs r4, #0x41
	rsbs r4, r4, #0
	mov sb, r4
_0800FBBE:
	cmp r3, #0x1f
	bhi _0800FBD0
	movs r0, #1
	lsls r0, r3
	ldr r5, [sp, #0x4c]
	ands r0, r5
	b _0800FBDC
	.align 2, 0
_0800FBCC: .4byte 0x0203EFB4
_0800FBD0:
	adds r1, r3, #0
	subs r1, #0x20
	movs r0, #1
	lsls r0, r1
	ldr r1, [sp, #0x50]
	ands r0, r1
_0800FBDC:
	cmp r0, #0
	bne _0800FBFE
	lsls r0, r3, #2
	adds r0, r0, r3
	lsls r0, r0, #2
	adds r1, r6, #0
	ldr r2, [sp, #0x48]
	adds r0, r0, r2
	ldm r0!, {r2, r4, r5}
	stm r1!, {r2, r4, r5}
	ldm r0!, {r4, r5}
	stm r1!, {r4, r5}
	ldrb r1, [r6, #5]
	mov r0, sb
	ands r0, r1
	strb r0, [r6, #5]
	adds r6, #0x14
_0800FBFE:
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, r8
	blt _0800FBBE
_0800FC08:
	movs r3, #0
	cmp r3, r8
	bge _0800FC5C
	movs r0, #1
	mov sb, r0
_0800FC12:
	cmp r3, #0x1f
	bhi _0800FC24
	mov r0, sb
	lsls r0, r3
	ldr r1, [sp, #0x4c]
	ands r0, r1
	cmp r0, #0
	bne _0800FC34
	b _0800FC52
_0800FC24:
	adds r1, r3, #0
	subs r1, #0x20
	mov r0, sb
	lsls r0, r1
	ldr r2, [sp, #0x50]
	ands r0, r2
	cmp r0, #0
	beq _0800FC52
_0800FC34:
	lsls r0, r3, #2
	adds r0, r0, r3
	lsls r0, r0, #2
	adds r1, r6, #0
	ldr r4, [sp, #0x48]
	adds r0, r0, r4
	ldm r0!, {r2, r4, r5}
	stm r1!, {r2, r4, r5}
	ldm r0!, {r2, r5}
	stm r1!, {r2, r5}
	ldrb r0, [r6, #5]
	movs r1, #0x40
	orrs r0, r1
	strb r0, [r6, #5]
	adds r6, #0x14
_0800FC52:
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, r8
	blt _0800FC12
_0800FC5C:
	movs r0, #0
	strb r0, [r6]
	mov r4, sl
	cmp r4, #1
	bne _0800FC80
	mov r6, ip
	movs r3, #0
	cmp r3, r8
	bge _0800FC80
	movs r1, #0
_0800FC70:
	strb r1, [r6, #7]
	str r1, [r6, #8]
	adds r6, #0x14
	adds r0, r3, #1
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	cmp r3, r8
	blt _0800FC70
_0800FC80:
	mov r6, ip
	ldr r5, [sp, #0x40]
	cmp r5, #1
	bne _0800FC8E
	adds r0, r6, #0
	bl sub_8012684
_0800FC8E:
	adds r0, r6, #0
	add sp, #0x54
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

