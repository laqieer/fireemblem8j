	.syntax unified
	.section .text.Sio_CheckLinkAlive, "ax", %progbits
@ Sio_CheckLinkAlive @ JP 0x08042164 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global Sio_CheckLinkAlive
	.thumb_func
Sio_CheckLinkAlive:
	push {r4, lr}
	ldr r2, _08042190 @ =0x085D31E8
	ldr r3, [r2]
	ldrh r1, [r3, #2]
	movs r0, #0
	strh r0, [r3, #2]
	movs r4, #8
	ands r1, r4
	cmp r1, #0
	bne _08042198
	ldr r0, _08042194 @ =0x04000128
	ldrh r1, [r0]
	adds r0, r4, #0
	ands r0, r1
	cmp r0, #0
	bne _08042198
	adds r1, r3, #0
	adds r1, #0x20
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	b _080421A0
	.align 2, 0
_08042190: .4byte 0x085D31E8
_08042194: .4byte 0x04000128
_08042198:
	ldr r0, [r2]
	adds r0, #0x20
	movs r1, #0
	strb r1, [r0]
_080421A0:
	ldr r0, [r2]
	adds r0, #0x20
	ldrb r0, [r0]
	cmp r0, #0xa
	bhi _080421AE
	movs r0, #1
	b _080421B0
_080421AE:
	movs r0, #0
_080421B0:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

