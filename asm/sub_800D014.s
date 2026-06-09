	.syntax unified
	.set SetTalkFlag, 0x080069AC + 1
	.set sub_80C8458, 0x080C8458 + 1
	.section .text.sub_800D014, "ax", %progbits
@ sub_800D014 @ JP 0x0800D014 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_800D014
	.thumb_func
sub_800D014:
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x3c]
	lsrs r0, r0, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0800D028
	movs r0, #0
	b _0800D046
_0800D028:
	ldr r1, [r4, #0x38]
	ldrh r0, [r1, #4]
	ldrh r1, [r1, #6]
	orrs r0, r1
	bl sub_80C8458
	ldrh r1, [r4, #0x3c]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0800D044
	movs r0, #4
	bl SetTalkFlag
_0800D044:
	movs r0, #2
_0800D046:
	pop {r4}
	pop {r1}
	bx r1

