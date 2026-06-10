	.syntax unified
	.set _Balloc, 0x080D9968 + 1
	.set _Bfree, 0x080D99C0 + 1
	.set __adddf3, 0x080DAE2C + 1
	.set __divdf3, 0x080DB13C + 1
	.set __eqdf2, 0x080DB3F0 + 1
	.set __fixdfsi, 0x080DB634 + 1
	.set __floatsidf, 0x080DB5B8 + 1
	.set __gtdf2, 0x080DB488 + 1
	.set __ledf2, 0x080DB56C + 1
	.set __ltdf2, 0x080DB520 + 1
	.set __mcmp, 0x080D9E88 + 1
	.set __mdiff, 0x080D9EC8 + 1
	.set __nedf2, 0x080DB43C + 1
	.set __negdf2, 0x080DB6A8 + 1
	.set __subdf3, 0x080DAE5C + 1
	.set _d2b, 0x080DA0C0 + 1
	.set _hi0bits, 0x080D9AF4 + 1
	.set _i2b, 0x080D9BD0 + 1
	.set _lshift, 0x080D9DE8 + 1
	.set _multiply, 0x080D9BE4 + 1
	.set _pow5mult, 0x080D9D50 + 1
	.set memcpy, 0x080D6908 + 1
	.set sub_80D7C98, 0x080D7C98 + 1
	.set sub_80D8ADE, 0x080D8ADE + 1
	.set sub_80D99D8, 0x080D99D8 + 1
	.set sub_80DAE94, 0x080DAE94 + 1
	.section .text._dtoa_r, "ax", %progbits
@ _dtoa_r @ JP 0x080D7DF4-0x080D8AEC - region-different, gbadisasm descriptive asm (merged run, D24)
	.thumb
	.global _dtoa_r
	.thumb_func
