	.syntax unified
	.set SetGmCharUnit, 0x080C42E8 + 1
	.section .text.sub_800CEE8, "ax", %progbits
@ sub_800CEE8 @ JP 0x0800CEE8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_800CEE8
	.thumb_func
sub_800CEE8:
	push {r4, r5, lr}
	ldr r0, [r0, #0x38]
	ldrh r4, [r0, #4]
	ldrh r3, [r0, #6]
	ldr r5, [r0, #8]
	ldr r1, _0800CF0C @ =0x03005270
	lsls r0, r4, #2
	adds r2, r0, r1
	ldrb r1, [r2, #0x10]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	bne _0800CF10
	movs r1, #0x12
	ldrsh r0, [r2, r1]
	cmp r0, r3
	bne _0800CF14
	b _0800CF22
	.align 2, 0
_0800CF0C: .4byte 0x03005270
_0800CF10:
	cmp r3, #0
	beq _0800CF22
_0800CF14:
	movs r2, #1
	rsbs r2, r2, #0
	adds r0, r4, #0
	adds r1, r3, #0
	adds r3, r5, #0
	bl SetGmCharUnit
_0800CF22:
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

