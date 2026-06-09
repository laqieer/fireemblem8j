	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_801ED1C, "ax", %progbits
@ sub_801ED1C @ JP 0x0801ED1C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_801ED1C
	.thumb_func
sub_801ED1C:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov sl, r0
	movs r6, #9
	movs r0, #0x4c
	add r0, sl
	mov r8, r0
	ldr r1, _0801EDE8 @ =0x020234A8
	mov ip, r1
_0801ED36:
	movs r2, #0xe
	str r2, [sp]
	lsls r0, r6, #1
	lsls r2, r6, #6
	subs r3, r6, #1
	mov sb, r3
	adds r0, #1
	lsls r1, r0, #5
	adds r1, #0x1d
	lsls r0, r0, #6
	add r0, ip
	adds r5, r0, #0
	adds r5, #0x38
	adds r2, #0x1d
	lsls r0, r6, #7
	add r0, ip
	adds r4, r0, #0
	adds r4, #0x38
	lsls r2, r2, #1
	add r2, ip
	lsls r1, r1, #1
	add r1, ip
_0801ED62:
	mov r7, r8
	movs r3, #0
	ldrsh r0, [r7, r3]
	ldr r7, [sp]
	subs r0, r7, r0
	adds r0, #0x15
	subs r3, r0, r6
	cmp r3, #0x10
	ble _0801ED76
	movs r3, #0x10
_0801ED76:
	cmp r3, #0
	bge _0801ED7C
	movs r3, #0
_0801ED7C:
	movs r0, #0xfe
	ands r3, r0
	ldr r7, _0801EDEC @ =0x00005501
	adds r0, r7, #0
	adds r0, r3, r0
	strh r0, [r4]
	subs r7, #1
	adds r0, r7, #0
	adds r0, r3, r0
	strh r0, [r2]
	adds r7, #0x21
	adds r0, r3, r7
	strh r0, [r5]
	subs r7, #1
	adds r0, r3, r7
	strh r0, [r1]
	subs r1, #4
	subs r5, #4
	subs r2, #4
	subs r4, #4
	ldr r0, [sp]
	subs r0, #1
	str r0, [sp]
	cmp r0, #0
	bge _0801ED62
	mov r6, sb
	cmp r6, #0
	bge _0801ED36
	mov r1, r8
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	movs r0, #2
	bl BG_EnableSyncByMask
	mov r2, r8
	movs r3, #0
	ldrsh r0, [r2, r3]
	cmp r0, #0x24
	bne _0801EDD6
	movs r0, #0
	strh r0, [r2]
	mov r0, sl
	bl sub_8002DE4
_0801EDD6:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801EDE8: .4byte 0x020234A8
_0801EDEC: .4byte 0x00005501

