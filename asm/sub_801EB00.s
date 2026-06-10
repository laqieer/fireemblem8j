	.syntax unified
	.set PutSpriteExt, 0x08005330 + 1
	.set sub_8002100, 0x08002100 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8012E84, 0x08012E84 + 1
	.set sub_80D6374, 0x080D6374 + 1
	.section .text.sub_801EB00, "ax", %progbits
@ sub_801EB00 @ JP 0x0801EB00 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_801EB00
	.thumb_func
sub_801EB00:
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r6, r0, #0
	movs r0, #0x4e
	adds r0, r0, r6
	mov r8, r0
	movs r1, #0
	ldrsh r5, [r0, r1]
	cmp r5, #1
	beq _0801EB5A
	cmp r5, #1
	bgt _0801EB24
	cmp r5, #0
	beq _0801EB2A
	b _0801EBB0
_0801EB24:
	cmp r5, #2
	beq _0801EB80
	b _0801EBB0
_0801EB2A:
	movs r2, #0x80
	lsls r2, r2, #1
	adds r4, r6, #0
	adds r4, #0x4c
	movs r0, #0
	ldrsh r3, [r4, r0]
	movs r0, #0xf
	str r0, [sp]
	movs r0, #4
	movs r1, #0x10
	bl sub_8012E84
	adds r7, r0, #0
	ldrh r1, [r4]
	movs r2, #0
	ldrsh r0, [r4, r2]
	cmp r0, #0xe
	ble _0801EBA4
	strh r5, [r4]
	mov r3, r8
	ldrh r0, [r3]
	adds r0, #1
	strh r0, [r3]
	b _0801EBB0
_0801EB5A:
	movs r7, #0x80
	lsls r7, r7, #1
	adds r1, r6, #0
	adds r1, #0x4c
	ldrh r2, [r1]
	movs r3, #0
	ldrsh r0, [r1, r3]
	cmp r0, #0x1d
	bgt _0801EB72
	adds r0, r2, #1
	strh r0, [r1]
	b _0801EBB0
_0801EB72:
	movs r0, #0
	strh r0, [r1]
	mov r1, r8
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	b _0801EBB0
_0801EB80:
	movs r1, #0x80
	lsls r1, r1, #1
	adds r4, r6, #0
	adds r4, #0x4c
	movs r2, #0
	ldrsh r3, [r4, r2]
	movs r0, #0xf
	str r0, [sp]
	movs r0, #2
	movs r2, #0x10
	bl sub_8012E84
	adds r7, r0, #0
	ldrh r1, [r4]
	movs r3, #0
	ldrsh r0, [r4, r3]
	cmp r0, #0xe
	bgt _0801EBAA
_0801EBA4:
	adds r0, r1, #1
	strh r0, [r4]
	b _0801EBB0
_0801EBAA:
	adds r0, r6, #0
	bl sub_8002DE4
_0801EBB0:
	ldr r4, _0801EC38 @ =0x080DC15C
	movs r0, #0x80
	adds r0, r0, r4
	mov sb, r0
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r0, r0, #4
	movs r2, #0x80
	lsls r2, r2, #1
	mov r8, r2
	mov r1, r8
	bl sub_80D6374
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	movs r3, #0
	ldrsh r0, [r4, r3]
	rsbs r0, r0, #0
	lsls r0, r0, #4
	adds r1, r7, #0
	bl sub_80D6374
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	movs r1, #0
	ldrsh r0, [r4, r1]
	lsls r0, r0, #4
	mov r1, r8
	bl sub_80D6374
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r2, sb
	movs r3, #0
	ldrsh r0, [r2, r3]
	lsls r0, r0, #4
	adds r1, r7, #0
	bl sub_80D6374
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #0
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl sub_8002100
	ldr r3, _0801EC3C @ =0x085C3348
	movs r0, #0x98
	lsls r0, r0, #6
	str r0, [sp]
	movs r0, #2
	movs r1, #0
	movs r2, #0x44
	bl PutSpriteExt
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801EC38: .4byte 0x080DC15C
_0801EC3C: .4byte 0x085C3348

