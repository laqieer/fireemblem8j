	.syntax unified
	.set GenerateExtendedMovementMap, 0x0801A138 + 1
	.set sub_8019174, 0x08019174 + 1
	.set sub_801A0D4, 0x0801A0D4 + 1
	.section .text.sub_802EC08, "ax", %progbits
@ sub_802EC08 @ JP 0x0802EC08 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_802EC08
	.thumb_func
sub_802EC08:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r7, r0, #0
	str r1, [sp]
	mov sb, r2
	mov sl, r3
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [r2]
	str r0, [r3]
	ldr r0, _0802ECCC @ =0x0000270F
	str r0, [sp, #4]
	adds r0, r7, #0
	bl sub_801A0D4
	movs r0, #0x11
	ldrsb r0, [r7, r0]
	ldr r1, _0802ECD0 @ =0x0202E4D4
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0x10
	ldrsb r1, [r7, r1]
	ldr r0, [r0]
	adds r0, r0, r1
	movs r1, #0xff
	strb r1, [r0]
	ldr r0, _0802ECD4 @ =0x0202E4D0
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r5, r0, #1
	cmp r5, #0
	blt _0802ED04
_0802EC52:
	ldr r0, _0802ECD4 @ =0x0202E4D0
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r4, r0, #1
	subs r0, r5, #1
	mov r8, r0
	cmp r4, #0
	blt _0802ECFE
	lsls r6, r5, #2
_0802EC64:
	ldr r0, _0802ECD8 @ =0x0202E4DC
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0802ECF8
	ldr r0, _0802ECD0 @ =0x0202E4D4
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0
	bne _0802ECF8
	ldr r0, _0802ECDC @ =0x0202E4E8
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _0802ECF8
	ldr r0, _0802ECE0 @ =0x0202E4D8
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r1, [r0]
	ldr r0, [sp]
	bl sub_8019174
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0802ECF8
	movs r0, #0x10
	ldrsb r0, [r7, r0]
	subs r2, r4, r0
	cmp r2, #0
	bge _0802ECBC
	subs r2, r0, r4
_0802ECBC:
	movs r0, #0x11
	ldrsb r0, [r7, r0]
	subs r1, r5, r0
	cmp r1, #0
	blt _0802ECE4
	adds r0, r2, r1
	b _0802ECE8
	.align 2, 0
_0802ECCC: .4byte 0x0000270F
_0802ECD0: .4byte 0x0202E4D4
_0802ECD4: .4byte 0x0202E4D0
_0802ECD8: .4byte 0x0202E4DC
_0802ECDC: .4byte 0x0202E4E8
_0802ECE0: .4byte 0x0202E4D8
_0802ECE4:
	subs r0, r0, r5
	adds r0, r2, r0
_0802ECE8:
	ldr r1, [sp, #4]
	cmp r1, r0
	blt _0802ECF8
	str r0, [sp, #4]
	mov r0, sb
	str r4, [r0]
	mov r1, sl
	str r5, [r1]
_0802ECF8:
	subs r4, #1
	cmp r4, #0
	bge _0802EC64
_0802ECFE:
	mov r5, r8
	cmp r5, #0
	bge _0802EC52
_0802ED04:
	mov r1, sb
	ldr r0, [r1]
	cmp r0, #0
	blt _0802ED14
	mov r1, sl
	ldr r0, [r1]
	cmp r0, #0
	bge _0802EE02
_0802ED14:
	ldr r0, _0802EE14 @ =0x0000270F
	str r0, [sp, #4]
	movs r0, #0x10
	ldrsb r0, [r7, r0]
	movs r1, #0x11
	ldrsb r1, [r7, r1]
	ldr r2, _0802EE18 @ =0x088600EE
	bl GenerateExtendedMovementMap
	movs r0, #0x11
	ldrsb r0, [r7, r0]
	ldr r1, _0802EE1C @ =0x0202E4D4
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0x10
	ldrsb r1, [r7, r1]
	ldr r0, [r0]
	adds r0, r0, r1
	movs r1, #0xff
	strb r1, [r0]
	ldr r0, _0802EE20 @ =0x0202E4D0
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r5, r0, #1
	cmp r5, #0
	blt _0802EDDE
_0802ED4A:
	ldr r0, _0802EE20 @ =0x0202E4D0
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r4, r0, #1
	subs r0, r5, #1
	mov r8, r0
	cmp r4, #0
	blt _0802EDD8
	lsls r6, r5, #2
_0802ED5C:
	ldr r0, _0802EE24 @ =0x0202E4DC
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0802EDD2
	ldr r0, _0802EE1C @ =0x0202E4D4
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0
	bne _0802EDD2
	ldr r0, _0802EE28 @ =0x0202E4E8
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _0802EDD2
	ldr r0, _0802EE2C @ =0x0202E4D8
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r1, [r0]
	ldr r0, [sp]
	bl sub_8019174
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0802EDD2
	movs r0, #0x10
	ldrsb r0, [r7, r0]
	subs r2, r4, r0
	cmp r2, #0
	bge _0802EDB4
	subs r2, r0, r4
_0802EDB4:
	movs r1, #0x11
	ldrsb r1, [r7, r1]
	subs r0, r5, r1
	cmp r0, #0
	bge _0802EDC0
	subs r0, r1, r5
_0802EDC0:
	adds r0, r2, r0
	ldr r1, [sp, #4]
	cmp r1, r0
	blt _0802EDD2
	str r0, [sp, #4]
	mov r0, sb
	str r4, [r0]
	mov r1, sl
	str r5, [r1]
_0802EDD2:
	subs r4, #1
	cmp r4, #0
	bge _0802ED5C
_0802EDD8:
	mov r5, r8
	cmp r5, #0
	bge _0802ED4A
_0802EDDE:
	mov r1, sb
	ldr r0, [r1]
	cmp r0, #0
	blt _0802EDEE
	mov r1, sl
	ldr r0, [r1]
	cmp r0, #0
	bge _0802EE02
_0802EDEE:
	ldr r1, [sp]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	mov r1, sb
	str r0, [r1]
	ldr r1, [sp]
	movs r0, #0x11
	ldrsb r0, [r1, r0]
	mov r1, sl
	str r0, [r1]
_0802EE02:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802EE14: .4byte 0x0000270F
_0802EE18: .4byte 0x088600EE
_0802EE1C: .4byte 0x0202E4D4
_0802EE20: .4byte 0x0202E4D0
_0802EE24: .4byte 0x0202E4DC
_0802EE28: .4byte 0x0202E4E8
_0802EE2C: .4byte 0x0202E4D8

