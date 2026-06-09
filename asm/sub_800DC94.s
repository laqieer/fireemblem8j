	.syntax unified
	.set sub_800D340, 0x0800D340 + 1
	.set sub_8086100, 0x08086100 + 1
	.section .text.sub_800DC94, "ax", %progbits
@ sub_800DC94 @ JP 0x0800DC94 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_800DC94
	.thumb_func
sub_800DC94:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x38]
	ldrb r1, [r0]
	movs r3, #0xf
	ands r3, r1
	ldrh r1, [r0, #2]
	ldr r2, [r0, #4]
	cmp r2, #0
	bge _0800DCAC
	ldr r0, _0800DCBC @ =0x030004B0
	ldr r2, [r0, #8]
_0800DCAC:
	cmp r2, #0
	beq _0800DCD8
	cmp r3, #0
	beq _0800DCC0
	cmp r3, #1
	beq _0800DCCE
	b _0800DCD8
	.align 2, 0
_0800DCBC: .4byte 0x030004B0
_0800DCC0:
	adds r0, r4, #0
	adds r0, #0x41
	ldrb r1, [r0]
	adds r0, r2, #0
	bl sub_800D340
	b _0800DCD8
_0800DCCE:
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r2, #0
	bl sub_8086100
_0800DCD8:
	movs r0, #0
	pop {r4}
	pop {r1}
	bx r1

