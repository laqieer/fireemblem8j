	.syntax unified
	.section .text.ClearPermanentFlag, "ax", %progbits
@ ClearPermanentFlag @ JP 0x08086000 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global ClearPermanentFlag
	.thumb_func
ClearPermanentFlag:
	push {lr}
	adds r2, r0, #0
	cmp r2, #0x63
	ble _08086032
	cmp r2, #0x64
	beq _08086032
	subs r2, #0x65
	ldr r3, _08086038 @ =0x08A5A6A0
	adds r1, r2, #0
	cmp r2, #0
	bge _08086018
	adds r1, r2, #7
_08086018:
	asrs r1, r1, #3
	lsls r0, r1, #3
	subs r0, r2, r0
	adds r0, r0, r3
	ldrb r0, [r0]
	mvns r0, r0
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	ldr r0, _0808603C @ =0x03005240
	adds r1, r1, r0
	ldrb r0, [r1]
	ands r0, r3
	strb r0, [r1]
_08086032:
	pop {r0}
	bx r0
	.align 2, 0
_08086038: .4byte 0x08A5A6A0
_0808603C: .4byte 0x03005240

