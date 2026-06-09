	.syntax unified
	.set sub_80D8AEC, 0x080D8AEC + 1
	.set vfprintf, 0x080D6B14 + 1
	.section .text.sub_80D6AA0, "ax", %progbits
@ sub_80D6AA0 @ JP 0x080D6AA0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80D6AA0
	.thumb_func
sub_80D6AA0:
	push {r4, r5, lr}
	ldr r4, _080D6B10 @ =0xFFFFFBA8
	add sp, r4
	adds r5, r0, #0
	ldr r0, [r5, #0x54]
	str r0, [sp, #0x54]
	mov r3, sp
	movs r0, #3
	rsbs r0, r0, #0
	ldrh r4, [r5, #0xc]
	ands r0, r4
	movs r4, #0
	strh r0, [r3, #0xc]
	ldrh r0, [r5, #0xe]
	strh r0, [r3, #0xe]
	ldr r0, [r5, #0x1c]
	str r0, [sp, #0x1c]
	ldr r0, [r5, #0x24]
	str r0, [sp, #0x24]
	add r0, sp, #0x58
	str r0, [sp]
	str r0, [sp, #0x10]
	movs r0, #0x80
	lsls r0, r0, #3
	str r0, [sp, #8]
	str r0, [sp, #0x14]
	str r4, [sp, #0x18]
	mov r0, sp
	bl vfprintf
	adds r4, r0, #0
	cmp r4, #0
	blt _080D6AF0
	mov r0, sp
	bl sub_80D8AEC
	cmp r0, #0
	beq _080D6AF0
	movs r4, #1
	rsbs r4, r4, #0
_080D6AF0:
	mov r1, sp
	movs r0, #0x40
	ldrh r1, [r1, #0xc]
	ands r0, r1
	cmp r0, #0
	beq _080D6B04
	movs r0, #0x40
	ldrh r1, [r5, #0xc]
	orrs r0, r1
	strh r0, [r5, #0xc]
_080D6B04:
	adds r0, r4, #0
	movs r3, #0x8b
	lsls r3, r3, #3
	add sp, r3
	pop {r4, r5, pc}
	.align 2, 0
_080D6B10: .4byte 0xFFFFFBA8

