	.syntax unified
	.set CallARM_PushToSecondaryOAM, 0x08002B08 + 1
	.set GetUnit, 0x08019108 + 1
	.set sub_8002100, 0x08002100 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8012E84, 0x08012E84 + 1
	.set sub_80D6374, 0x080D6374 + 1
	.section .text.sub_8049988, "ax", %progbits
@ sub_8049988 @ JP 0x08049988 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8049988
	.thumb_func
sub_8049988:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r7, r0, #0
	adds r0, #0x33
	ldrb r0, [r0]
	bl GetUnit
	str r0, [sp, #4]
	ldr r3, [r7, #0x3c]
	cmp r3, #0x10
	bhi _08049A1C
	movs r0, #0x80
	lsls r0, r0, #1
	mov r8, r0
	movs r0, #0x10
	str r0, [sp]
	movs r0, #1
	movs r1, #0x10
	mov r2, r8
	bl sub_8012E84
	mov sl, r0
	ldr r4, _08049A50 @ =0x080DC15C
	movs r1, #0x80
	adds r1, r1, r4
	mov sb, r1
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #4
	mov r1, r8
	bl sub_80D6374
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	movs r1, #0
	ldrsh r0, [r4, r1]
	rsbs r0, r0, #0
	lsls r0, r0, #4
	mov r1, sl
	bl sub_80D6374
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	movs r2, #0
	ldrsh r0, [r4, r2]
	lsls r0, r0, #4
	mov r1, r8
	bl sub_80D6374
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r1, sb
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #4
	mov r1, sl
	bl sub_80D6374
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	movs r0, #0
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl sub_8002100
_08049A1C:
	adds r0, r7, #0
	adds r0, #0x40
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _08049A74
	ldr r1, [r7, #0x3c]
	cmp r1, #3
	bls _08049A74
	cmp r1, #0x16
	bhi _08049A74
	subs r2, r1, #4
	ldr r4, [sp, #4]
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	cmp r0, #8
	bne _08049A58
	ldr r0, _08049A54 @ =0x085D4148
	lsls r1, r2, #1
	adds r0, r1, r0
	ldrh r0, [r0]
	ldrh r2, [r7, #0x2a]
	adds r0, r0, r2
	strh r0, [r7, #0x2a]
	b _08049A68
	.align 2, 0
_08049A50: .4byte 0x080DC15C
_08049A54: .4byte 0x085D4148
_08049A58:
	ldr r1, _08049AB8 @ =0x085D4148
	lsls r2, r2, #1
	adds r1, r2, r1
	ldrh r0, [r7, #0x2a]
	ldrh r1, [r1]
	subs r0, r0, r1
	strh r0, [r7, #0x2a]
	adds r1, r2, #0
_08049A68:
	ldr r0, _08049ABC @ =0x085D416E
	adds r0, r1, r0
	ldrh r1, [r7, #0x2c]
	ldrh r0, [r0]
	subs r1, r1, r0
	strh r1, [r7, #0x2c]
_08049A74:
	movs r4, #0x2a
	ldrsh r0, [r7, r4]
	movs r2, #0x2c
	ldrsh r1, [r7, r2]
	movs r4, #0x80
	lsls r4, r4, #1
	adds r1, r1, r4
	ldr r2, _08049AC0 @ =0x085B8D24
	adds r3, r7, #0
	adds r3, #0x32
	ldrb r3, [r3]
	lsls r3, r3, #2
	ldr r4, _08049AC4 @ =0x00009340
	adds r3, r3, r4
	bl CallARM_PushToSecondaryOAM
	ldr r0, [r7, #0x3c]
	adds r0, #1
	str r0, [r7, #0x3c]
	cmp r0, #0x40
	bls _08049AA8
	movs r0, #0
	str r0, [r7, #0x3c]
	adds r0, r7, #0
	bl sub_8002DE4
_08049AA8:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08049AB8: .4byte 0x085D4148
_08049ABC: .4byte 0x085D416E
_08049AC0: .4byte 0x085B8D24
_08049AC4: .4byte 0x00009340

