	.syntax unified
	.set PutSpriteExt, 0x08005330 + 1
	.set sub_8001EE4, 0x08001EE4 + 1
	.set sub_8002100, 0x08002100 + 1
	.set sub_80D6374, 0x080D6374 + 1
	.section .text.sub_80B762C, "ax", %progbits
@ sub_80B762C @ JP 0x080B762C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B762C
	.thumb_func
sub_80B762C:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	mov r8, r1
	str r2, [sp, #4]
	ldr r1, [sp, #0x30]
	ldr r2, [sp, #0x34]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov sb, r0
	lsls r3, r3, #0x10
	lsrs r3, r3, #0x10
	mov sl, r3
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	str r1, [sp, #8]
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp, #0xc]
	movs r4, #1
	ldr r2, _080B7684 @ =0x020228A8
	movs r0, #0x80
	lsls r0, r0, #1
	ldr r1, _080B7688 @ =0x0000021E
	adds r5, r2, r1
	ldr r3, [sp, #0xc]
	adds r0, r3, r0
	mov r3, sb
	lsls r1, r3, #5
	lsls r0, r0, #1
	adds r0, r0, r2
	adds r3, r0, #2
	ldr r0, _080B768C @ =0x00000222
	adds r1, r1, r0
	adds r1, r1, r2
_080B7678:
	ldr r2, [sp, #0xc]
	adds r0, r4, r2
	cmp r0, #0xf
	ble _080B7690
	ldrh r0, [r5]
	b _080B7692
	.align 2, 0
_080B7684: .4byte 0x020228A8
_080B7688: .4byte 0x0000021E
_080B768C: .4byte 0x00000222
_080B7690:
	ldrh r0, [r3]
_080B7692:
	strh r0, [r1]
	mov r7, sb
	adds r7, #1
	adds r1, #2
	adds r3, #2
	adds r4, #1
	cmp r4, #0xf
	ble _080B7678
	bl sub_8001EE4
	ldr r3, [sp, #8]
	cmp r3, #8
	bls _080B778C
	mov r0, sl
	cmp r0, #7
	bhi _080B76B6
	movs r1, #8
	mov sl, r1
_080B76B6:
	ldr r4, _080B774C @ =0x080DC15C
	ldr r2, _080B7750 @ =0x080DC1DC
	movs r3, #0
	ldrsh r0, [r2, r3]
	lsls r0, r0, #4
	mov r1, sl
	bl sub_80D6374
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	movs r1, #0
	ldrsh r0, [r4, r1]
	rsbs r0, r0, #0
	lsls r0, r0, #4
	ldr r1, [sp, #8]
	bl sub_80D6374
	adds r5, r0, #0
	lsls r5, r5, #0x10
	asrs r5, r5, #0x10
	movs r2, #0
	ldrsh r0, [r4, r2]
	lsls r0, r0, #4
	mov r1, sl
	bl sub_80D6374
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	ldr r3, _080B7750 @ =0x080DC1DC
	movs r1, #0
	ldrsh r0, [r3, r1]
	lsls r0, r0, #4
	ldr r1, [sp, #8]
	bl sub_80D6374
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	mov r0, sb
	adds r1, r6, #0
	adds r2, r5, #0
	adds r3, r4, #0
	bl sub_8002100
	ldr r2, [sp, #0xc]
	cmp r2, #0
	beq _080B775C
	ldr r0, _080B7754 @ =0x000001FF
	mov r3, r8
	ands r3, r0
	mov r8, r3
	mov r2, sb
	lsls r1, r2, #9
	add r1, r8
	ldr r3, [sp, #4]
	ands r3, r0
	str r3, [sp, #4]
	ldr r3, _080B7758 @ =0x08AAFCAC
	lsls r0, r2, #2
	movs r2, #0xf
	ands r7, r2
	lsls r2, r7, #0xc
	adds r0, r0, r2
	movs r2, #0x80
	lsls r2, r2, #4
	adds r0, r0, r2
	str r0, [sp]
	movs r0, #4
	ldr r2, [sp, #4]
	bl PutSpriteExt
	b _080B778C
	.align 2, 0
_080B774C: .4byte 0x080DC15C
_080B7750: .4byte 0x080DC1DC
_080B7754: .4byte 0x000001FF
_080B7758: .4byte 0x08AAFCAC
_080B775C:
	ldr r0, _080B779C @ =0x000001FF
	mov r3, r8
	ands r3, r0
	mov r8, r3
	mov r2, sb
	lsls r1, r2, #9
	add r1, r8
	ldr r3, [sp, #4]
	ands r3, r0
	str r3, [sp, #4]
	ldr r3, _080B77A0 @ =0x08AAFCAC
	lsls r0, r2, #2
	movs r2, #0xf
	ands r7, r2
	lsls r2, r7, #0xc
	adds r0, r0, r2
	movs r2, #0x80
	lsls r2, r2, #3
	adds r0, r0, r2
	str r0, [sp]
	movs r0, #4
	ldr r2, [sp, #4]
	bl PutSpriteExt
_080B778C:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B779C: .4byte 0x000001FF
_080B77A0: .4byte 0x08AAFCAC

