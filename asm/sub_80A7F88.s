	.syntax unified
	.set GetTotalGlobalSupportValue, 0x080A7F44 + 1
	.set __divsi3, 0x080D65F8 + 1
	.set sub_80A7F10, 0x080A7F10 + 1
	.section .text.sub_80A7F88, "ax", %progbits
@ sub_80A7F88 @ JP 0x080A7F88 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A7F88
	.thumb_func
sub_80A7F88:
	push {r4, r5, lr}
	movs r0, #0
	bl GetTotalGlobalSupportValue
	adds r4, r0, #0
	bl sub_80A7F10
	adds r5, r0, #0
	cmp r4, #0
	ble _080A7FAE
	movs r0, #0x64
	muls r0, r4, r0
	adds r1, r5, #0
	bl __divsi3
	cmp r0, #0
	bne _080A7FAE
	movs r4, #1
	b _080A7FBA
_080A7FAE:
	movs r0, #0x64
	muls r0, r4, r0
	adds r1, r5, #0
	bl __divsi3
	adds r4, r0, #0
_080A7FBA:
	cmp r4, #0x64
	ble _080A7FC0
	movs r4, #0x64
_080A7FC0:
	adds r0, r4, #0
	pop {r4, r5}
	pop {r1}
	bx r1

