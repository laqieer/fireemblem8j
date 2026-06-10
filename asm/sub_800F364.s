	.syntax unified
	.set BMapDispResume, 0x08030108 + 1
	.set sub_807B500, 0x0807B500 + 1
	.section .text.sub_800F364, "ax", %progbits
@ sub_800F364 @ JP 0x0800F364 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_800F364
	.thumb_func
sub_800F364:
	push {r4, lr}
	adds r4, r0, #0
	ldrh r1, [r4, #0x3c]
	movs r0, #0x80
	lsls r0, r0, #5
	ands r0, r1
	cmp r0, #0
	beq _0800F37C
	bl BMapDispResume
	bl sub_807B500
_0800F37C:
	ldrh r1, [r4, #0x3c]
	ldr r0, _0800F38C @ =0x0000EFFF
	ands r0, r1
	strh r0, [r4, #0x3c]
	movs r0, #2
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0800F38C: .4byte 0x0000EFFF

