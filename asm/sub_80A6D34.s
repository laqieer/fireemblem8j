	.syntax unified
	.set __divsi3, 0x080D65F8 + 1
	.set __modsi3, 0x080D6690 + 1
	.set sub_80A6AC0, 0x080A6AC0 + 1
	.set sub_80A6C20, 0x080A6C20 + 1
	.section .text.sub_80A6D34, "ax", %progbits
@ sub_80A6D34 @ JP 0x080A6D34 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A6D34
	.thumb_func
sub_80A6D34:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	movs r0, #0
	mov sl, r0
	movs r7, #0
	bl sub_80A6AC0
	ldr r4, _080A6DC8 @ =0x02014EF4
	ldr r0, [r4]
	ldr r6, _080A6DCC @ =0x02014F28
	adds r0, r0, r6
	ldr r1, _080A6DD0 @ =0x02014FC8
	ldrh r1, [r1, #6]
	bl sub_80A6C20
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	movs r3, #0
	ldr r0, [r4]
	cmp sl, r0
	bge _080A6D7E
	mov r8, r6
	ldr r6, _080A6DD4 @ =0x02014EF0
_080A6D68:
	mov r1, r8
	adds r2, r3, r1
	ldrb r1, [r2]
	subs r1, r1, r5
	ldr r0, [r6]
	ands r0, r1
	strb r0, [r2]
	adds r3, #1
	ldr r0, [r4]
	cmp r3, r0
	blt _080A6D68
_080A6D7E:
	ldr r0, _080A6DD0 @ =0x02014FC8
	movs r1, #0
	strh r1, [r0]
	strh r1, [r0, #2]
	strh r1, [r0, #4]
	ldr r1, _080A6DCC @ =0x02014F28
	ldr r2, _080A6DD8 @ =0x02014EEC
	mov sb, r2
	mov r8, r0
	mov r0, sl
	adds r6, r0, r1
_080A6D94:
	adds r0, r7, #0
	movs r1, #3
	bl __modsi3
	adds r5, r0, #0
	cmp r5, #0
	bne _080A6DDC
	ldrb r4, [r6]
	mov r2, sb
	ldr r1, [r2]
	adds r0, r7, #0
	bl __modsi3
	asrs r4, r0
	movs r0, #1
	ands r4, r0
	adds r0, r7, #0
	movs r1, #3
	bl __divsi3
	lsls r4, r0
	mov r1, r8
	ldrh r0, [r1]
	orrs r4, r0
	strh r4, [r1]
	b _080A6E28
	.align 2, 0
_080A6DC8: .4byte 0x02014EF4
_080A6DCC: .4byte 0x02014F28
_080A6DD0: .4byte 0x02014FC8
_080A6DD4: .4byte 0x02014EF0
_080A6DD8: .4byte 0x02014EEC
_080A6DDC:
	cmp r5, #1
	bne _080A6E04
	ldrb r4, [r6]
	mov r2, sb
	ldr r1, [r2]
	adds r0, r7, #0
	bl __modsi3
	asrs r4, r0
	ands r4, r5
	adds r0, r7, #0
	movs r1, #3
	bl __divsi3
	lsls r4, r0
	mov r1, r8
	ldrh r0, [r1, #2]
	orrs r4, r0
	strh r4, [r1, #2]
	b _080A6E28
_080A6E04:
	ldrb r4, [r6]
	mov r2, sb
	ldr r1, [r2]
	adds r0, r7, #0
	bl __modsi3
	asrs r4, r0
	movs r0, #1
	ands r4, r0
	adds r0, r7, #0
	movs r1, #3
	bl __divsi3
	lsls r4, r0
	mov r1, r8
	ldrh r0, [r1, #4]
	orrs r4, r0
	strh r4, [r1, #4]
_080A6E28:
	adds r7, #1
	mov r2, sb
	ldr r1, [r2]
	adds r0, r7, #0
	bl __modsi3
	cmp r0, #0
	bne _080A6E3A
	adds r6, #1
_080A6E3A:
	cmp r7, #0x1e
	bne _080A6D94
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

