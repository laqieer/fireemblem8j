	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_80564F0, 0x080564F0 + 1
	.set sub_8056774, 0x08056774 + 1
	.set sub_805679C, 0x0805679C + 1
	.section .text.sub_8066E88, "ax", %progbits
@ sub_8066E88 @ JP 0x08066E88 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8066E88
	.thumb_func
sub_8066E88:
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	adds r6, r1, #0
	ldr r1, _08066EEC @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08066EF0 @ =0x086019E0
	movs r1, #3
	bl sub_8002BCC
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	movs r0, #0
	strh r0, [r4, #0x2c]
	strh r6, [r4, #0x2e]
	ldr r3, _08066EF4 @ =0x0877AB34
	str r3, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl sub_80564F0
	str r0, [r4, #0x60]
	movs r1, #0x78
	strh r1, [r0, #2]
	movs r1, #0x48
	strh r1, [r0, #4]
	ldrh r2, [r0, #8]
	ldr r1, _08066EF8 @ =0x0000F3FF
	ands r1, r2
	movs r3, #0x80
	lsls r3, r3, #3
	adds r2, r3, #0
	orrs r1, r2
	strh r1, [r0, #8]
	ldr r0, _08066EFC @ =0x08779A94
	movs r1, #0x20
	bl sub_805679C
	ldr r0, _08066F00 @ =0x08779764
	movs r1, #0x80
	lsls r1, r1, #5
	bl sub_8056774
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08066EEC: .4byte 0x0201774C
_08066EF0: .4byte 0x086019E0
_08066EF4: .4byte 0x0877AB34
_08066EF8: .4byte 0x0000F3FF
_08066EFC: .4byte 0x08779A94
_08066F00: .4byte 0x08779764

