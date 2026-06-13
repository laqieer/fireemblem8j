	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set SetGameOption, 0x080B6B7C + 1
	.set __modsi3, 0x080D6690 + 1
	.set m4aSongNumStart, 0x080D4EF4 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_80B62FC, 0x080B62FC + 1
	.set sub_80B6470, 0x080B6470 + 1
	.section .text.GenericOptionChangeHandler, "ax", %progbits
@ GenericOptionChangeHandler @ JP 0x080B6934 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global GenericOptionChangeHandler
	.thumb_func
GenericOptionChangeHandler:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	movs r7, #0
	ldr r0, _080B697C @ =0x08AAF6D8
	ldr r0, [r0]
	movs r1, #0x2a
	ldrsh r5, [r0, r1]
	ldr r0, _080B6980 @ =0x08AAF6DC
	adds r0, r5, r0
	ldrb r4, [r0]
	adds r6, r4, #0
	bl sub_80B62FC
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	ldr r0, _080B6984 @ =0x085775CC
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0x30
	ands r0, r1
	cmp r0, #0
	beq _080B69E6
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _080B6988
	cmp r3, #0
	beq _080B69AE
	subs r0, r3, #1
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	adds r0, r4, #0
	b _080B69A6
	.align 2, 0
_080B697C: .4byte 0x08AAF6D8
_080B6980: .4byte 0x08AAF6DC
_080B6984: .4byte 0x085775CC
_080B6988:
	ldr r2, _080B69F4 @ =0x08AAF700
	adds r4, r3, #1
	lsls r0, r4, #3
	movs r1, #0x2c
	muls r1, r6, r1
	adds r0, r0, r1
	adds r0, r0, r2
	ldrh r0, [r0, #6]
	cmp r0, #0
	beq _080B69AE
	cmp r3, #2
	bhi _080B69AE
	lsls r0, r4, #0x18
	lsrs r3, r0, #0x18
	adds r0, r6, #0
_080B69A6:
	adds r1, r3, #0
	bl SetGameOption
	movs r7, #1
_080B69AE:
	cmp r7, #1
	bne _080B69E6
	ldr r0, _080B69F8 @ =0x08AAF9EC
	mov r1, r8
	bl sub_8002BCC
	adds r0, r5, #0
	movs r1, #7
	bl __modsi3
	adds r1, r0, #0
	lsls r2, r5, #1
	adds r2, #5
	adds r0, r5, #0
	bl sub_80B6470
	movs r0, #3
	bl BG_EnableSyncByMask
	ldr r0, _080B69FC @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080B69E6
	movs r0, #0x67
	bl m4aSongNumStart
_080B69E6:
	adds r0, r7, #0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080B69F4: .4byte 0x08AAF700
_080B69F8: .4byte 0x08AAF9EC
_080B69FC: .4byte 0x0202BCEC

