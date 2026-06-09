	.syntax unified
	.set PutSpriteExt, 0x08005330 + 1
	.set sub_8001EE4, 0x08001EE4 + 1
	.section .text.sub_80B7CEC, "ax", %progbits
@ sub_80B7CEC @ JP 0x080B7CEC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B7CEC
	.thumb_func
sub_80B7CEC:
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	mov ip, r0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov r8, r1
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	mov sb, r2
	movs r4, #0
	ldr r7, _080B7D94 @ =0x020228A8
	adds r5, r7, #0
	adds r5, #0x80
	lsls r2, r0, #0x10
	movs r0, #0xf8
	lsls r0, r0, #2
	adds r3, r7, r0
_080B7D18:
	mov r1, ip
	adds r0, r1, r4
	movs r1, #0xf
	cmp r0, #0xf
	bgt _080B7D24
	lsrs r1, r2, #0x10
_080B7D24:
	movs r6, #0xf0
	lsls r6, r6, #1
	adds r0, r1, r6
	lsls r0, r0, #1
	adds r0, r0, r7
	ldrh r1, [r0]
	strh r1, [r3]
	ldrh r0, [r0]
	strh r0, [r5]
	adds r5, #2
	movs r0, #0x80
	lsls r0, r0, #9
	adds r2, r2, r0
	adds r3, #2
	adds r4, #1
	cmp r4, #0xf
	ble _080B7D18
	bl sub_8001EE4
	movs r0, #8
	mov r1, r8
	subs r0, r0, r1
	lsls r0, r0, #4
	movs r4, #0
	ldr r6, _080B7D98 @ =0x08AAFF34
	adds r5, r0, #0
	subs r5, #8
_080B7D5A:
	mov r0, sb
	asrs r0, r4
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _080B7D7C
	ldr r1, _080B7D9C @ =0x000001FF
	ands r1, r5
	ldr r3, [r6]
	movs r0, #0xf0
	lsls r0, r0, #8
	str r0, [sp]
	movs r0, #4
	movs r2, #0x50
	bl PutSpriteExt
	adds r5, #0x20
_080B7D7C:
	adds r6, #4
	adds r4, #1
	cmp r4, #7
	ble _080B7D5A
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B7D94: .4byte 0x020228A8
_080B7D98: .4byte 0x08AAFF34
_080B7D9C: .4byte 0x000001FF

