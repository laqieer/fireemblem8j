	.syntax unified
	.set GetPartyGoldAmount, 0x08024D98 + 1
	.section .text.sub_808759C, "ax", %progbits
@ sub_808759C @ JP 0x0808759C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_808759C
	.thumb_func
sub_808759C:
	push {lr}
	bl GetPartyGoldAmount
	movs r2, #0
	ldr r1, _080875B4 @ =0x00001F3F
	cmp r0, r1
	ble _080875AC
	movs r2, #1
_080875AC:
	adds r0, r2, #0
	pop {r1}
	bx r1
	.align 2, 0
_080875B4: .4byte 0x00001F3F

