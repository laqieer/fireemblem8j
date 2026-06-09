	.syntax unified
	.set __muldi3, 0x080D6760 + 1
	.set __pack_f, 0x080DB73C + 1
	.set __unpack_f, 0x080DB7F4 + 1
	.section .text.sub_80DBA4C, "ax", %progbits
@ sub_80DBA4C @ JP 0x080DBA4C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80DBA4C
	.thumb_func
sub_80DBA4C:
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0x38
	str r0, [sp, #0x30]
	str r1, [sp, #0x34]
	add r0, sp, #0x30
	mov r1, sp
	bl __unpack_f
	add r0, sp, #0x34
	add r4, sp, #0x10
	adds r1, r4, #0
	bl __unpack_f
	mov r7, sp
	add r0, sp, #0x20
	mov r8, r0
	movs r0, #0
	ldr r1, [sp]
	mov sb, r8
	cmp r1, #1
	bhi _080DBA7E
	movs r0, #1
_080DBA7E:
	cmp r0, #0
	bne _080DBADC
	movs r2, #0
	ldr r0, [sp, #0x10]
	cmp r0, #1
	bhi _080DBA8C
	movs r2, #1
_080DBA8C:
	cmp r2, #0
	beq _080DBA94
	ldr r0, [sp, #4]
	b _080DBAFC
_080DBA94:
	movs r2, #0
	cmp r1, #4
	bne _080DBA9C
	movs r2, #1
_080DBA9C:
	cmp r2, #0
	beq _080DBAAE
	movs r1, #0
	cmp r0, #2
	bne _080DBAA8
	movs r1, #1
_080DBAA8:
	cmp r1, #0
	bne _080DBAC6
	b _080DBADC
_080DBAAE:
	movs r2, #0
	cmp r0, #4
	bne _080DBAB6
	movs r2, #1
_080DBAB6:
	cmp r2, #0
	beq _080DBAD0
	movs r0, #0
	cmp r1, #2
	bne _080DBAC2
	movs r0, #1
_080DBAC2:
	cmp r0, #0
	beq _080DBAFA
_080DBAC6:
	ldr r0, _080DBACC @ =0x03002BF8
	b _080DBB9E
	.align 2, 0
_080DBACC: .4byte 0x03002BF8
_080DBAD0:
	movs r2, #0
	cmp r1, #2
	bne _080DBAD8
	movs r2, #1
_080DBAD8:
	cmp r2, #0
	beq _080DBAEE
_080DBADC:
	ldr r0, [sp, #4]
	ldr r1, [sp, #0x14]
	eors r0, r1
	rsbs r1, r0, #0
	orrs r1, r0
	lsrs r1, r1, #0x1f
	str r1, [sp, #4]
	mov r0, sp
	b _080DBB9E
_080DBAEE:
	movs r1, #0
	cmp r0, #2
	bne _080DBAF6
	movs r1, #1
_080DBAF6:
	cmp r1, #0
	beq _080DBB0C
_080DBAFA:
	ldr r0, [r7, #4]
_080DBAFC:
	ldr r1, [sp, #0x14]
	eors r0, r1
	rsbs r1, r0, #0
	orrs r1, r0
	lsrs r1, r1, #0x1f
	str r1, [sp, #0x14]
	adds r0, r4, #0
	b _080DBB9E
_080DBB0C:
	ldr r0, [r7, #0xc]
	movs r1, #0
	ldr r2, [sp, #0x1c]
	movs r3, #0
	bl __muldi3
	adds r2, r1, #0
	adds r5, r2, #0
	adds r6, r0, #0
	ldr r4, [r7, #8]
	ldr r0, [sp, #0x18]
	adds r4, r4, r0
	str r4, [sp, #0x28]
	ldr r1, [r7, #4]
	ldr r0, [sp, #0x14]
	eors r1, r0
	rsbs r0, r1, #0
	orrs r0, r1
	lsrs r0, r0, #0x1f
	str r0, [sp, #0x24]
	adds r4, #2
	str r4, [sp, #0x28]
	cmp r2, #0
	bge _080DBB58
	movs r2, #1
	movs r1, #0x80
	lsls r1, r1, #0x18
_080DBB42:
	adds r4, #1
	adds r0, r5, #0
	ands r0, r2
	cmp r0, #0
	beq _080DBB50
	lsrs r6, r6, #1
	orrs r6, r1
_080DBB50:
	lsrs r5, r5, #1
	cmp r5, #0
	blt _080DBB42
	str r4, [sp, #0x28]
_080DBB58:
	ldr r0, _080DBBAC @ =0x3FFFFFFF
	cmp r5, r0
	bhi _080DBB7E
	movs r4, #0x80
	lsls r4, r4, #0x18
	movs r3, #1
	adds r2, r0, #0
	ldr r1, [sp, #0x28]
_080DBB68:
	subs r1, #1
	lsls r5, r5, #1
	adds r0, r6, #0
	ands r0, r4
	cmp r0, #0
	beq _080DBB76
	orrs r5, r3
_080DBB76:
	lsls r6, r6, #1
	cmp r5, r2
	bls _080DBB68
	str r1, [sp, #0x28]
_080DBB7E:
	movs r0, #0x7f
	ands r0, r5
	cmp r0, #0x40
	bne _080DBB94
	movs r0, #0x80
	ands r0, r5
	cmp r0, #0
	bne _080DBB92
	cmp r6, #0
	beq _080DBB94
_080DBB92:
	adds r5, #0x40
_080DBB94:
	str r5, [sp, #0x2c]
	movs r0, #3
	mov r1, r8
	str r0, [r1]
	mov r0, sb
_080DBB9E:
	bl __pack_f
	add sp, #0x38
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_080DBBAC: .4byte 0x3FFFFFFF

