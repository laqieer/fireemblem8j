	.syntax unified
	.set __divsi3, 0x080D65F8 + 1
	.set sub_80A487C, 0x080A487C + 1
	.section .text.sub_80A4FB8, "ax", %progbits
@ sub_80A4FB8 @ JP 0x080A4FB8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A4FB8
	.thumb_func
sub_80A4FB8:
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x3c]
	movs r1, #1
	rsbs r1, r1, #0
	cmp r0, r1
	beq _080A5040
	str r0, [r4, #0x38]
	str r1, [r4, #0x3c]
	movs r1, #3
	bl __divsi3
	adds r1, r0, #0
	ldr r0, [r4, #0x34]
	cmp r0, #0
	bge _080A4FDA
	adds r0, #0xf
_080A4FDA:
	asrs r0, r0, #4
	subs r0, r1, r0
	lsls r0, r0, #4
	adds r0, #0x24
	cmp r0, #0x24
	bgt _080A4FF4
	cmp r1, #0
	bne _080A4FEE
	str r1, [r4, #0x34]
	b _080A4FF4
_080A4FEE:
	subs r0, r1, #1
	lsls r0, r0, #4
	str r0, [r4, #0x34]
_080A4FF4:
	ldr r0, [r4, #0x38]
	movs r1, #3
	bl __divsi3
	adds r5, r0, #0
	ldr r0, [r4, #0x34]
	cmp r0, #0
	bge _080A5006
	adds r0, #0xf
_080A5006:
	asrs r0, r0, #4
	subs r0, r5, r0
	lsls r0, r0, #4
	adds r0, #0x24
	cmp r0, #0x73
	ble _080A5040
	bl sub_80A487C
	subs r0, #1
	movs r1, #3
	bl __divsi3
	cmp r5, r0
	bne _080A5032
	bl sub_80A487C
	subs r0, #1
	movs r1, #3
	bl __divsi3
	subs r0, #5
	b _080A503C
_080A5032:
	ldr r0, [r4, #0x38]
	movs r1, #3
	bl __divsi3
	subs r0, #4
_080A503C:
	lsls r0, r0, #4
	str r0, [r4, #0x34]
_080A5040:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

