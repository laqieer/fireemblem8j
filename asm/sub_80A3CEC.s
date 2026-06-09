	.syntax unified
	.set SetBlendConfig, 0x08001DF0 + 1
	.set SetBlendTargetA, 0x08001E20 + 1
	.set SetBlendTargetB, 0x08001E5C + 1
	.set m4aSongNumStart, 0x080D4EF4 + 1
	.section .text.sub_80A3CEC, "ax", %progbits
@ sub_80A3CEC @ JP 0x080A3CEC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A3CEC
	.thumb_func
sub_80A3CEC:
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	ldr r5, _080A3DC0 @ =0x03003020
	ldrb r2, [r5, #0xc]
	movs r3, #4
	rsbs r3, r3, #0
	adds r1, r3, #0
	ands r1, r2
	movs r7, #1
	orrs r1, r7
	strb r1, [r5, #0xc]
	ldrb r1, [r5, #0x10]
	movs r2, #3
	orrs r1, r2
	strb r1, [r5, #0x10]
	ldrb r2, [r5, #0x14]
	adds r1, r3, #0
	ands r1, r2
	movs r4, #2
	orrs r1, r4
	strb r1, [r5, #0x14]
	ldrb r1, [r5, #0x18]
	ands r3, r1
	strb r3, [r5, #0x18]
	movs r6, #0
	str r6, [r0, #0x2c]
	movs r0, #1
	movs r1, #0
	movs r2, #0x10
	movs r3, #0
	bl SetBlendConfig
	str r6, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #1
	bl SetBlendTargetA
	movs r0, #1
	str r0, [sp]
	movs r1, #1
	movs r2, #1
	movs r3, #0
	bl SetBlendTargetB
	ldr r0, _080A3DC4 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A3D5A
	movs r0, #0xc8
	bl m4aSongNumStart
_080A3D5A:
	ldrb r0, [r5, #1]
	movs r1, #0x20
	orrs r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r5, #1]
	adds r2, r5, #0
	adds r2, #0x34
	ldrb r0, [r2]
	orrs r0, r7
	orrs r0, r4
	movs r1, #4
	orrs r0, r1
	movs r4, #8
	orrs r0, r4
	movs r3, #0x10
	orrs r0, r3
	strb r0, [r2]
	adds r2, #2
	ldrb r1, [r2]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #2
	ands r0, r1
	orrs r0, r4
	orrs r0, r3
	strb r0, [r2]
	adds r0, r5, #0
	adds r0, #0x2d
	strb r6, [r0]
	adds r0, #4
	strb r6, [r0]
	adds r1, r5, #0
	adds r1, #0x2c
	movs r0, #0xf0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0xa0
	strb r0, [r1]
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A3DC0: .4byte 0x03003020
_080A3DC4: .4byte 0x0202BCEC

