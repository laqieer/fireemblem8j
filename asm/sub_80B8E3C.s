	.syntax unified
	.set GetUnitItemCount, 0x08017780 + 1
	.section .text.sub_80B8E3C, "ax", %progbits
@ sub_80B8E3C @ JP 0x080B8E3C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B8E3C
	.thumb_func
sub_80B8E3C:
	push {r4, lr}
	adds r4, r0, #0
	movs r2, #0
	ldrh r0, [r4, #0x30]
	cmp r0, #0
	beq _080B8E56
	adds r1, r4, #0
	adds r1, #0x30
_080B8E4C:
	adds r1, #2
	adds r2, #1
	ldrh r0, [r1]
	cmp r0, #0
	bne _080B8E4C
_080B8E56:
	adds r0, r4, #0
	adds r0, #0x5a
	strb r2, [r0]
	ldr r0, [r4, #0x2c]
	bl GetUnitItemCount
	adds r1, r4, #0
	adds r1, #0x5b
	strb r0, [r1]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

