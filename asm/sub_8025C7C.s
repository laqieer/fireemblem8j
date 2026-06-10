	.syntax unified
	.set AddTarget, 0x08050630 + 1
	.set sub_8019174, 0x08019174 + 1
	.section .text.sub_8025C7C, "ax", %progbits
@ sub_8025C7C @ JP 0x08025C7C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8025C7C
	.thumb_func
sub_8025C7C:
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _08025CD8 @ =0x0202E4D4
	ldr r0, [r0]
	lsls r2, r5, #2
	adds r0, r2, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0
	bne _08025CD2
	ldr r0, _08025CDC @ =0x0202BCEC
	ldrb r0, [r0, #0xd]
	cmp r0, #0
	beq _08025CAC
	ldr r0, _08025CE0 @ =0x0202E4E4
	ldr r0, [r0]
	adds r0, r2, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0
	beq _08025CD2
_08025CAC:
	ldr r0, _08025CE4 @ =0x02033F38
	ldr r0, [r0]
	ldr r1, _08025CE8 @ =0x0202E4D8
	ldr r1, [r1]
	adds r1, r2, r1
	ldr r1, [r1]
	adds r1, r1, r4
	ldrb r1, [r1]
	bl sub_8019174
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08025CD2
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0
	movs r3, #0
	bl AddTarget
_08025CD2:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08025CD8: .4byte 0x0202E4D4
_08025CDC: .4byte 0x0202BCEC
_08025CE0: .4byte 0x0202E4E4
_08025CE4: .4byte 0x02033F38
_08025CE8: .4byte 0x0202E4D8

