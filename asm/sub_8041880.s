	.syntax unified
	.set SetIRQHandler, 0x08000B50 + 1
	.section .text.sub_8041880, "ax", %progbits
@ sub_8041880 @ JP 0x08041880 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8041880
	.thumb_func
sub_8041880:
	push {r4, lr}
	ldr r0, _080418D0 @ =0x04000134
	movs r3, #0
	strh r3, [r0]
	ldr r2, _080418D4 @ =0x04000128
	ldr r0, _080418D8 @ =0x030017D8
	ldrb r0, [r0]
	movs r4, #0x80
	lsls r4, r4, #6
	adds r1, r4, #0
	orrs r0, r1
	strh r0, [r2]
	ldr r0, _080418DC @ =0x0400010E
	strh r3, [r0]
	ldr r2, _080418E0 @ =0x03004E18
	ldr r1, _080418E4 @ =0x03004E14
	movs r0, #0
	str r0, [r1]
	str r0, [r2]
	ldr r1, _080418E8 @ =0x03004EA8
	str r0, [r1]
	ldr r1, _080418EC @ =0x030017DC
	subs r0, #1
	str r0, [r1]
	ldr r1, _080418F0 @ =sub_804195C
	movs r0, #7
	bl SetIRQHandler
	ldr r1, _080418F4 @ =SioHandleIrq_Timer3
	movs r0, #6
	bl SetIRQHandler
	ldr r2, _080418F8 @ =0x04000200
	ldrh r0, [r2]
	movs r1, #0xc0
	orrs r0, r1
	strh r0, [r2]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080418D0: .4byte 0x04000134
_080418D4: .4byte 0x04000128
_080418D8: .4byte 0x030017D8
_080418DC: .4byte 0x0400010E
_080418E0: .4byte 0x03004E18
_080418E4: .4byte 0x03004E14
_080418E8: .4byte 0x03004EA8
_080418EC: .4byte 0x030017DC
_080418F0: .4byte 0x0804195D  @ sub_804195C
_080418F4: .4byte 0x08041CE9  @ SioHandleIrq_Timer3
_080418F8: .4byte 0x04000200

