	.syntax unified
	.set PutSpriteExt, 0x08005330 + 1
	.set __divsi3, 0x080D65F8 + 1
	.set __modsi3, 0x080D6690 + 1
	.section .text.sub_80B4E58, "ax", %progbits
@ sub_80B4E58 @ JP 0x080B4E58 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B4E58
	.thumb_func
sub_80B4E58:
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r6, r0, #0
	adds r7, r1, #0
	adds r0, r2, #0
	movs r1, #0x3c
	bl __divsi3
	adds r5, r0, #0
	movs r1, #0x3c
	bl __divsi3
	adds r4, r0, #0
	adds r0, r5, #0
	movs r1, #0x3c
	bl __modsi3
	mov r8, r0
	ldr r3, _080B4EE0 @ =0x08A9E40E
	movs r5, #0x80
	lsls r5, r5, #7
	str r5, [sp]
	movs r0, #0
	adds r1, r6, #0
	adds r2, r7, #0
	bl PutSpriteExt
	adds r1, r6, #0
	adds r1, #0x28
	ldr r0, _080B4EE4 @ =0x08A9E470
	mov sb, r0
	lsls r4, r4, #2
	add r4, sb
	ldr r3, [r4]
	str r5, [sp]
	movs r0, #0
	adds r2, r7, #0
	bl PutSpriteExt
	adds r1, r6, #0
	adds r1, #0x30
	ldr r3, _080B4EE8 @ =0x08A9E416
	str r5, [sp]
	movs r0, #0
	adds r2, r7, #0
	bl PutSpriteExt
	mov r0, r8
	cmp r0, #9
	ble _080B4EEC
	adds r4, r6, #0
	adds r4, #0x38
	movs r1, #0xa
	bl __divsi3
	lsls r0, r0, #2
	add r0, sb
	ldr r3, [r0]
	str r5, [sp]
	movs r0, #0
	adds r1, r4, #0
	adds r2, r7, #0
	bl PutSpriteExt
	b _080B4EFE
	.align 2, 0
_080B4EE0: .4byte 0x08A9E40E
_080B4EE4: .4byte 0x08A9E470
_080B4EE8: .4byte 0x08A9E416
_080B4EEC:
	adds r1, r6, #0
	adds r1, #0x38
	mov r0, sb
	ldr r3, [r0]
	str r5, [sp]
	movs r0, #0
	adds r2, r7, #0
	bl PutSpriteExt
_080B4EFE:
	adds r5, r6, #0
	adds r5, #0x40
	ldr r4, _080B4F30 @ =0x08A9E470
	mov r0, r8
	movs r1, #0xa
	bl __modsi3
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r3, [r0]
	movs r0, #0x80
	lsls r0, r0, #7
	str r0, [sp]
	movs r0, #0
	adds r1, r5, #0
	adds r2, r7, #0
	bl PutSpriteExt
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B4F30: .4byte 0x08A9E470

