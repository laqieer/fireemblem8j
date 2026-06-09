	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_808F7FC, 0x0808F7FC + 1
	.section .text.sub_808FA04, "ax", %progbits
@ sub_808FA04 @ JP 0x0808FA04 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_808FA04
	.thumb_func
sub_808FA04:
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r6, r4, #0
	adds r6, #0x55
	movs r5, #0
	movs r0, #1
	strb r0, [r6]
	ldr r1, _0808FA5C @ =0x08A73A99
	ldr r0, [r4, #0x58]
	adds r0, r0, r1
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r0, r4, #0
	adds r0, #0x50
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r2, r4, #0
	adds r2, #0x44
	movs r3, #0
	ldrsh r2, [r2, r3]
	bl sub_808F7FC
	ldr r0, [r4, #0x58]
	adds r0, #1
	str r0, [r4, #0x58]
	cmp r0, #3
	bne _0808FA54
	str r5, [r4, #0x58]
	strb r5, [r6]
	adds r0, r4, #0
	adds r0, #0x56
	strb r5, [r0]
	adds r1, r4, #0
	adds r1, #0x57
	movs r0, #0xff
	strb r0, [r1]
	adds r0, r4, #0
	bl sub_8002DE4
_0808FA54:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0808FA5C: .4byte 0x08A73A99

