	.syntax unified
	.set sub_80B8CF0, 0x080B8CF0 + 1
	.section .text.sub_80B9580, "ax", %progbits
@ sub_80B9580 @ JP 0x080B9580 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B9580
	.thumb_func
sub_80B9580:
	push {lr}
	adds r1, r0, #0
	ldr r0, [r1, #0x2c]
	cmp r0, #0
	bne _080B9598
	ldr r0, _080B9594 @ =0x00000838
	bl sub_80B8CF0
	b _080B959E
	.align 2, 0
_080B9594: .4byte 0x00000838
_080B9598:
	ldr r0, _080B95A4 @ =0x00000858
	bl sub_80B8CF0
_080B959E:
	pop {r0}
	bx r0
	.align 2, 0
_080B95A4: .4byte 0x00000858

