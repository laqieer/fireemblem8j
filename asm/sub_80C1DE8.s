	.syntax unified
	.set WMLoc_GetChapterId, 0x080C03E0 + 1
	.section .text.sub_80C1DE8, "ax", %progbits
@ sub_80C1DE8 @ JP 0x080C1DE8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C1DE8
	.thumb_func
sub_80C1DE8:
	push {r4, r5, lr}
	adds r5, r0, #0
	subs r0, #0x25
	cmp r0, #8
	bhi _080C1DFA
	movs r5, #0x24
	b _080C1E04
_080C1DF6:
	adds r0, r4, #0
	b _080C1E1A
_080C1DFA:
	adds r0, r5, #0
	subs r0, #0x2f
	cmp r0, #8
	bhi _080C1E04
	movs r5, #0x2e
_080C1E04:
	movs r4, #0
_080C1E06:
	adds r0, r4, #0
	bl WMLoc_GetChapterId
	cmp r5, r0
	beq _080C1DF6
	adds r4, #1
	cmp r4, #0x1c
	ble _080C1E06
	movs r0, #1
	rsbs r0, r0, #0
_080C1E1A:
	pop {r4, r5}
	pop {r1}
	bx r1

