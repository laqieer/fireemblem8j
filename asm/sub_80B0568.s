	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_80B0568, "ax", %progbits
@ sub_80B0568 @ JP 0x080B0568 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B0568
	.thumb_func
sub_80B0568:
	push {r4, lr}
	mov ip, r0
	mov r2, ip
	adds r2, #0x29
	adds r0, #0x2b
	ldrb r0, [r0]
	ldrb r1, [r2]
	adds r0, r0, r1
	strb r0, [r2]
	ldr r3, _080B05D8 @ =0x03003020
	ldrb r1, [r3, #1]
	movs r0, #0x21
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r3, #1]
	mov r0, ip
	adds r0, #0x2a
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	ble _080B05DC
	ldrb r1, [r2]
	lsls r0, r1, #1
	adds r0, r0, r1
	adds r1, r3, #0
	adds r1, #0x2f
	strb r0, [r1]
	ldrb r0, [r2]
	lsls r0, r0, #1
	adds r1, #4
	strb r0, [r1]
	ldrb r1, [r2]
	lsls r0, r1, #1
	adds r0, r0, r1
	movs r4, #0x10
	rsbs r4, r4, #0
	adds r1, r4, #0
	subs r1, r1, r0
	adds r0, r3, #0
	adds r0, #0x2e
	strb r1, [r0]
	ldrb r0, [r2]
	lsls r0, r0, #1
	movs r2, #0x60
	rsbs r2, r2, #0
	adds r1, r2, #0
	subs r1, r1, r0
	adds r0, r3, #0
	adds r0, #0x32
	strb r1, [r0]
	b _080B0612
	.align 2, 0
_080B05D8: .4byte 0x03003020
_080B05DC:
	ldrb r1, [r2]
	lsls r0, r1, #1
	adds r0, r0, r1
	movs r1, #0x78
	subs r1, r1, r0
	adds r0, r3, #0
	adds r0, #0x2f
	strb r1, [r0]
	ldrb r0, [r2]
	lsls r0, r0, #1
	movs r1, #0x50
	subs r1, r1, r0
	adds r0, r3, #0
	adds r0, #0x33
	strb r1, [r0]
	ldrb r1, [r2]
	lsls r0, r1, #1
	adds r0, r0, r1
	adds r0, #0x78
	adds r1, r3, #0
	adds r1, #0x2e
	strb r0, [r1]
	ldrb r0, [r2]
	lsls r0, r0, #1
	adds r0, #0x50
	adds r1, #4
	strb r0, [r1]
_080B0612:
	adds r2, r3, #0
	adds r2, #0x35
	ldrb r0, [r2]
	movs r1, #1
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2]
	adds r2, #1
	ldrb r1, [r2]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #2
	ands r0, r1
	subs r1, #4
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r2]
	mov r0, ip
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #0x27
	bls _080B065C
	mov r0, ip
	bl sub_8002DE4
_080B065C:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

