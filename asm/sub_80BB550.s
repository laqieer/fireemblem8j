	.syntax unified
	.set GetUnit, 0x08019108 + 1
	.section .text.sub_80BB550, "ax", %progbits
@ sub_80BB550 @ JP 0x080BB550 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80BB550
	.thumb_func
sub_80BB550:
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r4, #1
_080BB556:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _080BB57E
	ldr r0, [r2]
	cmp r0, #0
	beq _080BB57E
	ldrb r0, [r0, #4]
	cmp r0, r5
	bne _080BB57E
	ldr r0, [r2, #0xc]
	movs r1, #0x80
	lsls r1, r1, #9
	ands r0, r1
	cmp r0, #0
	bne _080BB584
	adds r0, r2, #0
	b _080BB586
_080BB57E:
	adds r4, #1
	cmp r4, #0x3f
	ble _080BB556
_080BB584:
	movs r0, #0
_080BB586:
	pop {r4, r5}
	pop {r1}
	bx r1

