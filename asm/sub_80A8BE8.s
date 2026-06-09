	.syntax unified
	.set SetPartyGoldAmount, 0x08024DB4 + 1
	.set sub_80A8C0C, 0x080A8C0C + 1
	.section .text.sub_80A8BE8, "ax", %progbits
@ sub_80A8BE8 @ JP 0x080A8BE8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A8BE8
	.thumb_func
sub_80A8BE8:
	push {lr}
	ldr r2, _080A8C04 @ =0x0202BCEC
	ldrh r1, [r2, #0x2c]
	ldr r0, _080A8C08 @ =0xFFFFE00F
	ands r0, r1
	strh r0, [r2, #0x2c]
	movs r0, #0
	bl SetPartyGoldAmount
	bl sub_80A8C0C
	pop {r0}
	bx r0
	.align 2, 0
_080A8C04: .4byte 0x0202BCEC
_080A8C08: .4byte 0xFFFFE00F

