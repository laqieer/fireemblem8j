	.syntax unified
	.section .text.GetAffinityBonuses, "ax", %progbits
@ GetAffinityBonuses @ JP 0x080284C0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global GetAffinityBonuses
	.thumb_func
GetAffinityBonuses:
	push {lr}
	adds r3, r0, #0
	ldr r2, _080284C8 @ =0x08904B84
	b _080284D8
	.align 2, 0
_080284C8: .4byte 0x08904B84
_080284CC:
	ldrb r1, [r2]
	cmp r1, r3
	bne _080284D6
	adds r0, r2, #0
	b _080284DE
_080284D6:
	adds r2, #8
_080284D8:
	ldrb r1, [r2]
	cmp r1, #0
	bne _080284CC
_080284DE:
	pop {r1}
	bx r1
	.align 2, 0

