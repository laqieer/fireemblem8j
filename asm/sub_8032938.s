	.syntax unified
	.set sub_801B6B0, 0x0801B6B0 + 1
	.section .text.sub_8032938, "ax", %progbits
@ sub_8032938 @ JP 0x08032938 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8032938
	.thumb_func
sub_8032938:
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x18
	asrs r3, r0, #0x18
	ldr r2, _080329D0 @ =0x085C6080
	ldr r0, [r2]
	adds r1, r0, #0
	adds r1, #0x2c
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, r3
	blt _080329CA
	subs r0, r3, #1
	strb r0, [r1]
	ldr r3, [r2]
	adds r0, r3, #0
	adds r0, #0x2c
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r0, #0x29
	adds r0, r0, r1
	adds r1, r3, #0
	adds r1, #0x2b
	ldrb r1, [r1]
	strb r1, [r0]
	movs r6, #1
	ldr r0, [r2]
	adds r0, #0x2c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r6, r0
	bgt _080329CA
	adds r7, r2, #0
_0803297A:
	bl sub_801B6B0
	ldr r2, [r7]
	adds r4, r2, #0
	adds r4, #0x55
	adds r5, r4, r6
	subs r1, r6, #1
	adds r4, r4, r1
	adds r1, r2, #0
	adds r1, #0x41
	adds r1, r1, r6
	movs r3, #0
	ldrsb r3, [r1, r3]
	ldr r1, _080329D4 @ =0x0202E4D8
	ldr r1, [r1]
	lsls r3, r3, #2
	adds r3, r3, r1
	adds r2, #0x2d
	adds r2, r2, r6
	ldrb r2, [r2]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	ldr r1, [r3]
	adds r1, r1, r2
	ldrb r1, [r1]
	adds r0, r0, r1
	ldrb r1, [r4]
	ldrb r0, [r0]
	subs r1, r1, r0
	strb r1, [r5]
	adds r0, r6, #1
	lsls r0, r0, #0x18
	asrs r6, r0, #0x18
	ldr r0, [r7]
	adds r0, #0x2c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r6, r0
	ble _0803297A
_080329CA:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080329D0: .4byte 0x085C6080
_080329D4: .4byte 0x0202E4D8

