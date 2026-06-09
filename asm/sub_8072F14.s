	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8059810, 0x08059810 + 1
	.set sub_8073E74, 0x08073E74 + 1
	.set sub_8073F94, 0x08073F94 + 1
	.section .text.sub_8072F14, "ax", %progbits
@ sub_8072F14 @ JP 0x08072F14 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8072F14
	.thumb_func
sub_8072F14:
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, [r5, #0x5c]
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x1a
	bne _08072F3E
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0xdc
	bl sub_8073E74
	movs r0, #2
	ldrsh r1, [r4, r0]
	movs r0, #0xdc
	movs r2, #1
	bl sub_8073F94
_08072F3E:
	ldr r0, [r4, #0x20]
	ldrb r0, [r0, #3]
	movs r1, #0x3f
	ands r0, r1
	cmp r0, #0
	bne _08072F6C
	adds r1, #0xc1
	movs r0, #0xde
	bl sub_8073E74
	movs r0, #2
	ldrsh r1, [r4, r0]
	movs r0, #0xde
	movs r2, #1
	bl sub_8073F94
	adds r0, r4, #0
	movs r1, #0xc3
	bl sub_8059810
	adds r0, r5, #0
	bl sub_8002DE4
_08072F6C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

