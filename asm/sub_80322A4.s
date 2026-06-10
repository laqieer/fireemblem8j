	.syntax unified
	.set GetUnit, 0x08019108 + 1
	.set sub_802C94C, 0x0802C94C + 1
	.set sub_802CA5C, 0x0802CA5C + 1
	.set sub_802CB00, 0x0802CB00 + 1
	.set sub_802CB70, 0x0802CB70 + 1
	.section .text.sub_80322A4, "ax", %progbits
@ sub_80322A4 @ JP 0x080322A4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80322A4
	.thumb_func
sub_80322A4:
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _080322E8 @ =0x0203A954
	ldrb r0, [r4, #0xd]
	bl GetUnit
	ldr r1, [r0, #0xc]
	ldr r2, _080322EC @ =0xFFFFFBBD
	ands r1, r2
	str r1, [r0, #0xc]
	ldrb r0, [r4, #0xc]
	bl GetUnit
	movs r1, #1
	rsbs r1, r1, #0
	bl sub_802CA5C
	ldrb r0, [r4, #0xd]
	bl GetUnit
	bl sub_802CB00
	ldr r1, _080322F0 @ =0x0203A4D0
	movs r0, #0x40
	strh r0, [r1]
	adds r0, r5, #0
	bl sub_802CB70
	bl sub_802C94C
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080322E8: .4byte 0x0203A954
_080322EC: .4byte 0xFFFFFBBD
_080322F0: .4byte 0x0203A4D0

