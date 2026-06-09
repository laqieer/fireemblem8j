	.syntax unified
	.set PrepGetUnitAmount, 0x08097654 + 1
	.section .text.sub_809D058, "ax", %progbits
@ sub_809D058 @ JP 0x0809D058 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_809D058
	.thumb_func
sub_809D058:
	push {r4, r5, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x30]
	lsrs r1, r0, #4
	cmp r1, #0
	ble _0809D06C
	ldrh r0, [r4, #0x2e]
	lsrs r0, r0, #1
	cmp r0, r1
	ble _0809D082
_0809D06C:
	adds r5, r1, #5
	bl PrepGetUnitAmount
	subs r0, #1
	asrs r0, r0, #1
	cmp r5, r0
	bge _0809D086
	ldrh r0, [r4, #0x2e]
	lsrs r0, r0, #1
	cmp r0, r5
	blt _0809D086
_0809D082:
	movs r0, #1
	b _0809D088
_0809D086:
	movs r0, #0
_0809D088:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

