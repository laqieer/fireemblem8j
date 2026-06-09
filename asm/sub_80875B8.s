	.syntax unified
	.set GetPartyGoldAmount, 0x08024D98 + 1
	.section .text.sub_80875B8, "ax", %progbits
@ sub_80875B8 @ JP 0x080875B8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80875B8
	.thumb_func
sub_80875B8:
	push {lr}
	bl GetPartyGoldAmount
	movs r2, #0
	ldr r1, _080875D0 @ =0x0000176F
	cmp r0, r1
	ble _080875C8
	movs r2, #1
_080875C8:
	adds r0, r2, #0
	pop {r1}
	bx r1
	.align 2, 0
_080875D0: .4byte 0x0000176F

