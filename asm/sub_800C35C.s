	.syntax unified
	.set sub_80C41E0, 0x080C41E0 + 1
	.set sub_80C428C, 0x080C428C + 1
	.section .text.sub_800C35C, "ax", %progbits
@ sub_800C35C @ JP 0x0800C35C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_800C35C
	.thumb_func
sub_800C35C:
	push {lr}
	ldrh r0, [r0, #0x3c]
	lsrs r0, r0, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0800C37C
	bl sub_80C41E0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800C378
	bl sub_80C428C
_0800C378:
	movs r0, #0
	b _0800C38C
_0800C37C:
	bl sub_80C41E0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800C38A
	movs r0, #3
	b _0800C38C
_0800C38A:
	movs r0, #2
_0800C38C:
	pop {r1}
	bx r1

