	.syntax unified
	.set LoadRNState, 0x08000C0C + 1
	.set NextRN_N, 0x08000C58 + 1
	.set StoreRNState, 0x08000C24 + 1
	.set WMLoc_GetChapterId, 0x080C03E0 + 1
	.set memcpy, 0x080D6908 + 1
	.set sub_8085738, 0x08085738 + 1
	.set sub_80C64B0, 0x080C64B0 + 1
	.set sub_80C64E0, 0x080C64E0 + 1
	.section .text.sub_80C6530, "ax", %progbits
@ sub_80C6530 @ JP 0x080C6530 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C6530
	.thumb_func
sub_80C6530:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x1c
	adds r3, r0, #0
	str r1, [sp, #0x18]
	cmp r3, #0
	blt _080C65BC
	cmp r3, #9
	ble _080C65B0
	cmp r3, #0x38
	beq _080C65B0
	cmp r3, #0
	blt _080C65BC
	ldr r0, _080C6578 @ =0x0202BCEC
	ldrb r0, [r0, #0x1b]
	cmp r0, #2
	beq _080C655C
	cmp r0, #3
	beq _080C6584
_080C655C:
	movs r2, #0
	ldr r4, _080C657C @ =0x081F66A4
	ldrb r0, [r4]
	ldr r1, _080C6580 @ =0x081F66BA
	cmp r0, r3
	beq _080C659E
_080C6568:
	adds r2, #1
	cmp r2, #0xa
	bhi _080C659E
	adds r0, r2, r4
	ldrb r0, [r0]
	cmp r0, r3
	bne _080C6568
	b _080C659E
	.align 2, 0
_080C6578: .4byte 0x0202BCEC
_080C657C: .4byte 0x081F66A4
_080C6580: .4byte 0x081F66BA
_080C6584:
	movs r2, #0
	ldr r4, _080C65B4 @ =0x081F66AF
	ldrb r0, [r4]
	ldr r1, _080C65B8 @ =0x081F671D
	cmp r0, r3
	beq _080C659E
_080C6590:
	adds r2, #1
	cmp r2, #0xa
	bhi _080C659E
	adds r0, r2, r4
	ldrb r0, [r0]
	cmp r0, r3
	bne _080C6590
_080C659E:
	lsls r0, r2, #3
	adds r0, r0, r2
	adds r4, r0, r1
	adds r0, r2, #0
	bl sub_80C64B0
	mov r8, r0
	cmp r0, #0
	bgt _080C65DE
_080C65B0:
	movs r0, #0
	b _080C667E
	.align 2, 0
_080C65B4: .4byte 0x081F66AF
_080C65B8: .4byte 0x081F671D
_080C65BC:
	ldr r0, _080C65CC @ =0x0202BCEC
	ldrb r0, [r0, #0x1b]
	cmp r0, #2
	beq _080C65C8
	cmp r0, #3
	beq _080C65D8
_080C65C8:
	ldr r4, _080C65D0 @ =0x081F6714
	b _080C65DA
	.align 2, 0
_080C65CC: .4byte 0x0202BCEC
_080C65D0: .4byte 0x081F6714
_080C65D4:
	adds r0, r6, #0
	b _080C667E
_080C65D8:
	ldr r4, _080C6690 @ =0x081F6777
_080C65DA:
	movs r0, #3
	mov r8, r0
_080C65DE:
	mov r0, sp
	adds r1, r4, #0
	movs r2, #9
	bl memcpy
	movs r6, #0
	add r1, sp, #0x10
	mov sl, r1
	ldr r3, _080C6694 @ =0x081F6614
	ldr r0, _080C6698 @ =0x03005270
	ldrb r1, [r0, #0x11]
	movs r2, #0
_080C65F6:
	adds r0, r6, r3
	ldrb r0, [r0]
	cmp r0, r1
	bne _080C6604
	mov r4, sp
	adds r0, r4, r6
	strb r2, [r0]
_080C6604:
	adds r6, #1
	cmp r6, #8
	bls _080C65F6
	mov r0, sl
	bl StoreRNState
	ldr r5, _080C669C @ =0x0300533E
	adds r0, r5, #0
	bl LoadRNState
	movs r6, #0
	cmp r6, r8
	bge _080C6670
	mov sb, r6
	add r7, sp, #0xc
	ldr r4, [sp, #0x18]
_080C6624:
	mov r0, sp
	movs r1, #9
	bl sub_80C64E0
	adds r5, r0, #0
	cmp r5, #0
	blt _080C65D4
	ldr r0, _080C6694 @ =0x081F6614
	adds r0, r5, r0
	ldrb r0, [r0]
	strb r0, [r4]
	ldrb r0, [r4]
	bl WMLoc_GetChapterId
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r1, r7, #0
	bl sub_8085738
	movs r0, #3
	bl NextRN_N
	adds r1, r7, r0
	ldrb r1, [r1]
	strb r1, [r4, #1]
	mov r1, sb
	strb r1, [r4, #2]
	ldr r2, _080C66A0 @ =0x03005339
	adds r1, r6, r2
	strb r0, [r1]
	mov r1, sp
	adds r0, r1, r5
	mov r2, sb
	strb r2, [r0]
	adds r4, #4
	adds r6, #1
	cmp r6, r8
	blt _080C6624
_080C6670:
	ldr r0, _080C669C @ =0x0300533E
	bl StoreRNState
	mov r0, sl
	bl LoadRNState
	mov r0, r8
_080C667E:
	add sp, #0x1c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080C6690: .4byte 0x081F6777
_080C6694: .4byte 0x081F6614
_080C6698: .4byte 0x03005270
_080C669C: .4byte 0x0300533E
_080C66A0: .4byte 0x03005339

