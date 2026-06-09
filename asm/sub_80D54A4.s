	.syntax unified
	.set sub_80D65C0, 0x080D65C0 + 1
	.section .text.sub_80D54A4, "ax", %progbits
@ sub_80D54A4 @ JP 0x080D54A4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80D54A4
	.thumb_func
sub_80D54A4:
	push {r4, r5, r6, r7, lr}
	ldr r0, _080D54F0 @ =0x03007FF0
	ldr r6, [r0]
	ldr r1, [r6]
	ldr r0, _080D54F4 @ =0x68736D53
	cmp r1, r0
	bne _080D54EA
	adds r0, r1, #1
	str r0, [r6]
	movs r5, #0xc
	adds r4, r6, #0
	adds r4, #0x50
	movs r0, #0
_080D54BE:
	strb r0, [r4]
	subs r5, #1
	adds r4, #0x40
	cmp r5, #0
	bgt _080D54BE
	ldr r4, [r6, #0x1c]
	cmp r4, #0
	beq _080D54E6
	movs r5, #1
	movs r7, #0
_080D54D2:
	lsls r0, r5, #0x18
	lsrs r0, r0, #0x18
	ldr r1, [r6, #0x2c]
	bl sub_80D65C0
	strb r7, [r4]
	adds r5, #1
	adds r4, #0x40
	cmp r5, #4
	ble _080D54D2
_080D54E6:
	ldr r0, _080D54F4 @ =0x68736D53
	str r0, [r6]
_080D54EA:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080D54F0: .4byte 0x03007FF0
_080D54F4: .4byte 0x68736D53

