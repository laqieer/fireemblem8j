	.syntax unified
	.set SetTextFont, 0x08003C68 + 1
	.set StartMenu, 0x0804F954 + 1
	.set sub_80042E0, 0x080042E0 + 1
	.set sub_804F610, 0x0804F610 + 1
	.set sub_804F8F4, 0x0804F8F4 + 1
	.section .text.sub_8088798, "ax", %progbits
@ CallRouteSplitMenu @ JP 0x08088798 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global CallRouteSplitMenu
	.thumb_func
CallRouteSplitMenu:
	push {r4, lr}
	adds r4, r0, #0
	bl sub_804F610
	ldr r2, _080887D8 @ =0x03003020
	ldrb r0, [r2, #1]
	movs r1, #1
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
	movs r0, #0
	bl SetTextFont
	bl sub_80042E0
	bl sub_804F8F4
	ldr r0, _080887DC @ =0x08A657D4
	adds r1, r4, #0
	bl StartMenu
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080887D8: .4byte 0x03003020
_080887DC: .4byte 0x08A657D4

