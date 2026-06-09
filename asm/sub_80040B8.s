	.syntax unified
	.set sub_800443C, 0x0800443C + 1
	.set sub_80D65C4, 0x080D65C4 + 1
	.section .text.sub_80040B8, "ax", %progbits
@ sub_80040B8 @ JP 0x080040B8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80040B8
	.thumb_func
sub_80040B8:
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r0, _080040D4 @ =0x02028E70
	ldr r1, [r0]
	ldrb r1, [r1, #0x16]
	adds r6, r0, #0
	cmp r1, #0
	beq _080040D8
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_800443C
	b _0800411A
	.align 2, 0
_080040D4: .4byte 0x02028E70
_080040D8:
	ldrb r3, [r4]
	adds r4, #1
	ldrb r2, [r4]
	adds r4, #1
_080040E0:
	ldr r0, [r6]
	ldr r1, [r0, #4]
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r1, _080040F0 @ =0xFFFFFF00
	adds r0, r0, r1
	ldr r1, [r0]
	b _080040F6
	.align 2, 0
_080040F0: .4byte 0xFFFFFF00
_080040F4:
	ldr r1, [r1]
_080040F6:
	cmp r1, #0
	bne _08004108
	movs r3, #0x81
	movs r2, #0xa7
	ldr r6, _08004104 @ =0x02028E70
	b _080040E0
	.align 2, 0
_08004104: .4byte 0x02028E70
_08004108:
	ldrb r0, [r1, #4]
	cmp r0, r3
	bne _080040F4
	ldr r0, [r6]
	ldr r2, [r0, #8]
	adds r0, r5, #0
	bl sub_80D65C4
	adds r0, r4, #0
_0800411A:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

