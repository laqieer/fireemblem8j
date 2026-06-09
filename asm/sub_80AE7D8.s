	.syntax unified
	.set m4aSongNumStart, 0x080D4EF4 + 1
	.set sub_808B1F4, 0x0808B1F4 + 1
	.set sub_808BB14, 0x0808BB14 + 1
	.section .text.sub_80AE7D8, "ax", %progbits
@ sub_80AE7D8 @ JP 0x080AE7D8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80AE7D8
	.thumb_func
sub_80AE7D8:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080AE808 @ =0x06014000
	movs r1, #9
	bl sub_808BB14
	ldr r0, [r4, #0x2c]
	ldr r1, [r4, #0x30]
	ldr r2, [r4, #0x58]
	bl sub_808B1F4
	ldr r0, _080AE80C @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080AE800
	movs r0, #0x70
	bl m4aSongNumStart
_080AE800:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AE808: .4byte 0x06014000
_080AE80C: .4byte 0x0202BCEC

