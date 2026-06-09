	.syntax unified
	.set NextRN_N, 0x08000C58 + 1
	.section .text.sub_800D9DC, "ax", %progbits
@ sub_800D9DC @ JP 0x0800D9DC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_800D9DC
	.thumb_func
sub_800D9DC:
	push {lr}
	ldr r0, [r0, #0x38]
	ldrh r1, [r0, #2]
	cmp r1, #0
	bne _0800D9F0
	ldr r0, _0800D9EC @ =0x030004B0
	str r1, [r0, #0x30]
	b _0800D9FA
	.align 2, 0
_0800D9EC: .4byte 0x030004B0
_0800D9F0:
	adds r0, r1, #1
	bl NextRN_N
	ldr r1, _0800DA00 @ =0x030004B0
	str r0, [r1, #0x30]
_0800D9FA:
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
_0800DA00: .4byte 0x030004B0

