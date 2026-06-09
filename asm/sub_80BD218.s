	.syntax unified
	.set EndFaceById, 0x08005660 + 1
	.set SetBlendConfig, 0x08001DF0 + 1
	.set SetFaceDisplayBits, 0x08005678 + 1
	.set sub_80056AC, 0x080056AC + 1
	.section .text.sub_80BD218, "ax", %progbits
@ sub_80BD218 @ JP 0x080BD218 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80BD218
	.thumb_func
sub_80BD218:
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r7, r0, #0
	adds r4, r7, #0
	adds r4, #0x31
	ldrb r1, [r4]
	lsrs r1, r1, #1
	movs r2, #0x10
	subs r2, r2, r1
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	movs r0, #1
	movs r3, #0
	bl SetBlendConfig
	adds r1, r7, #0
	adds r1, #0x30
	ldrb r0, [r1]
	ldrb r2, [r4]
	adds r0, r0, r2
	strb r0, [r4]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080BD29A
	movs r6, #0
	mov r8, r1
	movs r0, #1
	rsbs r0, r0, #0
	mov sb, r0
	movs r4, #0
	movs r5, #0
_080BD25A:
	ldr r1, [r7, #0x2c]
	adds r0, r1, #0
	adds r0, #0x30
	adds r0, r0, r4
	ldr r0, [r0]
	cmp r0, #0
	beq _080BD28C
	adds r0, r1, r4
	adds r0, #0x36
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, sb
	bne _080BD28C
	adds r0, r6, #0
	bl EndFaceById
	ldr r0, [r7, #0x2c]
	adds r0, r0, r4
	adds r0, #0x36
	strb r5, [r0]
	ldr r0, [r7, #0x2c]
	adds r0, #0x30
	adds r0, r0, r4
	str r5, [r0]
_080BD28C:
	adds r4, #0xc
	adds r6, #1
	cmp r6, #1
	ble _080BD25A
	movs r0, #0
	mov r1, r8
	strb r0, [r1]
_080BD29A:
	adds r0, r7, #0
	adds r0, #0x31
	ldrb r0, [r0]
	cmp r0, #0x20
	bne _080BD2F2
	movs r2, #0x30
	adds r2, r2, r7
	mov r8, r2
	movs r5, #0
	movs r6, #1
_080BD2AE:
	ldr r1, [r7, #0x2c]
	adds r0, r1, #0
	adds r0, #0x30
	adds r0, r0, r5
	ldr r4, [r0]
	cmp r4, #0
	beq _080BD2E4
	adds r0, r1, r5
	adds r0, #0x36
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _080BD2E4
	adds r0, r4, #0
	bl sub_80056AC
	ldr r1, _080BD300 @ =0xFFFFFBFF
	ands r1, r0
	adds r0, r4, #0
	bl SetFaceDisplayBits
	ldr r0, [r7, #0x2c]
	adds r0, r0, r5
	adds r0, #0x36
	movs r1, #0
	strb r1, [r0]
_080BD2E4:
	adds r5, #0xc
	subs r6, #1
	cmp r6, #0
	bge _080BD2AE
	movs r0, #0
	mov r1, r8
	strb r0, [r1]
_080BD2F2:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BD300: .4byte 0xFFFFFBFF

