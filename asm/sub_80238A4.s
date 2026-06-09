	.syntax unified
	.set sub_80011D0, 0x080011D0 + 1
	.set sub_801915C, 0x0801915C + 1
	.set sub_802356C, 0x0802356C + 1
	.section .text.sub_80238A4, "ax", %progbits
@ sub_80238A4 @ JP 0x080238A4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80238A4
	.thumb_func
sub_80238A4:
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _080238D0 @ =0x03004DF0
	ldr r0, [r0]
	ldr r4, _080238D4 @ =0x0203A954
	ldrb r1, [r4, #0x12]
	bl sub_801915C
	ldrb r0, [r4, #0x12]
	cmp r0, #0
	beq _080238C2
	ldr r0, _080238D8 @ =0x02022CA8
	movs r1, #0
	bl sub_80011D0
_080238C2:
	adds r0, r5, #0
	bl sub_802356C
	movs r0, #1
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080238D0: .4byte 0x03004DF0
_080238D4: .4byte 0x0203A954
_080238D8: .4byte 0x02022CA8

