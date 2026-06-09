	.syntax unified
	.set __divsi3, 0x080D65F8 + 1
	.set __modsi3, 0x080D6690 + 1
	.set sub_80A6AC0, 0x080A6AC0 + 1
	.set sub_80A6C20, 0x080A6C20 + 1
	.section .text.sub_80A6C60, "ax", %progbits
@ sub_80A6C60 @ JP 0x080A6C60 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A6C60
	.thumb_func
sub_80A6C60:
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	movs r6, #0
	ldr r0, _080A6C98 @ =0x02014EF4
	ldr r0, [r0]
	ldr r5, _080A6C9C @ =0x02014F28
	adds r0, r0, r5
	ldr r4, _080A6CA0 @ =0x02014FC8
	ldrh r1, [r4, #6]
	bl sub_80A6C20
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sb, r0
	adds r7, r5, #0
	mov r8, r4
_080A6C84:
	adds r0, r6, #0
	movs r1, #3
	bl __modsi3
	adds r5, r0, #0
	cmp r5, #0
	bne _080A6CA4
	mov r0, r8
	ldrh r4, [r0]
	b _080A6CBC
	.align 2, 0
_080A6C98: .4byte 0x02014EF4
_080A6C9C: .4byte 0x02014F28
_080A6CA0: .4byte 0x02014FC8
_080A6CA4:
	cmp r5, #1
	bne _080A6CB8
	mov r0, r8
	ldrh r4, [r0, #2]
	adds r0, r6, #0
	movs r1, #3
	bl __divsi3
	adds r1, r5, #0
	b _080A6CC6
_080A6CB8:
	mov r0, r8
	ldrh r4, [r0, #4]
_080A6CBC:
	adds r0, r6, #0
	movs r1, #3
	bl __divsi3
	movs r1, #1
_080A6CC6:
	lsls r1, r0
	ands r4, r1
	asrs r4, r0
	ldr r5, _080A6D24 @ =0x02014EEC
	ldr r1, [r5]
	adds r0, r6, #0
	bl __modsi3
	lsls r4, r0
	ldrb r0, [r7]
	orrs r4, r0
	strb r4, [r7]
	adds r6, #1
	ldr r1, [r5]
	adds r0, r6, #0
	bl __modsi3
	cmp r0, #0
	bne _080A6CEE
	adds r7, #1
_080A6CEE:
	cmp r6, #0x1e
	bne _080A6C84
	movs r3, #0
	ldr r4, _080A6D28 @ =0x02014EF4
	ldr r0, [r4]
	cmp r3, r0
	bge _080A6D14
	ldr r6, _080A6D2C @ =0x02014F28
	ldr r5, _080A6D30 @ =0x02014EF0
_080A6D00:
	adds r2, r3, r6
	ldrb r1, [r2]
	add r1, sb
	ldr r0, [r5]
	ands r0, r1
	strb r0, [r2]
	adds r3, #1
	ldr r0, [r4]
	cmp r3, r0
	blt _080A6D00
_080A6D14:
	bl sub_80A6AC0
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A6D24: .4byte 0x02014EEC
_080A6D28: .4byte 0x02014EF4
_080A6D2C: .4byte 0x02014F28
_080A6D30: .4byte 0x02014EF0

