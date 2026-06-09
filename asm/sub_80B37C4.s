	.syntax unified
	.set m4aSongNumStart, 0x080D4EF4 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_808B2A4, 0x0808B2A4 + 1
	.section .text.sub_80B37C4, "ax", %progbits
@ sub_80B37C4 @ JP 0x080B37C4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B37C4
	.thumb_func
sub_80B37C4:
	push {lr}
	adds r2, r0, #0
	ldr r0, _080B37F8 @ =0x085775CC
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	ldr r0, _080B37FC @ =0x0000030B
	ands r0, r1
	cmp r0, #0
	beq _080B37F2
	adds r0, r2, #0
	bl sub_8002DE4
	ldr r0, _080B3800 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080B37EE
	movs r0, #0x71
	bl m4aSongNumStart
_080B37EE:
	bl sub_808B2A4
_080B37F2:
	pop {r0}
	bx r0
	.align 2, 0
_080B37F8: .4byte 0x085775CC
_080B37FC: .4byte 0x0000030B
_080B3800: .4byte 0x0202BCEC

