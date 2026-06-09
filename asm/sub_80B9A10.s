	.syntax unified
	.set InitText, 0x08003C8C + 1
	.set PutSpecialChar, 0x08004A14 + 1
	.set SetTextFont, 0x08003C68 + 1
	.set sub_80042E0, 0x080042E0 + 1
	.section .text.sub_80B9A10, "ax", %progbits
@ sub_80B9A10 @ JP 0x080B9A10 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B9A10
	.thumb_func
sub_80B9A10:
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0
	bl SetTextFont
	bl sub_80042E0
	ldr r0, _080B9A38 @ =0x03001D48
	movs r1, #1
	bl InitText
	adds r0, r4, #0
	movs r1, #3
	movs r2, #0x1e
	bl PutSpecialChar
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B9A38: .4byte 0x03001D48

