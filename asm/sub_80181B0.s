	.syntax unified
	.set sub_802EAC4, 0x0802EAC4 + 1
	.section .text.sub_80181B0, "ax", %progbits
@ sub_80181B0 @ JP 0x080181B0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80181B0
	.thumb_func
sub_80181B0:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0xc]
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	beq _080181D0
	ldr r1, _080181F0 @ =0x085C2A50
	ldrb r0, [r4, #0x1b]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldrb r0, [r4, #0x10]
	strb r0, [r1, #0x10]
	ldrb r0, [r4, #0x11]
	strb r0, [r1, #0x11]
_080181D0:
	ldr r0, [r4, #0xc]
	movs r1, #0x80
	lsls r1, r1, #4
	ands r0, r1
	cmp r0, #0
	beq _080181EA
	ldrb r0, [r4, #0x1c]
	bl sub_802EAC4
	ldrb r1, [r4, #0x10]
	strb r1, [r0]
	ldrb r1, [r4, #0x11]
	strb r1, [r0, #1]
_080181EA:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080181F0: .4byte 0x085C2A50

