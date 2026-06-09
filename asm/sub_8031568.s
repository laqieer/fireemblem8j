	.syntax unified
	.set sub_80C1E54, 0x080C1E54 + 1
	.section .text.sub_8031568, "ax", %progbits
@ sub_8031568 @ JP 0x08031568 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8031568
	.thumb_func
sub_8031568:
	push {lr}
	ldr r0, _08031584 @ =0x03005270
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08031588
	bl sub_80C1E54
	cmp r0, #1
	bls _0803159C
	cmp r0, #0x38
	beq _0803159C
	b _080315A4
	.align 2, 0
_08031584: .4byte 0x03005270
_08031588:
	ldr r0, _080315A0 @ =0x0202BCEC
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	ble _0803159C
	cmp r0, #0x38
	beq _0803159C
	cmp r0, #5
	bne _080315A4
_0803159C:
	movs r0, #0
	b _080315A6
	.align 2, 0
_080315A0: .4byte 0x0202BCEC
_080315A4:
	movs r0, #1
_080315A6:
	pop {r1}
	bx r1
	.align 2, 0