_dtoa_r:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x84
	mov sl, r0
	str r3, [sp, #0xc]
	ldr r4, [sp, #0xac]
	str r1, [sp, #0x40]
	str r2, [sp, #0x44]
	ldr r2, [r0, #0x40]
	cmp r2, #0
	beq _080D7E2C
	ldr r0, [r0, #0x44]
	str r0, [r2, #4]
	mov r0, sl
	ldr r1, [r0, #0x44]
	movs r0, #1
	lsls r0, r1
	str r0, [r2, #8]
	mov r0, sl
	adds r1, r2, #0
	bl _Bfree
	movs r0, #0
	mov r1, sl
	str r0, [r1, #0x40]
_080D7E2C:
	movs r0, #0x80
	lsls r0, r0, #0x18
	ldr r1, [sp, #0x40]
	ands r0, r1
	cmp r0, #0
	beq _080D7E48
	movs r0, #1
	str r0, [r4]
	ldr r0, _080D7E44 @ =0x7FFFFFFF
	ands r1, r0
	str r1, [sp, #0x40]
	b _080D7E4A
	.align 2, 0
_080D7E44: .4byte 0x7FFFFFFF
_080D7E48:
	str r0, [r4]
_080D7E4A:
	ldr r1, _080D7E8C @ =0x7FF00000
	ldr r2, [sp, #0x40]
	adds r0, r2, #0
	ands r0, r1
	cmp r0, r1
	bne _080D7EA0
	ldr r0, _080D7E90 @ =0x0000270F
	ldr r3, [sp, #0xa8]
	str r0, [r3]
	ldr r0, _080D7E94 @ =0x0857743C
	mov sb, r0
	ldr r1, [sp, #0x44]
	cmp r1, #0
	bne _080D7E72
	ldr r0, _080D7E98 @ =0x000FFFFF
	ands r2, r0
	cmp r2, #0
	bne _080D7E72
	ldr r2, _080D7E9C @ =0x08577430
	mov sb, r2
_080D7E72:
	ldr r3, [sp, #0xb0]
	cmp r3, #0
	beq _080D7EC4
	mov r1, sb
	ldrb r0, [r1, #3]
	adds r1, #3
	cmp r0, #0
	beq _080D7E84
	adds r1, #5
_080D7E84:
	ldr r2, [sp, #0xb0]
	str r1, [r2]
	b _080D7EC4
	.align 2, 0
_080D7E8C: .4byte 0x7FF00000
_080D7E90: .4byte 0x0000270F
_080D7E94: .4byte 0x0857743C
_080D7E98: .4byte 0x000FFFFF
_080D7E9C: .4byte 0x08577430
_080D7EA0:
	ldr r3, _080D7ED0 @ =0x00000000
	ldr r2, _080D7ECC @ =0x00000000
	ldr r0, [sp, #0x40]
	ldr r1, [sp, #0x44]
	bl __eqdf2
	cmp r0, #0
	bne _080D7ED8
	movs r0, #1
	ldr r3, [sp, #0xa8]
	str r0, [r3]
	ldr r0, _080D7ED4 @ =0x08577440
	mov sb, r0
	ldr r1, [sp, #0xb0]
	cmp r1, #0
	beq _080D7EC4
	adds r0, #1
	str r0, [r1]
_080D7EC4:
	mov r0, sb
	bl sub_80D8ADE
	.align 2, 0
_080D7ECC: .4byte 0x00000000
_080D7ED0: .4byte 0x00000000
_080D7ED4: .4byte 0x08577440
_080D7ED8:
	add r0, sp, #8
	str r0, [sp]
	mov r0, sl
	ldr r1, [sp, #0x40]
	ldr r2, [sp, #0x44]
	add r3, sp, #4
	bl _d2b
	str r0, [sp, #0x5c]
	ldr r2, [sp, #0x40]
	lsls r0, r2, #1
	lsrs r0, r0, #0x15
	mov r8, r0
	cmp r0, #0
	beq _080D7F28
	ldr r0, [sp, #0x40]
	ldr r1, [sp, #0x44]
	str r0, [sp, #0x48]
	str r1, [sp, #0x4c]
	ldr r0, _080D7F1C @ =0x000FFFFF
	ldr r1, [sp, #0x48]
	ands r1, r0
	str r1, [sp, #0x48]
	ldr r0, _080D7F20 @ =0x3FF00000
	adds r2, r1, #0
	orrs r2, r0
	str r2, [sp, #0x48]
	ldr r3, _080D7F24 @ =0xFFFFFC01
	add r8, r3
	movs r0, #0
	str r0, [sp, #0x58]
	ldr r6, [sp, #8]
	b _080D7F88
	.align 2, 0
_080D7F1C: .4byte 0x000FFFFF
_080D7F20: .4byte 0x3FF00000
_080D7F24: .4byte 0xFFFFFC01
_080D7F28:
	ldr r1, [sp, #8]
	ldr r0, [sp, #4]
	adds r2, r1, r0
	ldr r3, _080D7F50 @ =0x00000432
	adds r3, r3, r2
	mov r8, r3
	adds r6, r1, #0
	cmp r3, #0x20
	ble _080D7F58
	movs r0, #0x40
	subs r0, r0, r3
	ldr r4, [sp, #0x40]
	lsls r4, r0
	ldr r1, _080D7F54 @ =0x00000412
	adds r0, r2, r1
	ldr r2, [sp, #0x44]
	lsrs r2, r0
	adds r0, r2, #0
	orrs r4, r0
	b _080D7F62
	.align 2, 0
_080D7F50: .4byte 0x00000432
_080D7F54: .4byte 0x00000412
_080D7F58:
	movs r0, #0x20
	mov r3, r8
	subs r0, r0, r3
	ldr r4, [sp, #0x44]
	lsls r4, r0
_080D7F62:
	adds r0, r4, #0
	bl __floatsidf
	cmp r4, #0
	bge _080D7F74
	ldr r3, _080D8038 @ =0x00000000
	ldr r2, _080D8034 @ =0x41F00000
	bl __adddf3
_080D7F74:
	str r0, [sp, #0x48]
	str r1, [sp, #0x4c]
	ldr r1, _080D803C @ =0xFE100000
	ldr r0, [sp, #0x48]
	adds r1, r0, r1
	str r1, [sp, #0x48]
	ldr r2, _080D8040 @ =0xFFFFFBCD
	add r8, r2
	movs r3, #1
	str r3, [sp, #0x58]
_080D7F88:
	ldr r2, _080D8044 @ =0x3FF80000
	ldr r3, _080D8048 @ =0x00000000
	ldr r0, [sp, #0x48]
	ldr r1, [sp, #0x4c]
	bl __subdf3
	ldr r2, _080D804C @ =0x3FD287A7
	ldr r3, _080D8050 @ =0x636F4361
	bl sub_80DAE94
	ldr r2, _080D8054 @ =0x3FC68A28
	ldr r3, _080D8058 @ =0x8B60C8B3
	bl __adddf3
	adds r5, r1, #0
	adds r4, r0, #0
	mov r0, r8
	bl __floatsidf
	ldr r2, _080D805C @ =0x3FD34413
	ldr r3, _080D8060 @ =0x509F79FB
	bl sub_80DAE94
	adds r3, r1, #0
	adds r2, r0, #0
	adds r1, r5, #0
	adds r0, r4, #0
	bl __adddf3
	str r0, [sp, #0x6c]
	str r1, [sp, #0x70]
	bl __fixdfsi
	str r0, [sp, #0x24]
	ldr r2, _080D8064 @ =0x00000000
	ldr r3, _080D8068 @ =0x00000000
	ldr r0, [sp, #0x6c]
	ldr r1, [sp, #0x70]
	bl __ltdf2
	cmp r0, #0
	bge _080D7FF8
	ldr r0, [sp, #0x24]
	bl __floatsidf
	adds r3, r1, #0
	adds r2, r0, #0
	ldr r0, [sp, #0x6c]
	ldr r1, [sp, #0x70]
	bl __nedf2
	cmp r0, #0
	beq _080D7FF8
	ldr r0, [sp, #0x24]
	subs r0, #1
	str r0, [sp, #0x24]
_080D7FF8:
	movs r1, #1
	str r1, [sp, #0x2c]
	ldr r2, [sp, #0x24]
	cmp r2, #0x16
	bhi _080D8022
	ldr r1, _080D806C @ =0x0857748C
	lsls r0, r2, #3
	adds r0, r0, r1
	ldr r2, [r0]
	ldr r3, [r0, #4]
	ldr r0, [sp, #0x40]
	ldr r1, [sp, #0x44]
	bl __ltdf2
	cmp r0, #0
	bge _080D801E
	ldr r3, [sp, #0x24]
	subs r3, #1
	str r3, [sp, #0x24]
_080D801E:
	movs r0, #0
	str r0, [sp, #0x2c]
_080D8022:
	mov r1, r8
	subs r0, r6, r1
	subs r4, r0, #1
	cmp r4, #0
	blt _080D8070
	movs r2, #0
	str r2, [sp, #0x10]
	str r4, [sp, #0x34]
	b _080D8078
	.align 2, 0
_080D8034: .4byte 0x41F00000
_080D8038: .4byte 0x00000000
_080D803C: .4byte 0xFE100000
_080D8040: .4byte 0xFFFFFBCD
_080D8044: .4byte 0x3FF80000
_080D8048: .4byte 0x00000000
_080D804C: .4byte 0x3FD287A7
_080D8050: .4byte 0x636F4361
_080D8054: .4byte 0x3FC68A28
_080D8058: .4byte 0x8B60C8B3
_080D805C: .4byte 0x3FD34413
_080D8060: .4byte 0x509F79FB
_080D8064: .4byte 0x00000000
_080D8068: .4byte 0x00000000
_080D806C: .4byte 0x0857748C
_080D8070:
	rsbs r4, r4, #0
	str r4, [sp, #0x10]
	movs r3, #0
	str r3, [sp, #0x34]
_080D8078:
	ldr r0, [sp, #0x24]
	cmp r0, #0
	blt _080D808C
	movs r1, #0
	str r1, [sp, #0x14]
	str r0, [sp, #0x38]
	ldr r2, [sp, #0x34]
	adds r2, r2, r0
	str r2, [sp, #0x34]
	b _080D809C
_080D808C:
	ldr r3, [sp, #0x10]
	ldr r0, [sp, #0x24]
	subs r3, r3, r0
	str r3, [sp, #0x10]
	rsbs r1, r0, #0
	str r1, [sp, #0x14]
	movs r2, #0
	str r2, [sp, #0x38]
_080D809C:
	ldr r3, [sp, #0xc]
	cmp r3, #9
	bls _080D80A6
	movs r0, #0
	str r0, [sp, #0xc]
_080D80A6:
	movs r5, #1
	ldr r1, [sp, #0xc]
	cmp r1, #5
	ble _080D80B4
	subs r1, #4
	str r1, [sp, #0xc]
	movs r5, #0
_080D80B4:
	movs r2, #1
	str r2, [sp, #0x30]
	ldr r3, [sp, #0xc]
	cmp r3, #5
	bhi _080D812E
	lsls r0, r3, #2
	ldr r1, _080D80C8 @ =_080D80CC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080D80C8: .4byte _080D80CC
_080D80CC: @ jump table
	.4byte _080D80E4 @ case 0
	.4byte _080D80E4 @ case 1
	.4byte _080D80F6 @ case 2
	.4byte _080D8112 @ case 3
	.4byte _080D80FA @ case 4
	.4byte _080D8116 @ case 5
_080D80E4:
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [sp, #0x18]
	str r0, [sp, #0x20]
	movs r1, #0x12
	mov r8, r1
	movs r2, #0
	str r2, [sp, #0xa4]
	b _080D812E
_080D80F6:
	movs r3, #0
	str r3, [sp, #0x30]
_080D80FA:
	ldr r0, [sp, #0xa4]
	cmp r0, #0
	bgt _080D8104
	movs r1, #1
	str r1, [sp, #0xa4]
_080D8104:
	ldr r2, [sp, #0xa4]
	mov r8, r2
	mov r3, r8
	str r3, [sp, #0x20]
	mov r0, r8
	str r0, [sp, #0x18]
	b _080D812E
_080D8112:
	movs r1, #0
	str r1, [sp, #0x30]
_080D8116:
	ldr r2, [sp, #0xa4]
	ldr r3, [sp, #0x24]
	adds r0, r2, r3
	adds r1, r0, #1
	mov r8, r1
	mov r2, r8
	str r2, [sp, #0x18]
	str r0, [sp, #0x20]
	cmp r1, #0
	bgt _080D812E
	movs r3, #1
	mov r8, r3
_080D812E:
	movs r4, #4
	movs r0, #0
	mov r1, sl
	str r0, [r1, #0x44]
	mov r2, r8
	cmp r2, #0x17
	bls _080D814E
	movs r1, #0
_080D813E:
	adds r1, #1
	lsls r4, r4, #1
	adds r0, r4, #0
	adds r0, #0x14
	cmp r0, r8
	bls _080D813E
	mov r3, sl
	str r1, [r3, #0x44]
_080D814E:
	mov r0, sl
	ldr r1, [r0, #0x44]
	bl _Balloc
	mov r1, sl
	str r0, [r1, #0x40]
	str r0, [sp, #0x74]
	mov sb, r0
	ldr r2, [sp, #0x18]
	cmp r2, #0xe
	bls _080D8166
	b _080D84D8
_080D8166:
	cmp r5, #0
	bne _080D816C
	b _080D84D8
_080D816C:
	ldr r0, [sp, #0x40]
	ldr r1, [sp, #0x44]
	str r0, [sp, #0x78]
	str r1, [sp, #0x7c]
	str r0, [sp, #0x48]
	str r1, [sp, #0x4c]
	ldr r1, [sp, #0x24]
	str r1, [sp, #0x28]
	str r2, [sp, #0x1c]
	movs r7, #2
	cmp r1, #0
	ble _080D81FC
	ldr r0, _080D81F4 @ =0x0857748C
	movs r2, #0xf
	ands r1, r2
	lsls r1, r1, #3
	adds r3, r1, r0
	ldr r0, [r3]
	ldr r1, [r3, #4]
	str r0, [sp, #0x6c]
	str r1, [sp, #0x70]
	ldr r1, [sp, #0x24]
	asrs r4, r1, #4
	movs r0, #0x10
	ands r0, r4
	cmp r0, #0
	beq _080D81B8
	ands r4, r2
	ldr r0, _080D81F8 @ =0x08577554
	ldr r2, [r0, #0x20]
	ldr r3, [r0, #0x24]
	ldr r0, [sp, #0x78]
	ldr r1, [sp, #0x7c]
	bl __divdf3
	str r0, [sp, #0x40]
	str r1, [sp, #0x44]
	movs r7, #3
_080D81B8:
	cmp r4, #0
	beq _080D81E0
	ldr r5, _080D81F8 @ =0x08577554
_080D81BE:
	movs r0, #1
	ands r0, r4
	cmp r0, #0
	beq _080D81D8
	adds r7, #1
	ldr r2, [r5]
	ldr r3, [r5, #4]
	ldr r0, [sp, #0x6c]
	ldr r1, [sp, #0x70]
	bl sub_80DAE94
	str r0, [sp, #0x6c]
	str r1, [sp, #0x70]
_080D81D8:
	asrs r4, r4, #1
	adds r5, #8
	cmp r4, #0
	bne _080D81BE
_080D81E0:
	ldr r0, [sp, #0x40]
	ldr r1, [sp, #0x44]
	ldr r2, [sp, #0x6c]
	ldr r3, [sp, #0x70]
	bl __divdf3
	str r0, [sp, #0x40]
	str r1, [sp, #0x44]
	b _080D8248
	.align 2, 0
_080D81F4: .4byte 0x0857748C
_080D81F8: .4byte 0x08577554
_080D81FC:
	ldr r2, [sp, #0x24]
	rsbs r6, r2, #0
	cmp r6, #0
	beq _080D8248
	ldr r1, _080D82F0 @ =0x0857748C
	movs r0, #0xf
	ands r0, r6
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, [r0, #4]
	ldr r0, [r0]
	ldr r2, [sp, #0x78]
	ldr r3, [sp, #0x7c]
	bl sub_80DAE94
	str r0, [sp, #0x40]
	str r1, [sp, #0x44]
	asrs r4, r6, #4
	cmp r4, #0
	beq _080D8248
	ldr r5, _080D82F4 @ =0x08577554
_080D8226:
	movs r0, #1
	ands r0, r4
	cmp r0, #0
	beq _080D8240
	adds r7, #1
	ldr r0, [r5]
	ldr r1, [r5, #4]
	ldr r2, [sp, #0x40]
	ldr r3, [sp, #0x44]
	bl sub_80DAE94
	str r0, [sp, #0x40]
	str r1, [sp, #0x44]
_080D8240:
	asrs r4, r4, #1
	adds r5, #8
	cmp r4, #0
	bne _080D8226
_080D8248:
	ldr r3, [sp, #0x2c]
	cmp r3, #0
	beq _080D8286
	ldr r2, _080D82F8 @ =0x3FF00000
	ldr r3, _080D82FC @ =0x00000000
	ldr r0, [sp, #0x40]
	ldr r1, [sp, #0x44]
	bl __ltdf2
	cmp r0, #0
	bge _080D8286
	ldr r0, [sp, #0x18]
	cmp r0, #0
	ble _080D8286
	ldr r1, [sp, #0x20]
	cmp r1, #0
	bgt _080D826C
	b _080D84C4
_080D826C:
	str r1, [sp, #0x18]
	ldr r2, [sp, #0x24]
	subs r2, #1
	str r2, [sp, #0x24]
	ldr r0, _080D8300 @ =0x40240000
	ldr r1, _080D8304 @ =0x00000000
	ldr r2, [sp, #0x40]
	ldr r3, [sp, #0x44]
	bl sub_80DAE94
	str r0, [sp, #0x40]
	str r1, [sp, #0x44]
	adds r7, #1
_080D8286:
	adds r0, r7, #0
	bl __floatsidf
	ldr r2, [sp, #0x40]
	ldr r3, [sp, #0x44]
	bl sub_80DAE94
	ldr r2, _080D8308 @ =0x401C0000
	ldr r3, _080D830C @ =0x00000000
	bl __adddf3
	str r0, [sp, #0x50]
	str r1, [sp, #0x54]
	ldr r0, _080D8310 @ =0xFCC00000
	ldr r3, [sp, #0x50]
	adds r0, r3, r0
	str r0, [sp, #0x50]
	ldr r1, [sp, #0x18]
	cmp r1, #0
	bne _080D831C
	movs r2, #0
	str r2, [sp, #0x64]
	movs r3, #0
	str r3, [sp, #0x68]
	ldr r2, _080D8314 @ =0x40140000
	ldr r3, _080D8318 @ =0x00000000
	ldr r0, [sp, #0x40]
	ldr r1, [sp, #0x44]
	bl __subdf3
	adds r5, r1, #0
	adds r4, r0, #0
	ldr r2, [sp, #0x50]
	ldr r3, [sp, #0x54]
	bl __gtdf2
	cmp r0, #0
	ble _080D82D4
	b _080D884E
_080D82D4:
	ldr r0, [sp, #0x50]
	ldr r1, [sp, #0x54]
	bl __negdf2
	adds r3, r1, #0
	adds r2, r0, #0
	adds r1, r5, #0
	adds r0, r4, #0
	bl __ltdf2
	cmp r0, #0
	bge _080D82EE
	b _080D8846
_080D82EE:
	b _080D84C4
	.align 2, 0
_080D82F0: .4byte 0x0857748C
_080D82F4: .4byte 0x08577554
_080D82F8: .4byte 0x3FF00000
_080D82FC: .4byte 0x00000000
_080D8300: .4byte 0x40240000
_080D8304: .4byte 0x00000000
_080D8308: .4byte 0x401C0000
_080D830C: .4byte 0x00000000
_080D8310: .4byte 0xFCC00000
_080D8314: .4byte 0x40140000
_080D8318: .4byte 0x00000000
_080D831C:
	ldr r0, [sp, #0x30]
	cmp r0, #0
	beq _080D83EC
	ldr r1, _080D834C @ =0x0857748C
	ldr r0, [sp, #0x18]
	subs r0, #1
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r2, [r0]
	ldr r3, [r0, #4]
	ldr r0, _080D8350 @ =0x3FE00000
	ldr r1, _080D8354 @ =0x00000000
	bl __divdf3
	ldr r2, [sp, #0x50]
	ldr r3, [sp, #0x54]
	bl __subdf3
	str r0, [sp, #0x50]
	str r1, [sp, #0x54]
	movs r1, #0
	mov r8, r1
	b _080D8378
	.align 2, 0
_080D834C: .4byte 0x0857748C
_080D8350: .4byte 0x3FE00000
_080D8354: .4byte 0x00000000
_080D8358:
	ldr r1, _080D83E0 @ =0x00000000
	ldr r0, _080D83DC @ =0x40240000
	ldr r2, [sp, #0x50]
	ldr r3, [sp, #0x54]
	bl sub_80DAE94
	str r0, [sp, #0x50]
	str r1, [sp, #0x54]
	ldr r1, _080D83E0 @ =0x00000000
	ldr r0, _080D83DC @ =0x40240000
	adds r3, r5, #0
	adds r2, r4, #0
	bl sub_80DAE94
	str r0, [sp, #0x40]
	str r1, [sp, #0x44]
_080D8378:
	ldr r0, [sp, #0x40]
	ldr r1, [sp, #0x44]
	bl __fixdfsi
	adds r6, r0, #0
	bl __floatsidf
	adds r3, r1, #0
	adds r2, r0, #0
	ldr r0, [sp, #0x40]
	ldr r1, [sp, #0x44]
	bl __subdf3
	adds r5, r1, #0
	adds r4, r0, #0
	adds r0, r6, #0
	adds r0, #0x30
	mov r2, sb
	strb r0, [r2]
	movs r3, #1
	add sb, r3
	adds r1, r5, #0
	adds r0, r4, #0
	ldr r2, [sp, #0x50]
	ldr r3, [sp, #0x54]
	bl __ltdf2
	cmp r0, #0
	bge _080D83B4
	b _080D8ABE
_080D83B4:
	ldr r0, _080D83E4 @ =0x3FF00000
	ldr r1, _080D83E8 @ =0x00000000
	adds r3, r5, #0
	adds r2, r4, #0
	bl __subdf3
	ldr r2, [sp, #0x50]
	ldr r3, [sp, #0x54]
	bl __ltdf2
	cmp r0, #0
	bge _080D83CE
	b _080D85D8
_080D83CE:
	movs r0, #1
	add r8, r0
	ldr r1, [sp, #0x18]
	cmp r8, r1
	blt _080D8358
	b _080D84C4
	.align 2, 0
_080D83DC: .4byte 0x40240000
_080D83E0: .4byte 0x00000000
_080D83E4: .4byte 0x3FF00000
_080D83E8: .4byte 0x00000000
_080D83EC:
	ldr r1, _080D840C @ =0x0857748C
	ldr r0, [sp, #0x18]
	subs r0, #1
	lsls r0, r0, #3
	adds r0, r0, r1
	ldr r1, [r0, #4]
	ldr r0, [r0]
	ldr r2, [sp, #0x50]
	ldr r3, [sp, #0x54]
	bl sub_80DAE94
	str r0, [sp, #0x50]
	str r1, [sp, #0x54]
	movs r2, #1
	mov r8, r2
	b _080D8424
	.align 2, 0
_080D840C: .4byte 0x0857748C
_080D8410:
	movs r3, #1
	add r8, r3
	ldr r1, _080D84B8 @ =0x00000000
	ldr r0, _080D84B4 @ =0x40240000
	adds r3, r5, #0
	adds r2, r4, #0
	bl sub_80DAE94
	str r0, [sp, #0x40]
	str r1, [sp, #0x44]
_080D8424:
	ldr r0, [sp, #0x40]
	ldr r1, [sp, #0x44]
	bl __fixdfsi
	adds r6, r0, #0
	bl __floatsidf
	adds r3, r1, #0
	adds r2, r0, #0
	ldr r0, [sp, #0x40]
	ldr r1, [sp, #0x44]
	bl __subdf3
	adds r5, r1, #0
	adds r4, r0, #0
	adds r0, r6, #0
	adds r0, #0x30
	mov r1, sb
	strb r0, [r1]
	movs r2, #1
	add sb, r2
	ldr r3, [sp, #0x18]
	cmp r8, r3
	bne _080D8410
	ldr r6, _080D84BC @ =0x3FE00000
	ldr r7, _080D84C0 @ =0x00000000
	adds r1, r7, #0
	adds r0, r6, #0
	ldr r2, [sp, #0x50]
	ldr r3, [sp, #0x54]
	bl __adddf3
	adds r3, r1, #0
	adds r2, r0, #0
	adds r1, r5, #0
	adds r0, r4, #0
	bl __gtdf2
	cmp r0, #0
	ble _080D8476
	b _080D85D8
_080D8476:
	adds r1, r7, #0
	adds r0, r6, #0
	ldr r2, [sp, #0x50]
	ldr r3, [sp, #0x54]
	bl __subdf3
	adds r3, r1, #0
	adds r2, r0, #0
	adds r1, r5, #0
	adds r0, r4, #0
	bl __ltdf2
	cmp r0, #0
	bge _080D84C4
	movs r0, #1
	rsbs r0, r0, #0
	add sb, r0
	mov r1, sb
	ldrb r1, [r1]
	cmp r1, #0x30
	beq _080D84A2
	b _080D85FE
_080D84A2:
	movs r2, #1
	rsbs r2, r2, #0
	add sb, r2
	mov r3, sb
	ldrb r3, [r3]
	cmp r3, #0x30
	beq _080D84A2
	b _080D85FE
	.align 2, 0
_080D84B4: .4byte 0x40240000
_080D84B8: .4byte 0x00000000
_080D84BC: .4byte 0x3FE00000
_080D84C0: .4byte 0x00000000
_080D84C4:
	ldr r1, [sp, #0x74]
	mov sb, r1
	ldr r2, [sp, #0x48]
	ldr r3, [sp, #0x4c]
	str r2, [sp, #0x40]
	str r3, [sp, #0x44]
	ldr r3, [sp, #0x28]
	str r3, [sp, #0x24]
	ldr r0, [sp, #0x1c]
	str r0, [sp, #0x18]
_080D84D8:
	ldr r0, [sp, #4]
	cmp r0, #0
	bge _080D84E0
	b _080D8614
_080D84E0:
	ldr r1, [sp, #0x24]
	cmp r1, #0xe
	ble _080D84E8
	b _080D8614
_080D84E8:
	ldr r1, _080D8534 @ =0x0857748C
	ldr r2, [sp, #0x24]
	lsls r0, r2, #3
	adds r0, r0, r1
	ldr r1, [r0]
	ldr r2, [r0, #4]
	str r1, [sp, #0x6c]
	str r2, [sp, #0x70]
	ldr r2, [sp, #0xa4]
	cmp r2, #0
	bge _080D8540
	ldr r3, [sp, #0x18]
	cmp r3, #0
	bgt _080D8540
	movs r0, #0
	str r0, [sp, #0x64]
	movs r1, #0
	str r1, [sp, #0x68]
	cmp r3, #0
	bge _080D8512
	b _080D8846
_080D8512:
	ldr r2, _080D8538 @ =0x40140000
	ldr r3, _080D853C @ =0x00000000
	ldr r0, [sp, #0x6c]
	ldr r1, [sp, #0x70]
	bl sub_80DAE94
	adds r3, r1, #0
	adds r2, r0, #0
	ldr r0, [sp, #0x40]
	ldr r1, [sp, #0x44]
	bl __ledf2
	cmp r0, #0
	bgt _080D8530
	b _080D8846
_080D8530:
	b _080D884E
	.align 2, 0
_080D8534: .4byte 0x0857748C
_080D8538: .4byte 0x40140000
_080D853C: .4byte 0x00000000
_080D8540:
	movs r2, #1
	mov r8, r2
	b _080D8564
_080D8546:
	ldr r1, _080D8608 @ =0x00000000
	ldr r0, _080D8604 @ =0x40240000
	bl sub_80DAE94
	str r0, [sp, #0x40]
	str r1, [sp, #0x44]
	ldr r2, _080D860C @ =0x00000000
	ldr r3, _080D8610 @ =0x00000000
	bl __eqdf2
	cmp r0, #0
	bne _080D8560
	b _080D8ABE
_080D8560:
	movs r3, #1
	add r8, r3
_080D8564:
	ldr r0, [sp, #0x40]
	ldr r1, [sp, #0x44]
	ldr r2, [sp, #0x6c]
	ldr r3, [sp, #0x70]
	bl __divdf3
	bl __fixdfsi
	adds r6, r0, #0
	bl __floatsidf
	ldr r2, [sp, #0x6c]
	ldr r3, [sp, #0x70]
	bl sub_80DAE94
	adds r3, r1, #0
	adds r2, r0, #0
	ldr r0, [sp, #0x40]
	ldr r1, [sp, #0x44]
	bl __subdf3
	adds r3, r1, #0
	adds r2, r0, #0
	adds r0, r6, #0
	adds r0, #0x30
	mov r1, sb
	strb r0, [r1]
	movs r0, #1
	add sb, r0
	ldr r1, [sp, #0x18]
	cmp r8, r1
	bne _080D8546
	adds r1, r3, #0
	adds r0, r2, #0
	bl __adddf3
	adds r5, r1, #0
	adds r4, r0, #0
	ldr r2, [sp, #0x6c]
	ldr r3, [sp, #0x70]
	bl __gtdf2
	cmp r0, #0
	bgt _080D85D8
	adds r1, r5, #0
	adds r0, r4, #0
	ldr r2, [sp, #0x6c]
	ldr r3, [sp, #0x70]
	bl __eqdf2
	cmp r0, #0
	beq _080D85CE
	b _080D8ABE
_080D85CE:
	movs r0, #1
	ands r0, r6
	cmp r0, #0
	bne _080D85D8
	b _080D8ABE
_080D85D8:
	movs r0, #0x30
_080D85DA:
	movs r2, #1
	rsbs r2, r2, #0
	add sb, r2
	mov r3, sb
	ldrb r3, [r3]
	cmp r3, #0x39
	bne _080D85F6
	ldr r1, [sp, #0x74]
	cmp sb, r1
	bne _080D85DA
	ldr r2, [sp, #0x24]
	adds r2, #1
	str r2, [sp, #0x24]
	strb r0, [r1]
_080D85F6:
	mov r3, sb
	ldrb r0, [r3]
	adds r0, #1
	strb r0, [r3]
_080D85FE:
	movs r0, #1
	add sb, r0
	b _080D8ABE
	.align 2, 0
_080D8604: .4byte 0x40240000
_080D8608: .4byte 0x00000000
_080D860C: .4byte 0x00000000
_080D8610: .4byte 0x00000000
_080D8614:
	ldr r5, [sp, #0x10]
	ldr r6, [sp, #0x14]
	movs r1, #0
	str r1, [sp, #0x60]
	movs r2, #0
	str r2, [sp, #0x64]
	ldr r3, [sp, #0x30]
	cmp r3, #0
	beq _080D868A
	ldr r1, [sp, #0xc]
	cmp r1, #1
	bgt _080D8648
	ldr r2, [sp, #0x58]
	cmp r2, #0
	beq _080D8640
	ldr r3, _080D863C @ =0x00000433
	adds r3, r3, r0
	mov r8, r3
	b _080D8674
	.align 2, 0
_080D863C: .4byte 0x00000433
_080D8640:
	ldr r1, [sp, #8]
	movs r0, #0x36
	subs r0, r0, r1
	b _080D8672
_080D8648:
	ldr r4, [sp, #0x18]
	subs r4, #1
	ldr r0, [sp, #0x14]
	cmp r0, r4
	blt _080D8656
	subs r6, r0, r4
	b _080D8666
_080D8656:
	ldr r1, [sp, #0x14]
	subs r4, r4, r1
	ldr r2, [sp, #0x38]
	adds r2, r2, r4
	str r2, [sp, #0x38]
	adds r1, r1, r4
	str r1, [sp, #0x14]
	movs r6, #0
_080D8666:
	ldr r3, [sp, #0x18]
	mov r8, r3
	cmp r3, #0
	bge _080D8674
	subs r5, r5, r3
	movs r0, #0
_080D8672:
	mov r8, r0
_080D8674:
	ldr r1, [sp, #0x10]
	add r1, r8
	str r1, [sp, #0x10]
	ldr r2, [sp, #0x34]
	add r2, r8
	str r2, [sp, #0x34]
	mov r0, sl
	movs r1, #1
	bl _i2b
	str r0, [sp, #0x64]
_080D868A:
	cmp r5, #0
	ble _080D86AC
	ldr r3, [sp, #0x34]
	cmp r3, #0
	ble _080D86AC
	mov r8, r3
	cmp r8, r5
	ble _080D869C
	mov r8, r5
_080D869C:
	ldr r0, [sp, #0x10]
	mov r1, r8
	subs r0, r0, r1
	str r0, [sp, #0x10]
	subs r5, r5, r1
	ldr r2, [sp, #0x34]
	subs r2, r2, r1
	str r2, [sp, #0x34]
_080D86AC:
	ldr r3, [sp, #0x14]
	cmp r3, #0
	ble _080D86FA
	ldr r0, [sp, #0x30]
	cmp r0, #0
	beq _080D86EE
	cmp r6, #0
	ble _080D86DE
	mov r0, sl
	ldr r1, [sp, #0x64]
	adds r2, r6, #0
	bl _pow5mult
	str r0, [sp, #0x64]
	mov r0, sl
	ldr r1, [sp, #0x64]
	ldr r2, [sp, #0x5c]
	bl _multiply
	adds r4, r0, #0
	mov r0, sl
	ldr r1, [sp, #0x5c]
	bl _Bfree
	str r4, [sp, #0x5c]
_080D86DE:
	ldr r1, [sp, #0x14]
	subs r4, r1, r6
	cmp r4, #0
	beq _080D86FA
	mov r0, sl
	ldr r1, [sp, #0x5c]
	adds r2, r4, #0
	b _080D86F4
_080D86EE:
	mov r0, sl
	ldr r1, [sp, #0x5c]
	ldr r2, [sp, #0x14]
_080D86F4:
	bl _pow5mult
	str r0, [sp, #0x5c]
_080D86FA:
	mov r0, sl
	movs r1, #1
	bl _i2b
	str r0, [sp, #0x68]
	ldr r2, [sp, #0x38]
	cmp r2, #0
	ble _080D8714
	mov r0, sl
	ldr r1, [sp, #0x68]
	bl _pow5mult
	str r0, [sp, #0x68]
_080D8714:
	ldr r3, [sp, #0xc]
	cmp r3, #1
	bgt _080D8750
	ldr r0, [sp, #0x44]
	cmp r0, #0
	bne _080D874C
	ldr r0, _080D8744 @ =0x000FFFFF
	ldr r1, [sp, #0x40]
	ands r0, r1
	cmp r0, #0
	bne _080D874C
	ldr r0, _080D8748 @ =0x7FF00000
	ands r1, r0
	cmp r1, #0
	beq _080D874C
	ldr r1, [sp, #0x10]
	adds r1, #1
	str r1, [sp, #0x10]
	ldr r2, [sp, #0x34]
	adds r2, #1
	str r2, [sp, #0x34]
	movs r3, #1
	str r3, [sp, #0x3c]
	b _080D8750
	.align 2, 0
_080D8744: .4byte 0x000FFFFF
_080D8748: .4byte 0x7FF00000
_080D874C:
	movs r0, #0
	str r0, [sp, #0x3c]
_080D8750:
	ldr r1, [sp, #0x38]
	cmp r1, #0
	beq _080D877C
	ldr r2, [sp, #0x68]
	ldr r1, [r2, #0x10]
	subs r1, #1
	lsls r1, r1, #2
	adds r0, r2, #0
	adds r0, #0x14
	adds r0, r0, r1
	ldr r0, [r0]
	bl _hi0bits
	ldr r1, [sp, #0x34]
	adds r1, #0x20
	subs r1, r1, r0
	mov r8, r1
	movs r0, #0x1f
	mov r3, r8
	ands r3, r0
	mov r8, r3
	b _080D878A
_080D877C:
	ldr r0, [sp, #0x34]
	adds r0, #1
	mov r8, r0
	movs r0, #0x1f
	mov r1, r8
	ands r1, r0
	mov r8, r1
_080D878A:
	mov r2, r8
	cmp r2, #0
	beq _080D8796
	movs r0, #0x20
	subs r2, r0, r2
	mov r8, r2
_080D8796:
	mov r3, r8
	cmp r3, #4
	ble _080D87A2
	movs r0, #4
	rsbs r0, r0, #0
	b _080D87AA
_080D87A2:
	mov r3, r8
	cmp r3, #3
	bgt _080D87BA
	movs r0, #0x1c
_080D87AA:
	add r8, r0
	ldr r1, [sp, #0x10]
	add r1, r8
	str r1, [sp, #0x10]
	add r5, r8
	ldr r2, [sp, #0x34]
	add r2, r8
	str r2, [sp, #0x34]
_080D87BA:
	ldr r3, [sp, #0x10]
	cmp r3, #0
	ble _080D87CC
	mov r0, sl
	ldr r1, [sp, #0x5c]
	adds r2, r3, #0
	bl _lshift
	str r0, [sp, #0x5c]
_080D87CC:
	ldr r0, [sp, #0x34]
	cmp r0, #0
	ble _080D87DE
	mov r0, sl
	ldr r1, [sp, #0x68]
	ldr r2, [sp, #0x34]
	bl _lshift
	str r0, [sp, #0x68]
_080D87DE:
	ldr r1, [sp, #0x2c]
	cmp r1, #0
	beq _080D881C
	ldr r0, [sp, #0x5c]
	ldr r1, [sp, #0x68]
	bl __mcmp
	cmp r0, #0
	bge _080D881C
	ldr r2, [sp, #0x24]
	subs r2, #1
	str r2, [sp, #0x24]
	mov r0, sl
	ldr r1, [sp, #0x5c]
	movs r2, #0xa
	movs r3, #0
	bl sub_80D99D8
	str r0, [sp, #0x5c]
	ldr r3, [sp, #0x30]
	cmp r3, #0
	beq _080D8818
	mov r0, sl
	ldr r1, [sp, #0x64]
	movs r2, #0xa
	movs r3, #0
	bl sub_80D99D8
	str r0, [sp, #0x64]
_080D8818:
	ldr r0, [sp, #0x20]
	str r0, [sp, #0x18]
_080D881C:
	ldr r1, [sp, #0x18]
	cmp r1, #0
	bgt _080D8860
	ldr r2, [sp, #0xc]
	cmp r2, #2
	ble _080D8860
	cmp r1, #0
	blt _080D8846
	mov r0, sl
	ldr r1, [sp, #0x68]
	movs r2, #5
	movs r3, #0
	bl sub_80D99D8
	str r0, [sp, #0x68]
	ldr r0, [sp, #0x5c]
	ldr r1, [sp, #0x68]
	bl __mcmp
	cmp r0, #0
	bgt _080D884E
_080D8846:
	ldr r3, [sp, #0xa4]
	mvns r3, r3
	str r3, [sp, #0x24]
	b _080D8A96
_080D884E:
	movs r0, #0x31
	mov r1, sb
	strb r0, [r1]
	movs r2, #1
	add sb, r2
	ldr r3, [sp, #0x24]
	adds r3, #1
	str r3, [sp, #0x24]
	b _080D8A96
_080D8860:
	ldr r0, [sp, #0x30]
	cmp r0, #0
	bne _080D8868
	b _080D89DE
_080D8868:
	cmp r5, #0
	ble _080D8878
	mov r0, sl
	ldr r1, [sp, #0x64]
	adds r2, r5, #0
	bl _lshift
	str r0, [sp, #0x64]
_080D8878:
	ldr r1, [sp, #0x64]
	str r1, [sp, #0x60]
	ldr r2, [sp, #0x3c]
	cmp r2, #0
	beq _080D88AA
	ldr r1, [r1, #4]
	mov r0, sl
	bl _Balloc
	str r0, [sp, #0x64]
	adds r0, #0xc
	ldr r1, [sp, #0x60]
	adds r1, #0xc
	ldr r3, [sp, #0x60]
	ldr r2, [r3, #0x10]
	lsls r2, r2, #2
	adds r2, #8
	bl memcpy
	mov r0, sl
	ldr r1, [sp, #0x64]
	movs r2, #1
	bl _lshift
	str r0, [sp, #0x64]
_080D88AA:
	movs r0, #1
	mov r8, r0
	mov r1, r8
	ldr r2, [sp, #0x44]
	ands r2, r1
	str r2, [sp, #0x80]
	b _080D8900
_080D88B8:
	mov r0, sl
	ldr r1, [sp, #0x5c]
	movs r2, #0xa
	movs r3, #0
	bl sub_80D99D8
	str r0, [sp, #0x5c]
	ldr r3, [sp, #0x60]
	ldr r0, [sp, #0x64]
	cmp r3, r0
	bne _080D88E0
	mov r0, sl
	ldr r1, [sp, #0x64]
	movs r2, #0xa
	movs r3, #0
	bl sub_80D99D8
	str r0, [sp, #0x64]
	str r0, [sp, #0x60]
	b _080D88FC
_080D88E0:
	mov r0, sl
	ldr r1, [sp, #0x60]
	movs r2, #0xa
	movs r3, #0
	bl sub_80D99D8
	str r0, [sp, #0x60]
	mov r0, sl
	ldr r1, [sp, #0x64]
	movs r2, #0xa
	movs r3, #0
	bl sub_80D99D8
	str r0, [sp, #0x64]
_080D88FC:
	movs r1, #1
	add r8, r1
_080D8900:
	ldr r0, [sp, #0x5c]
	ldr r1, [sp, #0x68]
	bl sub_80D7C98
	adds r7, r0, #0
	adds r7, #0x30
	ldr r0, [sp, #0x5c]
	ldr r1, [sp, #0x60]
	bl __mcmp
	adds r4, r0, #0
	mov r0, sl
	ldr r1, [sp, #0x68]
	ldr r2, [sp, #0x64]
	bl __mdiff
	adds r5, r0, #0
	ldr r0, [r5, #0xc]
	cmp r0, #0
	bne _080D8934
	ldr r0, [sp, #0x5c]
	adds r1, r5, #0
	bl __mcmp
	adds r6, r0, #0
	b _080D8936
_080D8934:
	movs r6, #1
_080D8936:
	mov r0, sl
	adds r1, r5, #0
	bl _Bfree
	cmp r6, #0
	bne _080D8962
	ldr r2, [sp, #0xc]
	cmp r2, #0
	bne _080D8962
	ldr r3, [sp, #0x80]
	cmp r3, #0
	bne _080D8962
	cmp r7, #0x39
	beq _080D89B4
	cmp r4, #0
	ble _080D8958
	adds r7, #1
_080D8958:
	mov r0, sb
	strb r7, [r0]
	movs r1, #1
	add sb, r1
	b _080D8A96
_080D8962:
	cmp r4, #0
	blt _080D8976
	cmp r4, #0
	bne _080D89AC
	ldr r2, [sp, #0xc]
	cmp r2, #0
	bne _080D89AC
	ldr r3, [sp, #0x80]
	cmp r3, #0
	bne _080D89AC
_080D8976:
	cmp r6, #0
	ble _080D89A6
	mov r0, sl
	ldr r1, [sp, #0x5c]
	movs r2, #1
	bl _lshift
	str r0, [sp, #0x5c]
	ldr r1, [sp, #0x68]
	bl __mcmp
	adds r6, r0, #0
	cmp r6, #0
	bgt _080D89A0
	cmp r6, #0
	bne _080D89A6
	adds r0, r7, #0
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _080D89A6
_080D89A0:
	adds r7, #1
	cmp r7, #0x3a
	beq _080D89B4
_080D89A6:
	mov r2, sb
	strb r7, [r2]
	b _080D8A5E
_080D89AC:
	cmp r6, #0
	ble _080D89CC
	cmp r7, #0x39
	bne _080D89C0
_080D89B4:
	movs r0, #0x39
	mov r1, sb
	strb r0, [r1]
	movs r2, #1
	add sb, r2
	b _080D8A34
_080D89C0:
	adds r0, r7, #1
	mov r3, sb

_080D89C4:
	strb r0, [r3]
	movs r0, #1
	add sb, r0
	b _080D8A96
_080D89CC:
	mov r1, sb
	strb r7, [r1]
	movs r2, #1
	add sb, r2
	ldr r3, [sp, #0x18]
	cmp r8, r3
	beq _080D89DC
	b _080D88B8
_080D89DC:
	b _080D8A10
_080D89DE:
	movs r0, #1
	mov r8, r0
	b _080D89F6
_080D89E4:
	mov r0, sl
	ldr r1, [sp, #0x5c]
	movs r2, #0xa
	movs r3, #0
	bl sub_80D99D8
	str r0, [sp, #0x5c]
	movs r1, #1
	add r8, r1
_080D89F6:
	ldr r0, [sp, #0x5c]
	ldr r1, [sp, #0x68]
	bl sub_80D7C98
	adds r7, r0, #0
	adds r7, #0x30
	mov r2, sb
	strb r7, [r2]
	movs r3, #1
	add sb, r3
	ldr r0, [sp, #0x18]
	cmp r8, r0
	blt _080D89E4
_080D8A10:
	mov r0, sl
	ldr r1, [sp, #0x5c]
	movs r2, #1
	bl _lshift
	str r0, [sp, #0x5c]
	ldr r1, [sp, #0x68]
	bl __mcmp
	adds r4, r0, #0
	cmp r4, #0
	bgt _080D8A34
	cmp r4, #0
	bne _080D8A76
	movs r0, #1
	ands r7, r0
	cmp r7, #0
	beq _080D8A76
_080D8A34:
	movs r1, #1
	rsbs r1, r1, #0
	add sb, r1
	mov r2, sb
	ldrb r2, [r2]
	cmp r2, #0x39
	bne _080D8A56
_080D8A42:
	ldr r3, [sp, #0x74]
	cmp sb, r3
	beq _080D8A64
	movs r0, #1
	rsbs r0, r0, #0
	add sb, r0
	mov r1, sb
	ldrb r1, [r1]
	cmp r1, #0x39
	beq _080D8A42
_080D8A56:
	mov r2, sb
	ldrb r0, [r2]
	adds r0, #1
	strb r0, [r2]
_080D8A5E:
	movs r3, #1
	add sb, r3
	b _080D8A96
_080D8A64:
	ldr r0, [sp, #0x24]
	adds r0, #1
	str r0, [sp, #0x24]
	movs r0, #0x31
	ldr r1, [sp, #0x74]
	strb r0, [r1]
	adds r1, #1
	mov sb, r1
	b _080D8A96
_080D8A76:
	movs r2, #1
	rsbs r2, r2, #0
	add sb, r2
	mov r3, sb
	ldrb r3, [r3]
	cmp r3, #0x30
	bne _080D8A92
_080D8A84:
	movs r0, #1
	rsbs r0, r0, #0
	add sb, r0
	mov r1, sb
	ldrb r1, [r1]
	cmp r1, #0x30
	beq _080D8A84
_080D8A92:
	movs r2, #1
	add sb, r2
_080D8A96:
	mov r0, sl
	ldr r1, [sp, #0x68]
	bl _Bfree
	ldr r3, [sp, #0x64]
	cmp r3, #0
	beq _080D8ABE
	ldr r0, [sp, #0x60]
	cmp r0, #0
	beq _080D8AB6
	cmp r0, r3
	beq _080D8AB6
	mov r0, sl
	ldr r1, [sp, #0x60]
	bl _Bfree
_080D8AB6:
	mov r0, sl
	ldr r1, [sp, #0x64]
	bl _Bfree
_080D8ABE:
	mov r0, sl
	ldr r1, [sp, #0x5c]
	bl _Bfree
	movs r0, #0
	mov r1, sb
	strb r0, [r1]
	ldr r0, [sp, #0x24]
	adds r0, #1
	ldr r2, [sp, #0xa8]
	str r0, [r2]
	ldr r3, [sp, #0xb0]
	cmp r3, #0
	beq _080D8ADC
	str r1, [r3]
_080D8ADC:
	ldr r0, [sp, #0x74]
sub_80D8ADE:
	add sp, #0x84
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7, pc}
	.align 2, 0

