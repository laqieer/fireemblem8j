	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_80564F0, 0x080564F0 + 1
	.section .text.sub_8065160, "ax", %progbits
@ sub_8065160 @ JP 0x08065160 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8065160
	.thumb_func
sub_8065160:
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r1, _080651C0 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	movs r5, #0
	strh r5, [r4, #0x2c]
	strh r5, [r4, #0x2e]
	ldr r1, [r4, #0x44]
	ldr r0, _080651C4 @ =0x00002AAA
	muls r0, r1, r0
	strh r0, [r4, #0x30]
	ldr r3, _080651C8 @ =0x0875ABC4
	ldr r0, [r4, #0x5c]
	str r3, [sp]
	adds r1, r3, #0
	adds r2, r3, #0
	bl sub_80564F0
	str r0, [r4, #0x60]
	strh r5, [r0, #6]
	ldrh r2, [r0, #8]
	ldr r1, _080651CC @ =0x0000F3FF
	ands r1, r2
	movs r3, #0x80
	lsls r3, r3, #4
	adds r2, r3, #0
	orrs r1, r2
	strh r1, [r0, #8]
	movs r1, #0x80
	lsls r1, r1, #1
	strh r1, [r0, #2]
	strh r1, [r0, #4]
	ldr r1, [r4, #0x5c]
	ldrh r0, [r1, #2]
	strh r0, [r4, #0x32]
	ldrh r0, [r1, #4]
	strh r0, [r4, #0x3a]
	adds r0, r4, #0
	bl sub_8002DE4
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080651C0: .4byte 0x0201774C
_080651C4: .4byte 0x00002AAA
_080651C8: .4byte 0x0875ABC4
_080651CC: .4byte 0x0000F3FF

