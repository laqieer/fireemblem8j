	.syntax unified
	.set sub_80D6370, 0x080D6370 + 1
	.section .text.sub_80B2AC0, "ax", %progbits
@ sub_80B2AC0 @ JP 0x080B2AC0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B2AC0
	.thumb_func
sub_80B2AC0:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r7, r1, #0
	mov ip, r2
	mov sb, r3
	ldr r2, [sp, #0x20]
	ldr r4, [sp, #0x28]
	ldr r3, [sp, #0x2c]
	ldrh r1, [r7]
	lsrs r1, r1, #1
	mov r8, r1
	movs r1, #0x78
	mov sl, r1
	adds r6, r7, #4
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #0xd
	movs r0, #0xc0
	lsls r0, r0, #0x13
	adds r5, r1, r0
	cmp r4, #0
	beq _080B2B58
	cmp r3, #0
	beq _080B2B58
	movs r0, #1
	rsbs r0, r0, #0
	cmp r4, r0
	bne _080B2B02
	ldrh r4, [r7]
	ldrh r3, [r7, #2]
_080B2B02:
	mov r1, ip
	asrs r1, r1, #1
	mov ip, r1
	asrs r2, r2, #1
	asrs r4, r4, #1
	lsls r4, r4, #1
	ldr r0, [sp, #0x24]
	mov r1, r8
	muls r1, r0, r1
	adds r0, r1, #0
	lsls r0, r0, #1
	adds r0, r6, r0
	lsls r1, r2, #1
	adds r6, r0, r1
	mov r2, sl
	mov r0, sb
	muls r0, r2, r0
	lsls r0, r0, #1
	adds r0, r5, r0
	mov r2, ip
	lsls r1, r2, #1
	adds r5, r0, r1
	cmp r3, #0
	ble _080B2B58
	asrs r7, r4, #1
	adds r4, r3, #0
	ldr r0, _080B2B68 @ =0x001FFFFF
	mov sb, r0
_080B2B3A:
	adds r0, r6, #0
	adds r1, r5, #0
	mov r2, sb
	ands r2, r7
	bl sub_80D6370
	mov r1, r8
	lsls r0, r1, #1
	adds r6, r6, r0
	mov r2, sl
	lsls r0, r2, #1
	adds r5, r5, r0
	subs r4, #1
	cmp r4, #0
	bne _080B2B3A
_080B2B58:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B2B68: .4byte 0x001FFFFF

