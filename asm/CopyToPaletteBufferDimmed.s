	.syntax unified
	.section .text.CopyToPaletteBufferDimmed, "ax", %progbits
@ CopyToPaletteBufferDimmed @ JP 0x08000DC4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global CopyToPaletteBufferDimmed
	.thumb_func
CopyToPaletteBufferDimmed:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r7, r2, #0
	adds r6, r3, #0
	asrs r1, r1, #1
	lsls r1, r1, #1
	ldr r2, _08000E44 @ =0x020228A8
	adds r5, r1, r2
	adds r4, r0, #0
	ldr r0, _08000E48 @ =0x0300000D
	mov sl, r0
	cmp r7, #0
	ble _08000E2E
	movs r1, #0x1f
	mov sb, r1
	movs r2, #0xf8
	lsls r2, r2, #2
	mov r8, r2
	movs r0, #0xf8
	lsls r0, r0, #7
	mov ip, r0
	adds r3, r7, #0
_08000DF6:
	ldrh r2, [r4]
	movs r0, #0x1f
	ands r0, r2
	adds r1, r0, #0
	muls r1, r6, r1
	asrs r1, r1, #6
	mov r7, sb
	ands r1, r7
	mov r0, r8
	ands r0, r2
	muls r0, r6, r0
	asrs r0, r0, #6
	mov r7, r8
	ands r0, r7
	adds r1, r1, r0
	mov r0, ip
	ands r0, r2
	muls r0, r6, r0
	asrs r0, r0, #6
	mov r2, ip
	ands r0, r2
	adds r1, r1, r0
	strh r1, [r5]
	adds r5, #2
	adds r4, #2
	subs r3, #1
	cmp r3, #0
	bne _08000DF6
_08000E2E:
	movs r0, #1
	mov r7, sl
	strb r0, [r7]
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08000E44: .4byte 0x020228A8
_08000E48: .4byte 0x0300000D

