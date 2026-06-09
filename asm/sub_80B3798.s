	.syntax unified
	.set m4aSongNumStart, 0x080D4EF4 + 1
	.set sub_808B0A0, 0x0808B0A0 + 1
	.section .text.sub_80B3798, "ax", %progbits
@ sub_80B3798 @ JP 0x080B3798 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B3798
	.thumb_func
sub_80B3798:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080B37C0 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080B37AE
	movs r0, #0x70
	bl m4aSongNumStart
_080B37AE:
	ldr r0, [r4, #0x2c]
	ldr r1, [r4, #0x30]
	ldr r2, [r4, #0x58]
	bl sub_808B0A0
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B37C0: .4byte 0x0202BCEC

