	.syntax unified
	.set __pack_d, 0x080DA9A0 + 1
	.set __unpack_d, 0x080DAAE8 + 1
	.section .text.__divdf3, "ax", %progbits
@ __divdf3 @ JP 0x080DB13C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global __divdf3
	.thumb_func
__divdf3:
	push {r4, r5, r6, r7, lr}
	sub sp, #0x48
	str r0, [sp, #0x28]
	str r1, [sp, #0x2c]
	str r2, [sp, #0x30]
	str r3, [sp, #0x34]
	add r0, sp, #0x28
	mov r1, sp
	bl __unpack_d
	add r0, sp, #0x30
	add r4, sp, #0x14
	adds r1, r4, #0
	bl __unpack_d
	mov ip, sp
	movs r0, #0
	ldr r3, [sp]
	cmp r3, #1
	bhi _080DB166
	movs r0, #1
_080DB166:
	cmp r0, #0
	beq _080DB16E
	mov r1, sp
	b _080DB2B0
_080DB16E:
	movs r0, #0
	ldr r2, [sp, #0x14]
	adds r5, r2, #0
	cmp r2, #1
	bhi _080DB17A
	movs r0, #1
_080DB17A:
	cmp r0, #0
	beq _080DB182
	adds r1, r4, #0
	b _080DB2B0
_080DB182:
	ldr r0, [sp, #4]
	ldr r1, [sp, #0x18]
	eors r0, r1
	str r0, [sp, #4]
	movs r0, #0
	cmp r3, #4
	bne _080DB192
	movs r0, #1
_080DB192:
	cmp r0, #0
	bne _080DB1A2
	movs r4, #0
	cmp r3, #2
	bne _080DB19E
	movs r4, #1
_080DB19E:
	cmp r4, #0
	beq _080DB1B4
_080DB1A2:
	mov r1, ip
	ldr r0, [r1]
	cmp r0, r5
	beq _080DB1AC
	b _080DB2B0
_080DB1AC:
	ldr r1, _080DB1B0 @ =0x03002BE0
	b _080DB2B0
	.align 2, 0
_080DB1B0: .4byte 0x03002BE0
_080DB1B4:
	movs r0, #0
	cmp r2, #4
	bne _080DB1BC
	movs r0, #1
_080DB1BC:
	cmp r0, #0
	beq _080DB1CE
	movs r0, #0
	movs r1, #0
	str r0, [sp, #0xc]
	str r1, [sp, #0x10]
	str r4, [sp, #8]
	mov r1, sp
	b _080DB2B0
_080DB1CE:
	movs r0, #0
	cmp r2, #2
	bne _080DB1D6
	movs r0, #1
_080DB1D6:
	cmp r0, #0
	beq _080DB1E2
	movs r0, #4
	mov r2, ip
	str r0, [r2]
	b _080DB2AE
_080DB1E2:
	mov r3, ip
	ldr r1, [r3, #8]
	ldr r0, [sp, #0x1c]
	subs r6, r1, r0
	str r6, [r3, #8]
	ldr r4, [r3, #0xc]
	ldr r5, [r3, #0x10]
	ldr r0, [sp, #0x20]
	ldr r1, [sp, #0x24]
	str r0, [sp, #0x38]
	str r1, [sp, #0x3c]
	cmp r1, r5
	bhi _080DB206
	ldr r1, [sp, #0x3c]
	cmp r1, r5
	bne _080DB21A
	cmp r0, r4
	bls _080DB21A
_080DB206:
	lsrs r3, r4, #0x1f
	lsls r2, r5, #1
	adds r1, r3, #0
	orrs r1, r2
	lsls r0, r4, #1
	adds r5, r1, #0
	adds r4, r0, #0
	subs r0, r6, #1
	mov r2, ip
	str r0, [r2, #8]
_080DB21A:
	ldr r7, _080DB2C0 @ =0x10000000
	ldr r6, _080DB2BC @ =0x00000000
	movs r0, #0
	movs r1, #0
	str r0, [sp, #0x40]
	str r1, [sp, #0x44]
_080DB226:
	ldr r1, [sp, #0x3c]
	cmp r1, r5
	bhi _080DB24A
	cmp r1, r5
	bne _080DB236
	ldr r2, [sp, #0x38]
	cmp r2, r4
	bhi _080DB24A
_080DB236:
	ldr r0, [sp, #0x40]
	orrs r0, r6
	ldr r1, [sp, #0x44]
	orrs r1, r7
	str r0, [sp, #0x40]
	str r1, [sp, #0x44]
	ldr r0, [sp, #0x38]
	ldr r1, [sp, #0x3c]
	subs r4, r4, r0
	sbcs r5, r1
_080DB24A:
	lsls r3, r7, #0x1f
	lsrs r2, r6, #1
	adds r0, r3, #0
	orrs r0, r2
	lsrs r1, r7, #1
	adds r7, r1, #0
	adds r6, r0, #0
	lsrs r3, r4, #0x1f
	lsls r2, r5, #1
	adds r1, r3, #0
	orrs r1, r2
	lsls r0, r4, #1
	adds r5, r1, #0
	adds r4, r0, #0
	adds r0, r7, #0
	orrs r0, r6
	cmp r0, #0
	bne _080DB226
	movs r0, #0xff
	ldr r1, [sp, #0x40]
	ands r1, r0
	movs r2, #0
	cmp r1, #0x80
	bne _080DB2A4
	cmp r2, #0
	bne _080DB2A4
	adds r0, #1
	ldr r1, [sp, #0x40]
	ands r1, r0
	adds r0, r2, #0
	orrs r0, r1
	cmp r0, #0
	bne _080DB294
	adds r0, r5, #0
	orrs r0, r4
	cmp r0, #0
	beq _080DB2A4
_080DB294:
	movs r0, #0x80
	movs r1, #0
	ldr r2, [sp, #0x40]
	ldr r3, [sp, #0x44]
	adds r2, r2, r0
	adcs r3, r1
	str r2, [sp, #0x40]
	str r3, [sp, #0x44]
_080DB2A4:
	ldr r0, [sp, #0x40]
	ldr r1, [sp, #0x44]
	mov r2, ip
	str r0, [r2, #0xc]
	str r1, [r2, #0x10]
_080DB2AE:
	mov r1, ip
_080DB2B0:
	adds r0, r1, #0
	bl __pack_d
	add sp, #0x48
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_080DB2BC: .4byte 0x00000000
_080DB2C0: .4byte 0x10000000

