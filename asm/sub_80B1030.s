	.syntax unified
	.set PutSpriteExt, 0x08005330 + 1
	.set sub_80B0EC0, 0x080B0EC0 + 1
	.set sub_80B0FA0, 0x080B0FA0 + 1
	.section .text.sub_80B1030, "ax", %progbits
@ sub_80B1030 @ JP 0x080B1030 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B1030
	.thumb_func
sub_80B1030:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r6, r0, #0
	adds r1, r6, #0
	adds r1, #0x2a
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	ldr r3, _080B10A8 @ =0x08A9DA08
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [sp]
	movs r0, #4
	movs r1, #0x38
	movs r2, #4
	bl PutSpriteExt
	ldr r3, _080B10AC @ =0x08A9DA16
	movs r0, #0x80
	lsls r0, r0, #7
	str r0, [sp]
	movs r0, #4
	movs r1, #0x38
	movs r2, #4
	bl PutSpriteExt
	movs r5, #0
	adds r0, r6, #0
	adds r0, #0x2b
	str r0, [sp, #4]
	movs r1, #6
	mov sb, r1
	movs r2, #5
	mov r8, r2
	movs r7, #0xc0
	lsls r7, r7, #0xe
	movs r0, #0xf
	mov sl, r0
_080B1084:
	asrs r4, r7, #0x10
	adds r0, r6, #0
	adds r0, #0x2b
	ldrb r0, [r0]
	cmp r5, r0
	bne _080B10B4
	mov r0, r8
	mov r1, sl
	ands r0, r1
	lsls r0, r0, #0xc
	str r0, [sp]
	movs r0, #4
	movs r1, #8
	adds r2, r4, #0
	ldr r3, _080B10B0 @ =0x08A9DA2A
	bl PutSpriteExt
	b _080B10CA
	.align 2, 0
_080B10A8: .4byte 0x08A9DA08
_080B10AC: .4byte 0x08A9DA16
_080B10B0: .4byte 0x08A9DA2A
_080B10B4:
	mov r0, sb
	mov r2, sl
	ands r0, r2
	lsls r0, r0, #0xc
	str r0, [sp]
	movs r0, #4
	movs r1, #8
	adds r2, r4, #0
	ldr r3, _080B1118 @ =0x08A9DA2A
	bl PutSpriteExt
_080B10CA:
	ldr r1, _080B111C @ =0x08A9DA70
	lsls r0, r5, #2
	adds r0, r0, r1
	ldr r3, [r0]
	movs r0, #0x80
	lsls r0, r0, #7
	str r0, [sp]
	movs r0, #4
	movs r1, #8
	adds r2, r4, #0
	bl PutSpriteExt
	movs r0, #2
	add sb, r0
	add r8, r0
	movs r1, #0x80
	lsls r1, r1, #0xe
	adds r7, r7, r1
	adds r5, #1
	cmp r5, #2
	ble _080B1084
	adds r0, r6, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	ldr r2, [sp, #4]
	ldrb r1, [r2]
	bl sub_80B0FA0
	adds r0, r6, #0
	bl sub_80B0EC0
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B1118: .4byte 0x08A9DA2A
_080B111C: .4byte 0x08A9DA70

