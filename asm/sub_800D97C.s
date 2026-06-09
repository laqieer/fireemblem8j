	.syntax unified
	.set CheckFlag, 0x080860D0 + 1
	.section .text.sub_800D97C, "ax", %progbits
@ sub_800D97C @ JP 0x0800D97C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_800D97C
	.thumb_func
sub_800D97C:
	push {r4, lr}
	adds r2, r0, #0
	ldr r1, [r2, #0x38]
	ldrb r0, [r1]
	movs r4, #0xf
	ands r4, r0
	movs r0, #2
	ldrsh r1, [r1, r0]
	cmp r1, #0
	bge _0800D996
	ldr r0, _0800D9A0 @ =0x030004B0
	movs r3, #8
	ldrsh r1, [r0, r3]
_0800D996:
	cmp r4, #0
	beq _0800D9A4
	cmp r4, #1
	beq _0800D9B2
	b _0800D9D0
	.align 2, 0
_0800D9A0: .4byte 0x030004B0
_0800D9A4:
	ldrh r0, [r2, #0x3c]
	asrs r0, r1
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0800D9CC
	b _0800D9C0
_0800D9B2:
	adds r0, r1, #0
	bl CheckFlag
	lsls r0, r0, #0x18
	asrs r1, r0, #0x18
	cmp r1, #0
	bne _0800D9CC
_0800D9C0:
	ldr r0, _0800D9C8 @ =0x030004B0
	str r1, [r0, #0x30]
	b _0800D9D0
	.align 2, 0
_0800D9C8: .4byte 0x030004B0
_0800D9CC:
	ldr r0, _0800D9D8 @ =0x030004B0
	str r4, [r0, #0x30]
_0800D9D0:
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0800D9D8: .4byte 0x030004B0

