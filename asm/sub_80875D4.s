	.syntax unified
	.set GetPartyGoldAmount, 0x08024D98 + 1
	.section .text.sub_80875D4, "ax", %progbits
@ sub_80875D4 @ JP 0x080875D4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80875D4
	.thumb_func
sub_80875D4:
	push {lr}
	bl GetPartyGoldAmount
	movs r2, #0
	ldr r1, _080875EC @ =0x00001387
	cmp r0, r1
	ble _080875E4
	movs r2, #1
_080875E4:
	adds r0, r2, #0
	pop {r1}
	bx r1
	.align 2, 0
_080875EC: .4byte 0x00001387

