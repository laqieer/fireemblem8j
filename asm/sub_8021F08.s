	.syntax unified
	.set AdvanceGetLCGRNValue, 0x08000CC0 + 1
	.set sub_8000CD8, 0x08000CD8 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8021EC0, 0x08021EC0 + 1
	.section .text.sub_8021F08, "ax", %progbits
@ sub_8021F08 @ JP 0x08021F08 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8021F08
	.thumb_func
sub_8021F08:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r6, r0, #0
	bl sub_8000CD8
	movs r1, #3
	ands r1, r0
	cmp r1, #0
	bne _08021F24
	b _0802204E
_08021F24:
	movs r0, #0
	mov sb, r0
	adds r0, r6, #0
	adds r0, #0x4c
	movs r2, #0
	ldrsh r1, [r0, r2]
	mov r8, r0
	cmp r1, #0x28
	ble _08021F38
	b _0802204E
_08021F38:
	movs r3, #0x64
	adds r3, r3, r6
	mov sl, r3
	mov r7, sl
_08021F40:
	ldr r0, _08022004 @ =0x085C39B8
	adds r1, r6, #0
	bl sub_8002BCC
	adds r5, r0, #0
	bl AdvanceGetLCGRNValue
	ldr r1, [r6, #0x34]
	lsls r1, r1, #0x10
	ldr r4, _08022008 @ =0x0000FFFF
	ands r0, r4
	lsls r0, r0, #4
	adds r1, r1, r0
	str r1, [r5, #0x2c]
	bl AdvanceGetLCGRNValue
	ldr r1, [r6, #0x38]
	adds r1, #8
	lsls r1, r1, #0x10
	ands r0, r4
	lsls r0, r0, #3
	adds r1, r1, r0
	str r1, [r5, #0x30]
	adds r4, r5, #0
	adds r4, #0x2c
	adds r1, r5, #0
	adds r1, #0x30
	ldr r2, [r6, #0x3c]
	ldr r3, [r6, #0x40]
	movs r5, #0
	ldrsh r0, [r7, r5]
	movs r5, #0x80
	lsls r5, r5, #1
	cmp r0, r5
	ble _08021F8A
	movs r0, #0x80
	lsls r0, r0, #1
_08021F8A:
	str r0, [sp]
	adds r0, r4, #0
	bl sub_8021EC0
	mov r1, r8
	ldrh r0, [r1]
	adds r1, r0, #1
	mov r2, r8
	strh r1, [r2]
	movs r3, #1
	add sb, r3
	mov r4, sb
	cmp r4, #0
	bgt _08021FAE
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x28
	ble _08021F40
_08021FAE:
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x28
	bgt _0802204E
	ldr r0, _08022004 @ =0x085C39B8
	adds r1, r6, #0
	bl sub_8002BCC
	adds r5, r0, #0
	bl AdvanceGetLCGRNValue
	ldr r1, [r6, #0x34]
	subs r1, #8
	lsls r1, r1, #0x10
	ldr r4, _08022008 @ =0x0000FFFF
	ands r0, r4
	lsls r0, r0, #5
	adds r1, r1, r0
	str r1, [r5, #0x2c]
	bl AdvanceGetLCGRNValue
	ldr r1, [r6, #0x38]
	adds r1, #8
	lsls r1, r1, #0x10
	ands r0, r4
	lsls r0, r0, #3
	adds r1, r1, r0
	str r1, [r5, #0x30]
	adds r7, r5, #0
	adds r7, #0x2c
	adds r1, r5, #0
	adds r1, #0x30
	ldr r2, [r6, #0x3c]
	ldr r3, [r6, #0x40]
	mov r5, sl
	movs r4, #0
	ldrsh r0, [r5, r4]
	movs r4, #0x80
	lsls r4, r4, #1
	cmp r0, r4
	bgt _0802200C
	str r0, [sp]
	b _0802200E
	.align 2, 0
_08022004: .4byte 0x085C39B8
_08022008: .4byte 0x0000FFFF
_0802200C:
	str r4, [sp]
_0802200E:
	adds r0, r7, #0
	bl sub_8021EC0
	mov r5, r8
	ldrh r0, [r5]
	adds r0, #1
	strh r0, [r5]
	mov r1, sl
	ldrh r2, [r1]
	movs r3, #0
	ldrsh r0, [r1, r3]
	cmp r0, #0
	blt _0802202E
	adds r0, r2, #0
	adds r0, #8
	strh r0, [r1]
_0802202E:
	mov r4, sl
	movs r5, #0
	ldrsh r1, [r4, r5]
	movs r0, #0xa0
	lsls r0, r0, #1
	cmp r1, r0
	ble _0802204E
	adds r0, r6, #0
	bl sub_8002DE4
	movs r0, #0
	strh r0, [r4]
	adds r1, r6, #0
	adds r1, #0x66
	movs r0, #1
	strh r0, [r1]
_0802204E:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

