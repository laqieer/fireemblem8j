	.syntax unified
	.set AddTarget, 0x08050630 + 1
	.set sub_8086240, 0x08086240 + 1
	.section .text.sub_8025578, "ax", %progbits
@ sub_8025578 @ JP 0x08025578 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8025578
	.thumb_func
sub_8025578:
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x30
	ldrb r0, [r0]
	movs r1, #0xf
	ands r1, r0
	cmp r1, #4
	beq _080255B6
	cmp r1, #2
	beq _080255B6
	ldr r0, _080255BC @ =0x02033F38
	ldr r0, [r0]
	ldr r0, [r0]
	ldrb r0, [r0, #4]
	ldr r1, [r4]
	ldrb r1, [r1, #4]
	bl sub_8086240
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080255B6
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r2, #0xb
	ldrsb r2, [r4, r2]
	ldr r3, [r4]
	ldrb r3, [r3, #4]
	bl AddTarget
_080255B6:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080255BC: .4byte 0x02033F38

