	.syntax unified
	.set InitTextDb, 0x08003CB4 + 1
	.section .text.sub_808F198, "ax", %progbits
@ sub_808F198 @ JP 0x0808F198 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_808F198
	.thumb_func
sub_808F198:
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	movs r1, #7
	bl InitTextDb
	adds r0, r4, #0
	adds r0, #0x4b
	movs r1, #0
	strb r1, [r0]
	adds r0, #0xa
	strb r1, [r0]
	str r1, [r4, #0x58]
	subs r0, #0x17
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #0x17
	strb r1, [r0]
	pop {r4}
	pop {r0}
	bx r0

