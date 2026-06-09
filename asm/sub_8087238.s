	.syntax unified
	.set GetUnit, 0x08019108 + 1
	.section .text.sub_8087238, "ax", %progbits
@ sub_8087238 @ JP 0x08087238 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8087238
	.thumb_func
sub_8087238:
	push {r4, r5, lr}
	lsls r0, r0, #0x18
	lsrs r5, r0, #0x18
	movs r4, #0x41
_08087240:
	adds r0, r4, #0
	bl GetUnit
	cmp r0, #0
	beq _08087264
	ldr r2, [r0]
	cmp r2, #0
	beq _08087264
	ldr r0, [r0, #0xc]
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	bne _08087264
	ldrb r0, [r2, #4]
	cmp r0, r5
	bne _08087264
	movs r0, #1
	b _0808726C
_08087264:
	adds r4, #1
	cmp r4, #0xbf
	ble _08087240
	movs r0, #0
_0808726C:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

