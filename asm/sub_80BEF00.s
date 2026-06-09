	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_80BD594, 0x080BD594 + 1
	.set sub_80BD70C, 0x080BD70C + 1
	.section .text.sub_80BEF00, "ax", %progbits
@ sub_80BEF00 @ JP 0x080BEF00 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80BEF00
	.thumb_func
sub_80BEF00:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x2c]
	cmp r0, #0
	ble _080BEF10
	subs r0, #1
	str r0, [r4, #0x2c]
	b _080BEF42
_080BEF10:
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r0, [r0]
	cmp r0, #6
	beq _080BEF20
	cmp r0, #7
	beq _080BEF30
	b _080BEF3C
_080BEF20:
	ldr r0, [r4, #0x34]
	ldr r1, [r4, #0x40]
	ldr r2, [r4, #0x44]
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	bl sub_80BD594
	b _080BEF3C
_080BEF30:
	ldr r0, [r4, #0x34]
	ldr r1, [r4, #0x44]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl sub_80BD70C
_080BEF3C:
	adds r0, r4, #0
	bl sub_8002DE4
_080BEF42:
	pop {r4}
	pop {r0}
	bx r0

