	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_80B3B44, "ax", %progbits
@ sub_80B3B44 @ JP 0x080B3B44 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B3B44
	.thumb_func
sub_80B3B44:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080B3B7C @ =0x08A9E24C
	adds r1, r4, #0
	bl sub_8002BCC
	adds r4, #0x31
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
	ldrb r2, [r4]
	ldr r0, _080B3B80 @ =0x08A9E248
	ldr r0, [r0]
	adds r0, r0, r2
	movs r1, #0
	ldrsb r1, [r0, r1]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _080B3B70
	cmp r2, #0x80
	bne _080B3B74
_080B3B70:
	movs r0, #0
	strb r0, [r4]
_080B3B74:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B3B7C: .4byte 0x08A9E24C
_080B3B80: .4byte 0x08A9E248

