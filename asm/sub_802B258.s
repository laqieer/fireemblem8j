	.syntax unified
	.set GetItemWeaponEffect, 0x080174CC + 1
	.set sub_802A490, 0x0802A490 + 1
	.section .text.sub_802B258, "ax", %progbits
@ sub_802B258 @ JP 0x0802B258 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_802B258
	.thumb_func
sub_802B258:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	adds r6, r1, #0
	ldr r4, _0802B2F4 @ =0x0203A604
	ldr r0, [r4]
	ldr r0, [r0]
	lsls r0, r0, #0xd
	lsrs r1, r0, #0xd
	movs r7, #2
	adds r0, r1, #0
	ands r0, r7
	cmp r0, #0
	bne _0802B2E8
	movs r0, #0x80
	lsls r0, r0, #7
	ands r0, r1
	cmp r0, #0
	bne _0802B2E8
	movs r0, #0x80
	lsls r0, r0, #9
	ands r0, r1
	cmp r0, #0
	bne _0802B2E8
	movs r0, #0x80
	lsls r0, r0, #8
	mov r8, r0
	ands r1, r0
	cmp r1, #0
	bne _0802B2E8
	adds r0, r5, #0
	adds r0, #0x48
	ldrh r0, [r0]
	bl GetItemWeaponEffect
	cmp r0, #1
	beq _0802B2E8
	ldr r0, [r4]
	ldr r0, [r0]
	lsls r0, r0, #0xd
	lsrs r0, r0, #0xd
	ands r0, r7
	cmp r0, #0
	bne _0802B2E8
	ldr r0, [r6, #4]
	ldrb r1, [r0, #4]
	cmp r1, #0xc
	bgt _0802B2E8
	cmp r1, #0xb
	blt _0802B2E8
	movs r0, #8
	ldrsb r0, [r5, r0]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #0
	bl sub_802A490
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0802B2E8
	ldr r3, [r4]
	ldr r2, [r3]
	lsls r1, r2, #0xd
	lsrs r1, r1, #0xd
	mov r0, r8
	orrs r1, r0
	ldr r0, _0802B2F8 @ =0xFFF80000
	ands r0, r2
	orrs r0, r1
	str r0, [r3]
_0802B2E8:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802B2F4: .4byte 0x0203A604
_0802B2F8: .4byte 0xFFF80000

