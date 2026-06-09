	.syntax unified
	.set GetWorldMapNodeIdByOrder, 0x080C0890 + 1
	.section .text.sub_80BE3F8, "ax", %progbits
@ sub_80BE3F8 @ JP 0x080BE3F8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80BE3F8
	.thumb_func
sub_80BE3F8:
	push {r4, r5, r6, lr}
	adds r4, r1, #0
	movs r5, #0
	b _080BE402
_080BE400:
	adds r5, #1
_080BE402:
	cmp r5, #0x1c
	bgt _080BE410
	adds r0, r5, #0
	bl GetWorldMapNodeIdByOrder
	cmp r0, r4
	bne _080BE400
_080BE410:
	movs r4, #1
	ldr r6, _080BE438 @ =0x03005270
_080BE414:
	adds r0, r5, r4
	cmp r0, #0x1c
	ble _080BE41C
	subs r0, #0x1d
_080BE41C:
	bl GetWorldMapNodeIdByOrder
	adds r2, r0, #0
	lsls r0, r2, #2
	adds r0, r0, r6
	adds r0, #0x30
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080BE43C
	adds r0, r2, #0
	b _080BE446
	.align 2, 0
_080BE438: .4byte 0x03005270
_080BE43C:
	adds r4, #1
	cmp r4, #0x1c
	ble _080BE414
	movs r0, #1
	rsbs r0, r0, #0
_080BE446:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

