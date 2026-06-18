	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.section .text.sub_80993B0, "ax", %progbits
@ SetPrepScreenMenuSelectedItem @ JP 0x080993B0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global SetPrepScreenMenuSelectedItem
	.thumb_func
SetPrepScreenMenuSelectedItem:
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r4, #0
	ldr r0, _080993DC @ =0x08A94430
	bl Proc_Find
	cmp r0, #0
	beq _080993EA
	movs r2, #0
	adds r3, r0, #0
	adds r3, #0x2a
	adds r1, r0, #0
	adds r1, #0x38
_080993CA:
	ldr r0, [r1]
	cmp r0, #0
	beq _080993E2
	adds r0, #0x39
	ldrb r0, [r0]
	cmp r0, r5
	bne _080993E0
	strb r4, [r3]
	b _080993EA
	.align 2, 0
_080993DC: .4byte 0x08A94430
_080993E0:
	adds r4, #1
_080993E2:
	adds r1, #4
	adds r2, #1
	cmp r2, #7
	ble _080993CA
_080993EA:
	pop {r4, r5}
	pop {r0}
	bx r0

