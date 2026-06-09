	.syntax unified
	.set PrepGetUnitAmount, 0x08097654 + 1
	.set sub_80B1800, 0x080B1800 + 1
	.section .text.sub_809D0D8, "ax", %progbits
@ sub_809D0D8 @ JP 0x0809D0D8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_809D0D8
	.thumb_func
sub_809D0D8:
	push {r4, r5, lr}
	movs r5, #0
	ldrh r0, [r0, #0x30]
	lsrs r4, r0, #4
	bl PrepGetUnitAmount
	subs r0, #1
	asrs r1, r0, #1
	cmp r4, #0
	ble _0809D0EE
	movs r5, #1
_0809D0EE:
	adds r0, r4, #5
	cmp r0, r1
	bge _0809D0F8
	movs r0, #2
	orrs r5, r0
_0809D0F8:
	adds r0, r5, #0
	bl sub_80B1800
	pop {r4, r5}
	pop {r0}
	bx r0

