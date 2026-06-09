	.syntax unified
	.set AnimSort, 0x08004EB4 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_80564F0, 0x080564F0 + 1
	.section .text.sub_806759C, "ax", %progbits
@ sub_806759C @ JP 0x0806759C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_806759C
	.thumb_func
sub_806759C:
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r1, _080675F0 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _080675F4 @ =0x08601B68
	movs r1, #3
	bl sub_8002BCC
	adds r4, r0, #0
	str r5, [r4, #0x5c]
	ldr r3, _080675F8 @ =0x087A1C04
	str r3, [sp]
	adds r0, r5, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl sub_80564F0
	str r0, [r4, #0x60]
	movs r1, #0x78
	strh r1, [r0, #2]
	movs r1, #0x3c
	strh r1, [r0, #4]
	ldrh r2, [r0, #8]
	ldr r1, _080675FC @ =0x0000F3FF
	ands r1, r2
	movs r3, #0xc0
	lsls r3, r3, #4
	adds r2, r3, #0
	orrs r1, r2
	strh r1, [r0, #8]
	movs r1, #0x14
	strh r1, [r0, #0xa]
	bl AnimSort
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080675F0: .4byte 0x0201774C
_080675F4: .4byte 0x08601B68
_080675F8: .4byte 0x087A1C04
_080675FC: .4byte 0x0000F3FF

