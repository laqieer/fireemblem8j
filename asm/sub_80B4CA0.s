	.syntax unified
	.set PutSpriteExt, 0x08005330 + 1
	.set sub_8002100, 0x08002100 + 1
	.set sub_80D6374, 0x080D6374 + 1
	.section .text.sub_80B4CA0, "ax", %progbits
@ sub_80B4CA0 @ JP 0x080B4CA0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B4CA0
	.thumb_func
sub_80B4CA0:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov sl, r0
	lsls r1, r1, #0x10
	lsrs r7, r1, #0x10
	cmp r7, #0x20
	bls _080B4D74
	movs r0, #0xff
	mov r1, sl
	ands r1, r0
	mov sl, r1
	ldr r4, _080B4D84 @ =0x080DC15C
	movs r2, #0x80
	adds r2, r2, r4
	mov sb, r2
	movs r1, #0
	ldrsh r0, [r2, r1]
	lsls r0, r0, #4
	movs r2, #0x80
	lsls r2, r2, #1
	mov r8, r2
	mov r1, r8
	bl sub_80D6374
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	movs r1, #0
	ldrsh r0, [r4, r1]
	rsbs r0, r0, #0
	lsls r0, r0, #4
	adds r1, r7, #0
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
	movs r4, #0
	ldr r6, _080B4D88 @ =0x0201F198
	movs r5, #0x24
_080B4D2A:
	lsls r0, r4, #2
	ldrh r1, [r6]
	adds r0, r0, r1
	movs r2, #0x80
	lsls r2, r2, #5
	adds r0, r0, r2
	str r0, [sp]
	movs r0, #4
	adds r1, r5, #0
	movs r2, #0x84
	lsls r2, r2, #1
	add r2, sl
	ldr r3, _080B4D8C @ =0x085B8D24
	bl PutSpriteExt
	adds r5, #0x20
	adds r4, #1
	cmp r4, #4
	ble _080B4D2A
	movs r6, #0xcb
	lsls r6, r6, #8
	movs r5, #0x18
	movs r4, #2
_080B4D58:
	str r6, [sp]
	movs r0, #4
	adds r1, r5, #0
	movs r2, #0x80
	lsls r2, r2, #1
	add r2, sl
	ldr r3, _080B4D90 @ =0x085B8D2C
	bl PutSpriteExt
	adds r6, #8
	adds r5, #0x40
	subs r4, #1
	cmp r4, #0
	bge _080B4D58
_080B4D74:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B4D84: .4byte 0x080DC15C
_080B4D88: .4byte 0x0201F198
_080B4D8C: .4byte 0x085B8D24
_080B4D90: .4byte 0x085B8D2C

