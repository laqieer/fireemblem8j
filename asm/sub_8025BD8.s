	.syntax unified
	.set AddTarget, 0x08050630 + 1
	.set sub_8019174, 0x08019174 + 1
	.section .text.sub_8025BD8, "ax", %progbits
@ sub_8025BD8 @ JP 0x08025BD8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8025BD8
	.thumb_func
sub_8025BD8:
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldr r0, _08025C34 @ =0x0202E4D4
	ldr r0, [r0]
	lsls r2, r5, #2
	adds r0, r2, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0
	bne _08025C2E
	ldr r0, _08025C38 @ =0x0202BCEC
	ldrb r0, [r0, #0xd]
	cmp r0, #0
	beq _08025C08
	ldr r0, _08025C3C @ =0x0202E4E4
	ldr r0, [r0]
	adds r0, r2, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0
	beq _08025C2E
_08025C08:
	ldr r0, _08025C40 @ =0x02033F38
	ldr r0, [r0]
	ldr r1, _08025C44 @ =0x0202E4D8
	ldr r1, [r1]
	adds r1, r2, r1
	ldr r1, [r1]
	adds r1, r1, r4
	ldrb r1, [r1]
	bl sub_8019174
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08025C2E
	adds r0, r4, #0
	adds r1, r5, #0
	movs r2, #0
	movs r3, #0
	bl AddTarget
_08025C2E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08025C34: .4byte 0x0202E4D4
_08025C38: .4byte 0x0202BCEC
_08025C3C: .4byte 0x0202E4E4
_08025C40: .4byte 0x02033F38
_08025C44: .4byte 0x0202E4D8

