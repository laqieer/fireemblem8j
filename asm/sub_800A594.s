	.syntax unified
	.set sub_800A34C, 0x0800A34C + 1
	.set sub_80D6384, 0x080D6384 + 1
	.section .text.sub_800A594, "ax", %progbits
@ sub_800A594 @ JP 0x0800A594 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_800A594
	.thumb_func
sub_800A594:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x3c
	adds r7, r0, #0
	str r1, [sp, #0x2c]
	str r2, [sp, #0x30]
	str r3, [sp, #0x34]
	ldr r0, [sp, #0x5c]
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800A6A8
	lsls r4, r1, #3
	adds r0, r4, r7
	subs r0, #8
	ldrh r0, [r0, #4]
	lsls r0, r0, #0xc
	adds r1, r2, #0
	bl sub_80D6384
	str r0, [sp, #0x30]
	lsrs r3, r0, #0xc
	movs r0, #0
	mov sb, r0
	ldr r2, [sp, #0x2c]
	subs r2, #2
	add r1, sp, #0x1c
	mov r8, r1
	add r6, sp, #8
	mov ip, r6
	mov r0, sp
	adds r0, #0x24
	str r0, [sp, #0x38]
	cmp sb, r2
	bge _0800A604
	ldrh r1, [r7, #4]
	cmp r3, r1
	blo _0800A5EA
	ldrh r6, [r7, #0xc]
	cmp r3, r6
	blo _0800A604
_0800A5EA:
	movs r0, #1
	add sb, r0
	cmp sb, r2
	bge _0800A604
	mov r1, sb
	lsls r0, r1, #3
	adds r0, r0, r7
	ldrh r6, [r0, #4]
	cmp r3, r6
	blo _0800A5EA
	ldrh r0, [r0, #0xc]
	cmp r3, r0
	bhs _0800A5EA
_0800A604:
	mov r0, sb
	cmp r0, #0
	bne _0800A678
	adds r0, r4, r7
	adds r1, r0, #0
	subs r1, #8
	ldrh r1, [r1, #4]
	subs r0, #0x10
	ldrh r0, [r0, #4]
	subs r1, r1, r0
	mov sl, r1
	lsls r0, r2, #3
	adds r0, r0, r7
	movs r2, #0
	ldrsh r1, [r0, r2]
	str r1, [sp, #4]
	movs r6, #2
	ldrsh r0, [r0, r6]
	str r0, [sp, #8]
	mov r1, sb
	mov r0, r8
	strh r1, [r0]
	movs r6, #0
	mov r4, r8
	adds r4, #2
	mov r1, ip
	adds r1, #8
	add r5, sp, #0xc
	adds r3, r7, #0
	ldr r2, [sp, #0x2c]
	subs r2, #1
	mov ip, r2
	movs r2, #1
_0800A646:
	movs r7, #0
	ldrsh r0, [r3, r7]
	str r0, [r5]
	movs r7, #2
	ldrsh r0, [r3, r7]
	str r0, [r1]
	ldrh r0, [r3, #4]
	add r0, sl
	strh r0, [r4]
	cmp r6, ip
	bge _0800A660
	adds r3, #8
	adds r6, #1
_0800A660:
	adds r4, #2
	adds r1, #8
	adds r5, #8
	subs r2, #1
	cmp r2, #0
	bge _0800A646
	mov r1, sl
	lsls r0, r1, #0xc
	ldr r2, [sp, #0x30]
	adds r2, r2, r0
	str r2, [sp, #0x30]
	b _0800A758
_0800A678:
	mov r6, sb
	subs r6, #1
	mov r5, r8
	mov r4, ip
	add r3, sp, #4
	lsls r0, r6, #3
	adds r1, r0, r7
	movs r2, #2
_0800A688:
	movs r6, #0
	ldrsh r0, [r1, r6]
	str r0, [r3]
	movs r7, #2
	ldrsh r0, [r1, r7]
	str r0, [r4]
	ldrh r0, [r1, #4]
	strh r0, [r5]
	adds r1, #8
	adds r5, #2
	adds r4, #8
	adds r3, #8
	subs r2, #1
	cmp r2, #0
	bge _0800A688
	b _0800A758
_0800A6A8:
	ldr r0, [sp, #0x30]
	lsrs r3, r0, #0xc
	movs r1, #0
	mov sb, r1
	add r2, sp, #0x1c
	mov r8, r2
	add r6, sp, #8
	mov ip, r6
	ldr r0, [sp, #0x2c]
	subs r0, #1
	mov sl, r0
	mov r1, sp
	adds r1, #0x24
	str r1, [sp, #0x38]
	cmp sb, sl
	bge _0800A6EE
	ldrh r2, [r7, #4]
	cmp r3, r2
	blo _0800A6D4
	ldrh r6, [r7, #0xc]
	cmp r3, r6
	blo _0800A6EE
_0800A6D4:
	movs r0, #1
	add sb, r0
	cmp sb, sl
	bge _0800A6EE
	mov r1, sb
	lsls r0, r1, #3
	adds r0, r0, r7
	ldrh r2, [r0, #4]
	cmp r3, r2
	blo _0800A6D4
	ldrh r0, [r0, #0xc]
	cmp r3, r0
	bhs _0800A6D4
_0800A6EE:
	mov r6, sb
	cmp r6, #0
	bne _0800A724
	movs r2, #0
	mov r5, r8
	mov r4, ip
	add r1, sp, #4
	adds r3, r7, #0
	mov r6, sl
_0800A700:
	movs r7, #0
	ldrsh r0, [r3, r7]
	str r0, [r1]
	movs r7, #2
	ldrsh r0, [r3, r7]
	str r0, [r4]
	ldrh r0, [r3, #4]
	strh r0, [r5]
	cmp r2, r6
	bge _0800A716
	adds r3, #8
_0800A716:
	adds r5, #2
	adds r4, #8
	adds r1, #8
	adds r2, #1
	cmp r2, #2
	ble _0800A700
	b _0800A758
_0800A724:
	mov r6, sb
	subs r6, #1
	mov r4, r8
	mov r1, ip
	add r5, sp, #4
	lsls r0, r6, #3
	adds r3, r0, r7
	movs r2, #2
_0800A734:
	movs r7, #0
	ldrsh r0, [r3, r7]
	str r0, [r5]
	movs r7, #2
	ldrsh r0, [r3, r7]
	str r0, [r1]
	ldrh r0, [r3, #4]
	strh r0, [r4]
	cmp r6, sl
	bge _0800A74C
	adds r3, #8
	adds r6, #1
_0800A74C:
	adds r4, #2
	adds r1, #8
	adds r5, #8
	subs r2, #1
	cmp r2, #0
	bge _0800A734
_0800A758:
	movs r0, #3
	str r0, [sp]
	add r0, sp, #4
	ldr r1, [sp, #0x38]
	mov r2, r8
	ldr r3, [sp, #0x30]
	bl sub_800A34C
	ldr r0, [sp, #0x24]
	ldr r1, [sp, #0x34]
	strh r0, [r1]
	ldr r2, [sp, #0x38]
	ldr r0, [r2, #4]
	strh r0, [r1, #2]
	mov r0, sb
	add sp, #0x3c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

