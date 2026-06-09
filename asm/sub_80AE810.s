	.syntax unified
	.set m4aSongNumStart, 0x080D4EF4 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_808B2A4, 0x0808B2A4 + 1
	.section .text.sub_80AE810, "ax", %progbits
@ sub_80AE810 @ JP 0x080AE810 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80AE810
	.thumb_func
sub_80AE810:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080AE844 @ =0x085775CC
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	ldr r0, _080AE848 @ =0x00000103
	ands r0, r1
	cmp r0, #0
	beq _080AE83E
	ldr r0, _080AE84C @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080AE834
	movs r0, #0x71
	bl m4aSongNumStart
_080AE834:
	bl sub_808B2A4
	adds r0, r4, #0
	bl sub_8002DE4
_080AE83E:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AE844: .4byte 0x085775CC
_080AE848: .4byte 0x00000103
_080AE84C: .4byte 0x0202BCEC

