	.syntax unified
	.set UpdateVolumeGraphBuffer, 0x080B3DC0 + 1
	.section .text.VolumeGraphBuffer_Loop, "ax", %progbits
@ VolumeGraphBuffer_Loop @ JP 0x080B3E4C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global VolumeGraphBuffer_Loop
	.thumb_func
VolumeGraphBuffer_Loop:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r4, r0, #0
	movs r7, #0
	movs r5, #0
	movs r0, #0xff
	mov r8, r0
	mov ip, r0
	movs r6, #0
	ldr r1, _080B3F4C @ =0x08A9E244
	mov sb, r1
	movs r2, #0xd4
	lsls r2, r2, #2
	mov sl, r2
_080B3E70:
	mov r0, sb
	ldr r2, [r0]
	lsls r3, r6, #1
	adds r2, r3, r2
	str r2, [sp]
	ldr r2, _080B3F50 @ =0x08A9E26C
	ldr r1, [r2]
	ldr r0, [r4, #0x2c]
	movs r2, #0xc6
	lsls r2, r2, #3
	adds r0, r0, r2
	add r1, sl
	adds r1, r1, r0
	ldrb r0, [r1]
	subs r0, #0x80
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x19
	ldr r1, [sp]
	strb r0, [r1]
	mov r0, sb
	ldr r2, [r0]
	adds r2, r3, r2
	ldr r1, _080B3F50 @ =0x08A9E26C
	ldr r0, [r1]
	add r0, sl
	ldr r1, [r4, #0x2c]
	adds r0, r0, r1
	ldrb r0, [r0]
	subs r0, #0x80
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x19
	movs r1, #0xf0
	subs r1, r1, r0
	strb r1, [r2, #1]
	mov r2, sb
	ldr r0, [r2]
	adds r3, r3, r0
	ldrb r0, [r3]
	cmp r0, r5
	bhs _080B3EC2
	adds r0, r5, #0
_080B3EC2:
	adds r5, r0, #0
	ldrb r0, [r3]
	cmp r0, ip
	bls _080B3ECC
	mov r0, ip
_080B3ECC:
	mov ip, r0
	ldrb r3, [r3, #1]
	adds r0, r3, #0
	cmp r3, r7
	bhs _080B3ED8
	adds r3, r7, #0
_080B3ED8:
	adds r7, r3, #0
	adds r1, r0, #0
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
	cmp r0, r8
	bls _080B3EE6
	mov r1, r8
_080B3EE6:
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
	mov r8, r0
	ldr r0, [r4, #0x2c]
	adds r1, r0, #1
	str r1, [r4, #0x2c]
	ldr r0, _080B3F54 @ =0x0000062F
	cmp r1, r0
	ble _080B3F00
	movs r2, #0xc6
	lsls r2, r2, #3
	subs r0, r1, r2
	str r0, [r4, #0x2c]
_080B3F00:
	adds r6, #1
	cmp r6, #0xdf
	ble _080B3E70
	mov r1, ip
	subs r0, r5, r1
	cmp r0, #0x3f
	ble _080B3F10
	movs r0, #0x3f
_080B3F10:
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	mov r2, r8
	subs r0, r7, r2
	cmp r0, #0x3f
	ble _080B3F1E
	movs r0, #0x3f
_080B3F1E:
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	lsls r0, r5, #1
	adds r0, r0, r5
	asrs r1, r0, #2
	movs r0, #0
	bl UpdateVolumeGraphBuffer
	lsls r0, r7, #1
	adds r0, r0, r7
	asrs r1, r0, #2
	movs r0, #1
	bl UpdateVolumeGraphBuffer
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B3F4C: .4byte 0x08A9E244
_080B3F50: .4byte 0x08A9E26C
_080B3F54: .4byte 0x0000062F

