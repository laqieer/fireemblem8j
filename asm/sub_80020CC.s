	.syntax unified
	.set j_ClearOam, 0x080DC0D4 + 1
	.set sub_80D636C, 0x080D636C + 1
	.section .text.sub_80020CC, "ax", %progbits
@ sub_80020CC @ JP 0x080020CC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80020CC
	.thumb_func
sub_80020CC:
	push {r4, lr}
	ldr r4, _080020F8 @ =0x03000028
	ldrh r0, [r4, #0xa]
	cmp r0, #0
	beq _080020F0
	ldr r0, [r4]
	ldr r1, [r4, #4]
	ldrh r2, [r4, #0xa]
	lsls r2, r2, #1
	bl sub_80D636C
	ldr r0, [r4]
	ldrh r1, [r4, #0xa]
	bl j_ClearOam
	ldr r1, _080020FC @ =0x03003010
	ldr r0, [r4]
	str r0, [r1]
_080020F0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080020F8: .4byte 0x03000028
_080020FC: .4byte 0x03003010

