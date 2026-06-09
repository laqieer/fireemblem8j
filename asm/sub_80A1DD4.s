	.syntax unified
	.set GetUnitItemCount, 0x08017780 + 1
	.set sub_80B1FBC, 0x080B1FBC + 1
	.section .text.sub_80A1DD4, "ax", %progbits
@ sub_80A1DD4 @ JP 0x080A1DD4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A1DD4
	.thumb_func
sub_80A1DD4:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x2c]
	bl GetUnitItemCount
	adds r1, r0, #0
	cmp r1, #5
	bne _080A1DF0
	adds r1, r4, #0
	adds r1, #0x30
	movs r0, #4
	strb r0, [r1]
	adds r0, r1, #0
	b _080A1DF6
_080A1DF0:
	adds r0, r4, #0
	adds r0, #0x30
	strb r1, [r0]
_080A1DF6:
	ldrb r1, [r0]
	lsls r1, r1, #4
	adds r1, #0x48
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x10
	movs r2, #0xb
	bl sub_80B1FBC
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

