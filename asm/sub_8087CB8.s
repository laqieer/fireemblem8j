	.syntax unified
	.set InitScanline, 0x080841B8 + 1
	.set SetBlendConfig, 0x08001DF0 + 1
	.set SetBlendTargetA, 0x08001E20 + 1
	.set SetPrimaryHBlankHandler, 0x08001D28 + 1
	.set m4aSongNumStart, 0x080D4EF4 + 1
	.section .text.sub_8087CB8, "ax", %progbits
@ sub_8087CB8 @ JP 0x08087CB8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8087CB8
	.thumb_func
sub_8087CB8:
	push {r4, r5, r6, lr}
	mov r6, sl
	mov r5, sb
	mov r4, r8
	push {r4, r5, r6}
	sub sp, #4
	movs r4, #0
	str r4, [r0, #0x2c]
	bl InitScanline
	movs r0, #1
	str r0, [sp]
	movs r1, #1
	movs r2, #1
	movs r3, #1
	bl SetBlendTargetA
	ldr r2, _08087D88 @ =0x03003020
	adds r0, r2, #0
	adds r0, #0x2d
	strb r4, [r0]
	adds r0, #4
	strb r4, [r0]
	adds r1, r2, #0
	adds r1, #0x2c
	movs r0, #0xf0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0xa0
	strb r0, [r1]
	ldrb r0, [r2, #1]
	movs r1, #0x20
	mov r8, r1
	mov r1, r8
	orrs r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r2, #1]
	movs r0, #0x34
	adds r0, r0, r2
	mov ip, r0
	ldrb r1, [r0]
	mov r0, r8
	orrs r1, r0
	adds r2, #0x36
	mov sl, r2
	ldrb r2, [r2]
	movs r0, #0x21
	rsbs r0, r0, #0
	mov sb, r0
	ands r0, r2
	movs r6, #1
	orrs r1, r6
	movs r5, #2
	orrs r1, r5
	movs r4, #4
	orrs r1, r4
	movs r3, #8
	orrs r1, r3
	movs r2, #0x10
	orrs r1, r2
	orrs r0, r6
	orrs r0, r5
	orrs r0, r4
	orrs r0, r3
	orrs r0, r2
	mov r2, r8
	orrs r1, r2
	mov r2, ip
	strb r1, [r2]
	mov r1, sb
	ands r0, r1
	mov r2, sl
	strb r0, [r2]
	movs r0, #2
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl SetBlendConfig
	ldr r0, _08087D8C @ =WorldFlushHBlank
	bl SetPrimaryHBlankHandler
	ldr r0, _08087D90 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08087D76
	ldr r0, _08087D94 @ =0x00000269
	bl m4aSongNumStart
_08087D76:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08087D88: .4byte 0x03003020
_08087D8C: .4byte 0x08084B9D  @ WorldFlushHBlank
_08087D90: .4byte 0x0202BCEC
_08087D94: .4byte 0x00000269

