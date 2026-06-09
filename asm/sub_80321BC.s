	.syntax unified
	.set GetUnit, 0x08019108 + 1
	.set sub_808639C, 0x0808639C + 1
	.section .text.sub_80321BC, "ax", %progbits
@ sub_80321BC @ JP 0x080321BC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80321BC
	.thumb_func
sub_80321BC:
	push {r4, r5, lr}
	ldr r5, _080321E4 @ =0x0203A954
	ldrb r0, [r5, #0xc]
	bl GetUnit
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	ldrb r0, [r5, #0xc]
	bl GetUnit
	movs r1, #0x11
	ldrsb r1, [r0, r1]
	adds r0, r4, #0
	bl sub_808639C
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080321E4: .4byte 0x0203A954

