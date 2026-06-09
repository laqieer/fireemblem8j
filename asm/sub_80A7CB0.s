	.syntax unified
	.set sub_803144C, 0x0803144C + 1
	.set sub_80D65C8, 0x080D65C8 + 1
	.section .text.sub_80A7CB0, "ax", %progbits
@ sub_80A7CB0 @ JP 0x080A7CB0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A7CB0
	.thumb_func
sub_80A7CB0:
	push {r4, r5, r6, r7, lr}
	sub sp, #0xb0
	ldr r1, _080A7D24 @ =0x03006790
	ldr r3, [r1]
	mov r1, sp
	movs r2, #0xb0
	bl sub_80D65C8
	bl sub_803144C
	adds r4, r0, #0
	add r5, sp, #0x64
	movs r7, #0
	movs r6, #0
_080A7CCC:
	mov r1, sp
	adds r0, r1, r6
	ldrb r0, [r0]
	strh r0, [r4]
	movs r3, #7
	ands r3, r7
	ldrb r1, [r5]
	ldr r0, _080A7D28 @ =0x081F56AC
	adds r0, r3, r0
	ldrb r0, [r0]
	bics r1, r0
	asrs r1, r3
	lsls r1, r1, #0x18
	lsrs r2, r1, #0x18
	cmp r3, #1
	ble _080A7D08
	adds r5, #1
	cmp r3, #2
	ble _080A7D08
	ldrb r1, [r5]
	ldr r0, _080A7D2C @ =0x081F56B4
	adds r0, r3, r0
	ldrb r0, [r0]
	bics r1, r0
	movs r0, #8
	subs r0, r0, r3
	lsls r1, r0
	orrs r2, r1
	lsls r0, r2, #0x18
	lsrs r2, r0, #0x18
_080A7D08:
	lsls r0, r2, #8
	ldrh r1, [r4]
	orrs r0, r1
	strh r0, [r4]
	adds r7, #6
	adds r4, #2
	adds r6, #1
	cmp r6, #0x63
	ble _080A7CCC
	add sp, #0xb0
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A7D24: .4byte 0x03006790
_080A7D28: .4byte 0x081F56AC
_080A7D2C: .4byte 0x081F56B4

