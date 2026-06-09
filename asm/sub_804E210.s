	.syntax unified
	.set PutSprite, 0x080052F0 + 1
	.set sub_8002100, 0x08002100 + 1
	.set sub_804E1BC, 0x0804E1BC + 1
	.set sub_80D6374, 0x080D6374 + 1
	.section .text.sub_804E210, "ax", %progbits
@ sub_804E210 @ JP 0x0804E210 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_804E210
	.thumb_func
sub_804E210:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r7, r0, #0
	movs r0, #0
	mov sb, r0
	movs r1, #0
	str r1, [sp, #4]
	mov sl, r1
_0804E228:
	ldr r1, [r7, #0x2c]
	ldr r2, [r7, #0x30]
	ldr r3, [sp, #4]
	adds r2, r2, r3
	movs r0, #0xf
	mov r4, sb
	ands r0, r4
	lsls r0, r0, #0xc
	movs r3, #0x80
	lsls r3, r3, #4
	adds r0, r0, r3
	str r0, [sp]
	movs r0, #4
	ldr r3, _0804E3DC @ =0x085D4AF4
	bl PutSprite
	ldr r4, _0804E3E0 @ =0x080DC1DC
	movs r1, #0
	ldrsh r0, [r4, r1]
	lsls r0, r0, #4
	movs r1, #0x80
	lsls r1, r1, #1
	bl sub_80D6374
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	ldr r2, _0804E3E4 @ =0x080DC15C
	movs r3, #0
	ldrsh r0, [r2, r3]
	rsbs r0, r0, #0
	lsls r0, r0, #4
	movs r1, #0x80
	lsls r1, r1, #1
	bl sub_80D6374
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	ldr r4, _0804E3E4 @ =0x080DC15C
	movs r1, #0
	ldrsh r0, [r4, r1]
	lsls r0, r0, #4
	movs r1, #0x80
	lsls r1, r1, #1
	bl sub_80D6374
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	ldr r2, _0804E3E0 @ =0x080DC1DC
	movs r3, #0
	ldrsh r0, [r2, r3]
	lsls r0, r0, #4
	movs r1, #0x80
	lsls r1, r1, #1
	bl sub_80D6374
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	mov r0, sb
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl sub_8002100
	ldr r1, [r7, #0x38]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _0804E352
	adds r3, r7, #0
	adds r3, #0x3c
	cmp r1, sb
	beq _0804E2D8
	mov r4, sl
	adds r1, r3, r4
	ldrh r0, [r1]
	movs r2, #0x80
	lsls r2, r2, #1
	cmp r0, r2
	bls _0804E2D2
	subs r0, #8
	strh r0, [r1]
_0804E2D2:
	ldr r0, [r7, #0x38]
	cmp r0, sb
	bne _0804E2EA
_0804E2D8:
	mov r4, sl
	adds r2, r3, r4
	ldrh r1, [r2]
	ldr r0, _0804E3E8 @ =0x0000014F
	cmp r1, r0
	bhi _0804E2EA
	adds r0, r1, #0
	adds r0, #8
	strh r0, [r2]
_0804E2EA:
	ldr r1, _0804E3E0 @ =0x080DC1DC
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #4
	add r3, sl
	mov r8, r3
	ldrh r1, [r3]
	bl sub_80D6374
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	ldr r3, _0804E3E4 @ =0x080DC15C
	movs r4, #0
	ldrsh r0, [r3, r4]
	rsbs r0, r0, #0
	lsls r0, r0, #4
	mov r2, r8
	ldrh r1, [r2]
	bl sub_80D6374
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	ldr r3, _0804E3E4 @ =0x080DC15C
	movs r4, #0
	ldrsh r0, [r3, r4]
	lsls r0, r0, #4
	mov r2, r8
	ldrh r1, [r2]
	bl sub_80D6374
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	ldr r3, _0804E3E0 @ =0x080DC1DC
	movs r1, #0
	ldrsh r0, [r3, r1]
	lsls r0, r0, #4
	mov r2, r8
	ldrh r1, [r2]
	bl sub_80D6374
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	mov r0, sb
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl sub_8002100
_0804E352:
	ldr r1, [r7, #0x2c]
	subs r1, #0x30
	ldr r2, [r7, #0x30]
	ldr r3, [sp, #4]
	adds r2, r2, r3
	ldr r3, _0804E3EC @ =0x085D4C5C
	mov r4, sb
	lsls r0, r4, #2
	adds r0, r0, r3
	ldr r3, [r0]
	movs r4, #0
	str r4, [sp]
	movs r0, #4
	bl PutSprite
	ldr r0, [sp, #4]
	adds r0, #0x18
	str r0, [sp, #4]
	movs r1, #2
	add sl, r1
	movs r2, #1
	add sb, r2
	mov r3, sb
	cmp r3, #3
	bgt _0804E386
	b _0804E228
_0804E386:
	ldr r2, [r7, #0x34]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r2, r0
	beq _0804E3CA
	ldr r1, [r7, #0x2c]
	subs r1, #0x48
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #3
	ldr r2, [r7, #0x30]
	adds r2, r2, r0
	adds r2, #8
	ldr r3, _0804E3F0 @ =0x080DF248
	str r4, [sp]
	movs r0, #4
	bl PutSprite
	ldr r1, [r7, #0x2c]
	subs r1, #0x48
	ldr r2, [r7, #0x34]
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #3
	ldr r2, [r7, #0x30]
	adds r2, r2, r0
	adds r2, #0x12
	ldr r3, _0804E3F4 @ =0x080DF256
	str r4, [sp]
	movs r0, #4
	bl PutSprite
	bl sub_804E1BC
_0804E3CA:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0804E3DC: .4byte 0x085D4AF4
_0804E3E0: .4byte 0x080DC1DC
_0804E3E4: .4byte 0x080DC15C
_0804E3E8: .4byte 0x0000014F
_0804E3EC: .4byte 0x085D4C5C
_0804E3F0: .4byte 0x080DF248
_0804E3F4: .4byte 0x080DF256

