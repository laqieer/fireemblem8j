	.syntax unified
	.set sub_80D636C, 0x080D636C + 1
	.section .text.sub_80B0A28, "ax", %progbits
@ sub_80B0A28 @ JP 0x080B0A28 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B0A28
	.thumb_func
sub_80B0A28:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	movs r1, #0x60
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _080B0A48
	ldr r6, _080B0A44 @ =0x06014000
	movs r2, #0x10
	movs r4, #2
	b _080B0A5A
	.align 2, 0
_080B0A44: .4byte 0x06014000
_080B0A48:
	movs r0, #0x10
	ands r0, r3
	cmp r0, #0
	beq _080B0A56
	ldr r6, _080B0A88 @ =0x06014800
	movs r2, #0xc
	movs r4, #2
_080B0A56:
	cmp r4, #0
	ble _080B0A7C
_080B0A5A:
	lsls r7, r2, #3
	ldr r5, _080B0A8C @ =0x06011800
	ldr r0, _080B0A90 @ =0x001FFFFF
	mov r8, r0
_080B0A62:
	adds r0, r6, #0
	adds r1, r5, #0
	mov r2, r8
	ands r2, r7
	bl sub_80D636C
	movs r0, #0x80
	lsls r0, r0, #3
	adds r6, r6, r0
	adds r5, r5, r0
	subs r4, #1
	cmp r4, #0
	bne _080B0A62
_080B0A7C:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B0A88: .4byte 0x06014800
_080B0A8C: .4byte 0x06011800
_080B0A90: .4byte 0x001FFFFF

