	.syntax unified
	.set InitTextDb, 0x08003CB4 + 1
	.section .text.sub_808EE30, "ax", %progbits
@ sub_808EE30 @ JP 0x0808EE30 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_808EE30
	.thumb_func
sub_808EE30:
	push {lr}
	adds r2, r0, #0
	adds r1, r2, #0
	adds r1, #0x57
	movs r0, #0xff
	strb r0, [r1]
	subs r1, #1
	movs r0, #0
	strb r0, [r1]
	str r0, [r2, #0x58]
	subs r1, #6
	movs r0, #1
	strb r0, [r1]
	adds r0, r2, #0
	adds r0, #0x2c
	movs r1, #5
	bl InitTextDb
	pop {r0}
	bx r0

