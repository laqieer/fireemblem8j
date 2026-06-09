	.syntax unified
	.set m4aSongNumStart, 0x080D4EF4 + 1
	.section .text.sub_800E11C, "ax", %progbits
@ sub_800E11C @ JP 0x0800E11C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_800E11C
	.thumb_func
sub_800E11C:
	push {lr}
	adds r2, r0, #0
	ldrh r0, [r2, #0x3c]
	lsrs r0, r0, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _0800E150
	ldr r0, [r2, #0x38]
	movs r2, #2
	ldrsh r1, [r0, r2]
	cmp r1, #0
	bge _0800E13C
	ldr r0, _0800E158 @ =0x030004B0
	movs r2, #8
	ldrsh r1, [r0, r2]
_0800E13C:
	ldr r0, _0800E15C @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0800E150
	lsls r0, r1, #0x10
	lsrs r0, r0, #0x10
	bl m4aSongNumStart
_0800E150:
	movs r0, #0
	pop {r1}
	bx r1
	.align 2, 0
_0800E158: .4byte 0x030004B0
_0800E15C: .4byte 0x0202BCEC

