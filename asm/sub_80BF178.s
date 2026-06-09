	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_80BF178, "ax", %progbits
@ sub_80BF178 @ JP 0x080BF178 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80BF178
	.thumb_func
sub_80BF178:
	push {lr}
	ldr r0, _080BF1A4 @ =0x08AC1108
	movs r1, #3
	bl sub_8002BCC
	adds r3, r0, #0
	adds r2, r3, #0
	adds r2, #0x29
	ldrb r1, [r2]
	movs r0, #3
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2]
	ldr r0, _080BF1A8 @ =0x0202BCEC
	ldrb r1, [r0, #0x14]
	movs r2, #4
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	beq _080BF1AC
	str r2, [r3, #0x2c]
	b _080BF1C4
	.align 2, 0
_080BF1A4: .4byte 0x08AC1108
_080BF1A8: .4byte 0x0202BCEC
_080BF1AC:
	ldr r0, _080BF1BC @ =0x03005270
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080BF1C0
	movs r0, #0xc
	b _080BF1C2
	.align 2, 0
_080BF1BC: .4byte 0x03005270
_080BF1C0:
	movs r0, #0x10
_080BF1C2:
	str r0, [r3, #0x2c]
_080BF1C4:
	pop {r0}
	bx r0

