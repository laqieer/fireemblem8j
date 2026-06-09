	.syntax unified
	.set GetUnit, 0x08019108 + 1
	.section .text.sub_8087154, "ax", %progbits
@ sub_8087154 @ JP 0x08087154 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8087154
	.thumb_func
sub_8087154:
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	movs r4, #1
_0808715C:
	adds r0, r4, #0
	bl GetUnit
	cmp r0, #0
	beq _08087176
	ldr r0, [r0]
	cmp r0, #0
	beq _08087176
	ldrb r0, [r0, #4]
	cmp r0, r5
	bne _08087176
	movs r0, #1
	b _0808717E
_08087176:
	adds r4, #1
	cmp r4, #0x3f
	ble _0808715C
	movs r0, #0
_0808717E:
	pop {r4, r5}
	pop {r1}
	bx r1

