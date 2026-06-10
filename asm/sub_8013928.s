	.syntax unified
	.set sub_8014B50, 0x08014B50 + 1
	.section .text.sub_8013928, "ax", %progbits
@ sub_8013928 @ JP 0x08013928 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8013928
	.thumb_func
sub_8013928:
	push {r4, r5, lr}
	adds r3, r0, #0
	movs r4, #0
	ldr r5, _0801398C @ =0x085775CC
	ldr r0, [r5]
	ldrh r1, [r0, #8]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08013946
	adds r1, r3, #0
	adds r1, #0x66
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
_08013946:
	adds r1, r3, #0
	adds r1, #0x64
	ldrh r2, [r1]
	adds r0, r2, #1
	strh r0, [r1]
	movs r0, #0xf
	ands r0, r2
	cmp r0, #0
	bne _08013986
	ldr r0, [r5]
	ldrh r1, [r0, #4]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0801396E
	adds r0, r3, #0
	adds r0, #0x66
	movs r2, #0
	ldrsh r0, [r0, r2]
	rsbs r4, r0, #0
_0801396E:
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _0801397E
	adds r0, r3, #0
	adds r0, #0x66
	movs r1, #0
	ldrsh r4, [r0, r1]
_0801397E:
	movs r0, #0x9a
	adds r1, r4, #0
	bl sub_8014B50
_08013986:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0801398C: .4byte 0x085775CC

