	.syntax unified
	.set sub_800BF3C, 0x0800BF3C + 1
	.set sub_800FE0C, 0x0800FE0C + 1
	.set sub_800FE54, 0x0800FE54 + 1
	.set sub_80194BC, 0x080194BC + 1
	.set sub_807C178, 0x0807C178 + 1
	.set sub_807C1DC, 0x0807C1DC + 1
	.set sub_807C40C, 0x0807C40C + 1
	.section .text.sub_800FF08, "ax", %progbits
@ sub_800FF08 @ JP 0x0800FF08 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_800FF08
	.thumb_func
sub_800FF08:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	mov r8, r0
	ldr r0, [r0, #0x38]
	ldrh r2, [r0]
	movs r4, #7
	ands r4, r2
	movs r1, #0xf
	ands r1, r2
	lsrs r1, r1, #3
	str r1, [sp, #4]
	movs r2, #2
	ldrsh r1, [r0, r2]
	str r1, [sp, #8]
	movs r1, #4
	ldrsh r0, [r0, r1]
	bl sub_800BF3C
	adds r7, r0, #0
	cmp r7, #0
	bne _0800FF3C
	b _08010070
_0800FF3C:
	movs r2, #0x10
	ldrsb r2, [r7, r2]
	mov sb, r2
	movs r0, #0x11
	ldrsb r0, [r7, r0]
	mov sl, r0
	ldr r1, [r7, #0xc]
	movs r0, #0x80
	lsls r0, r0, #0xf
	ands r0, r1
	cmp r0, #0
	bne _0800FF5E
	movs r0, #4
	ands r1, r0
	cmp r1, #0
	beq _0800FF5E
	b _08010070
_0800FF5E:
	cmp r4, #1
	beq _0800FF88
	cmp r4, #1
	bgt _0800FF6C
	cmp r4, #0
	beq _0800FF76
	b _0800FFEE
_0800FF6C:
	cmp r4, #2
	beq _0800FFAE
	cmp r4, #3
	beq _0800FFEA
	b _0800FFEE
_0800FF76:
	mov r2, r8
	ldr r1, [r2, #0x38]
	ldrh r0, [r1, #6]
	movs r6, #6
	ldrsb r6, [r1, r6]
	lsls r0, r0, #0x10
	asrs r5, r0, #0x18
	movs r0, #0
	b _0800FFEC
_0800FF88:
	mov r1, r8
	ldr r0, [r1, #0x38]
	movs r2, #6
	ldrsh r0, [r0, r2]
	cmp r0, #0
	bge _0800FF96
	movs r0, #0
_0800FF96:
	bl sub_800BF3C
	cmp r0, #0
	bne _0800FFA2
	movs r0, #6
	b _08010072
_0800FFA2:
	movs r6, #0x10
	ldrsb r6, [r0, r6]
	movs r5, #0x11
	ldrsb r5, [r0, r5]
	movs r0, #0
	b _0800FFEC
_0800FFAE:
	mov r1, r8
	ldr r0, [r1, #0x38]
	ldrh r0, [r0, #6]
	mov r6, sb
	mov r5, sl
	cmp r0, #1
	beq _0800FFDE
	cmp r0, #1
	bgt _0800FFC6
	cmp r0, #0
	beq _0800FFDA
	b _0800FFE4
_0800FFC6:
	cmp r0, #2
	beq _0800FFD2
	cmp r0, #3
	bne _0800FFE4
	subs r0, r5, #1
	b _0800FFD4
_0800FFD2:
	adds r0, r5, #1
_0800FFD4:
	lsls r0, r0, #0x18
	asrs r5, r0, #0x18
	b _0800FFE4
_0800FFDA:
	subs r0, r6, #1
	b _0800FFE0
_0800FFDE:
	adds r0, r6, #1
_0800FFE0:
	lsls r0, r0, #0x18
	asrs r6, r0, #0x18
_0800FFE4:
	movs r2, #0
	str r2, [sp, #0xc]
	b _0800FFEE
_0800FFEA:
	ldr r0, _08010028 @ =0x030004E8
_0800FFEC:
	str r0, [sp, #0xc]
_0800FFEE:
	mov r0, r8
	ldr r1, [sp, #4]
	bl sub_800FE54
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	ldr r0, _0801002C @ =0x0202E4EC
	ldr r0, [r0]
	movs r1, #0
	bl sub_80194BC
	mov r1, r8
	ldrh r0, [r1, #0x3c]
	lsrs r0, r0, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _08010018
	ldr r2, [sp, #8]
	cmp r2, #0
	bge _08010030
_08010018:
	adds r0, r7, #0
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl sub_807C40C
	b _08010070
	.align 2, 0
_08010028: .4byte 0x030004E8
_0801002C: .4byte 0x0202E4EC
_08010030:
	mov r0, r8
	mov r1, sb
	mov r2, sl
	bl sub_800FE0C
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08010044
	movs r0, #3
	b _08010072
_08010044:
	ldr r0, [sp, #0xc]
	cmp r0, #0
	bne _0801005E
	ldr r1, [sp, #8]
	lsls r3, r1, #0x18
	lsrs r3, r3, #0x18
	str r4, [sp]
	adds r0, r7, #0
	adds r1, r6, #0
	adds r2, r5, #0
	bl sub_807C1DC
	b _08010070
_0801005E:
	ldr r0, _08010084 @ =0x030004B0
	ldr r2, [r0, #0x34]
	lsls r2, r2, #0xf
	asrs r2, r2, #0x10
	adds r0, r7, #0
	ldr r1, [sp, #0xc]
	adds r3, r4, #0
	bl sub_807C178
_08010070:
	movs r0, #0
_08010072:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_08010084: .4byte 0x030004B0

