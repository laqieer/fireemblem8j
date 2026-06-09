	.syntax unified
	.set PrepGetUnitAmount, 0x08097654 + 1
	.set sub_809D058, 0x0809D058 + 1
	.section .text.sub_809D090, "ax", %progbits
@ sub_809D090 @ JP 0x0809D090 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_809D090
	.thumb_func
sub_809D090:
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	bl sub_809D058
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809D0D2
	ldrh r0, [r5, #0x2e]
	lsrs r4, r0, #1
	ldrh r0, [r5, #0x30]
	lsrs r6, r0, #4
	bl PrepGetUnitAmount
	subs r0, #1
	asrs r1, r0, #1
	cmp r4, r6
	bgt _0809D0C4
	cmp r4, #0
	bne _0809D0BA
	strh r4, [r5, #0x30]
	b _0809D0C0
_0809D0BA:
	subs r0, r4, #1
	lsls r0, r0, #4
	strh r0, [r5, #0x30]
_0809D0C0:
	cmp r4, r6
	ble _0809D0D2
_0809D0C4:
	cmp r4, r1
	bne _0809D0CC
	subs r0, r4, #5
	b _0809D0CE
_0809D0CC:
	subs r0, r4, #4
_0809D0CE:
	lsls r0, r0, #4
	strh r0, [r5, #0x30]
_0809D0D2:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

