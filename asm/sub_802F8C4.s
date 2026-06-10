	.syntax unified
	.set NextRN_N, 0x08000C58 + 1
	.set sub_80186A8, 0x080186A8 + 1
	.section .text.sub_802F8C4, "ax", %progbits
@ sub_802F8C4 @ JP 0x0802F8C4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_802F8C4
	.thumb_func
sub_802F8C4:
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	movs r1, #0
	movs r4, #0
	ldr r2, _0802F928 @ =0x080DC978
_0802F8D0:
	adds r0, r4, r2
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, r1, r0
	adds r4, #1
	cmp r4, #4
	bls _0802F8D0
	adds r0, r1, #0
	bl NextRN_N
	adds r2, r0, #0
	movs r4, #0
	ldr r0, _0802F928 @ =0x080DC978
	movs r1, #0
	ldrsb r1, [r0, r1]
	cmp r1, r2
	bgt _0802F90A
	adds r3, r0, #0
_0802F8F6:
	adds r4, #1
	cmp r4, #4
	bhi _0802F90A
	adds r0, r4, r3
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, r1, r0
	cmp r1, r2
	ble _0802F8F6
_0802F90A:
	adds r4, #1
	ldrb r0, [r5, #8]
	subs r0, r0, r4
	movs r1, #0
	strb r0, [r5, #8]
	strb r1, [r5, #9]
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_80186A8
	adds r0, r4, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_0802F928: .4byte 0x080DC978

