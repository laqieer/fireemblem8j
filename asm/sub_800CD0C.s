	.syntax unified
	.set sub_80C7934, 0x080C7934 + 1
	.set sub_80C79C8, 0x080C79C8 + 1
	.section .text.sub_800CD0C, "ax", %progbits
@ sub_800CD0C @ JP 0x0800CD0C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_800CD0C
	.thumb_func
sub_800CD0C:
	push {lr}
	ldr r1, [r0, #0x38]
	ldr r2, [r1, #4]
	ldrh r0, [r0, #0x3c]
	lsrs r0, r0, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _0800CD26
	adds r0, r2, #0
	bl sub_80C79C8
	b _0800CD2E
_0800CD26:
	movs r0, #1
	rsbs r0, r0, #0
	bl sub_80C7934
_0800CD2E:
	movs r0, #0
	pop {r1}
	bx r1

