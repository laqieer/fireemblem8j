	.syntax unified
	.set __muldi3, 0x080D6760 + 1
	.set __pack_d, 0x080DA9A0 + 1
	.set __unpack_d, 0x080DAAE8 + 1
	.section .text.sub_80DAE94, "ax", %progbits
@ sub_80DAE94 @ JP 0x080DAE94 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80DAE94
	.thumb_func
sub_80DAE94:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x74
	str r0, [sp, #0x3c]
	str r1, [sp, #0x40]
	str r2, [sp, #0x44]
	str r3, [sp, #0x48]
	add r0, sp, #0x3c
	mov r1, sp
	bl __unpack_d
	add r0, sp, #0x44
	add r4, sp, #0x14
	adds r1, r4, #0
	bl __unpack_d
	mov r8, sp
	add r0, sp, #0x28
	mov sl, r0
	movs r0, #0
	ldr r1, [sp]
	cmp r1, #1
	bhi _080DAECA
	movs r0, #1
_080DAECA:
	cmp r0, #0
	bne _080DAF2E
	movs r2, #0
	ldr r0, [sp, #0x14]
	cmp r0, #1
	bhi _080DAED8
	movs r2, #1
_080DAED8:
	cmp r2, #0
	beq _080DAEE0
	ldr r0, [sp, #4]
	b _080DAF50
_080DAEE0:
	movs r2, #0
	cmp r1, #4
	bne _080DAEE8
	movs r2, #1
_080DAEE8:
	cmp r2, #0
	beq _080DAEFA
	movs r1, #0
	cmp r0, #2
	bne _080DAEF4
	movs r1, #1
_080DAEF4:
	cmp r1, #0
	bne _080DAF12
	b _080DAF2E
_080DAEFA:
	movs r2, #0
	cmp r0, #4
	bne _080DAF02
	movs r2, #1
_080DAF02:
	cmp r2, #0
	beq _080DAF22
	movs r0, #0
	cmp r1, #2
	bne _080DAF0E
	movs r0, #1
_080DAF0E:
	cmp r0, #0
	beq _080DAF1C
_080DAF12:
	ldr r0, _080DAF18 @ =0x03002BE0
	b _080DB11A
	.align 2, 0
_080DAF18: .4byte 0x03002BE0
_080DAF1C:
	mov r1, r8
	ldr r0, [r1, #4]
	b _080DAF50
_080DAF22:
	movs r2, #0
	cmp r1, #2
	bne _080DAF2A
	movs r2, #1
_080DAF2A:
	cmp r2, #0
	beq _080DAF40
_080DAF2E:
	ldr r0, [sp, #4]
	ldr r1, [sp, #0x18]
	eors r0, r1
	rsbs r1, r0, #0
	orrs r1, r0
	lsrs r1, r1, #0x1f
	str r1, [sp, #4]
	mov r0, sp
	b _080DB11A
_080DAF40:
	movs r1, #0
	cmp r0, #2
	bne _080DAF48
	movs r1, #1
_080DAF48:
	cmp r1, #0
	beq _080DAF60
	mov r2, r8
	ldr r0, [r2, #4]
_080DAF50:
	ldr r1, [sp, #0x18]
	eors r0, r1
	rsbs r1, r0, #0
	orrs r1, r0
	lsrs r1, r1, #0x1f
	str r1, [sp, #0x18]
	adds r0, r4, #0
	b _080DB11A
_080DAF60:
	mov r4, r8
	ldr r0, [r4, #0xc]
	ldr r1, [r4, #0x10]
	adds r6, r0, #0
	movs r7, #0
	str r1, [sp, #0x4c]
	movs r5, #0
	str r5, [sp, #0x50]
	ldr r0, [sp, #0x20]
	ldr r1, [sp, #0x24]
	adds r4, r0, #0
	str r1, [sp, #0x54]
	movs r0, #0
	str r0, [sp, #0x58]
	adds r1, r5, #0
	adds r0, r4, #0
	adds r3, r7, #0
	adds r2, r6, #0
	bl __muldi3
	str r0, [sp, #0x5c]
	str r1, [sp, #0x60]
	ldr r0, [sp, #0x54]
	ldr r1, [sp, #0x58]
	adds r3, r7, #0
	adds r2, r6, #0
	bl __muldi3
	adds r7, r1, #0
	adds r6, r0, #0
	adds r1, r5, #0
	adds r0, r4, #0
	ldr r2, [sp, #0x4c]
	ldr r3, [sp, #0x50]
	bl __muldi3
	adds r5, r1, #0
	adds r4, r0, #0
	ldr r0, [sp, #0x54]
	ldr r1, [sp, #0x58]
	ldr r2, [sp, #0x4c]
	ldr r3, [sp, #0x50]
	bl __muldi3
	str r0, [sp, #0x64]
	str r1, [sp, #0x68]
	movs r1, #0
	movs r2, #0
	str r1, [sp, #0x6c]
	str r2, [sp, #0x70]
	adds r3, r7, #0
	adds r2, r6, #0
	adds r2, r2, r4
	adcs r3, r5
	cmp r7, r3
	bhi _080DAFD8
	cmp r7, r3
	bne _080DAFE0
	cmp r6, r2
	bls _080DAFE0
_080DAFD8:
	ldr r5, _080DB130 @ =0x00000001
	ldr r4, _080DB12C @ =0x00000000
	str r4, [sp, #0x6c]
	str r5, [sp, #0x70]
_080DAFE0:
	adds r1, r2, #0
	movs r6, #0
	adds r7, r1, #0
	ldr r0, [sp, #0x5c]
	ldr r1, [sp, #0x60]
	adds r6, r6, r0
	adcs r7, r1
	cmp r1, r7
	bhi _080DAFFC
	ldr r1, [sp, #0x60]
	cmp r1, r7
	bne _080DB00C
	cmp r0, r6
	bls _080DB00C
_080DAFFC:
	movs r0, #1
	movs r1, #0
	ldr r4, [sp, #0x6c]
	ldr r5, [sp, #0x70]
	adds r4, r4, r0
	adcs r5, r1
	str r4, [sp, #0x6c]
	str r5, [sp, #0x70]
_080DB00C:
	adds r0, r3, #0
	adds r2, r0, #0
	movs r3, #0
	adds r5, r3, #0
	adds r4, r2, #0
	ldr r0, [sp, #0x64]
	ldr r1, [sp, #0x68]
	adds r4, r4, r0
	adcs r5, r1
	ldr r1, [sp, #0x6c]
	ldr r2, [sp, #0x70]
	adds r4, r4, r1
	adcs r5, r2
	mov r0, r8
	ldr r2, [r0, #8]
	ldr r0, [sp, #0x1c]
	adds r2, r2, r0
	str r2, [sp, #0x30]
	mov r0, r8
	ldr r1, [r0, #4]
	ldr r0, [sp, #0x18]
	eors r1, r0
	rsbs r0, r1, #0
	orrs r0, r1
	lsrs r0, r0, #0x1f
	str r0, [sp, #0x2c]
	adds r2, #4
	str r2, [sp, #0x30]
	ldr r0, _080DB134 @ =0x1FFFFFFF
	cmp r5, r0
	bls _080DB08E
	movs r1, #1
	mov sb, r1
	mov r8, r0
	mov ip, r2
_080DB052:
	movs r2, #1
	add ip, r2
	mov r0, sb
	ands r0, r4
	cmp r0, #0
	beq _080DB078
	lsls r3, r7, #0x1f
	lsrs r2, r6, #1
	adds r0, r3, #0
	orrs r0, r2
	lsrs r1, r7, #1
	adds r7, r1, #0
	adds r6, r0, #0
	adds r0, r6, #0
	movs r1, #0x80
	lsls r1, r1, #0x18
	orrs r1, r7
	adds r7, r1, #0
	adds r6, r0, #0
_080DB078:
	lsls r3, r5, #0x1f
	lsrs r2, r4, #1
	adds r0, r3, #0
	orrs r0, r2
	lsrs r1, r5, #1
	adds r5, r1, #0
	adds r4, r0, #0
	cmp r5, r8
	bhi _080DB052
	mov r0, ip
	str r0, [sp, #0x30]
_080DB08E:
	ldr r0, _080DB138 @ =0x0FFFFFFF
	cmp r5, r0
	bhi _080DB0E0
	movs r1, #0x80
	lsls r1, r1, #0x18
	mov sb, r1
	mov r8, r0
	ldr r2, [sp, #0x30]
	mov ip, r2
_080DB0A0:
	movs r0, #1
	rsbs r0, r0, #0
	add ip, r0
	lsrs r3, r4, #0x1f
	lsls r2, r5, #1
	adds r1, r3, #0
	orrs r1, r2
	lsls r0, r4, #1
	adds r5, r1, #0
	adds r4, r0, #0
	movs r0, #0
	mov r1, sb
	ands r1, r7
	orrs r0, r1
	cmp r0, #0
	beq _080DB0CA
	movs r0, #1
	orrs r0, r4
	adds r1, r5, #0
	adds r5, r1, #0
	adds r4, r0, #0
_080DB0CA:
	lsrs r3, r6, #0x1f
	lsls r2, r7, #1
	adds r1, r3, #0
	orrs r1, r2
	lsls r0, r6, #1
	adds r7, r1, #0
	adds r6, r0, #0
	cmp r5, r8
	bls _080DB0A0
	mov r1, ip
	str r1, [sp, #0x30]
_080DB0E0:
	movs r0, #0xff
	adds r1, r4, #0
	ands r1, r0
	movs r2, #0
	cmp r1, #0x80
	bne _080DB10E
	cmp r2, #0
	bne _080DB10E
	adds r0, #1
	adds r1, r4, #0
	ands r1, r0
	adds r0, r2, #0
	orrs r0, r1
	cmp r0, #0
	bne _080DB106
	adds r0, r7, #0
	orrs r0, r6
	cmp r0, #0
	beq _080DB10E
_080DB106:
	movs r0, #0x80
	movs r1, #0
	adds r4, r4, r0
	adcs r5, r1
_080DB10E:
	str r4, [sp, #0x34]
	str r5, [sp, #0x38]
	movs r0, #3
	mov r2, sl
	str r0, [r2]
	add r0, sp, #0x28
_080DB11A:
	bl __pack_d
	add sp, #0x74
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7, pc}
	.align 2, 0
_080DB12C: .4byte 0x00000000
_080DB130: .4byte 0x00000001
_080DB134: .4byte 0x1FFFFFFF
_080DB138: .4byte 0x0FFFFFFF

